<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">
/* ===== 공통 ===== */
* {
    box-sizing: border-box;
    font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

body {
    margin: 0;
    padding: 0;
    background: #fafafa;
    color: #333;
}

/* ===== 회원가입 전체 카드 ===== */
form {
    width: 420px;
    margin: 80px auto;
    padding: 40px 32px;
    background: #ffffff;
    border-radius: 18px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
}

/* ===== 타이틀 ===== */
.title h2 {
    margin: 0 0 28px;
    text-align: center;
    font-size: 26px;
    font-weight: 700;
    color: #222;
}

/* ===== input 공통 ===== */
input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"],
input[type="date"] {
    width: 100%;
    height: 46px;
    margin-bottom: 10px;
    padding: 0 14px;
    border-radius: 10px;
    border: 1px solid #ddd;
    font-size: 14px;
    outline: none;
    transition: all 0.2s ease;
    background-color: #fff;
}

/* date 아이콘 위치 보정 */
input[type="date"]::-webkit-calendar-picker-indicator {
    cursor: pointer;
    opacity: 0.6;
}

input::placeholder {
    color: #aaa;
}

input:focus {
    border-color: #f4c430;
    box-shadow: 0 0 0 3px rgba(244, 196, 48, 0.25);
}

/* ===== 메시지 영역 ===== */
#mem_idMsg,
#mem_pwdMsg {
    font-size: 13px;
    margin-bottom: 10px;
}

/* ===== 약관 텍스트 줄 간격 조정 ===== */
.agree {
    line-height: 1.4;     		 /* 기본보다 살짝 타이트 */
    margin-bottom: 6px;    /* 줄 사이 여백 줄이기 */
}

/* 체크박스 + 텍스트 정렬 보정 */
.agree input[type="checkbox"] {
    vertical-align: middle;
    margin-right: 6px;
}

/* ===== 약관 내용보기 버튼 ===== */
.agree button,
.agree input[type="button"] {
    height: 28px;
    padding: 0 10px;
    margin-left: 6px;
    margin-bottom: 6px; 
    
    border-radius: 8px;
    border: none;
    
    background: #ddd;
    color: #888;
    
    font-size: 12px;
    font-weight: 500;
    
    cursor: pointer;
    vertical-align: middle;
    transition: all 0.2s ease;
}

.agree button:hover,
.agree input[type="button"]:hover {
    background: #ffe08a;
}

