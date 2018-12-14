package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.bean.Column;
import com.liaoin.service.app.bean.Notice;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.ColumnRepository;
import com.liaoin.service.app.dao.NoticeRepository;
import com.liaoin.service.app.service.NoticeService;
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
 * NoticeServiceImpl
 *
 * @author cqwu729
 * @date 2018/11/11 18:21
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeRepository noticeRepository;

    @Autowired
    private ColumnRepository columnRepository;

    @Override
    public OperateResult save(Notice notice) {
        noticeRepository.save(notice);
        return success();
    }

    @Override
    public Page<Notice> queryWithPage(int page, int size,Integer columnId,String name){
        Specification<Notice> specification = new Specification<Notice>() {
            @Override
            public Predicate toPredicate(Root<Notice> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(columnId != null) {
                    predicate.add(cb.equal(root.get("column").get("id").as(Integer.class), columnId));
                }
                if(StringUtils.isNotEmpty(name)) {
                    predicate.add(cb.like(root.get("name").as(String.class), "%"+name+"%"));
                }

                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "addTime");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Notice> notices = noticeRepository.findAll(specification,pageRequest);
        return notices;
    }

    @Override
    public List<Column> findAllColumns() {
        return columnRepository.findAll();
    }

    @Override
    public Notice findById(Integer id) {
        return noticeRepository.findById(id).get();
    }

    @Override
    public OperateResult deleteById(Integer id) {
        noticeRepository.deleteById(id);
        return success();
    }

    @Override
    public OperateResult findByColumnId(Integer columnId) {
        List<Notice> notices = noticeRepository.findByColumn_Id(columnId);
        return success(notices);
    }

    @Override
    public OperateResult findId(Integer id) {
        Notice notice = noticeRepository.findById(id).get();
        notice.setCount(notice.getCount()+1);
        noticeRepository.save(notice);
        return success(notice);
    }
}
