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
			<img alt="(프로필 이미지)" src="${ profile.mem_img }" >
		</div>
		
		<div class="nickname">
			닉네임 <span style="color: gray;  font-size: 12px; ">${ profile.mem_nickname }</span>
		</div>
		
		<div class="intro">
			한줄 소개 <span style="color: gray;  font-size: 12px; ">${ profile.mem_intro }</span>
		</div>
		
		<div class="btn">
			<input type="button"  value="비밀번호 찾기"  onclick="location.href='/member/pwdFind.do'">
			<input type="button"  value="수정"  onclick="location.href='/update/myUpdate.do'">
		</div>
	</form>
	
	<form action="${pageContext.request.contextPath}/member/delete.do" method="post">
	    <button type="submit"
	            onclick="return confirm('탈퇴할꼬냥? 😿');">
	        탈퇴
	    </button>
	</form>
		
</body>
</html>