package com.yummymap.mmy.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;


public class TextVO {
	private int txtno, count, rnum, cnt;
	private String mid, title, cdate, category;
	private Date tdate;
	private Time ttime;
	
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public void setCdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd/");
		
		this.cdate = form1.format(tdate) ;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public Time getTtime() {
		return ttime;
	}
	public void setTtime(Time ttime) {
		this.ttime = ttime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
	
}
