package com.liaoin.service.app.service;

import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.Withdraw;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

public interface WithdrawService {

    public OperateResult  queryUserWithdrawLists(String userId);

    public OperateResult  deal(String id);


    public Page<Withdraw> queryWithPage(int page, int size);

    OperateResult unpass(String id);
}
