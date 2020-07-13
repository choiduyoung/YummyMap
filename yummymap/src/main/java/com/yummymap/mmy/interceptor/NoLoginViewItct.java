package com.yummymap.mmy.interceptor;
/**
 * @author 유태희
 * @since 2020.06.20
 * 		이 클래스는 로그인후 로그인 페이지로 요청시 메인페이지로 보내는 인터셉터입니다
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
@Repository
public class NoLoginViewItct implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String sid = (String) request.getSession().getAttribute("SID");
		String adminsid = (String) request.getSession().getAttribute("ADMINSID");
		System.out.println(adminsid + " Adminsid");
		String uri = request.getRequestURI();
		System.out.println(uri + " uri ");
		String domain =  request.getContextPath();
		System.out.println(domain + " domain");
		String realPath = uri.substring(domain.length()+1);
		System.out.println(realPath + " realPath");
		realPath = realPath.substring(0, realPath.lastIndexOf("/"));
		System.out.println(realPath + " realPath");
		
		try {
			if(realPath.equals("admin")) {
				if(adminsid != null || adminsid.length() != 0) {
					response.sendRedirect("/yummymap/admin/main.mmy");
				}
			}else if(realPath.equals("member")) {
				if(sid != null || sid.length() != 0) {
					response.sendRedirect("/yummymap/main.mmy");
				}
			}
			return false;
		}catch(Exception e){}

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
