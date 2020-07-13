package com.yummymap.mmy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yummymap.mmy.vo.TextVO;
import com.yummymap.mmy.vo.admin.ChartCntVO;
import com.yummymap.mmy.vo.admin.ResCntVO;

public class ChartDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	//카테고리 가져오기 전담 함수
	public List<ResCntVO> category() {
		return sqlSession.selectList("chartSQL.category");
	}
	
	public ChartCntVO maindata() {
		return sqlSession.selectOne("chartSQL.mainCnt");
	}
	//활동 내역 가져오기 전담 함수
	public ChartCntVO activity(ChartCntVO cVO) {
		return sqlSession.selectOne("chartSQL.ActivityCnt",cVO);
	}
	//세부 활동 내역 가져오기 전담함수
	public List cataActivityCnt(TextVO tVO) {
		return sqlSession.selectList("chartSQL.cateActivityCnt", tVO);
	}
	
	//일일 접속자 수 가져오는 함수
	public List getClientCnt() {
		return sqlSession.selectList("chartSQL.getClientCnt");
	}
}
