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
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<meta>
<title>내 활동 내역</title>
<style>
    .nav-text{
    width: 400px;
  }
</style>
</head>
<body>
<!-- nav영역 -->
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
<!-- nav 영역 마지막 -->
<form method="post" id="frm">
		<input type="hidden" name="mid" id="mid" value="mid">
</form>
<div class="container" style="padding-top: 100px;">
		<div class="col sub ml-1 text-center" style="margin: auto;"> 
				<h3 class="mt-4 text-center ml-4">활동 현황</h3>
				<div class="mt-5">
					<div id="activity" class=" box ml-2 Regular shadow p-5" style="display: inline-block;"></div>
					<div id="cateactivity" class=" box ml-2 Regular shadow p-5" style="display: inline-block;"></div>
				</div>

		</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$('#mlink').click(function(){
		$("#staticBackdrop").modal();
	});
	$('#dbtn').click(function(){
		$('#mid').val(mid);
		$('#frm').attr('action' , '/yummymap/member/memberDel.mmy');
		$('#frm').submit();
	});
});
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawStuff);
	
	function drawStuff() {
	  let data = new google.visualization.arrayToDataTable([
		  	['', ''],
		    ["게시글 수", ${CNT.txtcnt}],
		    ["리뷰 수", ${CNT.recnt}]
	]);
	
    var options = {
            title: "Total",
            textStyle: {
 	           color: '333333',
 	           fontName: 'Arial',
 	           fontSize: 24         },
            width: 600,
            height: 100,
            legend: { position: "none" },
            bars: 'horizontal',
            bar: {groupWidth: "90%"}
          }
          let chart = new google.visualization.BarChart(document.getElementById('activity'));
          chart.draw(data, options);
      };
      
    google.charts.load('current', {'packages':['corechart']});
  	google.charts.setOnLoadCallback(drawChart);
  	function drawChart() {
	  	var data = google.visualization.arrayToDataTable([
	          ['', ''],
	         <c:forEach items="${LIST}" var="cate">
	          ['${cate.category}', ${cate.cnt}],
	       	 </c:forEach>
	       ]);
    var options = {
            title: "board",
            textStyle: {
 	           color: '333333',
 	           fontName: 'Arial',
 	           fontSize: 24         },
            width: 600,
            height: 300,
            legend: { position: "none" },
            bars: 'horizontal',
            bar: {groupWidth: "90%"}
          }
          let chart = new google.visualization.ColumnChart(document.getElementById('cateactivity'));
          chart.draw(data, options);
      };
</script>
</html>