package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.Enum.AuthenticationStatus;
import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.AuthenticationRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.service.AuthenticationService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
@Transactional
public class AuthenticationServiceImpl implements AuthenticationService {

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public OperateResult authentication(String userId, String positive, String opposite,String username,String idCardNumber) {
        if(userRepository.existsById(userId)){
            User user = userRepository.findById(userId).get();
            Authentication authentication = authenticationRepository.findByUserId(user.getId());
            if(authentication == null || (authentication != null && authentication.getAuthenticationStatus() == AuthenticationStatus.NO)){
                Integer id = null;
                if(authentication !=  null){
                    id = authentication.getId();
                }
                authentication = Authentication.builder()
                        .id(id)
                        .user(user)
                        .positive(positive)
                        .opposite(opposite)
                        .authenticationStatus(AuthenticationStatus.WAIT)
                        .addTime(new Date())
                        .username(username)
                        .idCardNumber(idCardNumber)
                        .build();
                authenticationRepository.save(authentication);
                user.setUsername(username);
                user.setIdCardNumber(idCardNumber);
                userRepository.save(user);
                return success();
            }else{
                return fail(Result.ALREDAY_AUTH);
            }
        }else{
            return fail(Result.NO_USER);
        }
    }

    @Override
    public Page<Authentication> queryWithPage(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "addTime");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<Authentication> authentications = authenticationRepository.findAll(pageRequest);
        return authentications;
    }

    @Override
    public OperateResult pass(Integer id, AuthenticationStatus authenticationStatus) {
        Authentication authentication = authenticationRepository.findById(id).get();
        authentication.setAuthenticationStatus(authenticationStatus);
        authenticationRepository.save(authentication);
        return success();
    }

    @Override
    public OperateResult queryUserAuthentication(String userId) {
        Authentication authentication = authenticationRepository.findByUserId(userId);
        return success(authentication);
    }
}
