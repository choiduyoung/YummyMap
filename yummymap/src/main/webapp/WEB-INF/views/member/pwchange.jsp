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
    <link rel="stylesheet" href="/yummymap/css/main/nav.css" />
    <link rel="stylesheet" href="/yummymap/css/member/pwchange.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<meta>
<title>비밀번호 변경</title>
<style>
body{overflow-x:hidden}
.mxw{
	white:300px;
}
</style>
<script type="text/javascript">
function pwchk(pw) {
    let patt = /(?=.*\d{1})(?=.*[~`!@#$%\^&*()-+=]{1})(?=.*[a-zA-Z]{2}).{8,15}$/;
    let pwok = patt.test(pw);
    return pwok;
   }
$(document).ready(function() {
	      //패스워드 정규식
	 $('#sbtn').click(function() {
        let pw = $('#mpw').val();
        let pwck = pwchk(pw);
        
        if(!pwck){
          alert('숫자/특수문자/영문 대/소문자 1자리이상 포함한 8자리이상 15자리 이하입니다');
          return;
        } 
        
        if ($('#mpw').val() != $('#ckPwd').val()) {
				alert('비밀번호 확인이 일치하지 않습니다.');
				return;
			}
			$('#frm').submit();
			alert('정상적으로 변경되었습니다.');
			window.close();
	 });
	$('#ckPwd').keyup(function(){
		let pw = $('#mpw').val();
		let pwck = $('#ckPwd').val();
		
		if(pw == pwck){
			alert
			$('#pwok').css('color','blue');
			$('#pwok').text('*비밀번호가 동일합니다.');
		}else{
			$('#pwok').css('color','red');
			$('#pwok').text('*비밀번호가 일치하지 않습니다.');
			}
		});
		$('#cbtn').click(function(){
			window.close();
		});
	});
</script>
</head>
<body>
  <div class="topNav border-bottom pl-4 pt-1 shadow-sm" id="topNav">
        <div class="d-flex m-0">
            <div class="topNavLogo">
                <a href="">YUMMY MAP</a>
            </div>
            
        </div>
  <div class="main-body por text-right mt-5">
		<div class="container" style="width: 400px;">
				<form method="post" action="/yummymap/member/pwEdit.mmy"id="frm">
				<div class="col d-flex justify-content-center mt-2">
					<input style="width: 240px;" type="password" id="mpw" name="mpw"placeholder="변경비밀번호">
				</div>
				<div class=" d-flex justify-content-center mt-2">
					<input style="width: 240px;" type="password" id="ckPwd" name="ckPwd" placeholder="확인비밀번호">
				</div>
				<div class="mt-3  text-center ml-4" style="font-size: 14px;" id="pwok"></div>
				</form>
				<div class="container d-flex justify-content-around mt-3">
					<button type="button" class="btn btn-outline-success" id="sbtn">저장</button>
					<button type="button" class="btn btn-outline-danger" id="cbtn">취소</button>
				</div>
			</div>
		</div>
	<div class="mt-3 container">
		비밀번호 변경 팁!!!<br>
		숫자/특수문자/영문 대/소문자 1자리이상 포함한 8자리이상 15자리
		쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같을 경우 도용되기 <br>쉬워 주기적으로변경하여 사용하는 것이 좋습니다
		비밀번호에 특수문자를 추가하여 사용하시면<br> 비밀번호 안전도가 높아져 도용의 위험이 줄어듭니다
	</div>
</body>
</html>