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

        // 서버로 아이디 조회 요청
        fetch(`/member/check_id.do?mem_id=${encodeURIComponent(memId)}`)
            .then(res => res.json()) // 컨트롤러에서 Map<String, Boolean> 반환
            .then(data => {
                if(data.result === true) {
                    alert("존재하지 않는 아이디입니다!");
                    authenticated = false;
                } else {
                    alert("본인 확인 완료!");
                    authenticated = true;
                    // 숨겨진 비밀번호 발급 섹션 표시
                    document.getElementById("passwordSection").style.display = "block";
                }
            })
            .catch(err => {
                console.error("아이디 조회 실패:", err);
                alert("조회 중 오류가 발생했습니다.");
            });
    }

    // 랜덤 비밀번호 생성
    function generateRandomPassword() {
        if(!authenticated) {
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

    <!-- 본인인증 버튼 -->
    <button type="button" onclick="doAuthentication()">본인인증 하기</button>

    <br><br>

    <!-- 숨겨진 비밀번호 발급 섹션 -->
    <div id="passwordSection" style="display:none;">
        <input type="text" id="randomOutput" readonly placeholder="버튼을 클릭하세요.">
        <button type="button" onclick="generateRandomPassword()">비밀번호 받기</button>
    </div>
</body>
</html>
