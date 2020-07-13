package com.yummymap.mmy.Service.main.upso;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.util.PageUtil;
import com.yummymap.mmy.vo.ImageFileVO;
import com.yummymap.mmy.vo.RatingUpsoVO;
import com.yummymap.mmy.vo.ReviewVO;
import com.yummymap.mmy.vo.SearchInfoVO;
import com.yummymap.mmy.vo.UpsoVO;


@Service
public class SimpleUpsoService implements UpsoService{
	private MainDAO mainDao;

	public SimpleUpsoService(MainDAO mainDao) {
		this.mainDao = mainDao;
	}
	
	@Override
	public UpsoVO getUpsoDetailInfo(int upso_id, String user_id) {
		UpsoVO upSoVo = mainDao.getUpSoDetailInfo(upso_id, user_id);
		return upSoVo;
	}

	@Override
	public boolean isShowUpso(int upso_id) {
		int resultCount = mainDao.isShowUpSo(upso_id);
		boolean result = resultCount > 0 ? true : false;
		return result;
	}

	@Override
	public int insertUpso(UpsoVO upsoVo, SearchInfoVO searchInfoVo) {
		int resultCnt = mainDao.insertUpSo(upsoVo);
		return resultCnt;
	}
	
	@Override
	public List<UpsoVO> getUpsoList(SearchInfoVO searchInfoVo, PageUtil pageUtil) {
		List<UpsoVO> upsoList = mainDao.getUpSoList_keyword(searchInfoVo, pageUtil);
		return upsoList;
	}
	
	@Override
	public RatingUpsoVO getRatingInfo(int upso_id) {
		List<RatingUpsoVO> ratingList = mainDao.getUpsoRatingInfo(upso_id);
		RatingUpsoVO ratingUpsoVo = new RatingUpsoVO();
		for(int i=0; i<ratingList.size(); i++) {
			RatingUpsoVO tmp = ratingList.get(i);
			int rating_value = tmp.getRating_value();
			switch(rating_value) {
			case 1:
				ratingUpsoVo.setRating_star1(tmp.getRating_value_count());
				break;
			case 2:
				ratingUpsoVo.setRating_star2(tmp.getRating_value_count());
				break;
			case 3:
				ratingUpsoVo.setRating_star3(tmp.getRating_value_count());
				break;
			case 4:
				ratingUpsoVo.setRating_star4(tmp.getRating_value_count());
				break;
			case 5:
				ratingUpsoVo.setRating_star5(tmp.getRating_value_count());
				break;
			}
		}
		int total = ratingUpsoVo.getRating_total();
		double per1 = ratingUpsoVo.getRating_star1() / (double)total * 100.;
		double per2 = ratingUpsoVo.getRating_star2() / (double)total * 100.;	
		double per3 = ratingUpsoVo.getRating_star3() / (double)total * 100.;
		double per4 = ratingUpsoVo.getRating_star4() / (double)total * 100.;
		double per5 = ratingUpsoVo.getRating_star5() / (double)total * 100.;
		ratingUpsoVo.setStar1_per(per1);
		ratingUpsoVo.setStar2_per(per2);
		ratingUpsoVo.setStar3_per(per3);
		ratingUpsoVo.setStar4_per(per4);
		ratingUpsoVo.setStar5_per(per5);
		return ratingUpsoVo;
	}

	@Override
	public List<UpsoVO> showWeeklyUpso() {
		List<UpsoVO> weeklyUpsoList = mainDao.selectWeeklyUpso();
		return weeklyUpsoList;
	}

	@Override
	public List<UpsoVO> showMyUpso(SearchInfoVO searchInfoVo) {
		String user_id = searchInfoVo.getUser_id();
		List<UpsoVO> myUpsoList = mainDao.selectMyPickUpsoList(user_id);
		return myUpsoList;
	}
}

