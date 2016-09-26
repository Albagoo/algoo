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
public class AdminLoginInterceptor 
	extends HandlerInterceptorAdapter  {

	private static final Logger logger
	=LoggerFactory.getLogger(AdminLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("컨트롤러 수행 전 호출 - preHandle()");
		
		//uri 읽어오기
		String uri = request.getRequestURI();
		
		//관리자 로그인 페이지는 걸러낸다
		if(uri.indexOf("/admin/login/adminLogin.ag") != -1){
			return true; // 에러 처리하지 않는다
		}
		
		HttpSession session = request.getSession();
		String adminUserid = (String)session.getAttribute("adminUserid");
		
		//관리자 로그인되지 않은 경우 에러처리
		if(adminUserid == null || adminUserid.isEmpty()){
			request.setAttribute("msg", "먼저 관리자 로그인 하세요");
			request.setAttribute("url", "/admin/login/adminLogin.ag");
			
			RequestDispatcher dispatcher
				= request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			
			return false;
		}else{
			return true;
		}
		
	}

	
}







