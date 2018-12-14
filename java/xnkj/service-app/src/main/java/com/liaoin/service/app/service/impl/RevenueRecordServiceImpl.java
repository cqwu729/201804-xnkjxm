package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.Enum.RevenueType;
import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.IncomeDetail;
import com.liaoin.service.app.bean.RevenueRecord;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.IncomeDetailRepository;
import com.liaoin.service.app.dao.RevenueRecordRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.service.RevenueRecordService;
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
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
@Transactional
public class RevenueRecordServiceImpl implements RevenueRecordService {

    @Autowired
    private UserRepository  userRepository;

    @Autowired
    private RevenueRecordRepository revenueRecordRepository;

    @Autowired
    private IncomeDetailRepository incomeDetailRepository;

    @Override
    public OperateResult calculation() {
        //查询所有用户
        List<User> users = userRepository.findAll();
        for (User user : users){
            if(user.getMiner() != null && user.getRoleStatus() == UserStatus.ENABLE){
//                RevenueRecord revenueRecord  = revenueRecordRepository.findByUserIdAndDate(user.getId(),new Date());
//                if(revenueRecord == null){
                if(user.getProfit() > 0){
                    RevenueRecord revenueRecord1  = RevenueRecord.builder()
                            .user(user)
                            .miner(user.getMiner())
                            .money(user.getProfit())
                            .date(new Date())
                            .revenueStatus(RevenueStatus.NO)
                            .revenueType(RevenueType.GDSY)
                            .build();
                    revenueRecordRepository.save(revenueRecord1);
                }
//                    user.setBalance(user.getBalance() + revenueRecord1.getMoney());
//                    user.setTotalIncome(user.getTotalIncome() + revenueRecord1.getMoney());
//                    user.setYesterdayIncome(revenueRecord1.getMoney());
//                    userRepository.save(user);
//                }
            }

        }
        return success();
    }

    @Override
    public OperateResult queryMyRevenueRecordLists(String userId) {
        List<RevenueRecord> revenueRecords = revenueRecordRepository.findByUserIdAndRevenueStatus(userId,RevenueStatus.NO);
        return success(revenueRecords);
    }

    @Override
    public OperateResult collectRevenue(String userId, Integer revenueRecordId) {
        if(revenueRecordRepository.existsById(revenueRecordId)){
            RevenueRecord revenueRecord = revenueRecordRepository.findById(revenueRecordId).get();
            if(revenueRecord.getRevenueStatus() == RevenueStatus.NO){
                User user = userRepository.findById(userId).get();
                user.setBalance(user.getBalance() + revenueRecord.getMoney());
                user.setTotalIncome(user.getTotalIncome() + revenueRecord.getMoney());
                user.setTodayIncome(revenueRecord.getMoney() + user.getTodayIncome());//添加今日收益
                userRepository.save(user);
                //增加收支明细
                IncomeDetail incomeDetail = IncomeDetail.builder()
                        .user(user)
                        .name(revenueRecord.getRevenueType().getName())
                        .balance(user.getBalance())
                        .date(new Date())
                        .money(revenueRecord.getMoney())
                        .build();
                incomeDetailRepository.save(incomeDetail);
                revenueRecord.setRevenueStatus(RevenueStatus.YES);
                revenueRecordRepository.save(revenueRecord);
                return success();
            }else{
                return fail();
            }
        }else{
            return fail();
        }
    }

    @Override
    public Page<RevenueRecord> queryWithPage(int page, int size, String userId,RevenueStatus revenueStatus) {
        Specification<RevenueRecord> specification = new Specification<RevenueRecord>() {
            @Override
            public Predicate toPredicate(Root<RevenueRecord> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(StringUtils.isNotEmpty(userId)) {
                    predicate.add(cb.equal(root.get("user").get("id").as(String.class), userId));
                }

                if(revenueStatus != null){
                    predicate.add(cb.equal(root.get("revenueStatus").as(RevenueStatus.class), revenueStatus));
                }

                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "date");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<RevenueRecord> revenueRecords = revenueRecordRepository.findAll(specification,pageRequest);
        return revenueRecords;
    }

    @Override
    public List<RevenueRecord> findAll() {
        return revenueRecordRepository.findAll();
    }
}
