package com.sample.web.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.sample.web.vo.Companies;

public class CompaniesHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.getParameterType() == Companies.class;
	}
	
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		String loginType = (String) webRequest.getAttribute("LOGIN_TYPE", NativeWebRequest.SCOPE_SESSION);
		if (loginType != null && loginType.equals("company")) {
			return webRequest.getAttribute("LOGIN_USERS", NativeWebRequest.SCOPE_SESSION);
		} 
		
		return null;
		//return webRequest.getAttribute("LOGIN_COMPANY", NativeWebRequest.SCOPE_SESSION);
	}
}
