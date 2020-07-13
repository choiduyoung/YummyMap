package com.yummymap.mmy.dao;
/**
 * 메인페이지에서 필요한 DAO 작업을 전담하는 클래스입니다.
 * 
 * @author	김종형
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.yummymap.mmy.util.PageUtil;
import com.yummymap.mmy.vo.*;

@Repository
public class MainDAO {

	private SqlSessionTemplate sqlSession;
	
	public MainDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/*
	 * 금주의 핫 맛집 TOP3를 조회합니다.
	 */
	public List<UpsoVO> selectWeeklyUpso() {
		return sqlSession.selectList("mainSql.weeklyUpso");
	}
	
	/*
	 * 업소가 DB 테이블에 저장되어있는지 조회합니다
	 */
	public int isShowUpSo(int upso_id) {
		return sqlSession.selectOne("mainSql.showUpso", upso_id);
	}
	/*
	 * 입력된 키워드의 분석된 정보를 조회합니다.
	 * 조회 결과
	 * 		키워드 분석 정보, 해당 키워드로 조회된 업소 총 수
	 */
	public SearchInfoVO isShowKeyword(String keyword) {
		return sqlSession.selectOne("mainSql.showKeyword", keyword);
	}
	/*
	 * 업소의 정보를 DB 테이블에 저장합니다.
	 */
	public int insertUpSo(UpsoVO upSoVo) {
		return sqlSession.insert("mainSql.insertUpSo", upSoVo);
	}
	/*
	 * 분석된 키워드정보를 DB 테이블에 저장합니다.
	 */
	public int insertKeyword(SearchInfoVO searchInfoVo) {
		return sqlSession.insert("mainSql.insertKeyword", searchInfoVo);
	}
	
	/*
	 * 업소의 디테일한 정보를 조회합니다.
	 */
	public UpsoVO getUpSoDetailInfo(int upso_id, String user_id) {
		Map<String, Object> paramMap = getPickProcessParamMap(upso_id, user_id);
		return sqlSession.selectOne("mainSql.upSoDetailInfo", paramMap);
	}
	/*
	 * 키워드에 해당하는 업소 리스트를 출력합니다.
	 * 	SearchInfoVO 에 담긴 정보에 의해서 동적인 질의명령이 완성됩니다.
	 * 		SearchInfoVO에는 keyword가 필수로 담겨있어야 합니다.
	 * 						나머지는 옵션이 될 수 있습니다.
	 * 						자세한 정보는 SearchInfoVO를 참조하세요.
	 * param :	SearchInfoVO - 검색정보가 담겨있는 vo
	 * 			PageUtil	 - 페이징 처리 정보가 담긴 util
	 */
	public List<UpsoVO> getUpSoList_keyword(SearchInfoVO searchInfoVo, PageUtil pageUtil){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchInfoVo", searchInfoVo);
		map.put("pageUtil", pageUtil);
		return sqlSession.selectList("mainSql.getUpSoList_keyword",map);
	}
	/*
	 * 카테고리로 그룹핑된 업소의 총 수를 조회합니다.
	 */
	public int countUpso_category(SearchInfoVO searchInfoVo) {
		return sqlSession.selectOne("mainSql.countUpso_category", searchInfoVo);
	}

	/*
	 * 업소의 리뷰 평점 정보를 조회합니다.
	 * param : upso_id (업소 id)
	 */
	public List<RatingUpsoVO> getUpsoRatingInfo(int upso_id) {
		return sqlSession.selectList("chartSQL.upso_rating_total", upso_id);
	}
	/*
	 * 업소정보에 등록된 모든 리뷰를 조회합니다.
	 *  param : upso_id (업소 id)
	 */
	public List<ReviewVO> getReviewList(int upso_id) {
		return sqlSession.selectList("mainSql.reviewList", upso_id);
	}
	/*
	 * 리뷰에 첨부된 이미지파일을 조회합니다.
	 * param : rev_no (DB에 저장된 리뷰 키값)
	 */
	public List<ImageFileVO> getReviewImgList(int rev_no){
		return sqlSession.selectList("mainSql.imgListForReview", rev_no);
	}
	
	/*
	 * 리뷰정보를 DB에 저장합니다.
	 */
	public int insertReview(ReviewVO reviewVo) {
		System.out.println("reviewVo ::"+reviewVo);
		return sqlSession.insert("mainSql.insertReview", reviewVo);
	}
	/*
	 * 리뷰에 첨부된 이미지 정보를 DB에 저장합니다.
	 */
	public int insertReviewImg(ImageFileVO imageFileVo) {
		return sqlSession.insert("mainSql.insertReviewImg", imageFileVo);
	}
	
	/*
	 * 업소에 등록된 리뷰중 등록된 사진이 있다면 첫번째로 등록된 사진을 가져옵니다.
	 */
	public String getUpsoImg(int upso_id) {
		return sqlSession.selectOne("mainSql.getUpsoImg", upso_id);
	}
	/*
	 * 업소에 등록된 리뷰중 함께 등록된 사진의 총 카운트를 조회하는 메소드입니다.
	 */
	public int getCountImgGroupByUpso(int upso_id) {
		return sqlSession.selectOne("mainSql.countImgGroupByUpso", upso_id);
	}
	/*
	 * 키워드를 통해 조회된 업소 리스트에서 카테고리 리스트를 따로 조회하는 메소드입니다.
	 * param : 검색keyword를 받습니다.
	 * 			업소 리스트 조회할때와 동일한 키워드를 입력해야 동일한 결과를 받습니다.
	 */
	public List<String> getCategoryList(String keyword) {
		return sqlSession.selectList("mainSql.category_list_keyword", keyword);
	}
	
	/*
	 * 로그인한 유저가 해당 업소를 픽 했는지 여부를 조회하는 메소드입니다.
	 */
	public int isPick(int upso_id, String user_id) {
		Map<String, Object> paramMap = getPickProcessParamMap(upso_id, user_id);
		return sqlSession.selectOne("mainSql.pickCount", paramMap);
	}
	
	/*
	 * 내가 찜한 업소 리스트를 출력합니다.
	 */
	public List<UpsoVO> selectMyPickUpsoList(String user_id) {
		return sqlSession.selectList("mainSql.myPickUpsoList", user_id);
	}
	/*
	 * 내가 찜한 업소가 없을시 대체 흐름으로 출력합니다.
	 */
	public List<UpsoVO> selectSubMyPickUpsoList(SearchInfoVO searchInfoVo) {
		return sqlSession.selectList("mainSql.sub_myPickUpsoList", searchInfoVo);
	}

	public int insertPickData(int upso_id, String user_id) {
		Map<String, Object> paramMap = getPickProcessParamMap(upso_id, user_id);
		return sqlSession.insert("mainSql.isertPick", paramMap);
	}

	public int deletePickData(int upso_id, String user_id) {
		Map<String, Object> paramMap = getPickProcessParamMap(upso_id, user_id);
		return sqlSession.update("mainSql.removePick", paramMap);
	}
	public String getReviewWriter(int rev_no) {
		return sqlSession.selectOne("mainSql.checkReviewWriter", rev_no);
	}
	
	private Map<String, Object> getPickProcessParamMap(int upso_id, String user_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("upso_id", upso_id);
		paramMap.put("user_id", user_id);
		return paramMap;
	}

	public int deleteReview(int rev_no, String user_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rev_no", rev_no);
		paramMap.put("user_id", user_id);
		return sqlSession.update("mainSql.deleteReview", paramMap);
	}

	public int deleteReviewImage(int rev_no) {
		return sqlSession.update("mainSql.deleteReviewImage", rev_no);
	}


}
