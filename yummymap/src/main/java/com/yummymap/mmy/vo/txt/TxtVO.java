package com.yummymap.mmy.vo.txt;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

public class TxtVO {
	private int rno, mno, txtno, count, rnum, catno, upno, step, reno, recomno, txtimg;
	private String title, mid, mname, mtxt, cdate, category, isrec, edit, editdate, oriname, savename, dir;
	private Date jDate;
	private Time jTime;
	private MultipartFile file;
	
	public int getRno() {
		return this.rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getMno() {
		return this.mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getTxtno() {
		return this.txtno;
	}

	public void setTxtno(int txtno) {
		this.txtno = txtno;
	}

	public int getCount() {
		return this.count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRnum() {
		return this.rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getCatno() {
		return this.catno;
	}

	public void setCatno(int catno) {
		this.catno = catno;
	}

	public int getUpno() {
		return this.upno;
	}

	public void setUpno(int upno) {
		this.upno = upno;
	}

	public int getStep() {
		return this.step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMid() {
		return this.mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtxt() {
		return this.mtxt;
	}

	public void setMtxt(String mtxt) {
		this.mtxt = mtxt;
		this.mtxt = mtxt.replaceAll("\r\n", "<br>");
	}

	public void setMtxt() {
		this.mtxt = this.mtxt.replaceAll("<br>", "\r\n");
	}

	public String getCdate() {
		return this.cdate;
	}

	public void setCdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat form2 = new SimpleDateFormat("hh24:mi:ss");
		this.cdate = form1.format(this.jDate) + " " + form2.format(this.jTime);
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIsrec() {
		return this.isrec;
	}

	public void setIsrec(String isrec) {
		this.isrec = isrec;
	}

	public Date getjDate() {
		return this.jDate;
	}

	public void setjDate(Date jDate) {
		this.jDate = jDate;
	}

	public Time getjTime() {
		return this.jTime;
	}

	public void setjTime(Time jTime) {
		this.jTime = jTime;
	}

	public String getEdit() {
		return this.edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public String getEditdate() {
		return this.editdate;
	}

	public void setEditdate(String editdate) {
		this.editdate = editdate;
	}

	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}

	public int getRecomno() {
		return recomno;
	}

	public void setRecomno(int recomno) {
		this.recomno = recomno;
	}

	public int getTxtimg() {
		return txtimg;
	}

	public void setTxtimg(int txtimg) {
		this.txtimg = txtimg;
	}

	public String getOriname() {
		return oriname;
	}

	public void setOriname(String oriname) {
		this.oriname = oriname;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "TxtVO [rno=" + rno + ", mno=" + mno + ", txtno=" + txtno + ", count=" + count + ", rnum=" + rnum
				+ ", catno=" + catno + ", upno=" + upno + ", step=" + step + ", reno=" + reno + ", recomno=" + recomno
				+ ", txtimg=" + txtimg + ", title=" + title + ", mid=" + mid + ", mname=" + mname + ", mtxt=" + mtxt
				+ ", cdate=" + cdate + ", category=" + category + ", isrec=" + isrec + ", edit=" + edit + ", editdate="
				+ editdate + ", oriname=" + oriname + ", savename=" + savename + ", dir=" + dir + ", jDate=" + jDate
				+ ", jTime=" + jTime + ", file=" + file + "]";
	}

	

}
