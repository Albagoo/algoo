package com.algoo.app.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor 
	extends HandlerInterceptorAdapter{
	private static final Logger logger
	=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object arg2) throws Exception {
		
		HttpSession session= request.getSession();
		String userid = (String)session.getAttribute("userid");
		
		if(userid==null || userid.isEmpty()){
			request.setAttribute("msg", "먼저 로그인하세요");
			request.setAttribute("url","/login/login.ag");
			
			RequestDispatcher dispatcher
				=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false; 
		}else{		
			return true; 
		}
	}
	
}


