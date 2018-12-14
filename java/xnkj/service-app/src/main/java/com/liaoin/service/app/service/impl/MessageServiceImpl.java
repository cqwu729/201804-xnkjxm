package com.liaoin.service.app.service.impl;

import com.liaoin.message.Enum.SmsType;
import com.liaoin.message.util.SmsUtils;
import com.liaoin.service.app.bean.Message;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.MessageRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.service.MessageService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageRepository messageRepository;

    @Override
    public OperateResult sendMessage(String phone, SmsType smsType) {
        if(SmsType.REGISTER == smsType){
            return sendRegisterMessage(phone);
        }else{
            return sendForgetPasswordMessage(phone);
        }
    }

    private OperateResult sendRegisterMessage(String phone){
        try {
            User user = userRepository.findByPhone(phone);
            if(user != null){
                return fail(Result.USER_REGISTERED);
            }else{
                int verify = (int)(Math.random()*9000 + 1000);
                String content = "尊敬的用户，您好，您此次的验证码是" + verify + "；此验证码半个小时内有效；";
                int smsResult = SmsUtils.sendSms(phone,content);
                if(smsResult > 0){
                    Message message = Message.builder()
                            .phone(phone)
                            .addTime(new Date())
                            .content(content)
                            .verify(verify)
                            .build();
                    messageRepository.save(message);
                    return success(message);
                }else{
                    return fail(Result.SEND_MESSAGE_FAIL);
                }

            }
        }catch (Exception e){
            return fail();
        }
    }

    private OperateResult sendForgetPasswordMessage(String phone){
        try {
            User user = userRepository.findByPhone(phone);
            if(user == null){
                return fail(Result.NO_USER);
            }else{
                int verify = (int)(Math.random()*9000 + 1000);
                String content = "尊敬的用户，您好，您此次的验证码是" + verify + "；此验证码半个小时内有效；";
                int smsResult = SmsUtils.sendSms(phone,content);
                if(smsResult > 0) {
                    Message message = Message.builder()
                            .phone(phone)
                            .addTime(new Date())
                            .content(content)
                            .verify(verify)
                            .build();
                    messageRepository.save(message);
                    return success(message);
                }else{
                    return fail(Result.SEND_MESSAGE_FAIL);
                }
            }
        }catch (Exception e){
            return fail();
        }
    }
}
