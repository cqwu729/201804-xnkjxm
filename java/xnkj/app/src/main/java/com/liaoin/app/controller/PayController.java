package com.liaoin.app.controller;

import com.liaoin.app.annotation.LoadUserId;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.service.OrderService;
import com.liaoin.service.base.constant.Constant;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.http.ResponseEntity.ok;

@Api(value = "支付相关接口", description = "支付相关接口")
@Controller
@RequestMapping("/Pay")
public class PayController {

    @Autowired
    private OrderService orderService;

    @ApiOperation(value = "购买",notes = "购买",response = Order.class)
    @RequestMapping(value = "/buy",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity buy(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "矿机ID" ,required = true) @RequestParam Integer minerId
    ){
        return ok(orderService.buy(userId,minerId));
    }

    @ApiOperation(value = "获取支付价格",notes = "获取支付价格")
    @RequestMapping(value = "/queryPayMoney",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryPayMoney(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "矿机ID" ,required = true) @RequestParam Integer minerId
    ){
        return ok(orderService.queryPayMoney(userId,minerId));
    }
}
