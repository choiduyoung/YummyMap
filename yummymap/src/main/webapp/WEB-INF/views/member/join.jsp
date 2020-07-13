<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<link rel="stylesheet" href="/yummymap/css/register.css">
<link rel="stylesheet" href="/yummymap/css/nav.css">
<link rel="stylesheet" href="/yummymap/css/bootstrap.min.css">
<link rel="stylesheet" href="/yummymap/css/main/nav.css">
<script src="/yummymap/js/jquery-3.5.0.min.js"></script>
<script src="/yummymap/js/member/register.js"></script>

</head>
<style>

</style>
<body style="width: 40%; float:none; margin:0 auto;">
<!-- nav 영역입니다-->
<div class="bg-white border-bottom nav-body">
  <div class=" mt-2 nav-btn">
      <div class="member_nav text-right mt-3">
          <div class="ctQZg">
              <div class="_47KiJ">
                  <div class="XrOey"><a class="_0ZPOP kIKUG _4700r " href="#"><svg aria-label="활동 피드"
                              class="_8-yf5 " fill="#262626" height="24" viewBox="0 0 48 48" width="24">
                              <path
                                  d="M34.6 6.1c5.7 0 10.4 5.2 10.4 11.5 0 6.8-5.9 11-11.5 16S25 41.3 24 41.9c-1.1-.7-4.7-4-9.5-8.3-5.7-5-11.5-9.2-11.5-16C3 11.3 7.7 6.1 13.4 6.1c4.2 0 6.5 2 8.1 4.3 1.9 2.6 2.2 3.9 2.5 3.9.3 0 .6-1.3 2.5-3.9 1.6-2.3 3.9-4.3 8.1-4.3m0-3c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5.6 0 1.1-.2 1.6-.5 1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z">
                              </path>
                          </svg></a>
                      <div class="_0Sl_t">
                          <div class="poA5q" style="margin-left: -423px;"></div>
                      </div>
                  </div>
                  <div class="XrOey"><a href="/yummymap/join/join.mmy"><svg aria-label="프로필" class="_8-yf5 " fill="#262626" height="24"
                              viewBox="0 0 48 48" width="24">
                              <path
                                  d="M24 26.7c7.4 0 13.4-6 13.4-13.4S31.4 0 24 0 10.6 6 10.6 13.4s6 13.3 13.4 13.3zM24 3c5.7 0 10.4 4.6 10.4 10.4S29.7 23.7 24 23.7s-10.4-4.6-10.4-10.4S18.3 3 24 3zm9.1 27.1H14.9c-7.4 0-13.4 6-13.4 13.4v3c0 .8.7 1.5 1.5 1.5s1.5-.7 1.5-1.5v-3c0-5.7 4.6-10.4 10.4-10.4h18.3c5.7 0 10.4 4.6 10.4 10.4v3c0 .8.7 1.5 1.5 1.5s1.5-.7 1.5-1.5v-3c-.1-7.4-6.1-13.4-13.5-13.4z">
                              </path>
                          </svg></a></div>
              </div>
              <!-- <a href="#" class="badge badge-light nav-item" id="join">Join</a>-->
              <a href="/yummymap/join/login.mmy" class="badge badge-light nav-item" id="login">LOGIN</a>
          </div>
      </div>
  </div>
  <a class="navbar-brand tcolor logo" href="/yummymap/main.mmy" >
      YUMMY MAP
  </a>
  <div class="b-subtitle text-left"><p class="pt-3">회원가입</p></div>
  <div class=" nav-item-1 d-flex justify-content-end">
      <a class="navbar-brand nav-item-size" href="#" id="">
          <i class="fas fa-gamepad"></i>
      </a>
      <a class="navbar-brand nav-item-size" href="#">
          <i class="far fa-clipboard"></i>
      </a>
  </div>
</div>
<!-- nav 마지막 입니다-->
<!-- body 시작 입니다-->
  <div class="main-body mb-5">
    <div class="m-box mt-4">
      <form id="frm" action="/yummymap/member/joinProc.mmy" method="POST">
        <div class="form-group">
          <label for="id" class="idlabel mr-2 d-inline-block">아이디</label>
          <button type="button" id="idcheck" class="btn btn-secondary btn-sm d-inline-block mb-1">아이디 체크</button>
          <input type="text" class="form-control ckinput" id="mid" name="mid">
          <small id="idmsg" class="text-secondary d-block">첫글자 영문자, 영문자 혹은 숫자 조합 5~13자리 입력</small>
          <small id="idmsg1" class="dnone d-block"></small>
          <small id="idmsg2" class="dnone d-block"></small>
        </div>
        <div class="form-group">
          <label for="pw">비밀번호</label>
          <input type="password" class="form-control ckinput" id="mpw" name="mpw">
          <small id="pwmsg" class="text-secondary d-block">첫글자 영문자, 영문+숫자+특수문자 조합 8~15자리 입력</small>
          <small id="pwmsg1" class="text-danger">비밀번호 패턴을 확인해주세요</small>
        </div>
        <div class="form-group">
          <label for="repw">비밀번호 재입력</label>
          <input type="password" class="form-control ckinput" id="repw">
          <small id="repwmsg" class="dnone"></small>
        </div>
        <div class="form-group">
          <label for="repw">이름</label>
          <input type="text" class="form-control ckinput" id="mname" name="mname">
        </div>
        <div class="form-group">
          <label for="mtel">휴대전화</label>
          <div class="d-flex">
            <select class="form-control" name="teltop">
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="017">017</option>
              <option value="019">019</option>
            </select>
            <p>-</p>
            <input type="text" class="form-control ckinput" id="mtel" name="mtel">
            <p>-</p>
            <input type="text" class="form-control ckinput" id="telend" name="telend">
          </div>
        </div>
        <div class="form-group">
          <label for="memail" class="idlabel mr-2 d-inline-block">이메일</label>
          <button type="button" class="btn btn-secondary btn-sm d-inline-block mb-1" id="sendmail">이메일 인증</button>
          <div class="d-flex">
            <input type="text" class="form-control ckinput" id="memail" name="memail">

          </div>
          <div class="mt-2 d-none" id="mailckBox">
	          <input class="p-1" type="text" id="malick" name="mailck" placeholder="인증번호를 입력하세요">
	           <span id="mailckBox"><button type="button" class="btn btn-secondary btn-sm d-inline-block mb-1" id="eokbtn">이메일 인증 확인</button></span>
          </div>
          <small id="mailmsg" class="text-danger" >이메일 인증을 진행해주세요</small>
        </div>
      </form>
      <div class="btn-box">
        <div class="mt-5">
          <button type="button" class="btn btn-primary joinbtn" id="joinbtn">회원 가입 완료</button>
        </div>
        <div class="mt-2 pt-2">
          <a  href="/yummymap/main.mmy" class="btn btn-secondary homebtn ">홈화면 가기</a>
        </div>
      </div>
    </div>
  </div>
<!-- body 마지막 입니다-->
</body>
</html>