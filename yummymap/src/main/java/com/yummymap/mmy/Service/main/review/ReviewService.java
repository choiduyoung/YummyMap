package com.yummymap.mmy.Service.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.yummymap.mmy.vo.ImageFileVO;
import com.yummymap.mmy.vo.ReviewVO;

public interface ReviewService extends ContentsService<ReviewVO>{
	int insertImageFile(ReviewVO reviewVo, HttpSession session);
	List<ImageFileVO> getImageList(int rev_no);
	boolean checkWriter(String user_id, ReviewVO reviewVo);
	int deleteReviewImage(ReviewVO reviewVo);
}
