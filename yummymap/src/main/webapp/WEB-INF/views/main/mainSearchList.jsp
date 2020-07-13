<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>야미맵 리스트</title>
    <link rel="stylesheet" href="/yummymap/css/main/nav.css" />
    <link rel="stylesheet" href="/yummymap/css/main/mainSearchList.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/yummymap/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="topNav border-bottom pl-4 pt-1 shadow-sm" id="topNav">
        <div class="d-flex m-0">
            <div class="topNavLogo">
                <a href="/yummymap/main.mmy">YUMMY MAP</a>
            </div>
            <ul class="topNavItem d-flex justify-content-end pr-4 pt-1">
                <li><div class="topNavItem-icon" onclick="showModal()"><i class="far fa-heart"></i></div></li>
                <li><a class="topNavItem-icon" href=""><i class="fas fa-user"></i></a></li>
                <c:if test="${SID == null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/login.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${SID != null and Token == null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/logoutProc.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
                <c:if test="${SID != null and Token != null}">
                <li><a class="topNavItem-icon" href="" id="kakaoLogout"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
        </div>
        <div class="d-flex justify-content-center">
            <div class="searchBox d-flex">
                <div class="searchBox-font"><i class="fas fa-search"></i></div>
                <input type="text" id="search" onkeydown="submitKeyword()">
                <div class="searchBox-text" onclick="submitKeyword_click()">검색</div>
            </div>
        </div>
    </div>
    <div class="itemBody container mb-5">
   	    <c:if test="${searchInfoVo.category_filtering == 'Y'}">
	    <div class="title mt-4">${searchInfoVo.keyword} 검색 결과</div>
	    <div class="d-flex mt-1">
		    <div class="border-bottom q-location">검색 장소 : ${searchInfoVo.query_location}</div>
	    </div>
	     <div class="d-flex justify-content-end">
	     	<div class="border d-flex p-1 sortBox">
				<div class="mr-2 border-right pr-2 pl-2" onclick="listSort('star_avg')">평점</div>
				<div class="mr-2 " onclick="listSort('cont_sum')">리뷰</div>
	     	</div>
		</div>
    	<div class="border-bottom mt-2 mb-2 p-2 d-flex justify-content-around category-box">
    		<div class="filter-item p-2 mr-2" onclick="groupByCategory('모두')">모두</div>
    		<c:forEach var="category" items="${categoryList}">
    		<div class="filter-item p-2 mr-2" onclick="groupByCategory('${category}')">${category}</div>
    		</c:forEach>
    	</div>
    	</c:if>
   	    <c:if test="${searchInfoVo.category_filtering == 'N'}">
    	<div class="title mt-4">${searchInfoVo.keyword} 검색 결과</div>
 		<div class="d-flex mt-1">
		    <div class="border-bottom q-location">검색 장소 : ${searchInfoVo.query_location}</div>
	    </div>
	     <div class="d-flex justify-content-end">
	     	<div class="border d-flex p-1 sortBox">
				<div class="mr-2 border-right pr-2 pl-2" onclick="listSort('star_avg')">평점</div>
				<div class="mr-2 " onclick="listSort('cont_sum')">리뷰</div>
	     	</div>
		</div>    		    
   	    </c:if>  	
   	    <c:if test="${searchInfoVo.category_name != null}">
    	<div class="sub-title mt-5">${searchInfoVo.category_name} 카테고리</div>   	    
   	    </c:if>
    	<c:forEach var="upsoVo" items="${upsoList}" varStatus="status">
    	<c:if test="${status.count % 2 != 0}">
 	    <div class="item d-inline-block mr-4 ml-3 mt-4" >
 	    	<div class="p-2">
	        	<div class="info-name m-0">${upsoVo.place_name}</div>
	        	<div class="info-addr m-0">${upsoVo.road_address_name}</div> 	    	
 	    	</div>
            <div class="imgBox" onclick="getDetail('${upsoVo.id}')">
            	<c:if test="${empty upsoVo.img_save_name}">
                <img src="/yummymap/resources/upsoImg/noImage1.jpg" alt="" />
            	</c:if>
                <c:if test="${!empty upsoVo.img_save_name}">
                <img src="/yummymap/resources/upsoImg/${upsoVo.img_save_name}" alt="" />
                </c:if>
            </div>
            <div class="info-sub pl-2 pt-1 d-flex">
            	<div class="d-flex">
            		<div class="mr-2"><i class="far fa-star"></i></div>
            		<div class="info-avg pr-2  mr-2 border-right">${upsoVo.star_avg}</div>
            	</div>
            	<div class="d-flex">
    				<div class="mr-2"><i class="far fa-edit"></i></div>        	
	                <div class="info-sum">${upsoVo.cont_sum}</div>
            	</div>
            </div>
        </div>
    	</c:if>
    	<c:if test="${status.count % 2 == 0}">
        <div class="item d-inline-block mt-4" >
 	    	<div class="p-2">
	        	<div class="info-name m-0">${upsoVo.place_name}</div>
	        	<div class="info-addr m-0">${upsoVo.road_address_name}</div> 	    	
 	    	</div>
            <div class="imgBox" onclick="getDetail('${upsoVo.id}')">
            	<c:if test="${empty upsoVo.img_save_name}">
                <img src="/yummymap/resources/upsoImg/noImage2.jpg" alt="" />
            	</c:if>
                <c:if test="${!empty upsoVo.img_save_name}">
                <img src="/yummymap/resources/upsoImg/${upsoVo.img_save_name}" alt="" />
                </c:if>
            </div>
            <div class="info-sub pl-2 pt-1 d-flex">
            	<div class="d-flex">
            		<div class="mr-2"><i class="far fa-star"></i></div>
            		<div class="info-avg pr-2  mr-2 border-right">${upsoVo.star_avg}</div>
            	</div>
            	<div class="d-flex">
    				<div class="mr-2"><i class="far fa-edit"></i></div>        	
	                <div class="info-sum">${upsoVo.cont_sum}</div>
            	</div>
            </div>
        </div>
    	</c:if>
    	</c:forEach>
    	<div class="d-flex justify-content-center mt-5 mb-5">
	    	<c:forEach var="pageNo" begin="${pageUtil.startPage}" end="${pageUtil.endPage}">
	    	<c:if test="${pageUtil.nowPage == pageNo}">
	    		<a href="/yummymap/main/getList.mmy?keyword=${searchInfoVo.keyword}&nowPage=${pageNo}&category_name=${searchInfoVo.category_name}&order_standard=${searchInfoVo.order_standard}">
	    			<div class="pager-no border pt-1 pb-1" style="border-bottom: 2px solid #F86624 !important;">${pageNo}</div>
	    		</a>
	    	</c:if>
	    	<c:if test="${pageUtil.nowPage != pageNo}">
	    		<a href="/yummymap/main/getList.mmy?keyword=${searchInfoVo.keyword}&nowPage=${pageNo}&category_name=${searchInfoVo.category_name}&order_standard=${searchInfoVo.order_standard}">
	    			<div class="pager-no border pt-1 pb-1">${pageNo}</div>
	    		</a>
	    	</c:if>
	    	</c:forEach>
    	</div>
    </div>
    <div class="dnone">
    	<form method="POST" action="/yummymap/main/getList.mmy" id="categoryDataForm">
	    	<input type="hidden" name="keyword" value="${searchInfoVo.keyword}">
	    	<input type="hidden" name="query_keyword" value="${searchInfoVo.query_keyword}">
	    	<input type="hidden" name="query_location" value="${searchInfoVo.query_location}">
	    	<input type="hidden" name="category_name" id="categoryDataForm_category">
    	</form>
    </div>
	<div class="dnone">
		<form method="POST" action="/yummymap/main/getList.mmy" id="sortForm">
			<input type="hidden" name="keyword"  value="${searchInfoVo.keyword}">
			<input type="hidden" name="order_standard" id="order_standard">
		</form>
	</div>    
