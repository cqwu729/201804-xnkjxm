package com.liaoin.app.controller;

import com.liaoin.service.app.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import static org.springframework.http.ResponseEntity.ok;

@Api(value = "登录注册相关-API", description = "登录注册相关-API")
@Controller
@RequestMapping("/Login")
public class LoginController {

    @Autowired
    private UserService userService;

    @ApiOperation(value = "登录接口",notes = "登录接口")
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    public ResponseEntity doLogin(
            @ApiParam(value = "手机号", required = true) @RequestParam String phone,
            @ApiParam(value = "密码", required = true) @RequestParam String password
    ){
        return ok(userService.login(phone,password));
    }

    @ApiOperation(value = "注册",notes = "注册")
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public ResponseEntity register(
            @ApiParam(value = "手机号", required = true) @RequestParam String phone,
            @ApiParam(value = "验证码", required = true) @RequestParam int verify,
            @ApiParam(value = "密码", required = true) @RequestParam String password,
            @ApiParam(value = "确认密码", required = true) @RequestParam String confirmPassword,
            @ApiParam(value = "推荐码") @RequestParam(required = false) Integer recommendCode
    ){
        return ok(userService.register(phone,verify,password,confirmPassword,recommendCode));
    }

    @ApiOperation(value = "忘记密码",notes = "忘记密码")
    @RequestMapping(value = "/forgetPassword",method = RequestMethod.POST)
    public ResponseEntity forgetPassword(
            @ApiParam(value = "手机号", required = true) @RequestParam String phone,
            @ApiParam(value = "验证码", required = true) @RequestParam int verify,
            @ApiParam(value = "密码", required = true) @RequestParam String password,
            @ApiParam(value = "确认密码", required = true) @RequestParam String confirmPassword
    ){
        return ok(userService.forgetPassword(phone,verify,password,confirmPassword));
    }
}
