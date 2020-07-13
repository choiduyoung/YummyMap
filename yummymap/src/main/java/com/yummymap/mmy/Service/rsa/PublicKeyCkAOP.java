package com.yummymap.mmy.Service.rsa;

import javax.servlet.http.HttpServletRequest;

//import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint; 
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 *  
 * @author 유태희
 * @since 2020.06.23
 * 		이 클래스는 공개키를 확인하는 클래스입니다.
 * 		
 */

@Service
@Aspect
public class PublicKeyCkAOP {
	@Autowired
	RsaServiceImpl rsaImpl;
	
	@Before("execution(* com.yummymap.mmy.Service.admin.AdminService.PublicKeySrvc(..))")
	public void rsaCk(JoinPoint join ) {
		Object[] obj = join.getArgs();
		
		HttpServletRequest req = (HttpServletRequest) obj[0];
		
		String RSAModulus = req.getParameter("RSAModulus");
		String RSAExponent = req.getParameter("RSAExponent");
		
		System.out.println("RSAModulus : " + RSAModulus);
		System.out.println("RSAExponent : " + RSAExponent);
		
		if(RSAModulus == null || RSAModulus.length() == 0) { 
			rsaImpl.initRsa(req);  // 키가 없다면 키를 생성해 보내준다.
		}else {
	        req.setAttribute("RSAModulus", RSAModulus); // rsa modulus 을 이미 가지고 있으면 그것을 다시 보내준다
	        req.setAttribute("RSAExponent", RSAExponent); // rsa exponent 을 이미 가지고 있으면 그것을 다시 보내준다
		}
	}
	
}
