package com.yummymap.mmy.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yummymap.mmy.vo.MemberVO;


public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	//로그인 처리 DAO
	public int loginck(MemberVO mVO) {
		return sqlSession.selectOne("memberSql.loginCheck", mVO);
	}
	//회원정보 리스트 DAO
	public MemberVO getUserInfo(MemberVO mVO) {
		return sqlSession.selectOne("memberSql.getUserInfo", mVO);
	}
	//비밀번호 변경 DAO
	public int pwchange(MemberVO mVO) {
		return sqlSession.update("memberSql.pwchange", mVO);
	}
	//회원 탈퇴 DAO
	public int memberDel(MemberVO mVO) {
		return sqlSession.update("memberSql.memberDel", mVO);
	}
	//아이디 찾기 DAO
	public String idFind(MemberVO mVO) {
		return sqlSession.selectOne("memberSql.idfind", mVO);
	}
	//비밀번호 찾기 DAO
	public int pwFind(MemberVO mVO) {
		return sqlSession.selectOne("memberSql.pwfind", mVO);
	}
	//이메일변경 DAO
	public int emailchange(MemberVO mVO) {
		return sqlSession.update("memberSql.emailchange", mVO);
	}
	//임시 패스워드 변경
	public int tempass(MemberVO mVO ,String mid, String mpw) {
		return sqlSession.update("memberSql.pwchange", mVO);
	}

	//회원가입 처리
	public int join(MemberVO mVO) {
		return sqlSession.insert("memberSql.join", mVO);
	}
	//아이디 중복확인
	public int idCheck(MemberVO mVO) {
		return sqlSession.selectOne("memberSql.idCheck", mVO);
	}
	
	//접속자 카운트 데이터 확인
	public int clientCntInfo() {
		return sqlSession.selectOne("memberSql.clicntCntInfo");
	}
	
	//접속자 카운트 증가 함수
	public int addClientCnt() {
		return sqlSession.update("memberSql.addClientCnt");
	}
	
	//접속자 카운트 데이터 생성 함수
	public int creatClientCnt(int cnt) {
		return sqlSession.insert("memberSql.createClientCnt", cnt);
	}

}
