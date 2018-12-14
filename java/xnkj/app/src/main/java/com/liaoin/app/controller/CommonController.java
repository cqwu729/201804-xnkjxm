package com.liaoin.app.controller;

import com.liaoin.app.annotation.LoadUserId;
import com.liaoin.app.file.FileUtils;
import com.liaoin.message.Enum.SmsType;
import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.Advertisement;
import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.app.bean.RevenueRecord;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.service.AdvertisementService;
import com.liaoin.service.app.service.MessageService;
import com.liaoin.service.app.service.RevenueRecordService;
import com.liaoin.service.app.service.UserService;
import com.liaoin.service.base.constant.Constant;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.util.Date;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@Api(value = "公共接口", description = "公共接口")
@Controller
@RequestMapping("/Common")
public class CommonController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private AdvertisementService advertisementService;

    @Autowired
    private RevenueRecordService revenueRecordService;

    @Autowired
    private UserService userService;

    @ApiOperation(value = "发送验证码",notes = "发送验证码")
    @RequestMapping(value = "/sendMessage",method = RequestMethod.POST)
    public ResponseEntity sendMessage(
            @ApiParam(value = "手机号", required = true) @RequestParam String phone,
            @ApiParam(value = "验证码类型", required = true) @RequestParam SmsType smsType
    ){
        return ok(messageService.sendMessage(phone,smsType));
    }

    @ApiOperation(value = "文件上传", notes = "文件上传")
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public ResponseEntity fileUpload(
            @ApiParam(value = "上传的文件资源", required = true) @RequestParam MultipartFile file,
            HttpServletRequest request
    ) throws Exception {
        return ok(FileUtils.upload(file, request));
    }

    @ApiOperation(value = "获取广告轮播", notes = "获取广告轮播",response = Advertisement.class)
    @RequestMapping(value = "/queryAdvertisements", method = RequestMethod.POST)
    public ResponseEntity queryAdvertisements() throws Exception {
        return ok(advertisementService.queryAdvertisementsByIcon("INDEX"));
    }

    @ApiOperation(value = "测试定时任务",notes = "测试定时任务",response = Authentication.class)
    @RequestMapping(value = "/test",method = RequestMethod.POST)
    public ResponseEntity test(){
        //收取昨日全部的收益
        List<RevenueRecord> revenueRecords = revenueRecordService.findAll();
        for (RevenueRecord revenueRecord : revenueRecords){
            revenueRecordService.collectRevenue(revenueRecord.getUser().getId(),revenueRecord.getId());
        }
        //固定收益
        revenueRecordService.calculation();
        //计算算例排行榜
        userService.updateCalculationForce();
        //动态收益
        List<User> users  = userService.findAll();
        for (User user : users){
            //清空今日收益，修改昨日收益
            user.setYesterdayIncome(user.getTodayIncome());
            user.setTodayIncome(0);
            //计算所有用户团队 总收益
            user.setTotalCalculationForce((userService.queryUserTotalCalculationForce(user.getId()))/10);
            userService.save(user);
            if(user.getRoleStatus() == UserStatus.ENABLE){
                userService.calculationCynamicIncome(user.getId(),user.getId());
            }
        }
        return ok(11);
    }


}
