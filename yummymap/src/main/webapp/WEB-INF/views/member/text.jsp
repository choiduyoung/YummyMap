<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴글 보기</title>
<link rel="stylesheet" href="/yummymap/css/w3.css">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/yummymap/css/member/text.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript"src="/yummymap/js/bootstrap.bundle.min.js"></script>
<style>
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		 //로그인 여부를 확인합니다.
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
		  
		$('.pbtn').click(function() {
			var page = $(this).text();
			$('#nowPage').val(page);
			$('#frm').attr('action', '/yummymap/member/text.mmy');
			$('#frm').submit();
		});
		$('.pre').click(function(){
			let aa = $(this).attr('id');
			$('#nowPage').val(aa);
			$('#frm').attr('action','/yummymap/member/text.mmy');
			$('#frm').submit();
		});
		$('.next').click(function(){
			let aa= $(this).attr('id');

			$('#nowPage').val(aa);
			$('#frm').attr('action','/yummymap/member/text.mmy');
			$('#frm').submit();
		});
	      $('.title').click(function(){
	          //글번호 알아낸다
	          var txtno = $(this).parent().prevAll('.ckd').attr('id');
	          alert(txtno);
	          $('#txtno').val(txtno);
	          $('#frm').attr('action','/yummymap/txt/detail.mmy?txtno='+txtno);
	          $('#frm').submit();
	       });
	      $(function(){
		    let txtnos =[]; 
		    
		    $('#dlbtn').click(function(){
		    	 $("input[name='no']:checked").each(function(){
		    		 txtnos.push($(this).val());
		    	});
		    	if(txtnos.length == 0){
		    		alert("선택된 게시글이 없습니다");
		    		return;
		    		}
				$('#txtno').val(txtnos);
				alert("정말 삭제 하시겠습니까?");
				$('#frm').attr('action','/yummymap/member/boardDel.mmy');
				$('#frm').submit();
		    });
	     });
			$('#mlink').click(function(){
				$("#staticBackdrop").modal();
			});
			$('#dbtn').click(function(){
				$('#mid').val(mid);
				$('#frm').attr('action' , '/yummymap/member/memberDel.mmy');
				$('#frm').submit();
			});
	});
</script>
</head>
<body>
	<form method="post" id="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="txtno" id="txtno" value="1">
		<input type="hidden" name="mid" id="mid">
	</form>
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
                <li><a class="topNavItem-icon" href="/yummymap/member/loginView.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${SID != null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/logoutProcess.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
        </div>

	<div class="row nav-text  ">
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
 <div class="container" style="padding-top: 100px;">
				<div class="col text-center">
					<div class="mt-3">
						<h3 class=" ">내가 쓴글 보기</h3>
					</div>
				<div class="col d-flex flex-column bd-highlight mt-2">
				<div class="mb-auto p-2 border-top ">
					<div class="d-flex justify-content-around text-center">
						<div class="col-2">번호</div>
						<div class="col-5">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
						<div class="col-1">추천</div>
						<div class="col-1">조회</div>
					</div>
				<div class="row border-top py-1"></div>
					<c:forEach var="data" items="${LIST}">
						<div class="d-flex mt-3 justify-content-around text-center">
							<div class="col-2 ckd " id="${data.txtno}">
								<input type="checkbox" class="mr-2" name="no" value="${data.txtno}">${data.txtno}
							</div>
							<div class="col-5 title-box "><a class="title">${data.title}</a></div>
							<div class="col-2">${data.mid }</div>
							<div class="col-2">${data.tdate}</div>
							<div class="col-1">${data.count}</div>
							<div class="col-1">${data.rnum}</div>
						</div>
					</c:forEach>
				</div>
			<div class="d-flex flex-row-reverse bd-highlight mt-3">
					<button type="button" class="btn btn-danger" id="dlbtn">삭제</button>
			</div>
	<div class="pager d-flex justify-content-center paging ">
         <div class="mb-3">
            <nav aria-label="Page navigation example">
               <ul class="pagination">
                  		<c:if test="${PAGE.endPage > 1}">
                    		<li class="page-item pre" id="${PAGE.prePage }"><a class="page-link Pre"   aria-label="Previous"><span aria-hidden="true" >&laquo;</span>
                     		</a></li>
		                </c:if>
		                <c:forEach var="pageNo" begin="${PAGE.startPage}" end="${PAGE.endPage}">
		                  <c:if test="${PAGE.nowPage eq pageNo }">
		                   	<li class="page-item  page-link pbtn pbtnck">${pageNo}</li>
		                   </c:if>
		                  <c:if test="${PAGE.nowPage ne pageNo }" >
		                    <li class="page-item  page-link pbtn">${pageNo}</li>
		                  </c:if>
                  		</c:forEach>
                  		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
                   			 <li class="page-item next" id="${PAGE.nextPage }" ><a class="page-link" 
                      		  aria-label="Next"> <span aria-hidden="true" >&raquo;</span>
	                     	</a></li>
	                 	 </c:if>
	             				  </ul>
		          			  </nav>
				         </div>
				     </div>
				</div>
			</div>
		</div>
	</div>
	<!-- body 마지막 입니다-->
</body>
</html>