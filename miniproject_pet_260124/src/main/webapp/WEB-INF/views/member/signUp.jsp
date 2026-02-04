<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	회원가입 폼 == signUp.jsp	/  로그인 폼 == loginForm.jsp	 /    비번찾기 == pwdFind.jsp	  /   == emailLogin.jsp
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">

</style>

<script type="text/javascript">
	function send(f) {
		// 변수 선언
		let id 		= f.mem_id.value.trim();
		let pwd 	= f.mem_pwd.value.trim();
		let name  = f.mem_name.value.trim();
		let tel		= f.mem_tel.value.trim();
		let email  = f.mem_email.value.trim();
		
		f.action = "/member/signUp.do";		// 메인 홈(재웅님)
		f.submit();
		
	}
	
	
	
	// 초기화
	window.onload = function() {
	    // 전체동의를 누르면 필수동의만 체크 되는 기능
	    let all = document.querySelector("input[name='allAgree']");
	    let agrees = document.querySelectorAll("input[name='agree']");

	    all.onclick = function() {
	        agrees.forEach(a => a.checked = all.checked);
	    };

	    // 아이디 중복여부 확인하는 메시지 (창 x)
	    document.querySelector("#id").addEventListener("input", idCheck);

	    // 비밀번호 동일한지 확인하는 메시지 (창 x)
	    document.querySelector("#pwd").addEventListener("input", pwdMsg);
	    document.querySelector("#pwdCheck").addEventListener("input", pwdMsg);

	    // 회원가입 버튼 활성 / 비활성
	    document.querySelector("#id").addEventListener("input", checkValid);
	    document.querySelector("#pwd").addEventListener("input", checkValid);
	    document.querySelector("input[name='mem_name']").addEventListener("input", checkValid);
	    document.querySelector("input[name='mem_tel']").addEventListener("input", checkValid);
	    document.querySelector("input[name='mem_email']").addEventListener("input", checkValid);

	    // 전체 동의 체크했을 때도 유효성 검사 실행
	    document.querySelector("input[name='allAgree']").addEventListener("change", checkValid);

	    // 필수 동의 체크박스(개별)
	    agrees.forEach(a => {
	        a.addEventListener("change", checkValid);
	    });

	    // 회원가입 버튼 처음엔 비활성화
	    document.querySelector("input[name='signUp']").disabled = true;
	};
	
	
	
	// 아이디 중복 여부 체크
	function idCheck() {
			// 변수 선언
		    let id = document.querySelector("#id").value.trim();
		    let msg = document.querySelector("#idMsg");
	
		    // 미입력 시 메시지 안뜨게
		    if (id === "") {
		        msg.textContent = "";
		        return;
		    }
			
		    // 입력 시 일치 여부에 따른 메시지
		    fetch("/member/check_id.do?mem_id=" + id)
		        .then(r => r.json())
		        .then(data => {
		            if (data.result) {
		                msg.style.color = "gray";
		                msg.textContent = "✔ 사용 가능한 아이디입니다.";
		            } else {
		                msg.style.color = "red";
		                msg.textContent = "✘ 이미 사용 중인 아이디입니다.";
		            }
		        })
		        .catch(err => console.log("에러 발생:", err));
		}

	
	
	// 비밀번호 일치 여부 확인
	function pwdMsg() {
		// 변수 선언
		let pwd = document.querySelector("#pwd").value;
		let pwdCheck = document.querySelector("#pwdCheck").value;
		let pwdMsg = document.querySelector("#pwdMsg");
		
		// 미입력 시 메시지 안뜨게
		if (pwd === "" && pwdCheck === "") {
			pwdMsg.textContent = "";
			return;
		}
		
		// 입력 시 일치 여부에 따른 메시지
		if (pwd === pwdCheck) {
			pwdMsg.style.color="gray";
			pwdMsg.textContent = "✔ 비밀번호가 일치합니다.";
		}
		else {
			pwdMsg.style.color="red";
			pwdMsg.textContent = "✘ 비밀번호가 일치하지 않습니다.";
		}
	}

	
	
	// 필수 항목 체크 안되면 못 넘어가게 하는 기능
	function checkValid() {
	    // 변수 선언
	    let id = document.querySelector("#id").value.trim();
	    let pwd = document.querySelector("#pwd").value.trim();
	    let name = document.querySelector("input[name='mem_name']").value.trim();
	    let tel = document.querySelector("input[name='mem_tel']").value.trim();
	    let email = document.querySelector("input[name='mem_email']").value.trim();

	    // 필수 동의 체크 박스 (name='agree')
	    let agrees = document.querySelectorAll("input[name='agree']");

	    let agree1 = agrees[0].checked;
	    let agree2 = agrees[1].checked;
	    let agree3 = agrees[2].checked;

	    let btn = document.querySelector("input[name='signUp']");

	    // 모든 값을 입력해야 버튼 활성화
	    let isValid =
	        id !== "" &&
	        pwd !== "" &&
	        name !== "" &&
	        tel !== "" &&
	        email !== "" &&
	        agree1 && agree2 && agree3;

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

	<form class="signUp"  f.action="/member/signUp.do";>		<!-- 테스트 중이여서 get임 -->
		<!-- <img alt="(웹 로고)" src="/images/miniProject01_logo_practice.png"> -->
		<div class="title">
			<h2>회원가입</h2>
		</div>
		
		<span style="font-size: 12px; color: #888888">간편하게 회원가입</span>
		<!-- 간편 회원가입 버튼 -->
		<div class="api">	<!-- #추가 링크(API 필요?) + 로고 필요 -->
			<input type="button" value="네이버로 회원가입" onclick="">
		</div>
		
		<div class="api">
			<input type="button" value="구글로 회원가입" onclick="">
		</div>
		
		<div class="api">
			<input type="button" value="애플로 회원가입" onclick="">
		</div>
		
		<hr>
		
		<!-- 그냥 가입하기 -->
		<h2>이메일로 회원가입</h2>
		
		<div class="id">     
			<input name="mem_id"  id="id"  type="text"  placeholder="아이디">
			<span id="idMsg" style="font-size:12px; margin-top:4px;"></span>
		</div>
		
		<div class="pwd">
			<input name="mem_pwd"  id="pwd"  type="password"  placeholder="비밀번호">
		</div>
		
		<div class="pwdCheck">
			<input name="pwdCheck"   id="pwdCheck"  type="password"  placeholder="비밀번호 확인">
			<span id="pwdMsg"  style="font-size:12px; margin-top:4px;"></span>
		</div>

		<div class="name">
			<input name="mem_name" type="text"  placeholder="이름">
		</div>
		
		<div class="bday">
			<input name="mem_bday" type="date"  placeholder="생년월일">
		</div>
		
		<div class="tel">
			<input name="mem_tel" type="text"  placeholder="연락처">
		</div>
		
		<div class="email">
			<input name="mem_email" type="email" placeholder="이메일">
		</div>
		
		<div class="agree">
			<input type="checkbox" name="allAgree" >전체 동의
		</div>
		
		<div class="agree">
			<input type="checkbox" name="agree" >서비스 이용약관 동의
			<input type="button" name="btn" value="내용보기" onclick="location.href='/agree/agreeService.do'">	
		</div>
		
		<div class="agree">
			<input type="checkbox" name="agree" >개인정보 수집 및 동의
			<input type="button" name="btn" value="내용보기"  onclick="location.href='/agree/agreePrivacy.do'">	
		</div>
		
		<div class="agree">
			<input type="checkbox" name="agree" >만 14세 이상입니다
		</div>
		
		<div class="agree">
			<input type="checkbox" name="agree" >(선택)마케팅 정보 수신 동의
			<input type="button" name="btn" value="내용보기"  onclick="location.href='/agree/agreeMarketing.do'">
		</div>
		
		<span style="font-size: 12px; color: #E74C3C;">⚠️ 필수 동의사항에 동의해야 회원가입이 가능합니다.</span>
		
		<div class="btn">
			<input type="button" name="signUp" value="회원가입"  onclick="send(this.form);">
		</div>	
		
	<%-- <c:if test="${param.error == '1'}">
			<script>
			    alert('❌ 회원가입에 실패했습니다.');
			</script>
		</c:if> --%>
		
		
	</form>
</body>
</html>