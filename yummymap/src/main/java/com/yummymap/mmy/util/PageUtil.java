package com.yummymap.mmy.util;

public class PageUtil {
	private int nowPage = 1; //현재 보고있는 페이지
	private int totalPage; //총페이지 수
	private int totalCount;//총 게시물 수
	
	private int pageRow; // 한페이지에 보여줄 게시물
	private int pageGroup; // 한 화면에서 이동가능 페이지 
	
	private int startPage; // 현재 화면에서 보여줄 시작페이지
	private int endPage; // 현재 화면에서 뵤여줄 마지막 페이지
	
	private int startCont; // 쿼리 로우 넘버
	private int endCont; // 쿼리 하이 넘버
	
	private int prePage; //뷰단 pre 버튼 아이디값
	private int nextPage; //뷰탄 next 버튼 아이디값
	
	
	public void totalfun() {
		calcPage();
		calcStart();
		calcEnd();
		calCont();
		
		prePage = startPage -1;
		nextPage = endPage +1;
	}
	//총 페이지수 계산 함수
	public void calcPage() {
		totalPage = (totalCount % pageRow == 0 ) ? (totalCount / pageRow):(totalCount / pageRow + 1 );
	}
	
	public void calcStart() {
		int tmp = (nowPage -1 ) / pageGroup;
		
		startPage = tmp * pageGroup + 1;
	}
	
	public void calcEnd() {
		int tmp = (nowPage - 1) / pageGroup;
		
		endPage = (tmp + 1) * pageGroup;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	
	}
	
	public void calCont() {
		startCont = (nowPage - 1 ) * pageRow + 1;
		endCont = nowPage * pageRow;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartCont() {
		return startCont;
	}

	public void setStartCont(int startCont) {
		this.startCont = startCont;
	}

	public int getEndCont() {
		return endCont;
	}

	public void setEndCont(int endCont) {
		this.endCont = endCont;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
}
