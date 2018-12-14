package com.liaoin.backstage.controller;

import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.bean.Miner;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.service.OrderService;
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
@RequestMapping("Order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(
            @RequestParam(required = false) Integer p,
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) OrderStatus orderStatus,
            HttpServletRequest request,
            ModelAndView modelAndView
    ){
        int page = 0;
        if(p != null){
            page = p - 1;
        }
        Page<Order> orders = orderService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT,keyword,orderStatus);
        PageResult<Order> pageResult = new PageResult<Order>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,orders);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.addObject("orderStatusLists", OrderStatus.values());
        modelAndView.addObject("orderStatus",orderStatus);
        modelAndView.setViewName("Order/index");
        return modelAndView;
    }

    /**
     * 审核通过
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/pass",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity pass(
            @RequestParam Integer orderId
    ){
        return ok(orderService.pass(orderId));
    }

    /**
     * 审核不通过
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/unpass",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity unpass(
            @RequestParam Integer orderId
    ){
        return ok(orderService.pass(orderId));
    }
}
