$(document).ready(function () {
	
let mailOk;
let mailcode=false;
let memail;
// 완료버튼 클릭시 이벤트를 진행합니다.
  $('#joinbtn').click(function(){
    let result = checkfrm();
    if(result == -1){
      alert('모든 입력을 완료해주세요');
      return;
    }
    if(!(idchk($('#mid').val()))) {
    	alert('아이디 입력이 잘못되었습니다.');
    	return;
    }
    if(!ckIdResult) {
    	alert('아이디 체크를 진행해주세요.');
    	return;
    }
    if(!(pwchk($('#mpw').val()))) {
    	alert('비밀번호 입력이 잘못되었습니다.');
    	return;
    }
    if(!(namechk($('#mname').val()))){
    	alert('이름 입력이 잘못되었습니다.')
    	return;
    }
    let tel = $('#mtel').val() + $('#telend').val();
    if(!(telchk(tel))) {
    	alert('휴대전화 입력이 잘못되었습니다.');
    	return;
    }
    if($('#repw').val() != $('#mpw').val()) {
    	alert('비밀번호가 일치하지 않습니다.');
    	return;
    }
    if(mailcode == false){
    	alert('이메일 인증을 진행 하세요');
    	return;
    }
    alert('문제없음');
    $('#frm').submit();
  });
// input태그의 모든 값이 들어있는지 체크해주는 함수입니다.
  function checkfrm(){
    let formtag = $('.ckinput');
    for(let i=0; i<formtag.length; i++) {
      let tagval = $(formtag[i]).val();
      if(!tagval)
        return -1;
    }
  }
  //정규식 검사를 진행합니다.
	function idchk(id) {
		var pett = /^([A-Za-z]){1}\w{4,12}$/;
		var ok = pett.test(id);
		return ok;
	}
   function pwchk(pw) {
      	var patt = /^([a-z0-9!@#$%^&*-+_]){1}(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*-=])[a-zA-Z0-9!@#$%^&*-+_]{7,14}$/i;
      	var ok = patt.test(pw);
      	return ok;
   }
   function telchk(num) {
      	var reg = /^[0-9]{7,8}$/;
      	var ok = reg.test(num);
      	return ok;
   }
   function namechk(num) {
     	var reg = /^[가-힣]{2,6}$/;
     	var ok = reg.test(num);
     	return ok;
  }
   
   $('#mid').keyup(function(){
	   $('#idmsg1').show();
	   if(idchk($('#mid').val())) {
		   $('#idmsg1').text('아이디 입력양식이 일치합니다');
		   $('#idmsg1').attr('class', 'text-primary' );
	   } else {
		   $('#idmsg1').text('아이디 입력양식을 확인해주세요');
		   $('#idmsg1').attr('class', 'text-danger' );
	   }
   });
   $('#mpw').keyup(function(){
	   $('#pwmsg1').show();
	   if(pwchk($('#mpw').val())) {
		   $('#pwmsg1').text('비밀번호 입력양식이 일치합니다');
		   $('#pwmsg1').attr('class', 'text-primary' );
	   } else {
		   $('#pwmsg1').text('비밀번호 입력양식을 확인해주세요');
		   $('#pwmsg1').attr('class', 'text-danger' );
	   }
   });
   $('#repw').keyup(function(){
	   $('#repwmsg').show(); 	 
	   if($('#repw').val() == $('#mpw').val()) {
		   $('#repwmsg').text('비밀번호가 일치합니다');
		   $('#repwmsg').attr('class', 'text-primary' );
	   } else {
		   $('#repwmsg').text('비밀번가 일치하지 않습니다');
		   $('#repwmsg').attr('class', 'text-danger');
	   }
   });


  let ckIdResult = false;
  //아이디체크 이벤트를 비동기로 진행합니다.
  $('#idcheck').click(function() {
	  let bid = $('#mid').val();
	  if(!bid)
		  return;
	  
		$.ajax({
			url: '/yummymap/member/idCheck.mmy',
			type: 'post',
			dataType: 'json',
			data: {
				'mid': bid
			},
			success: function(data){
				let str = data;
				if(str == 0) {
					$('#idmsg2').text('사용가능한 아이디입니다.');
					$('#idmsg2').attr('class', 'text-primary d-block' );
					ckIdResult = true;
				} else {
					$('#idmsg2').text('이미 사용된 아이디입니다.');					
					$('#idmsg2').attr('class', 'text-danger d-block' );
					ckIdResult = false;
				}
					$('#idmsg2').show();
			}
		});
  });
  //이메일인증 발송처리 

  $('#sendmail').click(function(){
	  let memail = $('#memail').val();
	  if(!memail){
		  alert('메일을 입력해 주세요');
		  return;
	  }
	  $.ajax({
		 url : '/yummymap/member/mailCk.mmy',
		 type: 'post',
		 dataType: 'json',
		 data: {
			 'mail' : memail
		 },
		 success : function(data){
			 mail = data.data;
			 alert('메일이 전송되었습니다. 메일을 확인하여 인증번호 입력을 완료해주세요.');
		 },error : function(){
			alert("통신 오류") 
		 }
	  });
	 $('#mailckBox').removeClass('d-none');
  });
  //이메일 인증 코드값 확인 처리
  $('#eokbtn').click(function(){
	 let mailo = $('#malick').val();
		$.ajax({
			url: '/yummymap/member/mailNum.mmy',
			type: 'POST',
			dataType: 'json',
			data: {
				'cftnum' : mailo
			},
			success: function(data){
				 if(data.result == 'ok'){
					 $('#mailmsg').removeClass('text-danger');
					 $('#mailmsg').css('color','blue');
					 $('#mailmsg').html('메일 인증이 완료 되었습니다');
					 $('#mailckBox').addClass('d-none');
					 mailcode = true;
				 } else  if(data.result == 'no'){
					 $('#mailmsg').html('인증 번호가 틀립니다 다시 인증해주세요');
				 }
			}, error: function(){
						alert('통신 에러');
						}
		})
  })
});