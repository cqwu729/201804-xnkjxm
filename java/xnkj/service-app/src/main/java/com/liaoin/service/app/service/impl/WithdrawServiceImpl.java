package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.Enum.RevenueType;
import com.liaoin.service.app.bean.*;
import com.liaoin.service.app.dao.IncomeDetailRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.dao.WithdrawRepository;
import com.liaoin.service.app.service.WithdrawService;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class WithdrawServiceImpl  implements WithdrawService {

    @Autowired
    private WithdrawRepository withdrawRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private IncomeDetailRepository incomeDetailRepository;

    @Override
    public OperateResult queryUserWithdrawLists(String userId) {
        List<Withdraw> withdraws  = withdrawRepository.findByUserId(userId);
        return success(withdraws);
    }

    @Override
    public Page<Withdraw> queryWithPage(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "updateTime");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Withdraw> withdraws = withdrawRepository.findAll(pageRequest);
        return withdraws;
    }

    @Override
    public OperateResult deal(String id) {
        Withdraw withdraw = withdrawRepository.findById(id).get();
        withdraw.setOrderStatus(OrderStatus.ORDER_PAID);
        withdraw.setUpdateTime(new Date());
        withdrawRepository.save(withdraw);
        return success();
    }

    @Override
    public OperateResult unpass(String id) {
        Withdraw withdraw = withdrawRepository.findById(id).get();
        withdraw.setOrderStatus(OrderStatus.CANCELD);
        withdraw.setUpdateTime(new Date());
        withdrawRepository.save(withdraw);
        //添加用户余额
        User user = userRepository.findById(withdraw.getUser().getId()).get();
        user.setBalance(user.getBalance() + withdraw.getMoney());
        userRepository.save(user);

        //增加收支明细
        IncomeDetail incomeDetail = IncomeDetail.builder()
                .user(user)
                .name("提现退款")
                .balance(user.getBalance())
                .date(new Date())
                .money(withdraw.getMoney())
                .build();
        incomeDetailRepository.save(incomeDetail);
        return success();
    }
}
