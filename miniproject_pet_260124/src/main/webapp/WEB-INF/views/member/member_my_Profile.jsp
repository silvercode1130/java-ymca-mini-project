<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/mypage/update.do" method="post">
	  <!-- 프로필 -->
	  닉네임: <input type="text" name="mem_nickname" value="${profile.mem_nickname}"><br>
	  한줄소개: <input type="text" name="mem_intro" value="${profile.mem_intro}"><br>
	
	  <!-- 주소 -->
	  우편번호: <input type="text" name="mem_zipcode" value="${addr.mem_zipcode}"><br>
	  주소: <input type="text" name="mem_addr" value="${addr.mem_addr}"><br>
	  상세주소: <input type="text" name="mem_addr_detail" value="${addr.mem_addr_detail}"><br>
	
	  <button type="submit">수정하기</button>
	</form>
		
</body>
</html>