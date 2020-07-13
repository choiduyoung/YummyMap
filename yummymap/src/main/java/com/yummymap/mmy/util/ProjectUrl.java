package com.yummymap.mmy.util;

/**
 * redirect URL을 상수화하여 관리해주는 열거형클래스이다.
 * @author	김종형
 *
 */
public enum ProjectUrl {
	MAIN_VIEW ("/yummymap/index.mmy"),
	MAIN_LIST_VIEW ("/yummymap/main.mmy"),
	UPSO_DETAIL_VIEW("/yummymap/main/getDetail.mmy"),
	LOGIN_VIEW ("/yummymap/member/loginView.mmy");
	
	private String url;
	
	private ProjectUrl(String url) {
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}

