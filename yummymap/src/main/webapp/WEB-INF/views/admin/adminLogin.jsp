
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/yummymap/css/admin/base.css">
	<link rel="stylesheet" href="/yummymap/css/admin/login.css">
	<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
	<script type="text/javascript" src="/yummymap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/rsa.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/jsbn.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/prng4.js"></script>
	<script type="text/javascript" src="/yummymap/js/RSA/rng.js"></script>
	<script type="text/javascript">

	</script>
	<script type="text/javascript" src="/yummymap/js/admin/login.js"></script>
	<title>관리자 로그인 페이지</title>

</head>


<body onload="noBack();">
	<div class="container  mt80" style="width: 900px;">
		<nav class="d-flex justify-content-between navbar navbar-light ">
			<div>
				<a class="navbar-brand tcolor logo mt-5" href="./login.mmy">
					YUMMY MAP
				</a>
			</div>
			<h2 class="mt-5 tcolor">Admin Login</h2>
		</nav>

		<div class="bar"></div>

		<div class="container mb-4 " style="max-width: 450px;">
		 <form method="post" action="/yummymap/admin/loginProc.mmy" id="frm">
	        <input type="hidden" id="RSAModulus" name="RSAModulus" value="${RSAModulus}"/>
       		<input type="hidden" id="RSAExponent" name="RSAExponent" value="${RSAExponent}"/> 
       		<input type="hidden" id="mid" name="mid" /> 
       		<input type="hidden" id="mpw" name="mpw" /> 
       		
			<div class="input-group mb-3 mt100">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default">I &nbspD&nbsp</span>
				</div>
				<input type="text" class="form-control" aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-default" id="id" name="id" autofocus="autofocus" />
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-default">P W</span>
				</div>
				<input type="password" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="pw" name="pw" autocomplete="on"/>
			</div>
			<c:if test="${param.noad eq 'b'}">
			<div class="text-danger" id="idck"> *일치하는 관리자가 없습니다</div>
			</c:if>
			</form>
			<div class="d-flex justify-content-end mb-5">
<!-- 				<div class="mt-3"><a class="text-right" id="sbtn">관리자 정보 찾기</a></div> -->
				<button type="button" class="btn btn-primary" id="join">로그인</button>
			</div>
		</div>
		<div class="bar"></div>
	</div>


<!-- <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="staticBackdropLabel">관리자 정보 찾기</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body text-center"> -->
<!--       <form action="/yummymap/admin/mailProc.mmy" method="post" id="frm2" > -->
<!--         <div> 관리자 이름 : <input type="txet" id="name" name="name"></div> -->
<!--         <div class="mt-3"> 관리자 메일 : <input type="txet"  id="mail" name="mail"></div> -->
<!--        </form> -->
<!--         </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button> -->
<!--         <button type="button" class="btn btn-danger" id="sendbtn">발송</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->

</body>

</html>