/* ===== 회원가입 버튼 ===== */
input[name="signUp"] {
    width: 100%;
    height: 52px;
    margin-top: 24px;
    background: linear-gradient(180deg, #ffd95a, #f4c430);
    border: none;
    border-radius: 16px;
    font-size: 17px;
    font-weight: 700;
    color: #fff;
    cursor: pointer;
    transition: all 0.2s ease;
}

input[name="signUp"]:hover:not(:disabled) {
    background: #e5b800;
    filter: brightness(1.05);
}

input[name="signUp"]:active:not(:disabled) {
    transform: scale(0.98);
}

/* ===== 비활성화 버튼 ===== */
input[name="signUp"]:disabled {
    background: #ddd;
    color: #888;
}

/* ===== 약관 링크 ===== */
.agree-box a {
    color: #f4c430;
    text-decoration: none;
    font-weight: 500;
}

.agree-box a:hover {
    text-decoration: underline;
}

</style>

<script type="text/javascript">
	function send(f) {
		// 변수 선언
		let mem_id 		= f.mem_id.value.trim();
		let mem_pwd 	= f.mem_pwd.value.trim();
		let mem_name  = f.mem_name.value.trim();
		let mem_tel		= f.mem_tel.value.trim();
		let mem_email  = f.mem_email.value.trim();
		
		// 2. 유효성 체크 (생략된 부분 코코가 짠 대로 유지)
	    if(mem_id == "") { alert("아이디를 입력하세요"); return; }

	    // 3. 전송 설정
	    f.method = "post"; // 확실하게 post 명시
		f.action = "/member/signUp.do";		// 메인 홈(재웅님)으로 연결 x
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
	    document.querySelector("#mem_id").addEventListener("input", idCheck);

	    // 비밀번호 동일한지 확인하는 메시지 (창 x)
	    document.querySelector("#mem_pwd").addEventListener("input", pwdMsg);
	    document.querySelector("#mem_pwdCheck").addEventListener("input", pwdMsg);

	    // 회원가입 버튼 활성 / 비활성
	    document.querySelector("#mem_id").addEventListener("input", checkValid);
	    document.querySelector("#mem_pwd").addEventListener("input", checkValid);
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
		    let mem_id = document.querySelector("#mem_id").value.trim();
		    let mem_msg = document.querySelector("#mem_idMsg");
	
		    // 미입력 시 메시지 안뜨게
		    if (mem_id === "") {
		        mem_msg.textContent = "";
		        return;
		    }
			
		    // 입력 시 일치 여부에 따른 메시지
		    fetch("/member/check_id.do?mem_id=" + mem_id)
		        .then(r => r.json())
		        .then(data => {
		            if (data.result) {
		                mem_msg.style.color = "gray";
		                mem_msg.textContent = "✔ 사용 가능한 아이디입니다.";
		            } else {
		                mem_msg.style.color = "red";
		                mem_msg.textContent = "✘ 이미 사용 중인 아이디입니다.";
		            }
		        })
		        .catch(err => console.log("에러 발생:", err));
		}

	
	
	// 비밀번호 일치 여부 확인
	function pwdMsg() {
		// 변수 선언
		let mem_pwd = document.querySelector("#mem_pwd").value;
		let mem_pwdCheck = document.querySelector("#mem_pwdCheck").value;
		let mem_pwdMsg = document.querySelector("#mem_pwdMsg");
		
		// 미입력 시 메시지 안뜨게
		if (mem_pwd === "" && mem_pwdCheck === "") {
			mem_pwdMsg.textContent = "";
			return;
		}
		
		// 입력 시 일치 여부에 따른 메시지
		if (mem_pwd === mem_pwdCheck) {
			mem_pwdMsg.style.color="gray";
			mem_pwdMsg.textContent = "✔ 비밀번호가 일치합니다.";
		}
		else {	
			mem_pwdMsg.style.color="red";
			mem_pwdMsg.textContent = "✘ 비밀번호가 일치하지 않습니다.";
		}
	}

	
	
	// 필수 항목 체크 안되면 못 넘어가게 하는 기능
	function checkValid() {
	    // 변수 선언
	    let mem_id = document.querySelector("#mem_id").value.trim();
	    let mem_pwd = document.querySelector("#mem_pwd").value.trim();
	    let mem_name = document.querySelector("input[name='mem_name']").value.trim();
	    let mem_tel = document.querySelector("input[name='mem_tel']").value.trim();
	    let mem_email = document.querySelector("input[name='mem_email']").value.trim();

	    // 필수 동의 체크 박스 (name='agree')
	    let agrees = document.querySelectorAll("input[name='agree']");

	    let agree1 = agrees[0].checked;
	    let agree2 = agrees[1].checked;
	    let agree3 = agrees[2].checked;

	    let btn = document.querySelector("input[name='signUp']");

	    // 모든 값을 입력해야 버튼 활성화		
	    let isValid =
	    	mem_id !== "" &&
	    	mem_pwd !== "" &&
	    	mem_name !== "" &&
	    	mem_tel !== "" &&
	    	mem_email !== "" &&
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

	<!-- <form class="signUp"  f.action="/member/signUp.do";  method="post">		 -->
	<form class="signUp"  action="/member/signUp.do" method="post">
		<!-- <img alt="(웹 로고)" src="/images/miniProject01_logo_practice.png"> -->
		<div class="title">
			<h2>회원가입</h2>
		</div>
		
		<div class="id">     
			<input name="mem_id"  id="mem_id"  type="text"  placeholder="아이디">
			<span id="mem_idMsg" style="font-size:12px; margin-top:4px;"></span>
		</div>
		
		<div class="pwd">
			<input name="mem_pwd"  id="mem_pwd"  type="password"  placeholder="비밀번호">
		</div>
		
		<div class="pwdCheck">
			<input name="pwdCheck"  id="mem_pwdCheck"  type="password"  placeholder="비밀번호 확인">
			<span id="mem_pwdMsg"  style="font-size:12px; margin-top:4px;"></span>
		</div>

		<div class="name">
			<input name="mem_name"  id="mem_name"  type="text"  placeholder="이름">
		</div>
		
		<div class="bday">
			<input name="mem_bday"  id="mem_bday"  type="date"  placeholder="생년월일">
		</div>
		
		<div class="tel">
			<input name="mem_tel"  id="mem_tel"  type="text"  placeholder="연락처">
		</div>
		
		<div class="email">
			<input name="mem_email"  id="mem_email" type="email" placeholder="이메일">
		</div>
		
		<div class="agree">
			<input type="checkbox"  id="allAgree"   name="allAgree" >전체 동의
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
				
	</form>
</body>
</html>