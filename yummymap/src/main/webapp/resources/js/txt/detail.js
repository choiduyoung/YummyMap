/*$(document).ready(function() {
			let userid = '${sid}';
			if (!userid) {
				$('#login').show();
				$('#logout').hide();
				$('#mypage').attr('href', '/yummymap/join/join.mmy');
			} else {
				$('#login').hide();
				$('#logout').show();
				$('#mypage').attr('href', '/yummymap/member/mypage.mmy');
			}
	});
*/

'use strict';
$(document).ready(function(){
		//로그인 여부를 확인합니다.
	
	  let userid = '${sid}';
	  if(!userid) {
		  $('#login').show();
		  $('#logout').hide();
		  $('#mypage').attr('href', '/yummymap/join/join.mmy');
	  } else {
		  $('#login').hide();
		  $('#logout').show();
		  $('#mypage').attr('href', '/yummymap/member/mypage.mmy');
	  }
		//마이리스트 이벤트 처리
		$('#myListIcon').click(function(){
			if(!userid) {
				alert('로그인을 진행해주세요');
				return;
			}
			$(location).attr('href', '/yummymap/main/myList.mmy');
		});
		
	// txt update
	$('#update').click(function() {
		// 데이터 유효성 체크
		$('#frm').attr('action', '/yummymap/txt/edit.mmy');
		$('#frm').submit();
	});
	// txt delete
	$('#delete').click(function() {
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		var txtno = $('#txtno').val();
		$('#frm').attr('action', '/yummymap/txt/delete.mmy');
		$('#frm').submit();
		alert("삭제되었습니다.");
	});
	
	// reply button
	$('#rtxt').focusin(function(){
		$('#reply-btn').show();
	});
	// reply write
	$('#reply-btn').click(function() {
//		var txtno = $('.rrrno').attr('value');
		var txtno = $('#upno').val();
		replyWrite(txtno);
	});
	
	
//	$('#dislikebtn').click(() => $('#dislikebtn').hide());
//	$('#dislikebtn').click(() => $('#likebtn').show());
//	
//	$('#likebtn').click(() => $('#likebtn').hide());
			
	/*		
			function(){
		
		
		if($(this).hasClass("")){

		
		} else {
		
			$('.likebtn').show();
		$('.dislikebtn').hide();
		alert("좋아요 취소!");
	}
	});
	$('.likebtn').click(function(){
		$('.likebtn').show();
		$('.dislikebtn').hide();
		alert("좋아요!");
	});
	
*/
	
});		
			

/*	
	location.reload();
function reload(){
}*/
	
$(document).on('click','.rrrno',function(){
	var txtno = $(this).attr('value');
	replyDelete();
	
// reply delete ajax
function replyDelete(){
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	var upno = $('#upno').val();
	$.ajax({
		url: "/yummymap/txt/rDelete.mmy",
		type: 'post',
		dataType: 'json',
		data: {
			'txtno' : txtno,
			'upno' : upno
		},
		success: function(result){
			if(result){
				$('#'+'reno'+txtno).remove();
				alert("삭제되었습니다.");
				$('#reply-btn').hide();
			}
			console.log(result);
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
});

// reply write ajax
function replyWrite(txtno) {
	var mtxt = $('#rtxt').val();
	var mid = $('#mid').val();
	var upno = $('#upno').val();
//	var txtno = $('#upno').val();
//	var txtno = $('.rrrno').attr('value');
//	txtno = parsInt(txtno);
//	txtno = Integer.parseInt(txtno);
//	alert(mtxt);
//	alert(mid);
//	alert(upno);
//	alert(txtno);
	var param="mtxt="+mtxt+"&mid="+mid+"&upno="+upno;
  
 $.ajax({
	url: '/yummymap/txt/rWrite.mmy',
	type:'post',
	dataType: 'json',
	data: param,
	success: function(data){
//		if (data == 'success'){
			replyList();
			$('#rtxt').val('');
			$('#reply-btn').hide();
//		}
	},
	error:function(request, status, error){
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
 });
}


// reply list ajax
function replyList(){
	var txtno = $('#upno').val();
	
	$.ajax({
		url: "/yummymap/txt/rList.mmy",
		type: 'get',
		dataType: 'json',
		data: {
			'txtno' : txtno
		},
		success: function(result){
			var html = "";
			var len = result.length;
//			console.log(result);
//			var output = "<div>";
			
			if(len > 0){
				for(var i=0; i<len; i++){
//					$('#rList').prepend(
//					html += '<div class="reply-body mt-4 rply-box">'+
					html += 	'<div class="" id="reno'+result[i].txtno+'">';
					html += 	'<div class="d-flex reply-txt-1 mt-3">';
					html += 	'<p id="">'+result[i].mid+'</p>';
					html += 	'<p id="" class="pl-2">'+ result[i].cdate +'</p>';
					html += 	'</div>';
					html += 	'<div class="reply-txt-2 ">';
					html += 	'<p id="listReply" style="display:inline-block; width: 680px;">'+result[i].mtxt+'</p>';

//						'<c:if test="${data.mid eq sid}">'+
					html += 	'<a onclick="" class="btn btn-sm btn-outline-light rrrno" value="'+result[i].txtno+'">삭제</a>';
//						'</c:if>'+
					html += 	'</div>';
					html += 	'<div class="b-w border-bottom ml-5 mt-4" style="height: 0px;">'+'</div>';
					html += 	'</div>';
//						+'</div>'
//					)
				}
			} else {
				html += "<div>";
				html +=	"<div class='d-flex reply-txt-3'>등록된 댓글이 없습니다.";
				html += "</div>";
				html += "</div>";
			}
            $("#re-count").html(len);
            $("#rList").html(html);
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

// recommend ajax
function like(){
	var txtno = $('#upno').val();
	var rnum = $('#rnum').attr('value');
	var mid = $('#mid').val();
	alert(rnum);

	var param="txtno="+txtno+"&rnum="+rnum+"&mid="+mid;
	$.ajax({
		url: "/yummymap/txt/like.mmy",
		type: 'post',
		dataType: 'json',
		data: param,
		success: function(data){
			let str = data.result;
			$('#rnum').text(data.rnum);
			alert(data.rnum);
			
/*			if(data.rnum != rnum){
				alert("좋아요 취소!");
			} else {
				alert("좋아요!");
			}*/
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function getLike(){
	var txtno = $('#upno').val();
	var rnum = $('#rnum').attr('value');
//	alert(rnum);
//	rnum = parseInt(rnum);
	var param="txtno="+txtno+"&rnum="+rnum;
	$.ajax({
		url: "/yummymap/txt/likeCnt.mmy",
		type: 'post',
		dataType: 'json',
		data: param,
		success: function(data){
			$('#rnum').text(rnum);
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

$(function() {
	replyList();
	getLike();
});
