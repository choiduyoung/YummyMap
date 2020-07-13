<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" href="/yummymap/css/member/user.css">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/main/nav.css" />
<link rel="stylesheet" href="/yummymap/css/member/member.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript"src="/yummymap/js/bootstrap.bundle.min.js"></script>
<style>
</style>
<script type="text/javascript">
$(document).ready(function() {
		  let userid = '${sid}';
		  if(!userid) {
			  $('#login').show();
			  $('#logout').hide();
			  $('#mypage').attr('href', '/yummymap/join/join.mmy');
		  } else {
			  $('#login').hide();
			  $('#logout').show();
			  $('#mypage').attr('href', '/yummymap/member/member.mmy');
		  }
		
		$('#ebtn').click(function() {
			$('#ee').css('display', 'none');
		});
		$('#ebtn').click(function() {
			$('#ff').css('display', '');
		});
		
		$('#mlink').click(function(){
			$("#staticBackdrop").modal();
		});
		
		$('#dbtn').click(function(){
				$('#mid').val(mid);
				$('#frm').attr('action' , '/yummymap/member/memberDel.mmy');
				$('#frm').submit();
		});
	$('#pwchange').click(function(){
		var url = "/yummymap/member/pwchange.mmy";
		window.open(url,"/yummymap/member/pwchange.mmy","width=500,height=400");
	});
	$('#emailChangeView').click(function(){
		let url = "/yummymap/member/emailChangeView.mmy";
		window.open(url,"/yummymap/member/emailChangeView.mmy","width=550,height=400");
	});
});
</script>
</head>
<body>
	<!-- nav 영역입니다-->
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
<div class="row nav-text ">
	    <div class="col-sm mt-4">
			<a href="/yummymap/member/activity.mmy">
				<h6 style="color: black" class="">활동 현황</h6>
			</a>
	    </div>
	    <div class="col-sm mt-4">
			<a href="/yummymap/member/member.mmy">
				<h6 style="color: black" class="">정보 변경</h6>
			</a>
	    </div>
	<div class="col-sm">
		<div class="mt-4">
			<a href="/yummymap/member/text.mmy">
				<h6 style="color: black" class="">내가 쓴글</h6>
			</a>
		</div>
    </div>
	<div class="col-sm">
		<div class="mt-4">
			<h6 style="color: black" type="button" class="text-danger" data-toggle="modal" id="mlink">회원탈퇴</h6>
		<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog" >
				<div class="modal-content">
						<div class="modal-header">
								<h5 class="modal-title">회원탈퇴 </h5>
							<button type="button" class="close" data-dismiss="modal"aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p><h4 class="text-center">정말로 탈퇴 하시겠습니까?</h4></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="dbtn">예</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
    </div>
    <!-- nav 마지막 입니다-->

	<!-- body 시작 입니다-->
	<form method="post" id="frm">
		<input type="hidden" name="mno" id="mno" value="${UserInfo.mno}">
		<input type="hidden" name="mname" id="mname" value="${UserInfo.mname}">
		<input type="hidden" name="mid" id="mid" value="0">
		<input type="hidden" name="mtel" id="mtel" value="${UserInfo.mtel}">
		<input type="hidden" name="meMail" id="meMail" value="${UserInfo.memail}">               	
	</form>
	<div class="container" style="padding-top: 100px;">	
			<div class="col text-center">
				<div class="mt-5 pt-5">
					<h3>회원정보 변경</h3>
				</div>
				<div class="  margin-lift ml-4">
					<div class=" mt-4 border-top">
  						<div class="row ">
    						<div class="col-4 h90 border-right">
					     		<h4 class="pa1">사용자 아이디 :</h4>
					    	</div>
					    	<div class="col-4 h90 pot">
					     		<h5 class="po2 wid">${UserInfo.mid}</h5>
					    	</div>
					  	</div>
					</div>
					<div class=" border-top ">
  						<div class="row ">
    						<div class="col-4 h90 border-right">
					     		<h4 class="pa">연락처 :</h4>
					    	</div>
					
  <div class="row">
    <div class="col h90 ">
      <h5><span class="pl-5 d-flex align-items-center mt-3">휴대전화 :</span></h5>
      <h5><span class="pl-5 d-flex align-items-center">이메일 :</span></h5>
    </div>
    <div class="col mt-3">
     <h5> <span class="pol">${UserInfo.mtel}</span><br></h5>
     <h5 style="white-space: nowrap;"> <span>${UserInfo.memail}</span>
     <span class=""><button type="button" id="emailChangeView" name="emailChangeView">변경</button></span></h5>
    </div>
					     	 	
					    	</div>
					  	</div>
					</div>
					<div class=" border-top ">
  						<div class="row ">
    						<div class="col-4 h90 border-right">
					  			<h4 class="pa">이름 :</h4>
					    	</div>
					    	<div class="col-4 h90 pot ">
								<h5 class="mt-2 wna">${UserInfo.mname}</h5>
					    	</div>
					  	</div>
					</div>
					<div class="border-top ">
  						<div class="row ">
    						<div class="col-4 h90 border-right border-bottom">
					  			<h5 class="pa ">비밀번호 :</h5>
					    	</div>
					    	<div class="col h90  border-bottom">
								<h5 class="mt-3"><span class= "pl-2 po3 mt-3">비밀번호 수정시 변경버튼 클릭</span>
								<span class="pl-3 po3">
								<button type="button" id="pwchange" name="pwchange">변경</button></span></h5>
					    	</div>
					  	</div>
					</div>
				</div>
			</div>
		</div>
	<!-- body 마지막 입니다-->
</body>
</html>