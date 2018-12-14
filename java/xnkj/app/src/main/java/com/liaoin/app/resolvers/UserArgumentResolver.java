package com.liaoin.app.resolvers;

import com.liaoin.app.annotation.LoadUserId;
import com.liaoin.service.base.constant.Constant;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.support.MissingServletRequestPartException;

import javax.servlet.http.HttpServletRequest;

/**
 * 增加方法注入，将含有LoadAdmin注解的方法参数注入当前登录用户
 */
@Component
public class UserArgumentResolver implements HandlerMethodArgumentResolver {



    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        //如果参数类型是String并且有AnnotationUser注解则支持
        if (parameter.getParameterType().isAssignableFrom(String.class) && parameter.hasParameterAnnotation(LoadUserId.class))
            return true;
        return false;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        String userId = (String) webRequest.getAttribute(Constant.AUTHENTICATION.CURRENT_USER_ID, RequestAttributes.SCOPE_REQUEST);
        if (StringUtils.isNotEmpty(userId)) {
            return userId;
        }
        throw new MissingServletRequestPartException("userId");
    }
}
