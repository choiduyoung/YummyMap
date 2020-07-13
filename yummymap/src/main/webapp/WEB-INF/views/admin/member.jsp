<!-- 
@author 유태희
@since 2020.05.23
 	이 페이지는 관리자 회원 관리 페이지 입니다
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
<script type="text/javascript"
	src="/yummymap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/yummymap/js/admin/member.js"></script>
<title>회원관리 페이지</title>
</head>

<body>
	<form class="d-none" method="post" action="" id="frm">
		<input type="hidden" name="mno" id="no" value="0"> 
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage }"> <input
			type="hidden" name="mname" id="mname"> <input
			type="hidden" name="mid" id="mid"> <input
			type="hidden" name="opts" id="opts">
	</form>
	<div class="topNav border-bottom mt-1">
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
		<div class="" style="padding-top: 200px;">
			<div class="col-9 d-flex flex-column mt-2 m-auto" style="height: 500px;">
				<div class="mb-auto p-2">
				<h3 class="text-center ml-4 mb-5">회원 관리</h3>
					<div class="d-flex justify-content-around text-center">
						<div class="col-1">번호</div>
						<div class="col-2">아이디</div>
						<div class="col-2">이름</div>
						<div class="col-2">가입일</div>
						<div class="col-1">악성회원</div>
						<div class="col-2">비고</div>
					</div>
					<div class="row bar py-1"></div>
					<c:forEach var="data" items="${LIST}">
						<div class="d-flex mt-3 justify-content-around text-center"
							id="${data.mno}">
							<div class="col-1">${data.mno}</div>
							<div class="col-2 mid">${data.mid }</div>
							<div class="col-2">${data.mname }</div>
							<div class="col-2">${data.joindate }</div>
							<div class="col-1">${data.issue }</div>
							<div class="col-2">
								<button class="col-5 obtn">수정</button>
								<button class="col-5 btn-danger rbtn" type="button"
									data-toggle="modal" data-target="#staticBackdrop">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class=" p-2 d-flex">
					<select style="display: inline-block;"
						class="ml-auto col-1 form-control" id="opt" name="opt">
						<option value="nos">검색조건</option>
						<c:if test="${empty OPT}">
							<option id="idsel" value="idch">ID 검색</option>
							<option id="namesel" value="namech">이름 검색</option>
						</c:if>
						<c:if test="${not empty OPT and OPT eq 'idch' }">
							<option id="idsel" value="idch" selected>ID 검색</option>
							<option id="namesel" value="namech">이름 검색</option>
						</c:if>
						<c:if test="${not empty OPT and OPT eq 'namech' }">
							<option id="idsel" value="idch">ID 검색</option>
							<option id="namesel" value="namech" selected>이름 검색</option>
						</c:if>
					</select>
					<div class="col-4 bd-highlight">
						<input type="search" class="form-control ds-input"
							id="search-input" placeholder="Search..."
							aria-label="Search for..." autocomplete="off"
							data-docs-version="4.5" spellcheck="false" role="combobox"
							aria-autocomplete="list" aria-expanded="false"
							aria-owns="algolia-autocomplete-listbox-0" dir="auto"
							style="position: relative; vertical-align: top;" name="search"
							value="${SCH}">
					</div>
					<button type="button" class="btn btn-primary" id="sbtn">검색</button>
				</div>
	<div class="pager d-flex justify-content-center paging">
         <div class="mb-5">
            <nav aria-label="Page navigation example">
               <ul class="pagination">
                  <c:if test="${PAGE.endPage > 5}">
                     <li class="page-item pre" id="${PAGE.prePage }"><a class="page-link"   aria-label="Previous"><span aria-hidden="true" >&laquo;</span>
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

	<div class="modal fade" style="margin-top: 180px;" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1" role="dialog"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="height: 10% !important;"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="rmbtn">확인</button>
				</div>
			</div>
		</div>
	</div>




</body>

</html>