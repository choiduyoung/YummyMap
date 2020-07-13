package com.yummymap.mmy.vo.admin;

import java.text.SimpleDateFormat;

public class ChartCntVO {
	private int txtcnt  , isuemem , memcnt, recnt , cnt;
	private String mid, days;
	
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getTxtcnt() {
		return txtcnt;
	}

	public void setTxtcnt(int txtcnt) {
		this.txtcnt = txtcnt;
	}

	public int getIsuemem() {
		return isuemem;
	}

	public void setIsuemem(int isuemem) {
		this.isuemem = isuemem;
	}

	public int getMemcnt() {
		return memcnt;
	}

	public void setMemcnt(int memcnt) {
		this.memcnt = memcnt;
	}

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}
	
}
