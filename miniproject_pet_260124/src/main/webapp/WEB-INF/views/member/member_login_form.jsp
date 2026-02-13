<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>
    <title>펫온 로그인 | PetOn Login</title>
    <style>
        /* 리액트 Tailwind → 순수 CSS 완벽 변환 */
        .login-container {
            min-height: calc(100vh - 80px); background: rgba(251, 191, 36, 0.05);
            display: flex; align-items: center; justify-content: center; padding: 48px 16px;
        }
        .login-card {
            background: white; border-radius: 24px; box-shadow: 0 20px 60px -10px rgba(0,0,0,0.1);
            padding: 32px; width: 100%; max-width: 448px; border: 1px solid rgba(251, 191, 36, 0.2);
            backdrop-filter: blur(10px);
        }
        .title-section {
            text-align: center; margin-bottom: 32px;
        }
        .user-icon {
            width: 48px; height: 48px; background: #f59e0b; border-radius: 9999px;
            display: flex; align-items: center; justify-content: center; margin: 0 auto 16px;
            color: white; box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);
        }
        .login-title {
            font-size: 28px; font-weight: 800; color: #111827; margin: 0 0 4px 0;
        }
        .login-subtitle {
            color: #6b7280; font-size: 14px; margin: 0; font-weight: 400;
        }
        .form-group {
            margin-bottom: 16px;
        }
        .label {
            display: block; font-size: 14px; font-weight: 700; color: #374151; margin-bottom: 8px;
        }
        .input-wrapper {
            position: relative;
        }
        .input-field {
            width: 100%; padding: 12px 16px 12px 44px; background: #f9fafb; border: 1px solid #e5e7eb;
            border-radius: 12px; font-size: 16px; transition: all 0.2s ease; height: 52px;
        }
        .input-field:focus {
            outline: none; border-color: #f59e0b; background: white;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.1);
        }
        .input-field::placeholder { color: #9ca3af; }
        .input-icon {
            position: absolute; left: 16px; top: 50%; transform: translateY(-50%);
            color: #9ca3af; font-size: 18px; pointer-events: none;
        }
        .password-toggle {
            position: absolute; right: 16px; top: 50%; transform: translateY(-50%);
            background: none; border: none; color: #9ca3af; font-size: 18px;
            cursor: pointer; padding: 4px; border-radius: 6px; transition: all 0.2s;
        }
        .password-toggle:hover { background: rgba(245, 158, 11, 0.1); color: #f59e0b; }
        .login-button {
            width: 100%; padding: 16px; background: #f59e0b; color: white; border: none;
            border-radius: 12px; font-size: 16px; font-weight: 700; cursor: pointer;
            margin-top: 4px; box-shadow: 0 4px 14px rgba(245, 158, 11, 0.4);
            transition: all 0.2s ease; height: 56px; position: relative;
        }
        .login-button:hover:not(:disabled) {
            background: #eab308; transform: translateY(-1px); box-shadow: 0 8px 20px rgba(245, 158, 11, 0.5);
        }
        .login-button:active:not(:disabled) { transform: translateY(0); }
        .login-button:disabled {
            background: #d1d5db; color: #9ca3af; cursor: not-allowed; box-shadow: none;
            transform: none;
        }
        .links-container {
            display: flex; align-items: center; justify-content: center; gap: 16px;
            margin-top: 24px; font-size: 14px;
        }
        .link-item {
            color: #6b7280; text-decoration: none; font-weight: 500; padding: 4px 8px;
            transition: color 0.2s ease; border-radius: 6px;
        }
        .link-item:hover { color: #f59e0b; background: rgba(245, 158, 11, 0.05); }
        .divider { height: 3px; width: 1px; background: #d1d5db; }
        .error-message {
            margin-top: 20px; padding: 16px; background: linear-gradient(135deg, #fee2e2, #fecaca);
            border: 2px solid #fca5a5; border-radius: 12px; color: #dc2626; font-weight: 500;
            text-align: center; animation: shake 0.6s ease-in-out;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-4px); }
            20%, 40%, 60%, 80% { transform: translateX(4px); }
        }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="login-container">
  <div class="login-card">
    
    <!-- 상단 섹션 -->
    <div class="title-section">
      <div class="user-icon">👤</div>
      <h2 class="login-title">로그인</h2>
      <p class="login-subtitle">PetOn에 오신 것을 환영합니다!</p>
    </div>

    <!-- 폼 -->
    <form name="emailLoginForm" method="post" action="${pageContext.request.contextPath}/member/login.do">
     <input type="hidden" name="redirect" value="${param.redirect}" />
      
      <!-- 아이디 -->
      <div class="form-group">
        <label class="label">아이디</label>
        <div class="input-wrapper">
          <input type="text" id="mem_id" name="mem_id" 
                 placeholder="아이디를 입력해주세요" required autocomplete="username"
                 class="input-field" />
          <span class="input-icon">👤</span>
        </div>
      </div>

      <!-- 비밀번호 -->
      <div class="form-group">
        <label class="label">비밀번호</label>
        <div class="input-wrapper">
          <input type="password" id="mem_pwd" name="mem_pwd" 
                 placeholder="비밀번호를 입력해주세요" required autocomplete="current-password"
                 class="input-field" />
          <span class="input-icon">🔒</span>
          <button type="button" class="password-toggle" onclick="togglePassword('mem_pwd')" title="비밀번호 표시">
            👁️
          </button>
        </div>
      </div>

      <!-- 로그인 버튼 -->
      <button type="submit" name="emailLogin" class="login-button" disabled>로그인</button>

      <!-- 하단 링크 -->
      <div class="links-container">
        <a href="${pageContext.request.contextPath}/member/pwdFind.do" class="link-item">아이디 찾기</a>
        <span class="divider"></span>
        <a href="${pageContext.request.contextPath}/member/pwdFind.do" class="link-item">비밀번호 찾기</a>
        <span class="divider"></span>
        <a href="${pageContext.request.contextPath}/member/signUpForm.do" class="link-item">회원가입</a>
      </div>

    </form>

    <!-- 에러 -->
    <!-- 로그인 실패 관련 -->
	<c:if test="${param.reason eq 'fail' or param.reason eq 'id_null'}">
	  <div class="error-message">
	    <c:choose>
	      <c:when test="${param.reason eq 'fail'}">아이디 또는 비밀번호가 틀립니다.</c:when>
	      <c:when test="${param.reason eq 'id_null'}">아이디를 입력해주세요!</c:when>
	      <c:otherwise>로그인에 실패했습니다. 다시 시도해주세요.</c:otherwise>
	    </c:choose>
	  </div>
	</c:if>
	
	<!-- 단순 안내: 로그인 필요 -->
	<c:if test="${param.reason eq 'need_login'}">
	  <div class="error-message" style="background: linear-gradient(135deg,#fef9c3,#fef3c7); border-color:#facc15; color:#92400e;">
	    로그인 후 이용 가능한 기능입니다.
	  </div>
	</c:if>


  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>

// 상태 관리
let idValue = '';
let pwdValue = '';
let showPassword = false;

// DOM 준비
document.addEventListener('DOMContentLoaded', function() {
    const idInput = document.getElementById('mem_id');
    const pwdInput = document.getElementById('mem_pwd');
    const loginBtn = document.querySelector('.login-button');
    
    // 입력 이벤트 (리액트 onChange 동일)
    idInput.addEventListener('input', updateId);
    pwdInput.addEventListener('input', updatePwd);
    
    // 초기 비활성 (팀원 기능)
    toggleButton(false);
});

// ID 업데이트 (리액트 setId 동일)
function updateId(e) {
    idValue = e.target.value;
    checkValidity();
}

// PWD 업데이트 (리액트 setPassword 동일)
function updatePwd(e) {
    pwdValue = e.target.value;
    checkValidity();
}

// 유효성 체크 (리액트 isFormValid + 팀원 checkValid 통합)
function checkValidity() {
    const isValid = idValue.trim().length > 0 && pwdValue.length > 0;
    toggleButton(isValid);
}

// 버튼 상태 토글 (리액트 disabled + 팀원 opacity)
function toggleButton(isValid) {
    const btn = document.querySelector('.login-button');
    btn.disabled = !isValid;
    if (isValid) {
        btn.style.opacity = '1';
        btn.style.cursor = 'pointer';
    } else {
        btn.style.opacity = '0.6';
        btn.style.cursor = 'not-allowed';
    }
}

// 비밀번호 토글 (리액트 showPassword 동일)
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    showPassword = !showPassword;
    input.type = showPassword ? 'text' : 'password';
}

// Enter 제출 (리액트 handleSubmit)
document.addEventListener('keypress', function(e) {
    if (e.key === 'Enter' && !document.querySelector('.login-button').disabled) {
        document.querySelector('form[name="emailLoginForm"]').submit();
    }
});
</script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
