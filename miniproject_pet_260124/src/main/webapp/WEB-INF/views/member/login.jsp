<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일로 로그인</title>

<style type="text/css">

</style>

<script type="text/javascript">
	 function send(f) {
		// 변수 선언
		let id = f.id.value.trim();
		let pwd = f.pwd.value.trim();
		
		f.action = "/main.do";		// #수정 - 메인 홈(재웅님)  member/emailLoginForm
		f.submit();
		
	} 
	
	
	// 초기화
	window.onload = function() {	// 페이지가 로드되면 {}를 실행해
		// 로그인버튼 활성 / 비활성
		document.querySelector("#mem_id").addEventListener("input", checkValid);		// id="id" 인 애 값이 입력되면 function 실행해
		document.querySelector("#mem_pwd").addEventListener("input", checkValid);	// function checkVaild() {}
		
		document.querySelector("input[name='emailLogin']").disabled = true;		// 비활성화
	}
	
	
	// 필수 항목 체크 안되면 못 넘어가게 하는 기능
	function checkValid() {
		// 변수 선언
		let id = document.querySelector("#mem_id").value.trim();
		let pwd = document.querySelector("#mem_pwd").value.trim();
		let btn = document.querySelector("input[name='emailLogin']");

		
		// 모든 값을 입력해야 버튼 활성화
		let isValid =
			id != "" &&
			pwd != "";
		
		// 버튼 활성화 / 비활성화
		btn.disabled = !isValid;
		
		// 비활성화 시 css 변경
		if (!isValid) {
			btn.style.opacity = "0.5";
			btn.style.cursor = "not-allowed";
		}
		else {
			btn.style.opacity = "1";
			btn.style.cursor = "pointer";
		}
	}
	
	
	
	
	
</script>

</head>
<body>
	<form class="emailLogin"  action="/member/login.do"   >
		<div class="title">
			<h2>이메일 로그인</h2>
		</div>
		
		<div class="id">
			<input type="text"  id="mem_id" name="mem_id"  placeholder="아이디"> 
		</div>
		
		<div class="pwd">
			<input type="text"  id="mem_pwd"  name="mem_pwd"  placeholder="비밀번호">
		</div>
		
		<div class="btn">
			<input type="submit" value="로그인" name="emailLogin">
		</div>
		
		<div class="login-links">
		    <a href="pwdFind.do">비밀번호 찾기</a>
		    <span>│</span>
		    <a href="signUpForm.do">회원가입</a>
		</div>
	
	</form>
</body>
</html>
