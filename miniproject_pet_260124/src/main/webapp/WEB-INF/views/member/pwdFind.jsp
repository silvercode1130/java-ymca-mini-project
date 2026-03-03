<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 발급</title>
<script type="text/javascript">
    let authenticated = false;

    // 본인인증 클릭 시
	function doAuthentication() {
	    const memId = document.getElementById("memIdInput").value.trim();
	    if(memId === "") {
	        alert("아이디를 입력해주세요!");
	        return;
	    }

	    // ❌ 비밀번호 불일치
	    if (!user.getMem_pwd().equals(mem_pwd)) {
	        return "redirect:loginForm.do?reason=fail";
	    }
	
	    fetch("/member/check_id.do?mem_id=" + encodeURIComponent(memId))
	        .then(res => res.json())
	        .then(data => {
	            if(data.result === true) {
	                alert("존재하지 않는 아이디입니다!");
	            } else {
	                alert("본인 확인 완료!");
	                // 🔑 인증 상태를 DOM에 저장
	                document.getElementById("passwordSection").dataset.auth = "true";
	                document.getElementById("passwordSection").style.display = "block";
	            }
	        });
	}
	
	function generateRandomPassword() {
	    const auth = document.getElementById("passwordSection").dataset.auth;
	
	    if(auth !== "true") {
	        alert("본인인증 후 발급 가능합니다.");
	        return;
	    }
	
	    const randomNum = Math.floor(Math.random() * 10000);
	    const password = randomNum.toString().padStart(4, "0");
	    document.getElementById("randomOutput").value = password;
	    alert("임시 비밀번호가 발급되었습니다!");
	}
</script>

</head>
<body>
    <h2>임시 비밀번호 발급</h2>

    <!-- 아이디 입력 -->
    <input type="text" id="memIdInput" placeholder="아이디 입력">

    <!-- 본인인증 버튼 --><!-- #보류 - 지금 로그인한 아이디만 인증 가능 기능 -->
    <button type="button" onclick="doAuthentication()">본인인증 하기</button>

    <br><br>

    <!-- 숨겨진 비밀번호 발급 섹션 -->
    <div id="passwordSection" style="display:none;"><!-- #보류 - 인증할 때 받은 비번을 진짜로 db값에 저장 -->
        <input type="text" id="randomOutput" readonly placeholder="버튼을 클릭하세요.">
        <button type="button" onclick="generateRandomPassword()">비밀번호 받기</button>
    </div>
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
