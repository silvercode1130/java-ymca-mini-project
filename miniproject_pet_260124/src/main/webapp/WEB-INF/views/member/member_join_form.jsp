<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/join.do" method="post">
	  아이디: <input type="text" name="mem_id"><br>
	  비밀번호: <input type="password" name="mem_pwd"><br>
	  이름: <input type="text" name="mem_name"><br>
	  전화번호: <input type="text" name="mem_tel"><br>
	  이메일: <input type="text" name="mem_email"><br>
	  생년월일: <input type="text" name="mem_bday" placeholder="YYYY-MM-DD"><br>
	  <button type="submit">회원가입</button>
	</form>
		
</body>
</html>