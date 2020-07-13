package com.yummymap.mmy.dao;

import java.util.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.yummymap.mmy.vo.*;

public class TextDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	//게시판 글수 카운트
	public int txtCnt(TextVO tVO) {
		return sqlSession.selectOne("textSQL.txtCnt",tVO);
	}
	//리스트 불러와주는 DAO
	public List getList(HashMap<String, Object> map) {
		return sqlSession.selectList("textSQL.MytxtList" , map);
	}
	//나의글 선택 삭제 DAO
	public int textDel(ArrayList list) {
		return sqlSession.update("textSQL.textDel", list); 
	}
	//활동 내역 차트 DAO

}
