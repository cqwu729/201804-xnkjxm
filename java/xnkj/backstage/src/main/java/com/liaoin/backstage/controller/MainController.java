package com.liaoin.backstage.controller;

import com.liaoin.backstage.annotation.LoadAdmin;
import com.liaoin.service.backstage.bean.Admin;
import com.liaoin.service.backstage.service.AdminService;
import com.liaoin.service.backstage.service.MenuService;
import com.liaoin.service.backstage.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Main")
public class MainController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView index(
            @LoadAdmin Admin admin,
            ModelAndView modelAndView
    ){
        if(admin.getUsername().equals("admin")){
            modelAndView.addObject("menus",menuService.queryMenus(null));
        }else{
            //查询用户权限
            List<String> roleIds = adminService.queryAdminRoleIdsList(admin);
            List<String> menuIds = roleService.queryRoleList(roleIds);
            modelAndView.addObject("menus",menuService.queryAdminMenus(menuIds,null));
        }

        modelAndView.setViewName("Main/index");
        return modelAndView;
    }

    /**
     * 首页
     */
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView main(ModelAndView modelAndView){
        modelAndView.setViewName("Main/main");
        return modelAndView;
    }
}
