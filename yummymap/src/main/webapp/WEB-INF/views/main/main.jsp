<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>야미맵</title>
    <link rel="stylesheet" href="/yummymap/css/main/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/yummymap/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="topNavHidden border-bottom dnone pl-4 pt-1" id="topNavHidden">
        <div class="d-flex m-0">
            <div class="topNavLogoHD">
                <a href="">YUMMY MAP</a>
            </div>
            <ul class="topNavItemHD d-flex justify-content-end pr-4 pt-1">
                <li><div class="topNavItem-iconHD" onclick="showModal()"><i class="far fa-heart"></i></div></li>
                <li><a class="topNavItem-iconHD" href=""><i class="fas fa-user"></i></a></li>
                <c:if test="${SID == null}">
                <li><a class="topNavItem-iconHD" href="/yummymap/member/loginView.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${SID != null}">
                <li><a class="topNavItem-iconHD" href="/yummymap/member/logoutProcess.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
        </div>
        <div class="d-flex justify-content-center">
            <div class="searchBoxHD d-flex">
                <div class="searchBox-fontHD"><i class="fas fa-search"></i></div>
                <input type="text" id="Asearch" onkeydown="submitKeyword()">
                <div class="searchBox-textHD" onclick="submitKeyword_click('a')">검색</div>
            </div>
        </div>
    </div>
    <div class="topNav border-bottom">
        <div class="d-flex">
            <div class="topNavLogo pl-4 pt-2">
                <a href="">YUMMY MAP</a>
            </div>
            <ul class="topNavItem d-flex justify-content-end pr-4 pt-2">
                <li><div class="topNavItem-icon" onclick="showModal()"><i class="far fa-heart"></i></div></li>
                <li><a class="topNavItem-icon" href=""><i class="fas fa-user"></i></a></li>
                <c:if test="${SID == null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/login.mmy"><i class="fas fa-toggle-off"></i></a></li>
                </c:if>
                <c:if test="${SID != null and Token == null}">
                <li><a class="topNavItem-icon" href="/yummymap/member/logoutProc.mmy"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
                <c:if test="${SID != null and Token != null}">
                <li><a class="topNavItem-icon" href="" id="kakaoLogout"><i class="fas fa-toggle-on"></i></a></li>
                </c:if>
            </ul>
        </div>
        <div class="d-flex justify-content-center pt-3">
            <div class="sub-title">
                맛집 검색을 손쉽게! 야미맵
            </div>
        </div>
        <div class="d-flex justify-content-center pt-3">
            <div class="searchBox d-flex">
                <div class="searchBox-font"><i class="fas fa-search"></i></div>
                <input type="text" id="Bsearch" onkeydown="submitKeyword()">
                <div class="searchBox-text ml-1" onclick="submitKeyword_click('b')">검색</div>
            </div>
        </div>
        <div class="d-flex justify-content-end pt-4 pr-5">
            <div class="boardBanner">
                <a class="d-flex justify-content-center gameBannerItem" href="">
                    <div>Community</div>
                </a>
            </div>
        </div>
    </div>
    <div class="itemBody container mb-5">
    	<c:if test="${upsoListAroundUser.size() != 0}">
        <div class="itemBody-title">내 주변 맛집 바로가기!</div>
    	</c:if>
        <div class="d-flex mt-3">
        <c:forEach var="locationUpso" items="${upsoListAroundUser}">
        <c:if test="${empty locationUpso.img_save_name}">
            <div class="item-card border mr-3" onclick="getUpsoDetail('${locationUpso.id}')" style="background-image: url(/yummymap/resources/upsoImg/noImage1.jpg) ">
            	<div class="backImg-card"></div> 
                <div class="item-card-title">${locationUpso.place_name}</div>
            </div>
        </c:if>
        <c:if test="${!empty locationUpso.img_save_name}">
            <div class="item-card border mr-3" onclick="getUpsoDetail('${locationUpso.id}')" style="background-image: url(/yummymap/resources/upsoImg/${locationUpso.img_save_name})">
                <div class="backImg-card"></div>
                <div class="item-card-title">${locationUpso.place_name}</div>
            </div>
        </c:if>
        </c:forEach>
        </div>
        <c:if test="${weeklyUpsoList.size() != 0}">
        <div class="itemBody-title mt-5">이번주 핫 맛집!</div>
        </c:if>
        <div class="d-flex mt-3">
        <c:forEach var="weeklyUpso" items="${weeklyUpsoList}">
        <c:if test="${empty weeklyUpso.img_save_name}">
            <div class="item-card border mr-3" onclick="getUpsoDetail('${weeklyUpso.id}')" style="background-image: url(/yummymap/resources/upsoImg/noImage1.jpg) ">
                <div class="backImg-card"></div>
                <div class="item-card-title">${weeklyUpso.place_name}</div>
            </div>
        </c:if>
        <c:if test="${!empty weeklyUpso.img_save_name}">
            <div class="item-card border mr-3" onclick="getUpsoDetail('${weeklyUpso.id}')" style="background-image: url(/yummymap/resources/upsoImg/${weeklyUpso.img_save_name})">
                <div class="backImg-card"></div>
                <div class="item-card-title">${weeklyUpso.place_name}</div>
            </div>
        </c:if>
        </c:forEach>
        </div>



    </div>
    
