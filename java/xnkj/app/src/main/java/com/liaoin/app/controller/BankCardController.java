package com.liaoin.app.controller;

import com.liaoin.app.annotation.LoadUserId;
import com.liaoin.message.Enum.SmsType;
import com.liaoin.service.app.bean.BankCard;
import com.liaoin.service.app.service.BankCardService;
import com.liaoin.service.base.constant.Constant;
import io.swagger.annotations.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.http.ResponseEntity.ok;

@Api(value = "银行卡接口", description = "银行卡接口")
@Controller
@RequestMapping("/BankCard")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @ApiOperation(value = "添加银行卡",notes = "注意：设置银行卡的时候填写姓名和银行卡号，设置Imtoken的时候只填写address字段,address不为空则说明是设置Imtoken的，反之则相反")
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity add(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
//            @ApiParam(value = "ID") @RequestParam(required = false) String id,
            @ApiParam(value = "姓名") @RequestParam(required = false) String username,
            @ApiParam(value = "银行卡号") @RequestParam(required = false) String number,
            @ApiParam(value = "开户行") @RequestParam(required = false) String name,
            @ApiParam(value = "imToken地址") @RequestParam(required = false) String address
    ){
        BankCard bankCard  = BankCard.builder()
                .userId(userId)
                .build();
        if(StringUtils.isNotEmpty(address)){
            bankCard.setAddress(address);
            bankCard.setUsername(null);
            bankCard.setNumber(null);
            bankCard.setName(null);
        }else{
            bankCard.setAddress(null);
            bankCard.setUsername(username);
            bankCard.setNumber(number);
            bankCard.setName(name);
        }
        return ok(bankCardService.save(bankCard));
    }

    @ApiOperation(value = "获取用户银行卡列表",notes = "获取用户银行卡列表",response = BankCard.class)
    @RequestMapping(value = "/queryUserBankCardLists",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserBankCardLists(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(bankCardService.queryUserBankCardLists(userId));
    }

    @ApiOperation(value = "获取银行卡信息",notes = "获取银行卡信息",response = BankCard.class)
    @RequestMapping(value = "/queryUserBankCard",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserBankCard(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(bankCardService.queryUserBankCard(userId));
    }

    @ApiOperation(value = "获取Imtoken信息",notes = "获取Imtoken信息",response = BankCard.class)
    @RequestMapping(value = "/queryUserImtoken",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserImtoken(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(bankCardService.queryUserImtoken(userId));
    }
}
