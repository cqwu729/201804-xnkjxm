package com.liaoin.app.controller;

import com.liaoin.common.md5.MD5Encoder;
import com.liaoin.service.app.bean.CalculationForce;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.service.MinerService;
import com.liaoin.service.app.service.NoticeService;
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

@Api(value = "首页相关接口", description = "首页相关接口")
@Controller
@RequestMapping("/Index")
public class IndexController {

    @Autowired
    private MinerService minerService;

    @Autowired
    private UserService userService;

    @Autowired
    private NoticeService noticeService;

    @ApiOperation(value = "获取所有矿机列表",notes = "获取所有矿机列表",response = Miner.class)
    @RequestMapping(value = "/queryMinerLists",method = RequestMethod.POST)
    public ResponseEntity queryMinerLists(){
        return ok(minerService.queryMinerLists());
    }

    @ApiOperation(value = "获取收益排行",notes = "获取收益排行",response = User.class)
    @RequestMapping(value = "/queryIncomeRanking",method = RequestMethod.POST)
    public ResponseEntity queryIncomeRanking(){
        return ok(userService.queryWithPageOrderByIncome(0,10));
    }

    @ApiOperation(value = "获取算力排行",notes = "获取算力排行",response = CalculationForce.class)
    @RequestMapping(value = "/queryCalculationForceRanking",method = RequestMethod.POST)
    public ResponseEntity queryCalculationForceRanking(){
        return ok(userService.queryWithPageCalculationForceOrderByMoney(0,10));
    }

    @ApiOperation(value = "获取公告咨询列表",notes = "获取公告咨询列表[1：资讯；2：公告]",response = CalculationForce.class)
    @RequestMapping(value = "/queryNoticeLists",method = RequestMethod.POST)
    public ResponseEntity queryNoticeLists(
            @ApiParam(value = "栏目ID") @RequestParam Integer columnId
    ){
        return ok(noticeService.findByColumnId(columnId));
    }

    @ApiOperation(value = "获取公告咨询详情",notes = "获取公告咨询详情",response = CalculationForce.class)
    @RequestMapping(value = "/queryNoticeInfo",method = RequestMethod.POST)
    public ResponseEntity queryNoticeInfo(
            @ApiParam(value = "id") @RequestParam Integer id
    ){
        return ok(noticeService.findId(id));
    }
}
