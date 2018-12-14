package com.liaoin.backstage.controller;

import com.liaoin.backstage.annotation.LoadAdmin;
import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.service.*;
import com.liaoin.service.backstage.Enum.RoleStatus;
import com.liaoin.service.backstage.bean.Admin;
import com.liaoin.service.base.constant.Constant;
import com.liaoin.service.base.message.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static org.springframework.http.ResponseEntity.ok;

@Controller
@RequestMapping("User")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private MinerService minerService;

    @Autowired
    private RevenueRecordService revenueRecordService;

    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(
            @LoadAdmin Admin admin,
            @RequestParam(required = false) Integer p,
            @RequestParam(required = false) String keyword,
            HttpServletRequest request,
            ModelAndView modelAndView
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        boolean hide = true;
        if(admin.getId().equals("1")){
            hide = false;
        }
        Page<User> users = userService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT,keyword,hide);
        PageResult<User> pageResult = new PageResult<User>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,users);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.setViewName("User/index");
        return modelAndView;
    }

    @RequestMapping(value = "/recharge",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView recharge(
            @RequestParam String id,
            ModelAndView modelAndView
    ){
        modelAndView.addObject("userId",id);
        modelAndView.setViewName("User/recharge");
        return modelAndView;
    }

    /**
     * 提交数据
     */
    @RequestMapping(value = "/post",method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity post(
            @RequestParam String userId,
            @RequestParam(required = false) Float money,
            @RequestParam(required = false) Integer minerId
    ){
        return ok(userService.post(userId,money,minerId));
    }



    @RequestMapping(value = "/miners",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView miner(
            @RequestParam String id,
            ModelAndView modelAndView
    ){
        modelAndView.addObject("userId",id);
        List<Miner> miners  = minerService.queryMiners();
        modelAndView.addObject("miners",miners);
        User user = userService.findId(id);
        if(user.getMiner() != null){
            modelAndView.addObject("minerId",user.getMiner().getId());
        }
        modelAndView.addObject("userId",id);
        modelAndView.setViewName("User/miners");
        return modelAndView;
    }

    /**
     * 立即执行定制任务
     */
    @RequestMapping(value = "/run",method = RequestMethod.GET)
    public ResponseEntity run(){
//        userService.updateCalculationForce();
        List<User> users  = userService.findAll();
        for (User user : users){
            userService.calculationCynamicIncome(user.getId(),user.getId());
        }
        return ok(11);
    }

    /**
     * 提交数据
     */
    @RequestMapping(value = "/dealStatus",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity dealStatus(
            @RequestParam String id,
            @RequestParam UserStatus status
    ){
        return ok(userService.dealStatus(id,status));
    }
}
