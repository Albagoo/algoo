package com.algoo.app.controller;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletOutputStream;
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
		String authCode = (String)session.getAttribute("authCode");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(!(userid==null || userid.isEmpty()) && !authCode.equals("1")){
			out.println("<html><head><script type='text/javascript'>"
					+ "alert('개인회원이 이용 가능한 서비스 입니다!');"
					+ "history.back();"
					+ "</script></head><body></body></html>");
			
			return false;
		}
		
		if(userid==null || userid.isEmpty()){
			/*request.setAttribute("msg", "먼저 로그인하세요");
			request.setAttribute("url","/login/login.ag");
			
			RequestDispatcher dispatcher
				=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);*/
			
			
			
			out.println("<html><head><script type='text/javascript'>"
					+ "alert('로그인 하셔야 이용 가능한 서비스 입니다!!');window.open('/algoo/login/login.ag?type=Personal', 'login',"
					+ "'width=390,height=480,left=700,top=200,resizable=yes,location=yes');"
					+ "history.back();"
					+ "</script></head><body></body></html>");
			
			return false; 
		}else{		
			return true; 
		}
	}
	
}


