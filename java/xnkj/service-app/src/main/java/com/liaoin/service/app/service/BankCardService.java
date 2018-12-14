package com.liaoin.service.app.service;

import com.liaoin.service.app.bean.BankCard;
import com.liaoin.service.base.message.OperateResult;

public interface BankCardService {

    public OperateResult save(BankCard bankCard);

    public OperateResult  queryUserBankCardLists(String userId);

    OperateResult queryUserBankCard(String userId);

    OperateResult queryUserImtoken(String userId);
}
