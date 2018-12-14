package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.Enum.PayType;
import com.liaoin.service.app.bean.IncomeDetail;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.IncomeDetailRepository;
import com.liaoin.service.app.dao.MinerRepository;
import com.liaoin.service.app.dao.OrderRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.service.OrderService;
import com.liaoin.service.app.service.UserService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private MinerRepository minerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private IncomeDetailRepository incomeDetailRepository;

    @Override
    public OperateResult buy(String userId, Integer minerId) {
        if(minerRepository.existsById(minerId)){
            Miner miner = minerRepository.findById(minerId).get();
            User user = userRepository.findById(userId).get();
            float price  = miner.getPrice();
            if(user.getMiner() != null){
                if(user.getMiner().getPrice() >= miner.getPrice()){
                    return fail(Result.MINER_HIGH_TO_THIS);
                }else{
                    price = miner.getPrice() - user.getMiner().getPrice();
                }
            }
            if(user.getBalance() <  price){
                return fail(Result.HAVE_NOT_BALANCE);
            }else{
                Order order = Order.builder()
                        .user(user)
                        .miner(miner)
                        .price(price)
                        .payType(PayType.PAY_WITH_BALANCE)
                        .orderStatus(OrderStatus.WAIT_FOR_PAY)
                        .addTime(new Date())
                        .updateTime(new Date())
                        .count(1)
                        .build();
                orderRepository.save(order);
                //减去用户余额
                user.setBalance(user.getBalance() - price);
                userRepository.save(user);
                //增加收支明细
                IncomeDetail incomeDetail = IncomeDetail.builder()
                        .user(user)
                        .name(miner.getUsername())
                        .balance(user.getBalance())
                        .date(new Date())
                        .money(price*(-1))
                        .build();
                incomeDetailRepository.save(incomeDetail);
                return success();
            }
        }else{
            return fail(Result.HAVE_NOT_MINER);
        }
    }

    @Override
    public OperateResult queryPayMoney(String userId, Integer minerId) {
        if(minerRepository.existsById(minerId)){
            Miner miner = minerRepository.findById(minerId).get();
            User user = userRepository.findById(userId).get();
            float price  = miner.getPrice();
            if(user.getMiner() != null){
                if(user.getMiner().getPrice() >= miner.getPrice()){
                    return fail(Result.MINER_HIGH_TO_THIS);
                }else{
                    price = miner.getPrice() - user.getMiner().getPrice();
                }
            }
            if(user.getBalance() <  price){
                return fail(Result.HAVE_NOT_BALANCE);
            }else{
                return success(price);
            }
        }else{
            return fail(Result.HAVE_NOT_MINER);
        }
    }

    @Override
    public OperateResult queryUserOrderLists(String userId) {
        List<Order> orders = orderRepository.findByUserId(userId);
        return success(orders);
    }

    @Override
    public Page<Order> queryWithPage(int page, int size,String keyword,OrderStatus orderStatus) {
        Specification<Order> specification = new Specification<Order>() {
            @Override
            public Predicate toPredicate(Root<Order> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(StringUtils.isNotEmpty(keyword)){
                    predicate.add(cb.like(root.get("user").get("phone").as(String.class), "%" + keyword + "%"));
                }
                if(orderStatus != null){
                    predicate.add(cb.equal(root.get("orderStatus").as(OrderStatus.class), orderStatus));
                }
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "updateTime");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Order> orders = orderRepository.findAll(specification,pageRequest);
        return orders;
    }

    @Override
    public OperateResult pass(Integer orderId) {
        Order order = orderRepository.findById(orderId).get();
        User user  = userRepository.findById(order.getUser().getId()).get();
        Miner miner  = order.getMiner();
        if(user.getMiner() == null){//第一次购买才计算直接收益
            if(user.getCode() != 0){
                //计算直推收益
                userService.calculationDirectRecommendation(user.getCode(),miner.getPrice());
            }
        }
        user.setProfit(miner.getProfit());
        user.setMiner(miner);
        userRepository.save(user);
        order.setOrderStatus(OrderStatus.ORDER_PAID);
        orderRepository.save(order);
        return success();
    }

    @Override
    public OperateResult unpass(Integer orderId) {
        Order order = orderRepository.findById(orderId).get();
        User user  = userRepository.findById(order.getUser().getId()).get();
        //增加用户余额
        user.setBalance(user.getBalance() + order.getPrice());
        userRepository.save(user);
        //增加收支明细
        IncomeDetail incomeDetail = IncomeDetail.builder()
                .user(user)
                .name(order.getMiner().getUsername()+" 退款")
                .balance(user.getBalance())
                .date(new Date())
                .money(order.getPrice())
                .build();
        incomeDetailRepository.save(incomeDetail);

        order.setOrderStatus(OrderStatus.CANCELD);
        orderRepository.save(order);
        return success();
    }
}
