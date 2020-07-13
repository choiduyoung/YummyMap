package com.yummymap.mmy.vo;

public class RatingUpsoVO {
	private int rating_star1, rating_star2, rating_star3, rating_star4, rating_star5, rating_value, rating_value_count, rating_total;
	private double star1_per, star2_per, star3_per, star4_per, star5_per;
	public int getRating_star1() {
		return rating_star1;
	}

	public void setRating_star1(int rating_star1) {
		this.rating_star1 = rating_star1;
	}

	public int getRating_star2() {
		return rating_star2;
	}

	public void setRating_star2(int rating_star2) {
		this.rating_star2 = rating_star2;
	}

	public int getRating_star3() {
		return rating_star3;
	}

	public void setRating_star3(int rating_star3) {
		this.rating_star3 = rating_star3;
	}

	public int getRating_star4() {
		return rating_star4;
	}

	public void setRating_star4(int rating_star4) {
		this.rating_star4 = rating_star4;
	}

	public int getRating_star5() {
		return rating_star5;
	}

	public void setRating_star5(int rating_star5) {
		this.rating_star5 = rating_star5;
	}
	
	public double getStar1_per() {
		return star1_per;
	}

	public void setStar1_per(double star1_per) {
		this.star1_per = setDecimal(star1_per);
	}

	public double getStar2_per() {
		return star2_per;
	}

	public void setStar2_per(double star2_per) {
		this.star2_per = setDecimal(star2_per);
	}

	public double getStar3_per() {
		return star3_per;
	}

	public void setStar3_per(double star3_per) {
		this.star3_per = setDecimal(star3_per);
	}

	public double getStar4_per() {
		return star4_per;
	}

	public void setStar4_per(double star4_per) {
		this.star4_per = setDecimal(star4_per);
	}

	public double getStar5_per() {
		return star5_per;
	}

	public void setStar5_per(double star5_per) {
		this.star5_per = setDecimal(star5_per);
	}
	
	public int getRating_total() {
		return rating_star1 + rating_star2 + rating_star3 + rating_star4 + rating_star5;
	}

	public void setRating_total(int rating_total) {
		this.rating_total = rating_total;
	}

	public int getRating_value() {
		return rating_value;
	}

	public void setRating_value(int rating_value) {
		this.rating_value = rating_value;
	}

	public int getRating_value_count() {
		return rating_value_count;
	}

	public void setRating_value_count(int rating_value_count) {
		this.rating_value_count = rating_value_count;
	}

	/*
	 * double값을 소수점 1자리까지 셋팅합니다.
	 */
	private double setDecimal(double num) {
		String numStr = String.valueOf(num);
		int len = numStr.length();
		int index = numStr.indexOf(".");
		int dot = len-1-index;
		int per = 1;
		for(int i=1; i<=dot; i++) {
			per *= 10;
		}
		int tmp =(int) (num * per / (per/10));
		double result = tmp / 10.;
		return result;
	}
	@Override
	public String toString() {
		return "RatingUpsoVO [rating_star1=" + rating_star1 + ", rating_star2=" + rating_star2 + ", rating_star3="
				+ rating_star3 + ", rating_star4=" + rating_star4 + ", rating_star5=" + rating_star5 + ", rating_value="
				+ rating_value + ", rating_value_count=" + rating_value_count + ", rating_total=" + rating_total
				+ ", star1_per=" + star1_per + ", star2_per=" + star2_per + ", star3_per=" + star3_per + ", star4_per="
				+ star4_per + ", star5_per=" + star5_per + "]";
	}
}
