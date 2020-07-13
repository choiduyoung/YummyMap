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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<link rel="stylesheet" href="/yummymap/css/admin/base.css">
<link rel="stylesheet" href="/yummymap/css/admin/main.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/yummymap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>메인 페이지</title>
</head>

<style>
	.box text{
		font-size: 12px !important;
	}
	 
</style>

<body>

<div class="topNav border-bottom">
        <div class="d-flex">
            <div class="topNavLogo pl-4 pt-2">
                <a href="./main.mmy">YUMMY MAP</a>
                <h6 class="ml-5 mt-3" style="color: black; font-weight: bold;">ADMIN PAGE</h6>
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
	<div class=" mt-1 mb5 text-center " style="padding-top: 150px;">
		<div class="col sub ml-1" style="margin: auto;"> 
				<h3 class="mt-4 text-center ml-4">Yummy Map 현황표</h3>
				<div class="mt-5">
					<div id="piechart_3d" class=" text-center Regular shadow"  style="display: inline-block; height: 400px;"></div>
					<div id="top_x_div" class=" box ml-2 Regular shadow p-5" style="display: inline-block;"></div>
				</div>
				<div class="d-flex justify-content-center mt-5 mb-4">
					<div id="curve_chart" class="Regular shadow p-3"></div>
				</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawStuff);
	
	function drawStuff() {
	  let data = new google.visualization.arrayToDataTable([
	    ['', ''],
	    ["게시글 수", ${CNT.txtcnt}],
	    ["회원 수", ${CNT.memcnt}],
	    ["악성 회원", ${CNT.isuemem}],
	    ['Other', 0]
	  ]);
	
	  var options = {
	    title: 'Chess opening moves',
	    textStyle: {
	           color: '333333',
	           fontName: 'Arial',
	           fontSize: 24         },
	    width: 560,
	    height:300,
	    legend: { position: 'none' },
	    bars: 'horizontal', // Required for Material Bar Charts.
	    bar: { groupWidth: "90%" }
	  };
	
	  let chart = new google.charts.Bar(document.getElementById('top_x_div'));
	  chart.draw(data, options);
	};
	
	
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        <c:forEach items="${LIST}" var="cate">
        	['${cate.category}',  ${cate.cnt}],
        </c:forEach>
      ]);

      var options = {
        is3D: true,
        width: 660,
        height : 400
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    };
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Day');
        data.addColumn('number', '접속자 수');

        data.addRows([
        <c:forEach items="${CLIENTLIST}" var="list">
        	['${list.days}', ${list.cnt}],
        </c:forEach>

          
        ]);

        var options = {
          chart: {
            title: '${MON}월 접속자 수',
          },
          width: 1300,
          height: 400
        };

      var chart = new google.charts.Line(document.getElementById('curve_chart'));

      chart.draw(data, google.charts.Line.convertOptions(options));
//       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

//       chart.draw(data, options);
    }
	</script>
</html>	