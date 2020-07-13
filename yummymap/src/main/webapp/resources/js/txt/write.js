function setNum(cnt) {
		cnt = cnt + 1;
		return cnt;
	}

	$(document).ready(function() {
			let userid = '${sid}';
			if (!userid) {
				$('#login').show();
				$('#logout').hide();
				$('#mypage').attr('href', '/yummymap/join/join.mmy');
			} else {
				$('#login').hide();
				$('#logout').show();
				$('#mypage').attr('href', '/yummymap/member/member.mmy');
			}
			
		$('#file').change(function(e){
			var file = e.target.files;
			console.log(file);
		});
		
		$('#submitBtn').click(function() {
			// 데이터 유효성 체크
			let title_tag = $('#title').val();
			if(title_tag.length > 30) {
				alert('제목의 길이를 초과했습니다.');
				return;
			}
			let mid = $('#mid').val();
			let select = $('#catno').val();
			let title = $('#title').val();
			let mtxt = $('#mtxt').val();
			
			if(!select){
				alert('카테고리를 선택 하세요!');
				return;
			}
			$('#frm').attr('enctype','multipart/form-data');
			$('#frm').submit();
		});
		
		$('#exitBtn').click(function() {
			$(location).attr('href', '/yummymap/txt/list.mmy');
		});
		//마이리스트 이벤트 처리 입니다. 
		$('#myListIcon').click(function(){
			if(!userid) {
				alert('로그인을 진행해주세요');
				return;
			}
			$(location).attr('href', '/yummymap/main/myList.mmy');
		});
	});
