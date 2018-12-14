package com.liaoin.backstage.interceptor;

import com.liaoin.backstage.file.FileUtils;
import com.liaoin.backstage.resolvers.AdminArgumentResolver;
import com.liaoin.service.base.constant.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;
import java.util.List;


@Configuration
public class WebAppConfigurer extends WebMvcConfigurerAdapter {


    @Autowired
    private AuthorizationInterceptor authorizationInterceptor;

    @Resource
    private AdminArgumentResolver adminArgumentResolver;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(authorizationInterceptor)
                .excludePathPatterns("/")
                .excludePathPatterns("/Login/*")
        ;
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(adminArgumentResolver);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        try {
            String path = FileUtils.rootPath();
            registry.addResourceHandler(Constant.PATH.FILE_UPLOAD_PATH +"/**").addResourceLocations("file:///"+path+"/"+Constant.PATH.FILE_UPLOAD_PATH+"/");
            registry.addResourceHandler("/static/**").addResourceLocations(ResourceUtils.CLASSPATH_URL_PREFIX+"/static/");
        }catch (Exception e){
        }

    }


}