<!-- Modal -->
<div class="modal fade " id="myUpsoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">나의 맛집</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        <c:if test="${searchInfoVo.upsoCount == 0}">
        	<div class="modal-sub-title border-bottom pb-2">나의 맛집이 아직 등록되지 않았습니다.</div>
        	<div class="modal-sub-title2 pt-3 pb-3">내 주변 맛집 추천 리스트</div>
        </c:if>
        <c:forEach var="myPickUpso" items="${myPickUpsoList}">
          <div class="d-flex pb-2 border-bottom pt-2">
              <div class="myUpsoImgBox">
              <c:if test="${empty myPickUpso.img_save_name}">
                  <img src="/yummymap/resources/upsoImg/noImage.jpg" alt="">
              </c:if>
              <c:if test="${!empty myPickUpso.img_save_name}">
                  <img src="/yummymap/resources/upsoImg/${myPickUpso.img_save_name}" alt="">
              </c:if>
              </div>
              <div class="pl-3">
                  <div class="myUpsoName">${myPickUpso.place_name}</div>
                  <div class="myUpsoAddr pb-4">${myPickUpso.road_address_name}</div>
                  <div class="d-flex">
                    <div class="myUpsoStar d-flex pr-3">
                        <i class="fas fa-star mr-1"></i>
                        <div class="font-size-11">${myPickUpso.star_avg}</div>
                    </div>
                    <div class="myUpsoRCount d-flex">
                        <i class="fas fa-pen mr-1"></i>
                        <div class="font-size-11">${myPickUpso.cont_sum}</div>
                    </div>
                    <div class="myUpsoBtn" onclick="getUpsoDetail('${myPickUpso.id}')">클릭!</div>
                  </div>
              </div>
          </div>
        </c:forEach>
        </div>
      </div>
    </div>
  </div>    
</body>
<script type="text/javascript">


function submitKeyword(){
	if(event.keyCode == 13) {
		let keyword = event.target.value;
		if(!keyword)
			return;
		location.href = "/yummymap/main/getList.mmy?keyword="+keyword+"&nowPage=1";
	}
}
function submitKeyword_click(data){
	let keyword;
	if(data == 'a') 
		keyword = document.getElementById('Asearch').value;
	else if(data == 'b')
		keyword = document.getElementById('Bsearch').value;
	location.href = "/yummymap/main/getList.mmy?keyword="+keyword;
}


onmousewheel = function(e){
    let currentWheelDelta = e.wheelDelta;
    if(currentWheelDelta > 0) {
        if(scrollY < 200){
            document.getElementById('topNavHidden').classList.add('dnone');
        }
    } else {
        if(scrollY > 150){
            document.getElementById('topNavHidden').classList.remove('dnone');
        }
    }
}

document.getElementById('kakaoLogout').onclick = function(){
	 window.open('http://localhost/yummymap/kakaoLogout.mmy','','top=0, left=0, width=1, height=1');
}

function getUpsoDetail(data) {
	let id = data;
	location.href = "/yummymap/main/getDetail.mmy?id="+id;
}

function showModal() {
	let user_id = '${SID}';
	if(!user_id) {
		alert('로그인 후 이용해주세요');
		return;
	}
    if (!$(".modal.in").length) {
         $(".modal-dialog").css({
           top: 100,
           left: 0,
         });
       }
   $('#myUpsoModal').modal();
   
}

</script>
</html>