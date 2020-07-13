package com.yummymap.mmy.dao;

import com.yummymap.mmy.vo.txt.TxtVO;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TxtDAO {
	@Autowired 
	SqlSessionTemplate sqlSession;

	public List getList() {
		return sqlSession.selectList("tSQL.tList");
	}

	public int write(TxtVO tVO) {
		
		return sqlSession.insert("tSQL.tWrite", tVO);
	}

	public TxtVO detail(int txtno) {
		return sqlSession.selectOne("tSQL.tDetail", txtno);
	}

	public int delete(int txtno) {
		return sqlSession.update("tSQL.tDelete", txtno);
	}

	public TxtVO edit(TxtVO tVO) {
		sqlSession.update("tSQL.tEdit", tVO);
		return tVO;
	}

	public void count(int txtno) {
		sqlSession.update("tSQL.tCount", txtno);
	}
	
	public List<TxtVO> rList(int txtno) {
		return sqlSession.selectList("tSQL.rList", txtno);
	}
	public TxtVO rWrite(TxtVO tVO) {
		sqlSession.insert("tSQL.rWrite", tVO);
		return tVO;
	}
	public TxtVO rDelete(TxtVO tVO) {
		sqlSession.update("tSQL.rDelete",tVO);
		return tVO;
	}
	public int checkLike(TxtVO tVO) {
		return sqlSession.selectOne("tSQL.checkLike",tVO);
	}
	public void editLike(TxtVO tVO) {
		sqlSession.update("tSQL.editLike", tVO);
	}
	public TxtVO addLike(TxtVO tVO) {
		sqlSession.insert("tSQL.addLike", tVO);
		return tVO;
	}
	public Integer likeCnt(int txtno) {
		return sqlSession.selectOne("tSQL.likeCnt", txtno);
	}
	public List txtlist() {
		return sqlSession.selectList("tSQL.txtlist");
	}
	public int file(TxtVO tVO) {
		return sqlSession.insert("tSQL.file",tVO);
	}

}
