<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="site-header">
  <div class="header-inner">

    <!-- 로고 영역 -->
    <div class="logo-area" onclick="location.href='${pageContext.request.contextPath}/';" style="cursor:pointer;">
      <div class="logo-circle">
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
             xmlns="http://www.w3.org/2000/svg">
          <path d="M12 2C13.1 2 14 2.9 14 4V5H10V4C10 2.9 10.9 2 12 2ZM8.5 7C9.33 7 10 6.33 10 5.5C10 4.67 9.33 4 8.5 4C7.67 4 7 4.67 7 5.5C7 6.33 7.67 7 8.5 7ZM15.5 7C16.33 7 17 6.33 17 5.5C17 4.67 16.33 4 15.5 4C14.67 4 14 4.67 14 5.5C14 6.33 14.67 7 15.5 7ZM12 7.5C14 7.5 15.8 8.1 17 9.2C17.7 8.5 18.6 8 19.5 8C21.4 8 23 9.6 23 11.5C23 13.2 21.8 14.6 20.2 14.9C20.1 17.5 18 19.6 15.4 19.9C15.8 20.5 16 21.2 16 22H8C8 21.2 8.2 20.5 8.6 19.9C6 19.6 3.9 17.5 3.8 14.9C2.2 14.6 1 13.2 1 11.5C1 9.6 2.6 8 4.5 8C5.4 8 6.3 8.5 7 9.2C8.2 8.1 10 7.5 12 7.5Z"
                fill="currentColor"/>
        </svg>
      </div>
      <div class="logo-text-wrap">
        <span class="logo-main">PetOn</span>
        <span class="logo-sub">PET INFO PLATFORM</span>
      </div>
    </div>

    <!-- GNB -->
    <nav class="gnb" aria-label="주 메뉴">
      <ul class="gnb-list">
        <li class="gnb-item has-mega" data-menu="home">
          <a href="${pageContext.request.contextPath}/" class="gnb-link">홈</a>
        </li>
        <li class="gnb-item has-mega" data-menu="lab">
          <a href="${pageContext.request.contextPath}/lab/list.do" class="gnb-link">연구소</a>
        </li>
        <li class="gnb-item has-mega" data-menu="shop">
          <a href="${pageContext.request.contextPath}/shop" class="gnb-link">쇼핑몰</a>
        </li>
        <li class="gnb-item has-mega" data-menu="community">
          <a href="${pageContext.request.contextPath}/community" class="gnb-link">커뮤니티</a>
        </li>
        <li class="gnb-item has-mega" data-menu="service">
          <a href="${pageContext.request.contextPath}/service" class="gnb-link">서비스</a>
        </li>
      </ul>
    </nav>

    <!-- 우측 로그인/회원가입 -->
    <div class="header-user">
      <c:choose>
        <c:when test="${empty sessionScope.loginMember}">
          <a href="${pageContext.request.contextPath}/member/loginForm.do" class="btn btn-login">로그인</a>
          <a href="${pageContext.request.contextPath}/member/signUpForm.do" class="btn btn-join">회원가입</a>
        </c:when>
        <c:otherwise>
          <span class="header-welcome">
            <c:out value="${sessionScope.loginMember.mem_name}" />님
          </span>
          <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-logout">로그아웃</a>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- 모바일 토글 -->
    <button type="button" class="btn-gnb-toggle" id="btnGnbToggle" aria-label="메뉴 열기">
      <span></span><span></span><span></span>
    </button>
  </div>

  <!-- 메가메뉴 영역 -->
  <div class="mega-wrap" id="megaWrap">
    <div class="mega-inner">
      <div class="mega-intro">
        <h3 class="mega-title" id="megaTitle">홈</h3>
        <p class="mega-desc" id="megaDesc">
          PetOn의 새로운 소식을 확인하세요.
        </p>
      </div>
      <div class="mega-links">
        <!-- 홈 -->
        <div class="mega-group" data-menu="home">
          <a href="${pageContext.request.contextPath}/about" class="mega-item">
            <span class="mega-item-title">기업소개</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/board?type=NOTICE" class="mega-item">
            <span class="mega-item-title">공지사항</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/board?type=EVENT" class="mega-item">
            <span class="mega-item-title">이벤트</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 연구소 -->
        <div class="mega-group" data-menu="lab">
          <a href="${pageContext.request.contextPath}/lab/recommend" class="mega-item">
            <span class="mega-item-title">추천 연구</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/lab/dog" class="mega-item">
            <span class="mega-item-title">강아지 연구소</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/lab/cat" class="mega-item">
            <span class="mega-item-title">고양이 연구소</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/lab/news" class="mega-item">
            <span class="mega-item-title">뉴스</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 쇼핑몰 -->
        <div class="mega-group" data-menu="shop">
          <a href="${pageContext.request.contextPath}/shop?cat=dog-food" class="mega-item">
            <span class="mega-item-title">강아지 사료/간식</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/shop?cat=cat-food" class="mega-item">
            <span class="mega-item-title">고양이 사료/간식</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/shop?cat=toy" class="mega-item">
            <span class="mega-item-title">용품/장난감</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/shop?cat=hygiene" class="mega-item">
            <span class="mega-item-title">위생/배변</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 커뮤니티 -->
        <div class="mega-group" data-menu="community">
          <a href="${pageContext.request.contextPath}/board?type=QNA" class="mega-item">
            <span class="mega-item-title">Q&A</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/board?type=FREE" class="mega-item">
            <span class="mega-item-title">자유게시판</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/board?type=INFO" class="mega-item">
            <span class="mega-item-title">정보공유</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/board?type=SHOW" class="mega-item">
            <span class="mega-item-title">펫자랑</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 서비스 -->
        <div class="mega-group" data-menu="service">
          <a href="${pageContext.request.contextPath}/support/notice" class="mega-item">
            <span class="mega-item-title">고객문의 안내</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/support/faq" class="mega-item">
            <span class="mega-item-title">자주 묻는 질문</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/support/inquiry" class="mega-item">
            <span class="mega-item-title">1:1 문의</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/support/as" class="mega-item">
            <span class="mega-item-title">AS 안내</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
</header>
