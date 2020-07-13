<!-- 
@author 유태희
@since 2020.06.11
 	이페이지는 상점 추가 등록 하기 위한 페이지
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="/yummymap/css/admin/base.css">
	<link rel="stylesheet" href="/yummymap/css/admin/shop.css">
	<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- 	<script type="text/javascript" src="/yummymap/js/admin/shop.js"></script> -->
	<title>상점 등록 페이지</title>
</head>

<body>
	<div class="topNav border-bottom">
	        <div class="topNavLogo">
	            <a href="">로고!!!</a>
	</div>
	<div class=" mb-5" style="margin-top:120px;">
			<div class="col-8  ml-5  mb-5">
				<div style="width: 600px;" class="container">
					<form class="mt-5" action="#" method="post" id="frm">
						<h5 class="">식당 이름 : <input class="p-1" id="resName" name="resName" placeholder="식당이름 입력"></h5>
						<h5 class="text-left mt-3" style="">주소 등록 : </h5>
						<div class="mt-1">
							<input class="p-1" style="margin-left: 100px; width: 110px;" type="text" id="sample6_postcode"
								placeholder="우편번호">
							<input class="p-1 mt-1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input class="p-1 mt-1" type="text" style="margin-left: 100px; width: 225px;" id="sample6_address"
								placeholder="주소"><br>
							<input class="p-1 mt-1" style="margin-left: 100px; width: 130px;" type="text" id="sample6_detailAddress"
								placeholder="상세주소">
							<input class="p-1 mt-1" type="text" style="width: 90px;" id="sample6_extraAddress" placeholder="참고항목">
						</div>
					</form>
				</div>
			</div>
			<div class="mt-5 ml-5 pl-5">
				<button type="button" class="btn btn-yummy ml-5 px-5" id="okbtn">찾기</button>
				<button type="button" class="btn btn-outline-danger px-5 ml-2" id="cbtn">취소</button>
			</div>
		</div>
	</div>

</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	}
</script>

</html>