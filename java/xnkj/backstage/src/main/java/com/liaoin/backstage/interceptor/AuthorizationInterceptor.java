package com.liaoin.backstage.interceptor;


import com.google.gson.Gson;
import com.liaoin.service.backstage.bean.Admin;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * 自定义拦截器，判断此次请求是否有权限
 *
 *
 */
@Component
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //如果不是映射到方法直接通过
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }

        Admin admin = (Admin) request.getSession().getAttribute("admin");
//        if(admin == null || request.getRequestURI().equals("/error")){
        if(admin == null){
            response.sendRedirect(request.getContextPath()+"/");
            return false;
        }
        return true;
    }



    /**
     * 返回错误信息
     */
    public void response(HttpServletResponse response, OperateResult operateResult){
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding("UTF-8");
        PrintWriter out= null;
        try {
            out = response.getWriter();
            out.write(new Gson().toJson(operateResult));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {

            out.close();
        }

    }


}
