<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="login-container">
	  <h2>로그인</h2>
	  
	  <!-- 에러 메시지 -->
	  <c:if test="${not empty loginError}">
	    <div class="alert alert-danger">${loginError}</div>
	  </c:if>
	  <c:if test="${not empty loginSuccess}">
	    <div class="alert alert-success">${loginSuccess}</div>
	  </c:if>
	  
	  <form action="${pageContext.request.contextPath}/member/login.do" method="post">
	    <div class="form-group">
	      <input type="text" name="mem_id" placeholder="아이디" required>
	    </div>
	    <div class="form-group">
	      <input type="password" name="mem_pwd" placeholder="비밀번호" required>
	    </div>
	    <button type="submit" class="btn btn-primary">로그인</button>
	  </form>
	  
	  <div class="login-links">
	    <a href="${pageContext.request.contextPath}/member/join_form.do">회원가입</a>
	  </div>
	</div>

		
</body>
</html>