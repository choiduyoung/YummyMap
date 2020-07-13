package com.yummymap.mmy.vo;

import java.sql.*;
import java.text.*;

public class JoinMailVO {
	private int mailno, cftnum;
	private String mail, senddate;
	private Date mdate;
	public int getMailno() {
		return mailno;
	}
	public void setMailno(int mailno) {
		this.mailno = mailno;
	}
	public int getCftnum() {
		return cftnum;
	}
	public void setCftnum(int cftnum) {
		this.cftnum = cftnum;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate() {
		
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
		this.senddate = form1.format(mdate);
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
}
