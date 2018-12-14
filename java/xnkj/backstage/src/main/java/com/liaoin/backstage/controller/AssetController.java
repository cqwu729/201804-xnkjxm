package com.liaoin.backstage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/7/22 0022.
 */
@Controller
@RequestMapping("Asset")
public class AssetController {

    /**
     * 列表
     */
    @RequestMapping(value = "/swfupload",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView swfupload(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Asset/swfupload");
        return modelAndView;
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/swfupload2",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView swfupload2(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String subject = request.getParameter("subject");//科目
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("subject",subject);
        modelAndView.setViewName("Asset/swfupload2");
        return modelAndView;
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/swfupload3",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView swfupload3(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String subject = request.getParameter("subject");//科目
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("subject",subject);
        modelAndView.setViewName("Asset/swfupload3");
        return modelAndView;
    }
}
