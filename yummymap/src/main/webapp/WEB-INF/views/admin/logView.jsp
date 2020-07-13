<!-- 
@author 유태희
@since 2020.05.23
 	이 페이지는 관리자 게시글 관리 페이지 입니다
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<link rel="stylesheet" href="/yummymap/css/admin/base.css">
<link rel="stylesheet" href="/yummymap/css/admin/logView.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/yummymap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/yummymap/js/admin/logView.js"></script>
<title>게시글 관리 페이지</title>
</head>

<body>
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
	<div class="mt-1 mb5" style="padding-top: 200px;">
			<div class="col-9 d-flex flex-column bd-highlight m-auto" style="height: 500px; width: 1100px;">
				<h3 class="text-center ml-4 mb-5">로그 페이지</h3>
				<form action="/yummymap/admin/logView.mmy" method="post" id="frm" class="mb-3">
					<select class="p-2 text-center" name="logName" id="logName">
						<c:forEach var="opt" items="${OPT}">
<%-- 							<c:if test="${ }"> --%>
<%-- 								<option value="${opt}" selected >${opt}</option> --%>
<%-- 							 </c:if> --%>
							
							<c:if test="${LOGNAME eq opt or empty LOGNAME}">
								<option  value="${opt}" selected >${opt}</option>
							</c:if>
							<c:if test="${LOGNAME ne opt and not empty LOGNAME}">
								<option  value="${opt}" >${opt}</option>
							</c:if>
						</c:forEach>
					</select>
				</form>
				<div class="Regular shadow mx-auto p-5 text-center" style="overflow:auto; width:1100px;">
					<c:if test="${empty LOG }"> 
						<h3>로그가 없습니다</h3>
					</c:if>
					<c:if test="${not empty LOG }"> 
						${LOG}
					</c:if>
					
				</div>
			</div>
	</div>

		</div>
	</div>
	
	<div class="modal fade" id="staticBackdrop" style="margin-top: 180px;" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-danger" id="rmbtn">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

</body>

</html>