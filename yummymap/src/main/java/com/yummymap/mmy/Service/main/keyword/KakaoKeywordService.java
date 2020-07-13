package com.yummymap.mmy.Service.main.keyword;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import com.yummymap.mmy.Service.api.KakaoMapService;
import com.yummymap.mmy.Service.api.KakaoMapService.KakaoMapCategoryCode;
import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.vo.SearchInfoVO;
/**
 * KeywordService 구현 클래스입니다.
 * 카카오 검색 API 결과를 활용하여 키워드를 분석 관리 합니다.
 * 
 * @author	김종형
 */

@Service
public class KakaoKeywordService implements KeywordService {

	private MainDAO mainDao;
	private KakaoMapService kakaoMapService;
	
	public KakaoKeywordService(MainDAO mainDao, KakaoMapService kakaoMapService) {
		this.mainDao = mainDao;
		this.kakaoMapService = kakaoMapService;
	}
	
	@Override
	public SearchInfoVO analyzeKeyword(SearchInfoVO clientData) {
		// 해당 키워드가 분석된 데이터가 서버 데이터베이스에 등록되어있는지 조회합니다.
		SearchInfoVO serverData = mainDao.isShowKeyword(clientData.getKeyword());
		
		if(serverData == null) {
			clientData.setFirst(true);
			// 키워드 분석을 위한 데이터
			JsonObject meta = kakaoMapService.getUpsoMetaObject(clientData, KakaoMapCategoryCode.UPSO);
			JsonObject same_name = meta.getAsJsonObject("same_name");
			JsonElement selected_region = kakaoMapService.getJsonElement(same_name, "selected_region");
			JsonElement keyword = kakaoMapService.getJsonElement(same_name, "keyword");
			String query_location = selected_region.toString().replaceAll("\"", "");
			String query_keyword = keyword.toString().replaceAll("\"", "");
			
			if(query_location.length() == 0) {
				// 클라이언트로부터 받은 검색어에는 행정구역요소는 담겨있지 않은 경우입니다.
				// 이번에는 지하철역이름이 포함되어있는지 또한 검색해본다.
				reAnalyzeKeyword(clientData, query_keyword);
			} else {
				// 클라이언트로부터 받은 검색어에 행정구역 요소가 포함된 경우이다.
				setLocationAndKeyword(clientData, query_keyword, query_location);
			}
			checkCategory(clientData);
			return clientData;
		} else {
			serverData.setFirst(false);
			setSubKeywordInfo(clientData, serverData);
			checkCategory(serverData);
			return serverData;
		}
	}
	
	private void checkCategory(SearchInfoVO searchInfoVo) {
		String category = searchInfoVo.getCategory_name();
		if(category == null)
			return;
		if(category.equals("모두"))
			searchInfoVo.setCategory_name(null);
	}
	
	@Override
	public boolean insertKeyword(SearchInfoVO searchInfoVo) {
		boolean is_insert = checkSearchInfoVo(searchInfoVo);
		int insertCount = 0;
		if(is_insert)
			insertCount = mainDao.insertKeyword(searchInfoVo);
		boolean result = (insertCount == 1) ? true : false;
		return result;
	}
	
	/*
	 * null 데이터를 검사합니다.
	 * 또한 키워드로 조회된 업소결과를 찾고 해당 키워드를 데이터베이스에 저장할지 여부를 판별합니다.
	 * return :
	 * 		저장해야 할 경우 true
	 * 		저장하지 않아야 할 경우 false
	 */
	private boolean checkSearchInfoVo(SearchInfoVO searchInfoVo) {
		String query_keyword = searchInfoVo.getQuery_keyword();
		if(query_keyword == null)
			searchInfoVo.setQuery_keyword("");
		String query_location = searchInfoVo.getQuery_location();
		if(query_location == null)
			searchInfoVo.setQuery_location("");
		int upsoCount = searchInfoVo.getUpsoCount();
		boolean result = (upsoCount == 0) ? false : true;
		return result;
	}
	
	/*
	 * 지하철역이름 정보를 토대로 키워드를 재 분석합니다.
	 */
	private void reAnalyzeKeyword(SearchInfoVO searchInfoVo, String query_keyword) {
		// API검색 결과는 0이상의 정수입니다.
		int count = kakaoMapService.getCountSubwayStation(query_keyword);
		if(count != 0) {
			// 지하철역이름으로 검색결과 조회되는 경우 키워드를 location에 위치시킨다.
			searchInfoVo.setQuery_location(query_keyword);
		} else {
			// 검색 결과가 없을 경우 클라이언트로 부터 받은 검색어는 장소적 요소가 아니라 판단하여 keyword에 위치시킨다.
			searchInfoVo.setQuery_keyword(query_keyword);
		}
	}
	
	/*
	 * 키워드 분석 결과
	 * 장소에 해당하는 단어는 장소로, 키워드에 해당하는 단어는 키워드로 배치합니다.
	 * 이 결과는 JSP 파일에서 동적으로 화면을 출력할 요소가 됩니다.
	 */
	private void setLocationAndKeyword(SearchInfoVO searchInfoVo, String query_keyword, String query_location) {
		searchInfoVo.setQuery_location(query_location);
		if(query_keyword.length() != 0)
			searchInfoVo.setQuery_keyword(query_keyword);
	}
	
	/*
	 * 서버에 분석된 정보가 있는 경우
	 * 클라이언트로 부터 요청받은 부가정보를 셋팅합니다.
	 * 부가정보는 화면 정렬에 사용됩니다.
	 */
	private void setSubKeywordInfo(SearchInfoVO searchInfoVo, SearchInfoVO serverData) {
		String category_name = searchInfoVo.getCategory_name();
		String order_standard = searchInfoVo.getOrder_standard();
		if(category_name != null)
			serverData.setCategory_name(category_name);
		serverData.setOrder_standard(order_standard);
	}

}
