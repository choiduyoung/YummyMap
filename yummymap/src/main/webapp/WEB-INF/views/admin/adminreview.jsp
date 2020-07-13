<!-- 
@author 유태희
@since 2020.05.23
 	이 페이지는 관리자 수정 페이지 입니다
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" href="/yummymap/css/main/nav.css">
	<link rel="stylesheet" href="/yummymap/css/admin/base.css">
	<link rel="stylesheet" href="/yummymap/css/admin/adminre.css">
	<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/yummymap/js/admin/adminedit.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/rsa.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/jsbn.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/prng4.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/rng.js"></script>
	<title>관리자 수정 페이지</title>
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
	<div class="container mt-1 mb-5" style="padding-top: 200px;">
			<div class="col-8 text-center m-auto Regular shadow"">
				<h3 class="mt-4 pt-3">관리자 정보 변경</h3>
				<div class="container" style="max-width: 550px;">
					<div class="mt-5 row ">
						<h5 class="col-3 ml-1 mr-5 ">아이디 </h5>
						<span class="border-b col-6 ml-1 pb-2 id-span">${MVO.mid }</span>
					</div>

					<form action="" method="POST" id="frm">
						<input type="hidden" id="RSAModulus" name="RSAModulus" value="${RSAModulus}"/>
       					<input type="hidden" id="RSAExponent" name="RSAExponent" value="${RSAExponent}"/> 
						<input type="hidden" name="nowPage" id="nowPage" value="${param.nowpage}">
						<input type="hidden" name="mid"  value="${MVO.mid}">
						<div class="mt-4 row ml-1">
							<h5 class="in-bl text-left ml-2 col-3 mt-1">이름</h5>
							<input class="col-6 form-control border-b margin-name text-center"  type="text" id="name" name="mname" value="${MVO.mname }">
						</div>
						<div class="mt-3 text-left ml-4" style="font-size: 14px;" id="namehint"></div>
						<div class="mt-4 row ml-1">
							<h5 class="in-bl col-3  mt-1">비밀번호 </h5>
							<input type="password" class="col-6 form-control border-b margin-pw text-center" id="pw" name="mpw">
						</div>
						<div class="mt-3" style="font-size: 14px;" id="pwhint"></div>
						<div class="mt-4  row ml-1">
							<h5 class="in-bl col-4 mt-1">비밀번호 확인 </h5>
							<input type="password" class="col-6 form-control border-b text-center" id="pwck">
						</div>
						<div class="mt-3  text-left ml-4" style="font-size: 14px;" id="pwok"></div>
						<div class="mt-4 row ml-1">
							<h5 class="in-bl col-3 mt-1  text-left ml-2">연락처 </h5>
							<input type="text" class="col-6 form-control border-b margin-tel text-center" id="tel" name="mtel" value="${MVO.mtel }">
						</div>
						<div class="mt-4 row ml-1">
							<h5 class="in-bl col-3 mt-1  text-left ml-2">이메일 </h5>
							<input type="text" class="col-3 form-control border-b margin-mail text-center" id="mail" name="email" value="${MVO.email }">
							<span class="mt-2">@</span><input type="text" class="col-3 form-control border-b text-center" id="domain"
								name="domain" value="${MVO.domain}">

							<select class="col-3 form-control border-b  mt-1 margin-domain" id="mailSelect">
								<option value="">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
						</div>
					</form>
				</div>
				<div class="mt-5 pb-3">
					<button type="button" class="btn btn-outline-primary px-5" id="okbtn">수정</button>
					<button type="button" class="btn btn-outline-danger px-5 ml-2" id="cbtn">취소</button>
				</div>
			</div>
		</div>
	</div>

<div class="modal fade" id="staticBackdrop"  style="margin-top: 180px;" stdata-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">알림창</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</body>

</html>