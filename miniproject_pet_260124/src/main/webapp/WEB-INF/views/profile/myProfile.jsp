<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필 - href</title>
</head>
<body>
	<form action="">
		<div class="MyProfileImg">
			<img alt="(프로필 이미지)" src="${mem_img}" >
		</div>
		
		<div class="nickname">
			닉네임 <span>${ mem_nickname }</span>
		</div>
		
		<div class="intro">
			한줄 소개 <span>${ mem_intro }</span>
		</div>
		
		<div class="btn">
			<input type="button"  value="비밀번호 찾기"  onclick="location.href='/member/pwdFind.do'">
			<input type="button"  value="수정"  onclick="location.href='/update/myUpdate.do'">
		</div>
	</form>
	
	<!-- #연결 - 메인홈(재웅님)이랑 연결이 안되어 있어서 404 에러 뜸 -->
	<form action="/logout.do" method="post"><!-- Controller 리턴 타입 변경!! -->
	    <button type="submit">로그아웃</button>
	</form>
	
	<!-- #연결 - 메인홈(재웅님)이랑 연결이 안되어 있어서 404 에러 뜸 -->
	<form action="/myDelete.do" method="post"><!-- Controller 리턴 타입 변경!! -->
	    <button type="submit">탈퇴</button>
	</form>
		
</body>
</html>