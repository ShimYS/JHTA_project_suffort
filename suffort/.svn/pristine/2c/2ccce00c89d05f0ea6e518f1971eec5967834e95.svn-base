package com.sample.web.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.sample.web.vo.Users;

public class UsersHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.getParameterType() == Users.class;
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		String loginType = (String) webRequest.getAttribute("LOGIN_TYPE", NativeWebRequest.SCOPE_SESSION);
		if (loginType != null && (loginType.equals("user") || loginType.equals("naver") )) {
			return webRequest.getAttribute("LOGIN_USERS", NativeWebRequest.SCOPE_SESSION);
		} 
		
		return null;
	}
}
