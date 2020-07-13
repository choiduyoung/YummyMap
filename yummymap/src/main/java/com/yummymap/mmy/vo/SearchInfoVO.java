package com.yummymap.mmy.vo;
/**
 * 유저가 검색을 요청할때 요구되는 데이터들을 관리하는 클래스입니다.
 * @author	김종형
 *
 */
public class SearchInfoVO {
	private int keyword_id;
	private int upsoCount; // 업소 리스트 토탈카운트 변수
	private double x; // 검색 요청자의 경도값
	private double y; // 검색 요청자의 위도값
	private int upso_id;
	private String user_id;
	private String keyword; // 사용자가 입력한 현재 검색어 입니다
	private String query_location; // 검색어에 장소키워드가 포함되었을때 담을 변수입니다
	private String query_keyword; // 검색어에 카테고리 혹은 음식 키워드가 포함되었을때 담을 변수입니다
	private String category_name; // 카테고리 정렬시 카테고리를 담을 변수입니다
	private String order_standard = "star_avg"; // 정렬방식을 지정하는 변수입니다. 기본값 star_avg
	private String category_filtering; // 카테고리 필터링을 노출할지 여부를 담을 변수. Y or N
	private boolean isFirst; // 처음 요청된 키워드라면 true, 이미 요청된적이 있는 키워드라면 false

	public int getKeyword_id() {
		return keyword_id;
	}
	public void setKeyword_id(int keyword_id) {
		this.keyword_id = keyword_id;
	}
	
	public int getUpsoCount() {
		return upsoCount;
	}
	public void setUpsoCount(int upsoCount) {
		this.upsoCount = upsoCount;
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
	public int getUpso_id() {
		return upso_id;
	}
	public void setUpso_id(int upso_id) {
		this.upso_id = upso_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getQuery_location() {
		return query_location;
	}
	public void setQuery_location(String query_location) {
		this.query_location = query_location;
	}
	public String getQuery_keyword() {
		return query_keyword;
	}
	public void setQuery_keyword(String query_keyword) {
		this.query_keyword = query_keyword;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getOrder_standard() {
		return order_standard;
	}
	/*
	 * 정렬방식을 결정합니다
	 * 매개변수로 다음의 문자열을 입력받습니다
	 *  - star_avg
	 *  - cont_sum
	 */
	public void setOrder_standard(String order_standard) {
		this.order_standard = order_standard;
	}
	
	public String getCategory_filtering() {
		return category_filtering;
	}
	public void setCategory_filtering(String category_filtering) {
		this.category_filtering = category_filtering;
	}
	
	public boolean isFirst() {
		return isFirst;
	}
	public void setFirst(boolean isFirst) {
		this.isFirst = isFirst;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "SearchInfoVO [keyword_id=" + keyword_id + ", upsoCount=" + upsoCount + ", x=" + x + ", y=" + y
				+ ", upso_id=" + upso_id + ", user_id=" + user_id + ", keyword=" + keyword + ", query_location="
				+ query_location + ", query_keyword=" + query_keyword + ", category_name=" + category_name
				+ ", order_standard=" + order_standard + ", category_filtering=" + category_filtering + ", isFirst="
				+ isFirst + "]";
	}
}
