package com.yummymap.mmy.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import com.yummymap.mmy.vo.*;

public class JoinMailDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 인증메일 확인 함수
	public int mailCnt(JoinMailVO jVO) {
		return sqlSession.selectOne("jSQL.mailCnt", jVO);
	}
	
	// 메일이 이미 있을 때 인증번호 업데이트 함수
	public int mailUp(JoinMailVO jVO) {
		return sqlSession.update("jSQL.mailUp", jVO);
	}
	
	// 메일이 없을 때 메일과 컬럼들 업데이트 함수
	public int newMail(JoinMailVO jVO) {
		return sqlSession.insert("jSQL.newMail", jVO);
	}
}
