package com.yummymap.mmy.Service.api;

import java.io.BufferedReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.yummymap.mmy.vo.SearchInfoVO;
import com.yummymap.mmy.vo.UpsoVO;

@Service
public class KakaoMapService {
	private String authorKey = "e457f7b2d3393084fafd19c71b0c5bed";
	private String basePath = "https://dapi.kakao.com/v2/local/search/keyword.json";
	
	private JsonConnectApi JsonConnect;
	
	public enum KakaoMapCategoryCode {
		UPSO("category_group_code=FD6"), SUBWAY("category_group_code=SW8");

		KakaoMapCategoryCode(String category) {
			this.category = category;
		}
		private String category;
		public String getCategory() {
			return category;
		}
	}

	public KakaoMapService(JsonConnectApi JsonConnect) {
		this.JsonConnect = JsonConnect;
	}

	public JsonObject searchList(SearchInfoVO searchInfoVo, int page, KakaoMapCategoryCode code) {
		String urlStr = getPathUrl(searchInfoVo, page, code);
		URL pathUrl = JsonConnect.getUrl(urlStr);
		HttpURLConnection conn = JsonConnect.getHttpUrlConnection(pathUrl);
		JsonConnect.setMethod(conn, "GET");
		conn.setRequestProperty("Authorization", "KakaoAK "+ authorKey);
		int responseCode = JsonConnect.getRespCode(conn);
		System.out.println("[ Response Code ::: " + responseCode + " ]");
		BufferedReader rd = null;
		if(responseCode >= 200 && responseCode <= 300) {
			rd = JsonConnect.getBufferedReader(conn);
		} else {
			rd = JsonConnect.getBufferedReader(conn);
		}
		StringBuilder sb = JsonConnect.readLine(rd);
		JsonConnect.disconnectApi(conn, rd);
		JsonObject result = JsonConnect.toJsonObject(sb.toString());
		return result;
	}
	
	/*
	 * 카카오맵 RestAPI 파싱을통한 결과를 List로 반환합니다.
	 */
	public List<UpsoVO> getUpsoList(SearchInfoVO searchInfoVo, KakaoMapCategoryCode code) {
		List<UpsoVO> result_upsoList = new ArrayList<UpsoVO>();
		Gson gson = new Gson();
		boolean is_continue = true;
		int page = 1;
		do {
			JsonObject jsonObject = searchList(searchInfoVo, page, code);
			JsonArray jsonList = (JsonArray) jsonObject.get("documents");
			Type listType = new TypeToken<ArrayList<UpsoVO>>(){}.getType();
			List<UpsoVO> upsoList = gson.fromJson(jsonList.toString(), listType);
			for(int i=0; i<upsoList.size(); i++) {
				UpsoVO upsoVo = upsoList.get(i);
				result_upsoList.add(upsoVo);
			}
			// 검색결과 페이지가 더 있는지 조회합니다.
			is_continue = continueParsing(jsonObject);
			if(is_continue)
				page++;
		} while (is_continue);		
		return result_upsoList;
	}
	
	/*
	 * 검색결과 페이지가 더 있는지 조회합니다.
	 */
	private boolean continueParsing(JsonObject jsonObject) {
		boolean result = false;
		JsonElement is_end = jsonObject.getAsJsonObject("meta").get("is_end");
		if(is_end.toString().equals("false")) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}
	
	public JsonObject getUpsoMetaObject(SearchInfoVO searchInfoVo, KakaoMapCategoryCode code) {
		JsonObject jsonObject = searchList(searchInfoVo, 1, code);
		JsonObject meta = jsonObject.getAsJsonObject("meta");
		return meta;
	}
	
	public JsonElement getJsonElement(JsonObject jsonObj, String objName) {
		JsonElement element = jsonObj.get(objName);
		return element;
	}
	
	public int getCountSubwayStation(String query_keyword) {
		SearchInfoVO searchInfoVo = new SearchInfoVO();
		searchInfoVo.setKeyword(query_keyword);
		JsonObject jsonObject_subway = searchList(searchInfoVo, 1, KakaoMapCategoryCode.SUBWAY);
		JsonObject meta_subway = jsonObject_subway.getAsJsonObject("meta");
		JsonElement total_count = meta_subway.get("total_count");
		int count = Integer.parseInt(total_count.toString());
		return count;
	}
	
	private String getPathUrl(SearchInfoVO searchInfoVo, int page, KakaoMapCategoryCode code) {
		StringBuffer buff = new StringBuffer();
		buff.append(basePath);
		buff.append("?");
		buff.append(code.getCategory());
		buff.append("&query=");
		String query = JsonConnect.setURLEncoding(searchInfoVo.getKeyword());
		buff.append(query);
		buff.append("&page=");
		buff.append(page);
		if(searchInfoVo.getX() != 0 && searchInfoVo.getY() != 0) {
			buff.append("&x=");
			buff.append(searchInfoVo.getX());
			buff.append("&y=");
			buff.append(searchInfoVo.getY());
			buff.append("&radius=1000");
		}
		return buff.toString();
	}

//	public static void main(String[] args) {
//		SimpleConnectApi sc = new SimpleConnectApi();
//		JsonConnectApiImpl jc = new JsonConnectApiImpl(sc);
//		KakaoMapService kakao = new KakaoMapService(jc);
//		String str = "구로디지털";
//		int count = kakao.getCountSubwayStation(str);
//		System.out.println("지하철 카운트 ::"+count);
//		
//		SearchInfoVO searchInfoVo = new SearchInfoVO();
//		searchInfoVo.setKeyword("구로");
//		List<UpsoVO> list = kakao.getUpsoList(searchInfoVo, KakaoMapCategoryCode.UPSO);
//		System.out.println("파싱된 리스트 사이즈::"+list.size());
//	}

}
