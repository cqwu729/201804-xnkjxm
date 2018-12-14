package com.liaoin.backstage.controller;

import com.liaoin.service.app.Enum.AuthenticationStatus;
import com.liaoin.service.app.bean.Authentication;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.service.AuthenticationService;
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

/**
 * AuthenticationController
 *
 * @author cqwu729
 * @date 2018/11/14 23:36
 */
@Controller
@RequestMapping("Authentication")
public class AuthenticationController {

    @Autowired
    private AuthenticationService authenticationService;
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
        Page<Authentication> authentications = authenticationService.queryWithPage(page, Constant.PageConstant.ADMIN_PAGE_COUNT);
        PageResult<Authentication> pageResult = new PageResult<Authentication>();
        pageResult = pageResult.setPageUrl(request,page,Constant.PageConstant.ADMIN_PAGE_COUNT,authentications);
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("keyword", keyword);
        modelAndView.setViewName("Authentication/index");
        return modelAndView;
    }

    /**
     * 审核通过
     * @param id
     * @return
     */
    @RequestMapping(value = "/pass",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity pass(
            @RequestParam Integer id
    ){
        return ok(authenticationService.pass(id, AuthenticationStatus.YES));
    }

    /**
     * 审核不通过
     * @param id
     * @return
     */
    @RequestMapping(value = "/unpass",method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity unpass(
            @RequestParam Integer id
    ){
        return ok(authenticationService.pass(id,AuthenticationStatus.NO));
    }
}
