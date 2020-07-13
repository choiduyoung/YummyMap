<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>야미맵 정보</title>
    <link rel="stylesheet" href="/yummymap/css/main/nav.css" />
    <link rel="stylesheet" href="/yummymap/css/main/mainDetail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="/yummymap/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="topNav border-bottom pl-4 pt-1 shadow-sm" id="topNav">
        <div class="d-flex m-0">
            <div class="topNavLogo">
                <a href="/yummymap/main.mmy">YUMMY MAP</a>
            </div>
            <ul class="topNavItem d-flex justify-content-end pr-4 pt-1">
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
        <div class="d-flex justify-content-center">
            <div class="searchBox d-flex">
                <div class="searchBox-font"><i class="fas fa-search"></i></div>
                <input type="text" id="search" onkeydown="submitKeyword()">
                <div class="searchBox-text">검색</div>
            </div>
        </div>
    </div>
    <div class="itemBody container">
		<div class="border-bottom mt-5">
			<div class="d-flex">
		        <div class="upso-name mr-2">${upsoVo.place_name}</div>
	            <div class="upso-count pt-3">${upsoVo.cont_sum}개 리뷰</div>
			</div>
	        <div class="d-flex">
	        	<div class="d-flex upso-avgBox pt-2">
	        	<c:forEach begin="1" end="${upsoVo.star_avg}">
		            <i class="fas fa-star upso-star"></i>
	        	</c:forEach>
	        	<c:if test="${upsoVo.star_avg*10%10 >= 1}">
		            <i class="fas fa-star-half upso-star"></i>
	        	</c:if>
					<div class="upso-avg">${upsoVo.star_avg}</div>		
	        	</div>
	        	<div>
			        <div class="pickHeart mb-1">
			        <c:if test="${upsoVo.is_pick == 0}">
				    <i class="far fa-heart unPick" onclick="pickProcess('${upsoVo.id}')"></i>
			        </c:if>
			        <c:if test="${upsoVo.is_pick != 0}">
		            <i class="fas fa-heart pick" onclick="pickProcess('${upsoVo.id}')"></i>
			        </c:if>
			        </div>
	        	</div>
	        </div>
		</div>
		<div class="d-flex">
			<div class="upso-subinfo-box pt-1 border-right">
		        <div>
		            <i class="fas fa-map-marked-alt rgba4"></i>
		            <div class="upso-subinfo-font">${upsoVo.road_address_name}</div>
		        </div>
		        <div class="mt-1">
		        	<i class="fas fa-phone rgba4"></i>
		        	<div class="upso-subinfo-font">${upsoVo.phone}</div>
		        </div>
		        <div class="mt-1">
		            <i class="fas fa-utensils rgba4"></i>
		            <div class="upso-subinfo-font">${upsoVo.category_name}</div>
		        </div>
		        <div class="d-flex">
			        <div>
			        	<div class="avg">${upsoVo.star_avg}</div>
			        	<div>${ratingVo.rating_total}개의 리뷰</div>
			        </div>
			        <div class="mt-3 ml-2">
			        	<div class="d-flex">
							<div class="chart-star-box">
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
							</div>
							<div class="bar" style="width: ${ratingVo.star5_per*2}px;">${ratingVo.rating_star5}</div>
			        	</div>
			        	<div class="d-flex">
							<div class="chart-star-box">
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
							</div>
							<div class="bar" style="width: ${ratingVo.star4_per*2}px;">${ratingVo.rating_star4}</div>
			        	</div>
			        	<div class="d-flex">
							<div class="chart-star-box">
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
							</div>
							<div class="bar" style="width: ${ratingVo.star3_per*2}px;">${ratingVo.rating_star3}</div>
			        	</div>
			        	<div class="d-flex">
							<div class="chart-star-box">
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2"></i>
								<i class="fas fa-star upso-star2"></i>
							</div>
							<div class="bar" style="width: ${ratingVo.star2_per*2}px;">${ratingVo.rating_star2}</div>
			        	</div>
			        	<div class="d-flex">
							<div class="chart-star-box">
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2 dhidden"></i>
								<i class="fas fa-star upso-star2"></i>
							</div>
							<div class="bar" style="width: ${ratingVo.star1_per *2}px;">${ratingVo.rating_star1}</div>
			        	</div>
							        
			        </div>
		        
		        </div>
			</div>
			<div class="upso-mapBox" id="map" ></div>
		</div>


	    <div class="reviewBox">
	        <p class="reviewBox-title border-bottom m-0">리뷰</p>
	        <div class="reviewBtn" onclick="showInputBox()">
	            <i class="fas fa-pen"></i>
	        </div>
	        <form method="post" action="/yummymap/main/reviewProcess.mmy" id="reviewForm" enctype="multipart/form-data" >
		        <div class="writeBox mb-4 dnone ">
		        	<div>
		        		<label class="border review-img-btn" id="img-label" for="reviewImgFile0">사진 추가</label>
		        		<div class="imgNameBox pb-2" id="imgNameBox"></div>
		        		<div class="dnone" id="fileInputBox">
		        			<input type="file" id="reviewImgFile0" name="reviewImgFile" onchange="imgFileAppend()" />
		        		</div>
		        	</div>
		            <div class="d-flex starBox mt-1" id="star_grade">
		                <i class="fas fa-star" id="1" onclick="setRating()"></i>
		                <i class="fas fa-star" id="2" onclick="setRating()"></i>
		                <i class="fas fa-star" id="3" onclick="setRating()"></i>
		                <i class="fas fa-star" id="4" onclick="setRating()"></i>
		                <i class="fas fa-star" id="5" onclick="setRating()"></i>
		            </div>
		            <input class="dnone" type="text" name="rating_upso" id="rating_upso">
		            <input class="dnone" type="text" name="res_id" id="res_id" value="${upsoVo.id}">
		            <div class="input-group mt-1 mb-0">
		                <input type="text" name="rev_txt" id="rev_txt" class="form-control" >
		                <div class="input-group-append">
		                  <button class="btn border writeBtn" type="button" onclick="submitReview()">작성</button>
		                </div>
		            </div>
		        </div>
	        </form>
	    </div>
	    
	    <div class="mb-5">
	    <c:if test="${reviewList.size() == '0'}">
	    	<div class="reviewInfoText">첫 번째 리뷰를 등록해 주세요</div>
	    </c:if>
	    <c:forEach var="reviewVo" items="${reviewList}">
	        <div class="review-item border-bottom pt-4">
	        	<div class="d-flex">
		        	<c:forEach var="imgVo" items="${reviewVo.imgList}">
	        		<div class="reviewImg pr-2">
	        			<a href="/yummymap/resources/upsoImg/${imgVo.save_name}"><img src="/yummymap/resources/upsoImg/${imgVo.save_name}"></a>
	        		</div>
		        	</c:forEach>
	        	</div>
	            <div class="reviewId">${reviewVo.mid}</div>
	            <div class="d-flex reviewStarBox">
	            <c:forEach begin="1" end="${reviewVo.rating_upso}" >
                <i class="fas fa-star"></i>
	            </c:forEach>
	                <div class="pl-1">${reviewVo.cr_date}</div>
	                <c:if test="${SID == reviewVo.mid}">
	                <button type="button" class="btn btn-secondary btn-sm rbtn ml-3" onclick="deleteReview('${reviewVo.rev_no}')">삭제</button>
	                </c:if>
	            </div>
	            <div class="review-txt pt-4 pb-4">${reviewVo.rev_txt}</div>
	        </div>
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
		let keyword = document.getElementById("search").value;
		if(!keyword)
			return;
		location.href = "/yummymap/main/getList.mmy?keyword="+keyword;
	}
}
function setRating(){
	let rating = event.target.getAttribute('id');
	document.getElementById('rating_upso').value = rating;
}
function submitReview() {
	let user_id = '${SID}';
	if(!user_id) {
		alert('로그인 후 이용해주세요.');		
		return;
	}
	let rev_txt = document.getElementById('rev_txt').value;
	let rating_upso = document.getElementById('rating_upso').value;
	let res_id = document.getElementById('res_id').value;
	if(!rev_txt || !rating_upso || !res_id)
		return;
	document.getElementById('reviewForm').submit();
}

