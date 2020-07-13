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
<link rel="stylesheet" href="/yummymap/css/txt/detail.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script type="text/javascript" src="/yummymap/js/txt/detail.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

/* function rList(){
	$.ajax({
		url: "/yummymap/txt/rList.mmy?txtno=${LIST.txtno}",
		type: 'get',
		dataType: 'json',
		data: {
			'txtno' : txtno
		},
			success: function(result){
				console.log(result);
				var output = "<table>";
				for(var i in result);
				output += "<tr>";
				output += "<td>"+result[i].mid;
				output += "<br>"+result[i].sdate+"<br>";
				output += result[i].mtxt+"</td>";
				output += "</tr>";
			};
			output += "</table>" ;
			$("#listReply").html(result);
			}
	});
} */

</script>
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
	<form class="d-none" method="post" action="" id="frm">
		<input type="hidden" name="txtno" id="txtno" value="${DATA.txtno}">
		<input type="hidden" name="title" id="title" value="${DATA.title}"> 
		<input type="hidden" name="mtxt" id="mtxt" value="${DATA.mtxt}">
		<input type="hidden" id="mid" name="mid" value="${DATA.mid}">
		<input type="hidden" id="catno" name="catno" value="${DATA.catno}">
		<input	type="hidden" name="nowPage" id="nowPage" value="${nowPage}">
		<input type="hidden" name="isrec" id="isrec">
	</form>
	<form class="rec" method="post" action="" id="frm2">
		<input type="hidden" name="mid" id="mid">
		<input type="hidden" name="txtno" id="txtno">
	</form>
	<div class="main-body">
		<!--게시글 영역 입니다-->
		<div class="txt-line shadow-sm border mb-4">
			<div class="btns d-flex justify-content-end pr-4 mt-2">
			<c:if test="${SID == DATA.mid}">
				<a class="btn btn-sm btn-outline-light mr-1 text-grey" id="update">수정</a> 
				<a class="btn btn-sm btn-outline-light text-grey" id="delete">삭제</a>
			</c:if> 
			</div>
			<div class="b-w border-bottom ml-5 mt-4"></div>
			<div class="d-flex title">
				<div class="txt-title pt-4" id="title">${DATA.title}</div>
				<div class="pt-4 d-flex">
					<form id="like" method="post" action="">
						<div class="list-item-like">
						<c:choose>
							<c:when test="${SID eq show}">
								<a href='javascript: like();'>
								<img src="../img/txtimg/rice.png" class="dislikebtn" id="dislikebtn" aria-hidden="true" ></a>
							</c:when>
							<c:otherwise>
								<a href='javascript: like();'>
								<img src="../img/txtimg/norice.png" class="likebtn" id="likebtn" aria-hidden="true" ></a>
							</c:otherwise>
						<%-- 	<c:otherwise>
								<a href='javascript: login();'>
							 	</a>
							</c:otherwise> --%>
							</c:choose>
								${tVO.isrec}
								<img src="../img/txtimg/norice.png" class="nolikebtn" aria-hidden="true" >
							
							
				<%-- 		<span class="heart" >
							<i class="f" aria-hidden="true" onclick="return like()">
							<c:if test="${sid == null}">
							<img src="/yummymap/resources/img/txtimg/rice.png" style="width:30px; height:30px;" class="likebtn" aria-hidden="true" >
							</c:if>
							<c:if test="${sid != null && DATA.isrec == 'Y'}">
							<img src="/yummymap/resources/img/txtimg/rice.png" style="width:30px; height:30px;" class="likebtn">
							</c:if>
							<c:if test="${sid != null && DATA.isrec == 'N'}">
							<img src="/yummymap/resources/img/txtimg/norice.png" style="width:30px; height:30px;" class="likebtn">
							</c:if>
							</i></span>
							 --%>
							
							
							<span class="pl-3 pt-1 like-rnum" id="rnum" value="${DATA.rnum}"></span>
						</div>
							<input type="hidden" id="txtno" name="txtno" value="${DATA.txtno}">	
							<input type="hidden" id="mid" name="mid" value="${DATA.mid}">	
					</form>
				</div>
				    <%-- <c:if test="${sid == null}">
					<div class="list-item-like like-size">
						<span class="heart"><i  class="far fa-heart " aria-hidden="true"></i> </span>
					</div>
	                </c:if> 
	                <c:if test="${sid != null && DATA.isrec == 'N'}">
					<div class="list-item-like like-size">
						<span class="heart"><i id="dislike" class="far fa-heart " aria-hidden="true"></i> </span>
					</div>
	               </c:if>
	                <c:if test="${sid != null && DATA.isrec == 'Y'}">
					<div class="list-item-like like-size">
						<span class="heart"><i id="like" class="fas fa-heart " aria-hidden="true"></i> </span>
					</div>
	                </c:if>
					<div class="pl-3 pt-1" id="rnum">${DATA.rnum}</div> --%>
			</div>
			<div class="b-w border-bottom ml-5 mt-4"></div>
			<img src="../img/txtimg/${DATA.savename}" class="txtimg">
			<div class="txt-body pt-4" id="mtxt" > ${DATA.mtxt}</div>
		</div>

		<!--게시글 영역 마지막 입니다-->
		<!--댓글 영역 시작 입니다-->
		<div class="reply-line shadow-sm border mb-4">
			<div class="d-flex re-title border pt-2">
				<p class="re-title-1 pl-4 pr-3 pt-1">댓글</p>
				<div class="pt-1 d-flex reply-info">
					<p class="pr-1">총</p>
					<p class="tcolor pl-1" id="re-count"></p>
					<p>개</p>
				</div>
				
				<div class="d-flex justify-content-end reply-btn mt-1">
				<c:if test="${empty sid}">
				<%-- <c:if test="${not empty sid}"> --%>
					<button type="button" class="btn btn-sm btn-outline-dark myd-none" id="reply-btn">작성</button>
				</c:if>
				</div>
			</div>
			<!--댓글 input태그 시작 영역 입니다-->
			<div class="re-input d-flex">
				<p class="pt-3 pl-4" id="rid" value="show"></p>
				<form action="" method="POST" id="re-frm">
					<!-- <input type="hidden" name="rno" > -->
					<input type="hidden" name="reno" id=reno value="${DATA.upno}">
					<input type="hidden" name="txtno" id=upno value="${DATA.txtno}">
					<input type="hidden" name="mid" id=mid value="${DATA.mid}">
					<textarea class="form-control re-text-area ml-4" rows="2" name="reply" id="rtxt" placeholder="댓글을 입력하세요.">${data.mtxt}</textarea>
				</form>
			</div>
			<div class="reply-body mt-4 rply-box" id="rList"></div>
			<%-- <!--댓글 input태그 마지막 영역 입니다-->
			<!--댓글 내용 시작 영역 입니다-->
			<c:forEach var="data" items="${LIST}">
			<div class="reply-body mt-4 rply-box">
				<div class="d-flex reply-txt-1 mt-3">s
					<p id="">${data.mid}</p>
					<p id="" class="pl-2">${data.cdate}</p>
				</div>
				<div class="reply-txt-2 ">
					<p id="listReply" style="display:inline-block; width: 680px;">${data.mtxt}</p>
				<c:if test="${data.mid eq sid}">
					<a href="/yummymap/txt/replyRemveProc.mmy?tno=${data.upno}&rno=${data.rno}" class="badge badge-danger">댓글삭제</a>
				</c:if>
				</div>
				<div class="b-w border-bottom ml-5 mt-4" style="height: 0px;"></div>
			</div>
			</c:forEach>
			<!--댓글 내용 마지막 영역 입니다--> --%>
		</div>
	</div>
	</div>
		<!-- body 마지막 입니다-->
</body>
<script type="text/javascript">
</script>
</html>
