/**
@author 유태희
@since 2020.05.24
 	이 JS는 관리자 게시글 상세 보기 페이지에 사용할 JavaScript 입니다
*/

$(function(){
	$('#lbtn').click(function(){
		$('#frm').attr('action','/yummymap/admin/boardList.mmy');
		$('#frm').submit();
	});
	
	$('#delete').click(function(){
		$('#staticBackdrop').modal();

	});
	
	$('#rmbtn').click(function(){
		$('#frm').attr('action','/yummymap/admin/checkDel.mmy');
		$('#frm').submit();
	});
});