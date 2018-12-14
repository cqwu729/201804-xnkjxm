package com.liaoin.backstage.controller;

import com.liaoin.backstage.annotation.LoadAdmin;
import com.liaoin.service.backstage.bean.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Home")
public class HomeController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView nav(
            ModelAndView modelAndView
    ){

        modelAndView.setViewName("Home/index");
        return modelAndView;
    }
}
