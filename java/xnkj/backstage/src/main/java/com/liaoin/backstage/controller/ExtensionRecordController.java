package com.liaoin.backstage.controller;

import com.liaoin.service.app.bean.ExtensionRecord;
import com.liaoin.service.app.service.ExtensionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/ExtensionRecord")
public class ExtensionRecordController {

    @Autowired
    private ExtensionRecordService  extensionRecordService;
    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("extensionRecordString", extensionRecordService.queryExtensionRecords(null, request));
        modelAndView.setViewName("ExtensionRecord/index");
        return modelAndView;
    }
}
