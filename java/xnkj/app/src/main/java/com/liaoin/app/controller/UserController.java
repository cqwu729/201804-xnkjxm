package com.liaoin.app.controller;


import com.liaoin.app.annotation.LoadUserId;
import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.bean.*;
import com.liaoin.service.app.service.*;
import com.liaoin.service.base.constant.Constant;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import static com.liaoin.service.base.message.OperateResult.success;
import static org.springframework.http.ResponseEntity.ok;

@Api(value = "用户相关-API", description = "用户相关-API")
@Controller
@RequestMapping("/User")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private WithdrawService withdrawService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private RevenueRecordService revenueRecordService;

    @Autowired
    private IncomeDetailService incomeDetailService;

    @ApiOperation(value = "获取用户详细信息",notes = "获取用户详细信息",response = User.class)
    @RequestMapping(value = "/queryUserInfo",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserInfo(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(userService.findById(userId));
    }

    @ApiOperation(value = "提现",notes = "提现",response = Withdraw.class)
    @RequestMapping(value = "/withdraw",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity withdraw(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "提现金额",required = true) @RequestParam float money,
            @ApiParam(value = "验证码", required = true) @RequestParam int verify,
            @ApiParam(value = "银行卡信息ID",required = true) @RequestParam String bankCardId
    ){
        return ok(userService.withdraw(userId,money,bankCardId,verify));
    }

    @ApiOperation(value = "获取提现记录",notes = "获取提现记录",response = Withdraw.class)
    @RequestMapping(value = "/queryUserWithdrawLists",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserWithdrawLists(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(withdrawService.queryUserWithdrawLists(userId));
    }

    @ApiOperation(value = "获取我的团队信息",notes = "获取我的团队信息",response = ExtensionRecord.class)
    @RequestMapping(value = "/queryMyTeams",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryMyTeams(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(userService.queryMyTeams(userId));
    }

    @ApiOperation(value = "获取我的订单",notes = "获取我的订单",response = Order.class)
    @RequestMapping(value = "/queryMyOrders",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryMyOrders(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(orderService.queryUserOrderLists(userId));
    }

    @ApiOperation(value = "修改个人信息",notes = "修改个人信息",response = User.class)
    @RequestMapping(value = "/saveUserInfo",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity saveUserInfo(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "姓名") @RequestParam(required = false) String username,
            @ApiParam(value = "身份证号") @RequestParam(required = false) String idCardNumber,
            @ApiParam(value = "头像") @RequestParam(required = false) String picture
    ){
        return ok(userService.saveUserInfo(userId,username,idCardNumber,picture));
    }

    @ApiOperation(value = "实名认证",notes = "实名认证",response = Authentication.class)
    @RequestMapping(value = "/authentication",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity authentication(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "身份证正面",required = true) @RequestParam String positive,
            @ApiParam(value = "身份证反面",required = true) @RequestParam String opposite,
            @ApiParam(value = "姓名",required = true) @RequestParam String username,
            @ApiParam(value = "身份证号",required = true) @RequestParam String idCardNumber
    ){
        return ok(authenticationService.authentication(userId,positive,opposite,username,idCardNumber));
    }

    @ApiOperation(value = "获取我的收益记录",notes = "获取我的收益记录",response = Authentication.class)
    @RequestMapping(value = "/queryMyRevenueRecordLists",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryMyRevenueRecordLists(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "页数") @RequestParam Integer p,
            @ApiParam(value = "条数") @RequestParam Integer size
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        return ok(revenueRecordService.queryWithPage(page,size,userId, RevenueStatus.NO));
    }

    @ApiOperation(value = "收取收益",notes = "收取收益",response = Authentication.class)
    @RequestMapping(value = "/collectRevenue",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity collectRevenue(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "身份证正面",required = true) @RequestParam Integer revenueRecordId
    ){
        return ok(revenueRecordService.collectRevenue(userId,revenueRecordId));
    }

    @ApiOperation(value = "获取团队总收益",notes = "获取团队总收益",response = Authentication.class)
    @RequestMapping(value = "/queryUserTotalCalculationForce",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserTotalCalculationForce(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(userService.queryUserTotalCalculationForce(userId));
    }

    @ApiOperation(value = "获取我的收支明细",notes = "获取我的收支明细",response = IncomeDetail.class)
    @RequestMapping(value = "/queryIncomeDetailLists",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryIncomeDetailLists(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId,
            @ApiParam(value = "页数") @RequestParam Integer p,
            @ApiParam(value = "条数") @RequestParam Integer size
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        return ok(incomeDetailService.queryWithPage(page,size,userId));
    }

    @ApiOperation(value = "获取用户认证信息",notes = "获取用户认证信息",response = IncomeDetail.class)
    @RequestMapping(value = "/queryUserAuthentication",method = RequestMethod.POST)
    @ApiImplicitParams({@ApiImplicitParam(name = Constant.AUTHENTICATION.AUTHORIZATION, value = Constant.AUTHENTICATION.AUTHORIZATION, required = true, dataType = "string", paramType = "header"),})
    public ResponseEntity queryUserAuthentication(
            @ApiParam(value = "登录用户Id" ,hidden = true) @LoadUserId String userId
    ){
        return ok(authenticationService.queryUserAuthentication(userId));
    }


}