$('#star_grade i').click(function(){
            $(this).parent().children("i").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("i").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            return false;
  });

function showInputBox() {
    $('.writeBox').show();
}

let no = 0;
function imgFileAppend() {
	let inputTag = document.getElementById("reviewImgFile"+no);
	no++;
	let fReader = new FileReader();
	fReader.readAsDataURL(inputTag.files[0]);
	fReader.onloadend = function(event){
	    var img = document.createElement('img');
	    let result = event.target.result;
	    img.src = event.target.result;
	    img.style.width = '100px';
	    img.style.height = '100px';
	    img.style.margin = '0px 10px 0px 0px';
	    document.getElementById('imgNameBox').append(img);
	    var inputBox = document.createElement('input');
	    inputBox.setAttribute('name', 'reviewImgFile');
	    inputBox.type = 'file';
	    inputBox.id = 'reviewImgFile'+no;
	    inputBox.setAttribute('onchange', 'imgFileAppend()');
	    document.getElementById('fileInputBox').append(inputBox);
	    document.getElementById('img-label').setAttribute('for', 'reviewImgFile'+no);
	    
	}
}

function pickProcess(data){
	let upso_id = data;
	let user_id = '${SID}';
	if(!user_id) {
		alert('로그인 후 이용해주세요.');		
		return;
	}
	var xhr;  
	if (window.XMLHttpRequest) {  
		xhr = new XMLHttpRequest();
	} 
	else {  
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xhr.onreadystatechange = function() {  
	    if (xhr.readyState == 4 && xhr.status == 200) {
	         var obj = JSON.parse(xhr.response);
	        if(obj.result == true)
	        	location.reload();

	    }
	}
	xhr.open("GET", "/yummymap/main/pick.mmy?upso_id="+upso_id, true);  
	xhr.send(); 
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

function deleteReview(data) {
	let res_id = '${upsoVo.id}';
	location.href = '/yummymap/main/reviewDelete.mmy?rev_no='+data+'&res_id='+res_id;
}



</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8654c7466588faa58bc40d0b9bef6ce&libraries=services"></script>
<script>
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch('${upsoVo.place_name}', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        displayMarker(data[0]);    
        bounds.extend(new kakao.maps.LatLng(${upsoVo.y}, ${upsoVo.x}));

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

}
</script>
</html>