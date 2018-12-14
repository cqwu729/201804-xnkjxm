package com.liaoin.backstage.controller;

import com.liaoin.service.backstage.bean.Role;
import com.liaoin.service.base.constant.Constant;
import com.liaoin.service.base.message.PageResult;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * UeditorController
 *
 * @author cqwu729
 * @date 2018/11/11 18:57
 */
@Controller
@RequestMapping("/js/ueditor/jsp")
public class UeditorController {

    /**
     * 列表
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView index(ModelAndView modelAndView){
        modelAndView.setViewName("Ueditor/index");
        return modelAndView;
    }
}
