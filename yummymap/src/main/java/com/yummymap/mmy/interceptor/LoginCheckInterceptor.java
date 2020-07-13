package com.yummymap.mmy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 	이 클래스는 어드민 페이지 로그인 체크하는 인터셉터 클래스 입니다
 * 
 * @author 유태희
 * @since 2020/06/17
 * 
 */

public class LoginCheckInterceptor implements HandlerInterceptor {

	//해당 함수는 전처리 함수
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		, String RSAModulus ,String 
		String sid = (String) request.getSession().getAttribute("SID");
		String adminsid = (String) request.getSession().getAttribute("ADMINSID");
		String uri = request.getRequestURI();
		System.out.println(uri + " uri ");
		String domain =  request.getContextPath();
		System.out.println(domain + " domain");
		String realPath = uri.substring(domain.length()+1);
		System.out.println(realPath + " realPath");
		realPath = realPath.substring(0, realPath.lastIndexOf("/"));
		System.out.println(realPath + " realPath");
			
		 if(realPath.equals("admin")) {
			if(adminsid == null || adminsid.length() == 0) {
				response.sendRedirect("/yummymap/admin/login.mmy");
				return false;
			}
		 } else if(realPath.equals("member")) {	
			if(sid == null || sid.length() == 0) {
				response.sendRedirect("/yummymap/member/login.mmy");
				return false;
			}
		}
		return true;
	}
		
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
