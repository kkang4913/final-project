package com.myweb.somoim.login.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;


public class LoginInterceptor implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			
		    Object obj = session.getAttribute("loginData");
		    
		    if (obj == null) {
				response.sendRedirect(request.getContextPath()+"/login");
				return false;
			}
		
		return true;
	}
	
	
}
