/**
@author 유태희
@since 2020.05.23
 	이 JS는 관리자 회원관리 페이지에 사용할 JavaScript 입니다
 */

function search() {
	let sel = $('#opt').val();
	let scname = $('#search-input').val();

	if (sel == 'nos' && scname) {
		alert('조건을 선택하세요!!');
		return;
	}
	if (sel != 'nos' && !scname) {
		alert('검색어를 입력하세요');
		return;
	}
	if (sel == 'idch') {
		$('#mid').val(scname);
		$('#opts').val(sel);
	} else {
		$('#mname').val(scname);
		$('#opts').val(sel);
	}

	$('#frm').attr('action', '/yummymap/admin/member.mmy');
	$('#frm').submit();
}

$(function() {
	let mno;
	$('.obtn').click(function() {
		let no = $(this).parents().parents().attr('id');
		search();
		$('#no').val(no);
		$('#frm').attr('action', '/yummymap/admin/memberEdit.mmy');
		$('#frm').submit();
	});

	$('.pbtn').click(function() {
		let page = $(this).text();
		search();
		$('#nowPage').val(page);
		$('#frm').attr('action', '/yummymap/admin/member.mmy');
		$('#frm').submit();

	});

	$('.next').click(function() {
		let page = $(this).attr('id');
		let sel = $('#opt').val();
		let scname = $('#search-input').val();
		$('#searchs').val(scname);
		$('#opts').val(sel);
		$('#nowPage').val(page);
		$('#frm').attr('action', '/yummymap/admin/member.mmy');
		$('#frm').submit();
	});

	$('.pre').click(function() {
		let page = $(this).attr('id');
		let sel = $('#opt').val();
		let scname = $('#search-input').val();
		$('#searchs').val(scname);
		$('#opts').val(sel);
		$('#nowPage').val(page);
		$('#frm').attr('action', '/yummymap/admin/member.mmy');
		$('#frm').submit();
	});

	$('#sbtn').click(search);
	$('#search-input').keydown(function(key) {
		if (key.keyCode == 13) {
			search();
			return;
		}
	});

	/*	$('#opt').change(function(){
	 let val = $(this).val();
	 alert(val);
	
	 if(val == 'namech') {
	 $('#search-input').attr('name' ,'mname');
	 }else if(val == 'idch'){
	 $('#search-input').attr('name' ,'mid');
	
	 }
	 });*/
	$('.rbtn').click(function() {
		mno = $(this).parents().parents().attr('id');
		$('#no').val(no);
		let id = $(this).parents().prevAll('.mid').text();
		$('.modal-body').html('<b>' + id + '</b> 해당 계정을 정말 삭제 하시겠습니까? ');
	});

	$('#rmbtn').click(function() {
		$('#no').val(mno);
		$('#frm').attr('action', '/yummymap/admin/memberDelProc.mmy	');
		$('#frm').submit();
	});
});
