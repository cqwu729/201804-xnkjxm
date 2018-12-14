package com.liaoin.service.app.service;

import com.liaoin.service.app.bean.Column;
import com.liaoin.service.app.bean.Notice;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * NoticeService
 *
 * @author cqwu729
 * @date 2018/11/11 18:21
 */
public interface NoticeService {

    public OperateResult save(Notice notice);

    public Page<Notice> queryWithPage(int page, int size,Integer columnId,String name);

    public List<Column> findAllColumns();

    public Notice findById(Integer id);

    public OperateResult deleteById(Integer id);

    public OperateResult findByColumnId(Integer columnId);

    public OperateResult findId(Integer id);
}
