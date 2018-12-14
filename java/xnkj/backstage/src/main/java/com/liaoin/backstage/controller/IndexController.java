package com.liaoin.backstage.controller;

import com.liaoin.service.backstage.bean.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public ModelAndView login(
            ModelAndView modelAndView,
            HttpServletRequest request,
            HttpServletResponse response
    )throws Exception{
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        if(admin != null){
            response.sendRedirect(request.getContextPath()+"/Main/index");
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
