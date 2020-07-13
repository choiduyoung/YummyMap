package com.yummymap.mmy.vo;
 
public class ImageFileVO {
	private int rev_img_no, rev_no, res_no;
	private String original_name, save_name, save_date, is_main;
	public int getRev_img_no() {
		return rev_img_no;
	}
	public void setRev_img_no(int rev_img_no) {
		this.rev_img_no = rev_img_no;
	}
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public String getOriginal_name() {
		return original_name;
	}
	public void setOriginal_name(String original_name) {
		this.original_name = original_name;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public String getSave_date() {
		return save_date;
	}
	public void setSave_date(String save_date) {
		this.save_date = save_date;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public String getIs_main() {
		return is_main;
	}
	public void setIs_main(String is_main) {
		this.is_main = is_main;
	}
	@Override
	public String toString() {
		return "ImageFileVO [rev_img_no=" + rev_img_no + ", rev_no=" + rev_no + ", original_name=" + original_name
				+ ", save_name=" + save_name + ", save_date=" + save_date + ", res_no=" + res_no + ", is_main="
				+ is_main + "]";
	}
}
