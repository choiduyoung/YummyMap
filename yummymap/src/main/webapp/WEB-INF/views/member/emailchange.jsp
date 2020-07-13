<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YummyMap</title>
    <link rel="stylesheet" href="/yummymap/css/main/mainList.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/yummymap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/yummymap/css/member/pwchange.css">
     <link rel="stylesheet" href="/yummymap/css/main/nav.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<meta>
<title>이메일 변경</title>
<style>
body{overflow-x:hidden}
.none{style="display: none;"}
.po{    position: relative;
    	right: 50px;
    	top: 8px;}
.pl{padding-left: 51px;}
.p12{
position: relative;
    left: 91px;}
.por{position: relative;
    right: 4px;}
</style>
<script type="text/javascript">

$(document).ready(function() {
	let injeungmail;
	let mailcode=false;
	//이메일 인증 처리 ajax
	$('#get_injeung').click(function(){
		let changeMail = $('#memail').val();
		if(!changeMail){
			alert('메일을 입력해주세요');
			return;
		}
		$('#set_injeung').css('display', '')
		$('#get_injeung').css('display', 'none')
		var mail = $('#memail').val();
		$.ajax({
			url : '/yummymap/member/mailformProc.mmy',
			type : 'post',
			dataType: 'json',
			data: {
				'email' : mail
			},
			success: function(data){
				injeungmail = data;
			},
			error: function(){
				alert('###통신에러###');
			}
		});
	});
	//인증번호 체크
	$('#injeung_CK').click(function(){
		let mailCk = $('#mailOk').val();
		if(mailCk == injeungmail){
			$('#msg').removeClass('text-danger');
			$('#msg').css('color','blue');
			$('#msg').html('메일 인증이 완료 되었습니다!');
			$('#sbtn_view').css('display', '');
			mailcode = true;
		}else{
			$('#msg').html('인증번호 불일치 다시 입력해주세요!');
		}
	});
	$('#sbtn').click(function(){
		$('#frm').submit();
		window.close();
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
            
        </div>
  <div class="main-body por text-right mt-5">
		<div class="container ">
				<div class="container pl">
				  <div class="row">
				    <div class="col">
				 <form method="post" action="/yummymap/member/emailChangeProc.mmy"id="frm">
      					<div class="col d-flex justify-content-center mt-2">
							<input style="width: 240px; height: 38.67px;" type="text" id="memail" name="memail"  placeholder="변경할 이메일">
						</div>
					</div>
					<div class="col">
					      	<span class="pl-2 po" ><button type="button" class="btn btn-secondary" id="get_injeung">인증번호받기</button></span>
					</div>
				 </div>
					</div>
					<div style="display: none;" id="set_injeung">
					<div class=" d-flex justify-content-center mt-2">
						<input class="por" style="width: 240px;" type="text" id="mailOk" name="mailOk" placeholder="인증번호">
						<span class="pl-2" ><button type="button" class="btn btn-secondary" id="injeung_CK" name="injeung_CK">인증번호확인</button></span>
					</div>
						<small id="msg" class="text-danger d-flex justify-content-center" >이메일 인증을 진행해주세요</small>
					</div>
				 </form>
				<div style="display: none;" id="sbtn_view">
				<div class="container d-flex justify-content-around mt-3">
					<button type="button" class="btn btn-outline-success p12" id="sbtn">저장</button>
				</div>
				</div>
			</div>
		</div>
</body>
</html>