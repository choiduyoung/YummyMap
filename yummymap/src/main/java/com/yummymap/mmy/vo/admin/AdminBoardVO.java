package com.yummymap.mmy.vo.admin;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class AdminBoardVO {
	private int txtno, count , rnum, lv;
	private String title , mid , sdate ,mtxt , isshow;
	private Date cDate;
	private Time cTime;
	
	public int getTxtno() {
		return txtno;
	}
	public void setTxtno(int txtno) {
		this.txtno = txtno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm");
		
		this.sdate = form1.format(cDate) + " " + form2.format(cTime);
	}
	public String getMtxt() {
		return mtxt;
	}
	public void setMtxt(String mtxt) {
		this.mtxt = mtxt;
	}
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Time getcTime() {
		return cTime;
	}
	public void setcTime(Time cTime) {
		this.cTime = cTime;
	}
	
	
	
}
