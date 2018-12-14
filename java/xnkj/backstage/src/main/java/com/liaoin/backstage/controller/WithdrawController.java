package com.liaoin.backstage.controller;

import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.Withdraw;
import com.liaoin.service.app.service.OrderService;
import com.liaoin.service.app.service.WithdrawService;
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

import static org.springframework.http.ResponseEntity.ok;

@Controller
@RequestMapping("Withdraw")
public class WithdrawController {

    @Autowired
    private WithdrawService withdrawService;
    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(
            @RequestParam(required = false) Integer p,
            @RequestParam(required = false) String keyword,
            HttpServletRequest request,
            ModelAndView modelAndView
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        Page<Withdraw> withdraws = withdrawService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT);
        PageResult<Withdraw> pageResult = new PageResult<Withdraw>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,withdraws);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.setViewName("Withdraw/index");
        return modelAndView;
    }

    @RequestMapping(value = "/deal",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity deal(
            @RequestParam String id
    ) throws Exception{
        return ok(withdrawService.deal(id));
    }

    @RequestMapping(value = "/unpass",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity unpass(
            @RequestParam String id
    ) throws Exception{
        return ok(withdrawService.unpass(id));
    }

    @RequestMapping(value = "/ewm",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView ewm(
            @RequestParam String token,
            ModelAndView modelAndView
    ) throws Exception{
        modelAndView.addObject("token",token);
        modelAndView.setViewName("Withdraw/ewm");
        return modelAndView;
    }
}
