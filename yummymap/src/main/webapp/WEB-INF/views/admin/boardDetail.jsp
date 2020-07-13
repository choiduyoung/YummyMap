<!-- 
@author 유태희
@since 2020.05.24
 	이 페이지는 관리자 게시글 상세보기 페이지입니다
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="/yummymap/css/admin/base.css">
<link rel="stylesheet" href="/yummymap/css/admin/adminboardDetail.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript"src="/yummymap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"src="/yummymap/js/admin/detail.js"></script>
<title>게시글 상세 페이지</title>
</head>

<body>
	<form method="post" action="" id="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage }">
		<input type="hidden" name="mid"	id="mid" value="${param.mid }">
		<input type="hidden" name="title"	id="title" value="${param.title }">
		<input type="hidden" name="opts" id="opts" value="${param.opts }"> 
		<input type="hidden" name="txtno" id="txtno" value="${param.txtno }">
	</form>
	<div class="topNav border-bottom">
        <div class="d-flex">
            <div class="topNavLogo pl-4 pt-2">
                <a href="./main.mmy">YUMMY MAP</a>
                <h5 class="ml-5 mt-3" style="color: black;">ADMIN PAGE</h5>
            </div>
            <div class="d-flex align-items-end flex-column w-100 col">
            <ul class="topNavItem d-flex justify-content-end pr-4 pt-2">
                <li><a class="topNavItem-icon" href="/yummymap/admin/adminEdit.mmy"><i class="fas fa-user"></i></a></li>
                <c:if test="${ADMINSID == null}">
                <li><a class="topNavItem-icon" href="/yummymap/admin/loginView.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${ADMINSID != null}">
                <li><a class="topNavItem-icon" href="/yummymap/admin/logoutProc.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
                <div class="col-3 pr-4 d-flex justify-content-around">
					<div class="mt-4">
						<a href="./main.mmy">
							<h6>메인 화면</h6>
						</a>
					</div>
					<div class=" mt-4">
						<a href="./member.mmy">
							<h6>회원 관리</h6>
						</a>
					</div>
					<div class="mt-4 ">
						<a href="./boardList.mmy">
							<h6>게시글 관리</h6>
						</a>
					</div>
					<div class="mt-4 ">
						<a href="./logView.mmy">
							<h6>로그 보기</h6>
						</a>
					</div>
				</div>
            </div>
        </div>
      </div>
	<div class="mt-1 mb5" style="padding-top: 150px;">
			<div class="col-9 d-flex flex-column bd-highlight m-auto" style="height: 575px;">
				<div class="txt-line Regular shadow m-auto" style="width: 800px;">
				<h3 class="mt-4 text-center ml-4">게시글 상세보기</h3>
					<div class="btns d-flex justify-content-end pr-4 mt-2">
						<a class="badge badge-info text-white mr-2 p-2" id="lbtn">뒤로가기</a>
						<a class="badge badge-danger text-white p-2" id="delete">삭제</a>
					</div>
					<div class="b-w border-bottom ml-5 mt-4"></div>
					<div class="d-flex title">
						<div class="txt-title pt-4" id="">제목 : ${BVO.title }</div>
						<div class="pt-4 d-flex">
						</div>
					</div>
					<div class="b-w border-bottom ml-5 mt-4"></div>
					<div class="txt-body pt-4 mtxt-box" id="txt" >${BVO.mtxt }</div>
				</div>
			</div>
	</div>
	</div>

	<div class="modal fade" style="margin-top: 180px;" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1" role="dialog"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					해당 글을 정말 삭제 하겠습니까? 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="rmbtn">확인</button>
				</div>
			</div>
		</div>
	</div>

</body>

</html>