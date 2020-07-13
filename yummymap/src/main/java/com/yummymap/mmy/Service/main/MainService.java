package com.yummymap.mmy.Service.main;
/**
 * main 페이지에서 유저로부터 요청되는 다양한 기능을 구현한 클래스입니다.
 * 
 *  @author	김종형
 *  @see	www.mmy.YummyMap.Service.api.KaKaoMapRestApiService
 *  		www.mmy.YummyMap.dao.MainDAO
 *  		www.mmy.YummyMap.Service.main.UpSoServiceImpl
 */
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yummymap.mmy.Service.main.keyword.KeywordService;
import com.yummymap.mmy.Service.main.review.ReviewService;
import com.yummymap.mmy.Service.main.upso.ParsingUpsoService;
import com.yummymap.mmy.Service.main.upso.UpsoService;
import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.util.PageUtil;
import com.yummymap.mmy.vo.*;

@Service
public class MainService {

	private UpsoService upsoService;
	private ReviewService reviewService;
	private KeywordService keywordService; 
	private MainDAO mainDao;
	
	
	public MainService(ParsingUpsoService upsoService, ReviewService reviewService , KeywordService keywordService, MainDAO mainDao) {
		this.upsoService = upsoService;
		this.reviewService = reviewService;
		this.keywordService = keywordService;
		this.mainDao = mainDao;
	}
	
	public SearchInfoVO analyzeKeyword(SearchInfoVO searchInfoVo) {
		searchInfoVo = keywordService.analyzeKeyword(searchInfoVo);
		return searchInfoVo;
	}
	
	/*
	 * 분석된 키워드의 결과를 토대로 업소 리스트를 조회합니다.
	 * 검색어와 분석정보는 SearchInfoVO를 통해 관리합니다.
	 * 페이징처리 조건은 PageUtil을 통하여 설정 할 수 있습니다.
	 */
	public List<UpsoVO> getUpsoList(SearchInfoVO searchInfoVo, PageUtil pageUtil) {
		if(searchInfoVo.isFirst()) {
			upsoService.insertUpso(null, searchInfoVo);
		}
		
		setPageUtil(pageUtil, searchInfoVo);
		List<UpsoVO> upsoList = upsoService.getUpsoList(searchInfoVo, pageUtil);
		
		return upsoList;
	}
	
	private void setPageUtil(PageUtil pageUtil, SearchInfoVO searchInfoVo) {
		int totalCount = searchInfoVo.getUpsoCount();
		String category_name = searchInfoVo.getCategory_name();
		if(category_name != null) {
			totalCount = mainDao.countUpso_category(searchInfoVo);
		}
		pageUtil.setTotalCount(totalCount);
		pageUtil.setPageRow(10);
		pageUtil.setPageGroup(5);
		pageUtil.totalfun();
	}
	
	/*
	 * 화면에 카테고리 정렬 기능 노출이 필요하다면,
	 * 조회된 업소들의 카테고리 리스트를 가져옵니다. 
	 */
	public List<String> getCategoryList(SearchInfoVO searchInfoVo) {
		String keyword = searchInfoVo.getKeyword();
		List<String> categoryList = mainDao.getCategoryList(keyword);
		int countCategory = categoryList.size();
		if(countCategory > 1) {
			searchInfoVo.setCategory_filtering("Y");
			sortCategoryList(categoryList);
		} else {
			searchInfoVo.setCategory_filtering("N");
		}
		return categoryList;
	}
	
	private void sortCategoryList(List<String> categoryList) {
		if(categoryList.size() == 0)
			return;
		if(categoryList.get(0).equals("한식"))
			return;
		for(int i=0; i<categoryList.size(); i++) {
			String category_name = categoryList.get(i);
			if(category_name.equals("한식")) {
				categoryList.remove(i);
				categoryList.add(0, category_name);
				return;
			}
		}
	}
	/*
	 * 업소의 디테일 정보를 요정합니다.
	 */
	public UpsoVO getUpsoDetail(UpsoVO upsoVo, HttpSession session) {
		String user_id = getUserIdInSession(session);
		upsoVo = upsoService.getUpsoDetailInfo(upsoVo.getId(), user_id);
		return upsoVo;
	}

