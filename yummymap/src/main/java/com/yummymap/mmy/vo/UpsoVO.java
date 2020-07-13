package com.yummymap.mmy.vo;

public class UpsoVO {
	private int id, cont_sum;
	private double star_avg;
	private double x, y;
	private String place_name, category_name, phone, address_name, road_address_name, place_url, img_save_name, is_pick;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCont_sum() {
		return cont_sum;
	}
	public void setCont_sum(int cont_sum) {
		this.cont_sum = cont_sum;
	}
	public double getStar_avg() {
		return star_avg;
	}
	public void setStar_avg(double star_avg) {
		this.star_avg = star_avg;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getRoad_address_name() {
		return road_address_name;
	}
	public void setRoad_address_name(String road_address_name) {
		this.road_address_name = road_address_name;
	}
	public String getPlace_url() {
		return place_url;
	}
	public void setPlace_url(String place_url) {
		this.place_url = place_url;
	}
	public String getImg_save_name() {
		return img_save_name;
	}
	public void setImg_save_name(String img_save_name) {
		this.img_save_name = img_save_name;
	}
	public String getIs_pick() {
		return is_pick;
	}
	public void setIs_pick(String is_pick) {
		this.is_pick = is_pick;
	}
	@Override
	public String toString() {
		return "UpsoVO [id=" + id + ", cont_sum=" + cont_sum + ", star_avg=" + star_avg + ", x=" + x + ", y=" + y
				+ ", place_name=" + place_name + ", category_name=" + category_name + ", phone=" + phone
				+ ", address_name=" + address_name + ", road_address_name=" + road_address_name + ", place_url="
				+ place_url + ", img_save_name=" + img_save_name + ", is_pick=" + is_pick + "]";
	}
}
