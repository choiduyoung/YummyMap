package com.yummymap.mmy.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int rev_no, rating_upso, res_id;
	private String mid, rev_txt, cr_date;
	private MultipartFile[] reviewImgFile;
	private List<ImageFileVO> imgList;
	
	public int getRev_no() {
		return rev_no;
	}
	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	public int getRating_upso() {
		return rating_upso;
	}
	public void setRating_upso(int rating_upso) {
		this.rating_upso = rating_upso;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public String getRev_txt() {
		return rev_txt;
	}
	public void setRev_txt(String rev_txt) {
		this.rev_txt = rev_txt;
	}
	public String getCr_date() {
		return cr_date;
	}
	public void setCr_date(String cr_date) {
		this.cr_date = cr_date;
	}
	public MultipartFile[] getReviewImgFile() {
		return reviewImgFile;
	}
	public void setReviewImgFile(MultipartFile[] reviewImgFile) {
		this.reviewImgFile = reviewImgFile;
	}
	public List<ImageFileVO> getImgList() {
		return imgList;
	}
	public void setImgList(List<ImageFileVO> imgList) {
		this.imgList = imgList;
	}
	@Override
	public String toString() {
		return "ReviewVO [rev_no=" + rev_no + ", rating_upso=" + rating_upso + ", mid=" + mid + ", res_id=" + res_id
				+ ", rev_txt=" + rev_txt + ", cr_date=" + cr_date + ", reviewImgFile=" + Arrays.toString(reviewImgFile)
				+ ", imgList=" + imgList + "]";
	}
}