<!-- Modal -->
<div class="modal fade " id="myUpsoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">나의 맛집</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        <c:if test="${searchInfoVo.upsoCount == 0}">
        	<div class="modal-sub-title border-bottom pb-2">나의 맛집이 아직 등록되지 않았습니다.</div>
        	<div class="modal-sub-title2 pt-3 pb-3">내 주변 맛집 추천 리스트</div>
        </c:if>
        <c:forEach var="myPickUpso" items="${myPickUpsoList}">
          <div class="d-flex pb-2 border-bottom pt-2">
              <div class="myUpsoImgBox">
              <c:if test="${empty myPickUpso.img_save_name}">
                  <img src="/yummymap/resources/upsoImg/noImage.jpg" alt="">
              </c:if>
              <c:if test="${!empty myPickUpso.img_save_name}">
                  <img src="/yummymap/resources/upsoImg/${myPickUpso.img_save_name}" alt="">
              </c:if>
              </div>
              <div class="pl-3">
                  <div class="myUpsoName">${myPickUpso.place_name}</div>
                  <div class="myUpsoAddr pb-4">${myPickUpso.road_address_name}</div>
                  <div class="d-flex">
                    <div class="myUpsoStar d-flex pr-3">
                        <i class="fas fa-star mr-1"></i>
                        <div class="font-size-11">${myPickUpso.star_avg}</div>
                    </div>
                    <div class="myUpsoRCount d-flex">
                        <i class="fas fa-pen mr-1"></i>
                        <div class="font-size-11">${myPickUpso.cont_sum}</div>
                    </div>
                    <div class="myUpsoBtn" onclick="getUpsoDetail('${myPickUpso.id}')">클릭!</div>
                  </div>
              </div>
          </div>
        </c:forEach>
        </div>
      </div>
    </div>
  </div>  	
</body>
<script type="text/javascript">
function submitKeyword(){
	if(event.keyCode == 13) {
		let keyword = event.target.value;
		if(!keyword)
			return;
		location.href = "/yummymap/main/getList.mmy?keyword="+keyword;
	}
}
function submitKeyword_click(){
	let keyword = document.getElementById('search').value;
	location.href = "/yummymap/main/getList.mmy?keyword="+keyword;
}
function getDetail(data){
	location.href = "/yummymap/main/getDetail.mmy?id="+data;
}
function groupByCategory(data) {
	document.getElementById('categoryDataForm_category').value = data;
	document.getElementById('categoryDataForm').submit();
}
function listSort(data) {
	document.getElementById('order_standard').value = data;
	document.getElementById('sortForm').submit();
}
function showModal() {
	let user_id = '${SID}';
	if(!user_id) {
		alert('로그인 후 이용해주세요');
		return;
	}
    if (!$(".modal.in").length) {
         $(".modal-dialog").css({
           top: 100,
           left: 0,
         });
       }
   $('#myUpsoModal').modal();
   
}
</script>
</html>