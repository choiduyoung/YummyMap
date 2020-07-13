/**
@author 유태희
@since 2020.05.24
 	이 JS는 관리자 게시글관리 페이지에 사용할 JavaScript 입니다
*/
function search(){
		let sel =	$('#opt').val();
		let scname = $('#search-input').val();
		
		if(sel == 'nos' && scname){
			alert('조건을 선택하세요!!');
			return;
		}
		if(sel != 'nos' && !scname){
			alert('검색어를 입력하세요');
			return;
		}
		
		if(sel == 'idch'){
			$('#mid').val(scname);
			$('#opts').val(sel);
		}else {
			$('#title').val(scname);
			$('#opts').val(sel);
		}
		
		$('#frm').attr('action','/yummymap/admin/boardList.mmy');
		$('#frm').submit();
		
}
$(function(){
	let txtnos = [];
	let tno;
	
	
	$('.pbtn').click(function(){
		let page = $(this).text();
		$('#nowPage').val(page);
		search();
		$('#frm').attr('action','/yummymap/admin/boardList.mmy');
		$('#frm').submit();
	});
	
	$('.next').click(function(){
		let aa= $(this).attr('id');

		search();
		$('#nowPage').val(aa);
		$('#frm').attr('action','/yummymap/admin/boardList.mmy');
		$('#frm').submit();
	});
	
	$('.pre').click(function(){
		search();
		let aa = $(this).attr('id');
		$('#nowPage').val(aa);
		$('#frm').attr('action','/yummymap/admin/boardList.mmy');
		$('#frm').submit();
	});
	
	$('#sbtn').click(function(){
			$('#nowPage').val(1);
			search();
	});
	
	$('#search-input').keydown(function(key){
		if(key.keyCode == 13){
			$('#nowPage').val(1);
			search();
			return;
		}
	});
	$('#allck').click(function(){
		$("input:checkbox").attr('checked','checked');
		
	});
	$('.rbtn').click(function(){
		tno = $(this).parent().prevAll('.ckd').attr('id');
		$('.modal-body').text('해당 게시글을 정말 삭제 하시겠습니까?');
	});
	

	$('#allremve').click(function(){
		$("input:checkbox[name='no']:checked").each(function(){
			txtnos.push($(this).val());	
		});
		if(txtnos.length == 0){
			alert('선택을 먼저 부탁드립니다');
			return;
		}
		
		let inid = $('#search-input').val();
		let opt = $('#opt').val();
		$('#searchs').val(inid);
		$('#opts').val(opt);
		$('#txtno').val(txtnos); 
		$('#frm').attr('action','/yummymap/admin/boardDel.mmy');
		$('#frm').submit();
		
		
/*		$.ajax({
			url: '/yummymap/admin/checkDel.mmy',
			type: 'post',
			datatype: 'text',
			data:{
				'txtno' : txtnos
			},
			error : function(){
				alert('통신에러 ㅜ ㅜ');
			}
			
		});*/
		
	});
	
	$('#rmbtn').click(function(){
		let inid = $('#search-input').val();
		let opt = $('#opt').val();
		$('#searchs').val(inid);
		$('#opts').val(opt);
		$('#txtno').val(tno); 
		$('#frm').attr('action','/yummymap/admin/boardDel.mmy');
		$('#frm').submit();
	});
	
	$('.title').click(function(){
		
		tno = $(this).parent().prevAll('.ckd').attr('id');
		let inid = $('#search-input').val();
		let opt = $('#opt').val();
		$('#searchs').val(inid);
		$('#opts').val(opt);
		$('#txtno').val(tno); 
		$('#frm').attr('action','/yummymap/admin/boardDetail.mmy');
		$('#frm').submit();
		
	});
});