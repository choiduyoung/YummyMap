package com.yummymap.mmy.vo;

import java.sql.Date;
import java.sql.Time;

public class MemberVO {
	private int mno;
	private String mname;
	private String mid;
	private String mpw;
	private String mtel;
	private String memail;
	private String grade;
	private String issue;
	private String sdate;
	private Date joinDate;
	private Time joinTime;

	public int getMno() {
		return this.mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return this.mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return this.mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMtel() {
		return this.mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMemail() {
		return this.memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getIssue() {
		return this.issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

	public String getSdate() {
		return this.sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public Date getJoinDate() {
		return this.joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Time getJoinTime() {
		return this.joinTime;
	}

	public void setJoinTime(Time joinTime) {
		this.joinTime = joinTime;
	}
}