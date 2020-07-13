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
<link rel="stylesheet" href="/yummymap/css/txt/write.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/yummymap/js/txt/write.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<style>
</style>

</head>
<body>
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

	<!-- body 시작 입니다-->
	<div class="main-body">
		<div class="txt-line mb-4">
			<form action="/yummymap/txt/writeProc.mmy" method="POST" id="frm">
				<input type="hidden" id="mid" name="mid" value="${SID}">
				<div class="form-group d-flex">

					<select name="catno" id="catno">
						<option value="" selected=selected>카테고리</option>
						<option value="1" id="w3-button cat-item">한식</option>
						<option value="2" id="w3-button cat-item">중식</option>
						<option value="3" id="w3-button cat-item">일식</option>
						<option value="4" id="w3-button cat-item">경양식</option>
						<option value="5" id="w3-button cat-item">분식</option>
						<option value="6" id="w3-button cat-item">태국요리</option>
						<option value="7" id="w3-button cat-item">베트남요리</option>
						<option value="8" id="w3-button cat-item">인도요리</option>
						<option value="9" id="w3-button cat-item">야식</option>
					</select> 
					 <input type="text" class="form-control ml-1" id="title" name="title" placeholder="제목 (촤대 20글자)">
				</div>
				 <input type="file" id="file" name="file">
				<div class="form-group mt-2">
					<textarea class="form-control" id="mtxt" rows="15" name="mtxt"	style="resize: none;"></textarea>
				</div>
				<button type="button" class="btn btn-primary btn-sm" id="submitBtn">완료</button>
				<button type="button" class="btn btn-secondary btn-sm" id="exitBtn">취소</button>
			</form>
		</div>
	</div>
	</div>
	<!-- body 마지막 입니다-->
</body>
</html>
