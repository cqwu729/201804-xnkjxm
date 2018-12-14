package com.liaoin.service.app.service;

import com.liaoin.service.base.message.OperateResult;

/**
 * IncomeDetailService
 *
 * @author cqwu729
 * @date 2018/11/13 20:34
 */
public interface IncomeDetailService {

    /**
     * 获取我的收支明细
     * @param page
     * @param size
     * @param userId
     * @return
     */
    OperateResult queryWithPage(int page, Integer size, String userId);
}
