/**
@author 유태희
@since 2020.05.24
 	이 JS는 관리자 정보 수정 페이지에 사용할 JavaScript 입니다
*/
$(function(){
	
	$(document).keydown(function(event){
		if( event.keyCode == 82 || event.keyCode == 116){
			$('#frm').attr('action','/yummymap/admin/adminEdit.mmy');
			$('#frm').submit();
			return false; 	
		}
	});
	
	$('#pw').keyup(function(){
		let pw = $('#pw').val();
		let pwck = pwchk(pw);
		
		if(!pwck){
			$('#pwhint').css('color','red');
			$('#pwhint').text('* 숫자/특수문자/영문 대/소문자 1자리이상 포함한 8자리 이상 15자리 입니다');
		}else{
			$('#pwhint').text('');
		}
	});
	
	$('#pwck').keyup(function(){
		let pw = $('#pw').val();
		let pwck = $('#pwck').val();
		
		if(pw == pwck){
			$('#pwok').css('color','blue');
			$('#pwok').text('*비밀번호가 동일합니다.');
		}else{
			$('#pwok').css('color','red');
			$('#pwok').text('*비밀번호가 일치하지 않습니다.');
		}
	});
	
	$('#name').keyup(function(){
		let name = $('#name').val();
		let nameck = namechk(name);
		if(!nameck){
			$('#namehint').css('color' , 'red');
			$('#namehint').text('*이름은 한글 2자이상 6자리 미만입니다');
		}else{
			$('#namehint').text('');
		}
	});
	
	$('#mailSelect').change(function () {
		let domain= $(this).val();

		if (domain.length < 1) {
			$('#domin').removeAttr("readonly");
		} else {
			$('#domin').attr('readonly', true);
		}

		$('#domain').val(domain);

	});
	
	//정규식 함수
	
	
	 function namechk(num) {
	     	var reg = /^[가-힣]{2,6}$/;
	     	var ok = reg.test(num);
	     	return ok;
	}

	 function pwchk(pw) {
		let patt = /(?=.*\d{1})(?=.*[~`!@#$%\^&*()-+=]{1})(?=.*[a-zA-Z]{2}).{8,15}$/;
		let pwok = patt.test(pw);
		return pwok;
	}
	
	function phonck(num) {
		let reg = /^[0-9]{3}[-]{1}[0-9]{3,4}[-]{1}[0-9]{4}$/;
		let ok = reg.test(num);
		return ok;
	}
	
	function domainck(domain) {
		let reg = /^([A-Za-z0-9]){1}\w+\.+([a-zA-Z]){2,3}\.*([A-Za-z])*$/;
		let ok = reg.test(domain);
		return ok;
	}
	
	function eidchk(id) {
		let pett = /^([A-Za-z0-9])\w{2,10}$/;
		let ok = pett.test(id);
		return ok;
	}
	
//	여기서 부턴 버튼 클릭 이벤트 처리
	 $('#cbtn').click(function(){
		let nowpage = $('#nowPage').val()
		$(location).attr('href','/yummymap/admin/main.mmy'); 
	 });
	
	 $('#okbtn').click(function(){
		let check = ['name','pw','pwck','tel','mail','domain'];
		
		for(let i=0; i<check.length; i++){
			
			let val = $('#'+check[i]).val();
			
			if(check[i] == 'pw' && !val){
				continue;
			}
			
			if(check[i] == 'pwck' && !val){
				continue;
			}
			
			
			if(!val){
				$('.modal-body').text('입력하신 정보가 부족합니다.!!');
				$('#staticBackdrop').modal();
				return;
			}
			
			
			
		}
		
		
		//비밀번호 랑 비밀번호 확인중 하나만 비어있는 경우
		let pwval = $('#pw').val();
		let pwckval = $('#pwck').val();
		if(pwval  &&  !pwckval){
			$('.modal-body').text('비밀번호 확인이 비어 있습니다.');
			$('#staticBackdrop').modal();
			return;
		}else if(!pwval && pwckval){
			$('.modal-body').text('비밀번호가 비어 있습니다.');
			$('#staticBackdrop').modal();
			$('#pw').focus();
			return false;
		}
		
		//정규식 처리 
		
		let name = $('#name').val();
		let nameck = namechk(name);
		if(!nameck){
			$('.modal-body').text('이름을 확인하세요');
			$('#staticBackdrop').modal();
			return;
		}
		
		if(pwval){
	    let pwchks = pwchk(pwval);
	    
		if(!pwchks){
			$('.modal-body').text('비밀번호를 정확히 입력하세요!');
			$('#staticBackdrop').modal();
			return;
		}
		
		if(pwval != pwckval){
			$('.modal-body').text('비밀번호 확인이 맞지 않습니다.');
			$('#staticBackdrop').modal();
			return;
		}
		}
		
		let tel = $('#tel').val();
		let tel_ck = phonck(tel);
		if(!tel_ck){
			$('.modal-body').text('휴대폰 번호를 확인하세요');
			$('#staticBackdrop').modal();
			return;
		}
		
		let emailid = $('#mail').val();
		let emailidck = eidchk(emailid);
		if(!emailidck){
			$('.modal-body').text('메일 아이디를 확인하세요');
			$('#staticBackdrop').modal();
			return;
		}
		
		let domain = $('#domain').val();
		let domaincks = domainck(domain);
		if(!domaincks){
			$('.modal-body').text('메일 도메인을 확인하세요');
			$('#staticBackdrop').modal();
			return;
		}
		
	   let rsa = new RSAKey();
	   
	   rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
	   let sname =  $('#name').val(); 
	   
	   if(pwval){
		   $('#pw').val(rsa.encrypt(pwval));
	   }
	   
	   $('#name').val(rsa.encrypt(sname));
	   $('#tel').val(rsa.encrypt(tel));
	   $('#mail').val(rsa.encrypt(emailid));
	   $('#domain').val(rsa.encrypt(domain));
		
		$('#frm').attr('action','/yummymap/admin/adminEditProc.mmy');
		$('#frm').submit();
		
		
	});
	

 
});


