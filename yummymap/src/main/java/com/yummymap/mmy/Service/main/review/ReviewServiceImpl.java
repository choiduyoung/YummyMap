package com.yummymap.mmy.Service.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yummymap.mmy.Service.main.FileService;
import com.yummymap.mmy.dao.MainDAO;
import com.yummymap.mmy.vo.ImageFileVO;
import com.yummymap.mmy.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	private MainDAO mainDao;
	@Autowired
	private FileService fileService;
	
	public ReviewServiceImpl(MainDAO mainDao) {
		this.mainDao = mainDao;
	}

	@Override
	public int insertContents(ReviewVO reviewVo) {
		int result = mainDao.insertReview(reviewVo);
		return result;
	}

	@Override
	public int updateContents(ReviewVO reviewVo) {
		return 0;
	}

	@Override
	public int deleteContents(ReviewVO reviewVo) {
		int rev_no = reviewVo.getRev_no();
		String user_id = reviewVo.getMid();
		int deleteCnt = mainDao.deleteReview(rev_no, user_id);
		return deleteCnt;
	}
	@Override
	public <Integer> List<ReviewVO> getAllList(Integer key) {
		int upso_id = (int)key;
		List<ReviewVO> reviewList = mainDao.getReviewList(upso_id);
		return reviewList;
	}

	@Override
	public int insertImageFile(ReviewVO reviewVo, HttpSession session) {
		if(reviewVo == null)
			return 0;
		List<ImageFileVO> imageFileVoList = fileService.uploadProcess(session, reviewVo.getReviewImgFile());
		int rev_no = reviewVo.getRev_no();
		int res_no = reviewVo.getRes_id();
		int insertCount = 0;
		for(int i=0; i < imageFileVoList.size(); i++) {
			ImageFileVO imageFileVo  = imageFileVoList.get(i);
			imageFileVo.setRev_no(rev_no);
			imageFileVo.setRes_no(res_no);
			String is_main = isFirstImg(res_no);
			imageFileVo.setIs_main(is_main);
			insertCount += mainDao.insertReviewImg(imageFileVo);
		}
		return insertCount;
	}

	@Override
	public List<ImageFileVO> getImageList(int rev_no) {
		 List<ImageFileVO> reviewImgList = mainDao.getReviewImgList(rev_no);
		 return reviewImgList;
	}
	
	private String isFirstImg(int upso_id) {
		int count = mainDao.getCountImgGroupByUpso(upso_id);
		String result = (count == 0) ? "Y" : "N";
		return result;
	}

	@Override
	public boolean checkWriter(String user_id, ReviewVO reviewVo) {
		int rev_no = reviewVo.getRev_no();
		String writer = mainDao.getReviewWriter(rev_no);
		if(writer == null)
			return false;
		boolean result = (user_id.equals(writer)) ? true : false;
		return result;
	}

	@Override
	public int deleteReviewImage(ReviewVO reviewVo) {
		int rev_no = reviewVo.getRev_no();
		int deleteCnt = mainDao.deleteReviewImage(rev_no);
		return deleteCnt;
	}






}