	/*
	 * 업소의 리뷰 & 평점 분석정보를 가져옵니다.
	 */
	public RatingUpsoVO getRatingInfo(int upso_id) {
		RatingUpsoVO ratingVo = upsoService.getRatingInfo(upso_id);
		return ratingVo;
	}
	
	/*
	 * 업소에 등록된 리뷰 리스트를 가져옵니다.
	 */
	public List<ReviewVO> getReviewList(int upso_id){
		List<ReviewVO> reviewList = reviewService.getAllList(upso_id);
		for(int i=0; i < reviewList.size(); i++) {
			ReviewVO reviewVo = reviewList.get(i);
			int rev_no = reviewVo.getRev_no();
			List<ImageFileVO> imageList = reviewService.getImageList(rev_no);
			reviewVo.setImgList(imageList);
		}
		return reviewList;
	}
	 
	/*
	 * 업소 리뷰를 저장해주는 메소드입니다.
	 * return : 성공 - true, 실패 - false
	 */
	@Transactional
	public void insertReviewProcess(ReviewVO reviewVo, HttpSession session) {
		String userId = getUserIdInSession(session);
		if(userId.equals(""))
			return;
		reviewVo.setMid(userId);
		int count = reviewService.insertContents(reviewVo);
		if(count == 0)
			return;
		reviewService.insertImageFile(reviewVo, session);
	}

	@Transactional
	public void deleteReviewProcess(ReviewVO reviewVo, HttpSession session) {
		String user_id = getUserIdInSession(session);
		reviewVo.setMid(user_id);
		reviewService.deleteContents(reviewVo);
		reviewService.deleteReviewImage(reviewVo);
	}
	
	/*
	 * 주간 맛집을 선택합니다.
	 */
	public List<UpsoVO> getWeeklyUpso() {
		List<UpsoVO> weeklyUpsoList = upsoService.showWeeklyUpso();
		return weeklyUpsoList;
	}
	
	/*
	 * 내가 찜한 업소 리스트를 가져옵니다.
	 */
	public List<UpsoVO> getMyUpsoList(SearchInfoVO searchInfoVo, HttpSession session) {
		String userId = getUserIdInSession(session);
		if(userId.equals(""))
			return null;
		searchInfoVo.setUser_id(userId);
		List<UpsoVO> myUpsoList = upsoService.showMyUpso(searchInfoVo);
		return myUpsoList;
	}

	/*
	 * 클라이언트 위치기반 추천 업소 리스트를 가져옵니다.
	 */
	public List<UpsoVO> getupsoListAroundUser(SearchInfoVO searchInfoVo) {
		List<UpsoVO> upsoList = mainDao.selectSubMyPickUpsoList(searchInfoVo);
		return upsoList;
	}
	
	/*
	 * 클라이언트가 업소를 픽기능을 요청시 처리하는 메소드입니다.
	 */
	public boolean upsoPickProcess(HttpSession session, int upso_id) {
		String user_id = getUserIdInSession(session);
		boolean is_pick = pickOrUnPick(user_id, upso_id);
		int count = 0;
		if(is_pick) {
			count = mainDao.deletePickData(upso_id, user_id);
		} else if(!is_pick) {
			count = mainDao.insertPickData(upso_id, user_id);
		}
		boolean result = (count == 0) ? false : true;
		return result;
	}

	private boolean pickOrUnPick(String user_id, int upso_id) {
		int pickCount = mainDao.isPick(upso_id, user_id);
		boolean result = (pickCount == 0) ? false : true;
		return result;
	}
	

	private String getUserIdInSession(HttpSession session) {
		String user_id = (String) session.getAttribute("SID");
		if(user_id == null)
			user_id = "";
		return user_id;
	}






}
