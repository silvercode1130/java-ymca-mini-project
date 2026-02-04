<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">

</style>

<script type="text/javascript">
	// 필요한가..? 글쎄...
</script>

</head>
<body>										
	<form class="login" action="" >
		<div class="title">
			<h2>로그인</h2>
		</div>
			<span style="font-size: 12px; color: #888888">간편하게 로그인</span>
		
		<!-- 간편 로그인 버튼 -->
		<div class="api">	<!-- #추가 링크(API 필요?) + 로고 필요 -->
			<input type="button" value="네이버로 로그인" onclick="">
		</div>
		
		<div class="api">
			<input type="button" value="구글로 로그인" onclick="">
		</div>
		
		<div class="api">
			<input type="button" value="애플로 로그인"  onclick="">
		</div>
		
		<hr>
		
		<!-- #추가 - 가입 시키기(db) -->
		<div class="btn"><!-- #변경 + 연결 - onclick=메인홈(재웅님) -->
			<input type="button"  value="이메일로 로그인"  onclick="location.href='/member/emailLogin.do'">
		</div>
		
	</form>
</body>
</html>