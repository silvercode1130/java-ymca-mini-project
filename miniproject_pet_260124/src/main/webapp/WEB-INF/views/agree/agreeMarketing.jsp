<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(선택)마케팅 정보 수신 동의</title>

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
	
</style>

</head>
<body>
	<h1>마케팅 수신 동의</h1>
	<h2>1. 광고성 정보의 이용목적</h2>
	ㅇㅇ회사가 제공하는 이용자 맞춤형 서비스 및 상품 추천, 각종 경품 행사, 이벤트 등의 <br>
	광고성 정보를 전자우편이나 서신우편, 문자(SMS 또는 카카오 알림톡), <br>
	푸시, 전화 등을 통해 이용자에게 제공합니다. <br><br>

	– 마케팅 수신 동의는 거부하실 수 있으며 동의 이후에라도 고객의 의사에 따라 동의를 철회할 수 있습니다. <br>
	   동의를 거부하시더라도 ㅇㅇ회사가 제공하는 서비스의 이용에 제한이 되지 않습니다. <br>
	   단 할인, 이벤트 및 이용자 맞춤형 상품 추천 등의 마케팅 정보 안내 서비스가 제한됩니다. <br>
	
	<h2>2. 미동의 시 불이익 사항</h2>
	개인정보보호법 제22조 제5항에 의해 선택정보 사항에 대해서는 <br>
	동의 거부하시더라도 서비스 이용에 제한되지 않습니다. <br>
	단 할인, 이벤트 및 이용자 맞춤형 상품 추천 등의 마케팅 정보 안내 서비스가 제한됩니다. <br>
	
	<h2>3. 서비스 정보 수신 동의 철회</h2>
	ㅇㅇ회사가 제공하는 마케팅 정보를 원하지 않을 경우 "마이페이지 > 회원 정보 수정"에서 철회를 요청할 수 있습니다. <br>
	또한 향후 마케팅 활용에 새롭게 동의하고자 하는 경우에는 ‘마이페이지 > 회원 정보 수정’에서 동의하실 수 있습니다. <br><br>

	시행일자 : 2019. 01. 01 <br>
	
	<div>
    	<input type="button"  value="이전으로"  onclick="history.back();">
    </div>

</body>
</html>