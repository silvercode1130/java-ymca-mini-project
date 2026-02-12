<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수집 및 동의</title>

<style type="text/css">
h1, h2 {
	 font-weight: bold;
}

/* ===== 이전으로 버튼 ===== */
input[type="button"][value="이전으로"] {
    height: 36px;
    padding: 0 16px;

    border-radius: 12px;
    border: none;

    background: #e0e0e0;
    color: #777;

    font-size: 14px;
    font-weight: 500;

    cursor: pointer;
    transition: background 0.2s ease, transform 0.1s ease;
}

input[type="button"][value="이전으로"]:hover {
    background: #d5d5d5;
}

input[type="button"][value="이전으로"]:active {
    transform: scale(0.97);
}

/* ===== 약관 테이블 ===== */
table {
    width: 100%;
    max-width: 520px;              /* 👉 가로 6 느낌 */
    margin: 20px 0;
    border-collapse: separate;
    border-spacing: 0;
    border: 1px solid #ccc;

    background: #fff;
    border-radius: 16px;
    overflow: hidden;              /* 둥근 모서리 유지 */
    box-shadow: 0 6px 18px rgba(0,0,0,0.06);

    font-size: 14px;
}

/* ===== 헤더 / 행 공통 ===== */
tr {
    background: #f2f2f2;
    
}

th, td {
    padding: 14px 16px;            /* 👉 세로 4 느낌 */
    text-align: left;
    line-height: 1.4;
    border-bottom: 1px solid #e6e6e6;
	border-right: 1px solid #e6e6e6;
    border-bottom: 1px solid #ccc;  /* ⭐ table border와 동일한 색으로 맞춤 */
    border-right: 1px solid #ccc;   /* ⭐ 좌우 빈 공간 해결 */

}

/* ===== 헤더 ===== */
th {
    font-weight: 700;
    color: #222;
    background: #e0e0e0;
}

/* 마지막 셀의 오른쪽 테두리 제거 */
td:last-child, th:last-child {
    border-right: none;
}

/* ===== 마지막 줄 테두리 제거 ===== */
tr:last-child td {
    border-bottom: none;
}

/* ===== 테이블 비율 안정화 ===== */
td:nth-child(1) { width: 30%; }
td:nth-child(2) { width: 40%; }
td:nth-child(3) { width: 30%; }

/* 첫 행은 table border가 있으니 위쪽 제거 */
tr:first-child th {
    border-top: none;
}

/* 첫 열은 table border가 있으니 왼쪽 제거 */
th:first-child,
td:first-child {
    border-left: none;
}

/* 마지막 열 오른쪽 제거 */
th:last-child,
td:last-child {
    border-right: none;
}

/* 마지막 행 아래 제거 */
tr:last-child td {
    border-bottom: none;
}
	
</style>

</head>
<body>
	<h2>개인정보 수집 및 이용 동의</h2>
	ㅇㅇ회사는 개인정보를 안전하게 취급하는데 최선을 다합니다. <br><br>
	<span style="font-weight: bold;">[필수] 개인정보 수집 및 이용 동의</span>

	<table border="1">
		<tr>
			<th>목적</th>
			<th>항목</th>
			<th>보유 기간</th>
		</tr>
		
		<tr>
			<td>회원가입에 따른 이용자 식별 및 회원관리</td>
			<td>이메일(아이디), 비밀번호, 닉네임, SNS간편가입 업체의 사용자별 고유키, 프로필 사진</td>
			<td>회원 탈퇴 후 지체 없이 삭제</td>
		</tr>
	</table>
	
	<br>
	<span style="font-weight: bold;">개인정보 수집 및 이용 동의를 거부할 권리</span>
	– 이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. <br>
	회원가입 시 수집하는 최소한의 개인정보 <br>
	 즉 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우 <br> 
	 회원가입이 어려울 수 있습니다. <br>
	 
	<div>
    	<input type="button"  value="이전으로"  onclick="history.back();">
    </div>
    
</body>
</html>
