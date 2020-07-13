<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>YUMMY MAP COUMMUNITY</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/txt/list.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/yummymap/js/txt/list.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<form method="post" id="frm">
		<input type="hidden" name="nowPage" id="nowPage"> 
		<input type="hidden" name="txtno" id="txtno" value="${data.txtno}">
		<input type="hidden" name="mtxt" id="mtxt" value="${data.mtxt}">
		<input type="hidden" id="mid" name="mid" value="show">
	</form>

   <div class="topNav border-bottom pl-4 pt-1 shadow-sm" id="topNav">
        <div class="d-flex m-0">
            <div class="topNavLogo">
                <a href="">YUMMY MAP</a>
            </div>
            <ul class="topNavItem d-flex justify-content-end pr-4 pt-1">
                <li><a class="topNavItem-icon" href=""><i class="far fa-heart"></i></a></li>
                <li><a class="topNavItem-icon" href=""><i class="fas fa-user"></i></a></li>
                <c:if test="${SID == null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/login.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${SID != null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/logoutProc.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
        </div>
    </div>
    <div class="container" style="padding-top: 100px;">
        <!--본문작성-->


	<!-- body 시작 입니다. -->
	<div class="main-body">
		<div class="writebox d-flex">
			<div class="writeBtnBox">
				<button type="button" class="btn btn-outline-light text-dark" id="write">WRITE</button>
			</div>
		</div>
		<!--게시글 영역 입니다-->
		<div class="txt-line shadow-sm border mt-2 mb-4">
			<!-- 게시글 1개 시작 부분입니다-->
			<c:forEach var="data" items="${LIST}">
				<div class="txt-body d-flex border-bottom" id="${data.txtno}">
					<div class="txt-no text-center">
						<div class="pt-4" id="ttxtno">${data.txtno}</div>
					</div>
						<img src="../img/txtimg/${data.savename}" class="txtimg">
					<div class="txt-title">
						<div class="pt-4 bold-font">${data.title}</div>
						<div class="d-flex pt-2">
							<div class="txt-title-info pr-4 border-right">${data.cdate}</div>
							<div class="txt-title-info pl-4 pr-4 border-right">${data.mid}</div>
							<div class="txt-title-info pl-4 pr-4 border-right">${data.category}</div>
							<div class="txt-title-info pl-4 pr-4 border-right d-flex">
								<p>조회</p>
								<p class="pl-2">${data.count}</p>
							</div>
							<div class="txt-title-info pl-4 pr-4 border-right d-flex">
								<p>추천</p>
								
								<p class="pl-2" id="rnum">${data.rnum}</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 게시글 1개 마지막 부분입니다-->
		</div>
		<!-- 페이징 부분입니다-->
		<div class="pager d-flex justify-content-center paging">
			<div class="mb-5">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${PAGE.startPage lt (PAGE.pageGroup + 1)}">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="pageNo" begin="${PAGE.startPage}"
							end="${PAGE.endPage}">
							<li class="page-item"><a class="page-link pbtn"  href="#">${pageNo}</a></li>
						</c:forEach>
						<c:if test="${PAGE.endPage eq PAGE.totalPage}">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>

					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 마지막 부분입니다-->
	</div>
</div>
	<!-- body 마지막 입니다-->
</body>
<script type="text/javascript">
</script>
</html>
