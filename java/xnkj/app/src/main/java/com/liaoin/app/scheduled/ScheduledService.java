package com.liaoin.app.scheduled;

import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.RevenueRecord;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.service.RevenueRecordService;
import com.liaoin.service.app.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Slf4j
@Component
public class ScheduledService {

    @Autowired
    private RevenueRecordService revenueRecordService;

    @Autowired
    private UserService userService;

    @Scheduled(cron = "0 0 0 * * ?")//每天晚上12点触发
    public void scheduled(){
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
        log.info("这是每天晚上12点触发的任务",new Date());
    }

//    @Scheduled(cron = "0 0/10 * * * ?")//每隔10分钟执行一次
//    public void scheduled1(){
//        //收取昨日全部的收益
//        List<RevenueRecord> revenueRecords = revenueRecordService.findAll();
//        for (RevenueRecord revenueRecord : revenueRecords){
//            revenueRecordService.collectRevenue(revenueRecord.getUser().getId(),revenueRecord.getId());
//        }
//        //固定收益
//        revenueRecordService.calculation();
//        //计算算例排行榜
//        userService.updateCalculationForce();
//        //动态收益
//        List<User> users  = userService.findAll();
//        for (User user : users){
//            //清空今日收益，修改昨日收益
//            user.setYesterdayIncome(user.getTodayIncome());
//            user.setTodayIncome(0);
//            //计算所有用户团队 总收益
//            user.setTotalCalculationForce(userService.queryUserTotalCalculationForce(user.getId()));
//            userService.save(user);
//            userService.calculationCynamicIncome(user.getId(),user.getId());
//        }
//        log.info("这是每隔10分钟执行一次的任务",new Date());
//    }
}
