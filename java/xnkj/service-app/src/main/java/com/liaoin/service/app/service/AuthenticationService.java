package com.liaoin.service.app.service;

import com.liaoin.service.app.Enum.AuthenticationStatus;
import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

public interface AuthenticationService {

    public OperateResult authentication(String userId,String positive,String opposite,String username,String idCardNumber);

    Page<Authentication> queryWithPage(int page, int size);

    OperateResult pass(Integer id, AuthenticationStatus authenticationStatus);

    OperateResult queryUserAuthentication(String userId);
}
