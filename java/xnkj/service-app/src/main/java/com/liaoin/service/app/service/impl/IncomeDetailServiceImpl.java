package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.bean.IncomeDetail;
import com.liaoin.service.app.bean.RevenueRecord;
import com.liaoin.service.app.dao.IncomeDetailRepository;
import com.liaoin.service.app.service.IncomeDetailService;
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
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.success;

/**
 * IncomeDetailServiceImpl
 *
 * @author cqwu729
 * @date 2018/11/13 20:34
 */
@Service
public class IncomeDetailServiceImpl implements IncomeDetailService {

    @Autowired
    private IncomeDetailRepository incomeDetailRepository;

    @Override
    public OperateResult queryWithPage(int page, Integer size, String userId) {
        Specification<IncomeDetail> specification = new Specification<IncomeDetail>() {
            @Override
            public Predicate toPredicate(Root<IncomeDetail> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(StringUtils.isNotEmpty(userId)) {
                    predicate.add(cb.equal(root.get("user").get("id").as(String.class), userId));
                }

                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "date");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<IncomeDetail> incomeDetails = incomeDetailRepository.findAll(specification,pageRequest);
        return success(incomeDetails);
    }
}
