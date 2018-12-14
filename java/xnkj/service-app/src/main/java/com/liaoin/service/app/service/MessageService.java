package com.liaoin.service.app.service;

import com.liaoin.message.Enum.SmsType;
import com.liaoin.service.base.message.OperateResult;

public interface MessageService {

    public OperateResult sendMessage(String phone, SmsType smsType);

}
