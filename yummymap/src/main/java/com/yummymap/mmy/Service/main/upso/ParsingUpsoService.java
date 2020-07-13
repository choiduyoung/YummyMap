package com.yummymap.mmy.Service.main.upso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummymap.mmy.Service.api.KakaoMapService;
import com.yummymap.mmy.Service.api.KakaoMapService.KakaoMapCategoryCode;
import com.yummymap.mmy.Service.main.keyword.KeywordService;
import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.util.PageUtil;
import com.yummymap.mmy.vo.*;
@Service
public class ParsingUpsoService implements UpsoService {

	private MainDAO mainDao;
	private UpsoService simpleUpsoService;
	private KakaoMapService kakaoMapService;
	@Autowired
	private KeywordService keywordService; 
	
	
	public ParsingUpsoService(MainDAO mainDao, SimpleUpsoService simpleUpsoService, KakaoMapService kakaoMapService) {
		this.mainDao = mainDao;
		this.simpleUpsoService = simpleUpsoService;
		this.kakaoMapService = kakaoMapService;
	}
	
	@Override
	public UpsoVO getUpsoDetailInfo(int upso_id, String user_id) {
		return simpleUpsoService.getUpsoDetailInfo(upso_id, user_id);
	}
	@Override
	public boolean isShowUpso(int upso_id) {
		return simpleUpsoService.isShowUpso(upso_id);
	}
	
	/*
	 * 카카오맵 API파싱 결과를 DB에 저장합니다.
	 * return : 실제 데이터베이스에 저장된 데이터 수이다.
	 */
	@Override
	public int insertUpso(UpsoVO upsoVo, SearchInfoVO searchInfoVo) {
		if(upsoVo != null) {
			return simpleUpsoService.insertUpso(upsoVo, searchInfoVo);
		}
		int totalCount = 0;
		List<UpsoVO> upsoList = kakaoMapService.getUpsoList(searchInfoVo, KakaoMapCategoryCode.UPSO);
		searchInfoVo.setUpsoCount(upsoList.size());
		for(int i=0; i < upsoList.size(); i++) {
			UpsoVO upso = upsoList.get(i);
			int upso_id = upso.getId();
			if(isShowUpso(upso_id) == false) {
				// 업소가 데이터베이스에 저장되어있지 않다면 저장합니다.
				totalCount += simpleUpsoService.insertUpso(upso, searchInfoVo);
			}
			// 키워드 또한 저장합니다.
			searchInfoVo.setUpso_id(upso_id);
			keywordService.insertKeyword(searchInfoVo);
		}
		return totalCount;
	}
	
	@Override
	public List<UpsoVO> getUpsoList(SearchInfoVO searchInfoVo, PageUtil pageUtil) {
		return simpleUpsoService.getUpsoList(searchInfoVo, pageUtil);
	}
	
	@Override
	public RatingUpsoVO getRatingInfo(int upso_id) {
		return simpleUpsoService.getRatingInfo(upso_id);
	}

	@Override
	public List<UpsoVO> showWeeklyUpso() {
		return simpleUpsoService.showWeeklyUpso();
	}

	/*
	 * 내가 찜한 맛집 리스트를 가져옵니다.
	 * SimpleUpsoService에 구현된 myUpso를 통해 조회 후 조회결과가 0이라면
	 * 클라이언트 위치기반의 업소리스트를 새롭게 가져와 대체합니다.
	 */
	@Override
	public List<UpsoVO> showMyUpso(SearchInfoVO searchInfoVo) {
		List<UpsoVO> myUpsoList = simpleUpsoService.showMyUpso(searchInfoVo);
		
		int countMyUpso = myUpsoList.size();
		searchInfoVo.setUpsoCount(countMyUpso);
		
		if(countMyUpso == 0) {
			myUpsoList = mainDao.selectSubMyPickUpsoList(searchInfoVo);
		}
		return myUpsoList;
	}
	
	
}
