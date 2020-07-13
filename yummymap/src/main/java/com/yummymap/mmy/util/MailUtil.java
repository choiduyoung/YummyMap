package com.yummymap.mmy.util;
/**
 * @author 최두용
 * @since 2020.05.25
 *  이 클래스는 메일 발송 담당 클래스 입니다
 */

import java.util.*;
import java.io.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class MailUtil {
	private Session session;
	private String host;
	private String user;
	private String pass;
	private String domain;
	
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

//메일 보내기 사용자 설정 함수
	private Properties prop = new Properties();
	
	public boolean mailInit() {
		prop.put("mail.smtp.host",host);
		prop.put("mail.smtp.port",465);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.trust", host); 
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.starttls.enable","true");
		prop.put("mail.debug","true");
		session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pass);
			}	
		});
		return true;
	}
	
	//메일 발송 전담 함수
	public int getSend(String from ,String title , String mtxt) {
		mailInit();
		
		int cnt = 0;
		String getFrom = from;
		
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(getFrom));
			
			msg.setSubject(title); //메일 제목
			msg.setContent(mtxt,"text/html;charset=UTF-8"); //메일 본문
			
			Transport.send(msg);	
			cnt = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
}
