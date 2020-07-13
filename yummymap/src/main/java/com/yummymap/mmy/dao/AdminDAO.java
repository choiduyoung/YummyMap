package com.yummymap.mmy.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yummymap.mmy.vo.admin.AdminBoardVO;
import com.yummymap.mmy.vo.admin.AdminVO;

public class AdminDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//관리자 로그인 전담 함수
	public int loginck(AdminVO avo) {
		return sqlSession.selectOne("adminSQL.loginck",avo);
	}
	
	
	//회원 카운트 전담 함수
	public int memberCnt(AdminVO avo) {
		return sqlSession.selectOne("adminSQL.membercnt" , avo);
	}
	
	//관리자 회원관리 리스트 전담 함수
	public List getMemberList(HashMap map) {
		return sqlSession.selectList("adminSQL.memberList", map);
	}
	
	//회원 정보 수정 페이지 전담 함수
	public AdminVO getMemberInfo(AdminVO avo) {
		return sqlSession.selectOne("adminSQL.memberEdit" , avo);
	}
	
	//회원/관리자 정보 수정 전담 함수
	public int memberEdit(AdminVO avo) {
		return sqlSession.update("adminSQL.memberUpdate",avo);
	}
	
	//회원 삭제 전담 함수
	public int memberDel(AdminVO avo) {
		return sqlSession.update("adminSQL.memberDel" , avo);
	}
	
	
	//게시글 카운트 함수 
	public int boardCnt(AdminBoardVO abvo) {
		return sqlSession.selectOne("adminSQL.boardCnt", abvo);
	}
	
	//게시글 관리 페이지 함수
	public List boardList(HashMap<String, Object> map) {
		return sqlSession.selectList("adminSQL.boardList", map);
	}
	
	//게시글 상세보기 페이지
	public AdminBoardVO detailBoard(AdminBoardVO abvo) {
		return sqlSession.selectOne("adminSQL.boardDetail",abvo);
	}
	
	//게시글 단일 삭제 요청 
	public int boardDel(ArrayList list) {
		return sqlSession.update("adminSQL.boardDel" , list); 
	}
	
	
}
