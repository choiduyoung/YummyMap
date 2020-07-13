<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<link rel="stylesheet" href="/yummymap/css/member/register.css">
<link rel="stylesheet" href="/yummymap/css/nav.css">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/yummymap/css/member/login.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script> -->
<script type="text/javascript" src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<!-- nav 영역입니다-->
 <div class="topNav border-bottom pl-4 pt-1 shadow-sm" id="topNav">
        <div class="d-flex m-0">
            <div class="topNavLogo">
                <a href="">YUMMY MAP</a>
            </div>
        </div>
</div>
<!-- nav 마지막 입니다-->

<!-- body 시작 입니다-->
  <div class="container " style="padding-top: 100px;">
    <div class="m-box mt-4 pt-5 pol">
      <form id="frm" action="/yummymap/member/loginProc.mmy" method="POST">
        <div class="form-group">
          <label for="id">I D</label>
          <input type="text" class="form-control" id="id" name="mid">
        </div>
        <div class="form-group">
          <label for="pw">P W</label>
          <input type="password" class="form-control" id="pw" name="mpw">
          <small id="msg1" class="text-danger dnone">입력하신 내용에 일치하는 계정이 없습니다.</small>
          <small id="msg2" class="text-danger dnone">입력이 완료되지 않았습니다.</small>
        </div>
        <button type="button" class="btn btn-primary loginbtn" id="loginbtn">로그인</button>
      </form>
      <div class="btn-box">
        <div class="optionbox d-flex mt-3">
          <a><p class="option-item-text" id="searchmem">아이디/비밀번호 찾기</p></a>
          <a href="/yummymap/join/join.mmy" class="ml-5"><p class="option-item-text">회원가입</p></a>
          <a href="/yummymap/main.mmy" class="ml-5"><p class="option-item-text">홈으로</p></a>
        </div>
      </div>
    </div>
  </div>
<!-- body 마지막 입니다 -->
<!-- 모달창 입니다 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">회원 정보 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
       <input type="radio" name="memSrc" id="idSrc" value="id" checked="checked" > 아이디 찾기
       <input class="ml-2" type="radio" name="memSrc" id="passSrc" value="pass" > 비밀번호 찾기
      <form class="mt-3" action="/yummymap/member/idfind.mmy" method="post" id="frm2" >
        <div> 사용자 이름 : <input type="text" id="mname" name="mname"></div>
        <div class="mt-3"> 사용자 메일 : <input type="text"  id="memail" name="memail"></div>
       </form>
        </div>
        <small class="d-none text-danger text-center" id="srchint">*입력하신 계정 정보가 없습니다</small>
       <div class="d-none text-center" id="okbox">
       	
       </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="mdbtn">취소</button>
        <button type="button" class="btn btn-danger" id="sendbtn">찾기</button>
        <button type="button" class="btn btn-danger d-none" data-dismiss="modal" id="cbtn">닫기</button>
      </div>
    </div>
  </div>
 </div>
</body>
<script type="text/javascript">
$(document).ready(function () {
	//로그인 이벤트처리 입니다.
  $('#loginbtn').click(function(){
    let sid = $('#id').val();
    let spw = $('#pw').val();
    if(!sid || !spw) {
      $('#msg2').show();
      return;
    }
    $('#msg2').hide();
    $('#frm').submit();
  });
	// 로그인시 실패시 msg를 출력해줍니다.
	let result = '${param.r}';
	if(result == 'x'){
		$('#msg1').show();
	}
	
	$('#searchmem').click(function(){
		$('#mname').val('');	
		$('#memail').val('');
		$('#mid').val('');
		$('#mdbtn').removeClass('d-none');
		$('#sendbtn').removeClass('d-none');
		$('#cbtn').addClass('d-none');
		$('#srchint').addClass('d-none');
		$('#okbox').addClass('d-none');
		$('.modal-body').removeClass('d-none');
		$('#staticBackdrop').modal();
	});
	
	//라디오 버튼 클릭식 폼태그 변경
	$('input[name=memSrc]').click(function(){
		let sd = $(this).val();
		$('#srchint').addClass('d-none');
		if(sd == 'pass'){
			$('#frm2').html('<div> 사용자 아이디 : <input type="text" id="mid" name="mid"></div>'+
			        		'<div class="mt-3"> 사용자 이메일 : <input type="text"  id="memail" name="memail"></div>');		
			$('#sendbtn').text('발송');
		}else if(sd == 'id'){
			$('#frm2').html('<div> 사용자 이름 : <input type="text" id="name" name="name"></div>'+
    						'<div class="mt-3"> 사용자 메일 : <input type="text"  id="mail" name="mail"></div>');	
			$('#sendbtn').text('찾기');
		
		}
	})
	
	$('#sendbtn').click(function(){
		 let src = $('input[name=memSrc]:checked').val();
		 
		if(src == 'id'){
			let name = $('#mname').val();	
			let mail = $('#memail').val();
			if(!name || !mail){
				alert('정보를 입력해 주세요!!');
				return;
			}
			
			$.ajax({
				url : '/yummymap/member/idfind.mmy',
				type: 'post',
				dataType:'json',
				data: {
					'mname' : name,
					'memail' : mail
				},
				success: function(data){
					if(data.result == 'ok'){
						$('#mdbtn').addClass('d-none');
						$('#sendbtn').addClass('d-none');
						$('#cbtn').removeClass('d-none');
						$('#srchint').addClass('d-none');
						$('.modal-body').addClass('d-none');
						$('#okbox').html('<h4>고객님의 메일로 ID가 전송 되었습니다. <h4>');
						$('#okbox').removeClass('d-none');
					}else if(data.result == 'no'){
						$('#srchint').removeClass('d-none');
					}
				},error : function(){
					alert('서버와의 통신에 오류가 생겼습니다. ');
				}
				
			});
		}else if(src == 'pass'){
			let id = $('#mid').val();
			let mail = $('#memail').val();
			if(!id || !mail){
				alert('정보를 입력해 주세요!!');
				return;
			}
			
			$.ajax({
				url : '/yummymap/member/pwfind.mmy',
				type: 'post',
				dataType:'json',
				data: {
					'mid' : id,
					'memail' : mail
				},
				success: function(data){
					if(data.result == 'ok'){
						$('#mdbtn').addClass('d-none');
						$('#sendbtn').addClass('d-none');
						$('#srchint').addClass('d-none');
						$('#cbtn').removeClass('d-none');
						$('.modal-body').addClass('d-none');
						$('#okbox').html('<h4>고객님의 메일로 임시 패스워드가 발급 되었습니다. <h4>');
						$('#okbox').removeClass('d-none');
					}else if(data.result == 'no'){
						$('#srchint').removeClass('d-none');
					}
				},error : function(){
					alert('서버와의 통신에 오류가 생겼습니다. ');
				}
				
			});
		}
	});
	
	
});
</script>
</html>
