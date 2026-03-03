<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="site-header bg-white border-b border-gray-100 shadow-sm">

  <div class="header-inner">

    <!-- 로고 영역 -->
    <div class="logo-area cursor-pointer" onclick="location.href='${pageContext.request.contextPath}/';">
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
          <a href="${pageContext.request.contextPath}/qna/list.do" class="gnb-link">커뮤니티</a>
        </li>
        <li class="gnb-item has-mega" data-menu="service">
          <a href="${pageContext.request.contextPath}/service" class="gnb-link">서비스</a>
        </li>
      </ul>
    </nav>

    <!-- 우측 유저 영역 (Tailwind 스타일 이식) -->
    <div class="header-user hidden md:flex items-center gap-2">
      <c:choose>
        <c:when test="${empty sessionScope.user}">
          <!-- 비로그인: 로그인 / 회원가입 -->
          <a href="${pageContext.request.contextPath}/member/loginForm.do"
             class="px-5 py-2 bg-amber-400 text-white font-bold rounded-full hover:bg-amber-500 shadow-md transition-all transform hover:-translate-y-0.5 text-sm">
            로그인
          </a>
          <a href="${pageContext.request.contextPath}/member/signUpForm.do"
             class="px-5 py-2 border-2 border-amber-400 text-amber-500 font-bold rounded-full hover:bg-amber-50 transition-colors text-sm">
            회원가입
          </a>
        </c:when>
        <c:otherwise>
          <!-- 로그인: 마이페이지 / 장바구니 / 로그아웃 -->
          <div class="flex items-center gap-2">
            <!-- 마이페이지 -->
            <button type="button"
                    class="flex items-center gap-2 px-3 py-2 text-gray-600 hover:text-amber-500 hover:bg-amber-50 rounded-lg transition-colors"
                    onclick="location.href='/mypage';">
              <span class="w-5 h-5 rounded-full bg-gray-200 flex items-center justify-center text-xs">👤</span>
              <span class="font-bold text-sm">마이페이지</span>
            </button>

            <div class="w-px h-4 bg-gray-200"></div>

            <!-- 장바구니 -->
            <button type="button"
                    class="flex items-center gap-2 px-3 py-2 text-gray-600 hover:text-amber-500 hover:bg-amber-50 rounded-lg transition-colors relative"
                    onclick="location.href='/cart';">
              <span class="w-5 h-5 rounded-full bg-gray-200 flex items-center justify-center text-xs">🛍</span>
              <span class="font-bold text-sm">장바구니</span>
              <span class="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full border border-white"></span>
            </button>

            <div class="w-px h-4 bg-gray-200"></div>

            <!-- 로그아웃 -->
            <a href="${pageContext.request.contextPath}/member/logout.do"
               class="px-5 py-2 bg-amber-400 text-white font-bold rounded-full hover:bg-amber-500 shadow-md transition-all transform hover:-translate-y-0.5 text-sm">
              로그아웃
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <!-- 모바일 토글 -->
    <button type="button" class="btn-gnb-toggle md:hidden" id="btnGnbToggle" aria-label="메뉴 열기">
      <span></span><span></span><span></span>
    </button>
  </div>

  <!-- 메가메뉴 영역 (기존 구조 유지) -->
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
          <a href="#" class="mega-item">
            <span class="mega-item-title">기업소개</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/notice/list.do" class="mega-item">
            <span class="mega-item-title">공지사항</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/event/list.do" class="mega-item">
            <span class="mega-item-title">이벤트</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 연구소 -->
        <div class="mega-group" data-menu="lab">
          <a href="${pageContext.request.contextPath}/lab/list.do" class="mega-item">
            <span class="mega-item-title">추천 연구</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/lab/list.do?tag=DOG" class="mega-item">
            <span class="mega-item-title">강아지 연구소</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/lab/list.do?tag=CAT" class="mega-item">
            <span class="mega-item-title">고양이 연구소</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 쇼핑몰 -->
        <div class="mega-group" data-menu="shop">
          <a href="${pageContext.request.contextPath}/item/search.do?item_for=dog" class="mega-item">
            <span class="mega-item-title">강아지 용품</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/item/search.do?item_for=cat" class="mega-item">
            <span class="mega-item-title">고양이 용품</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 커뮤니티 -->
        <div class="mega-group" data-menu="community">
          <a href="${pageContext.request.contextPath}/qna/list.do" class="mega-item">
            <span class="mega-item-title">Q&A</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="${pageContext.request.contextPath}/free/list.do" class="mega-item">
            <span class="mega-item-title">자유게시판</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>

        <!-- 서비스 -->
        <div class="mega-group" data-menu="service">
          <a href="#" class="mega-item">
            <span class="mega-item-title">고객문의 안내</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="#" class="mega-item">
            <span class="mega-item-title">자주 묻는 질문</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="#" class="mega-item">
            <span class="mega-item-title">1:1 문의</span>
            <span class="mega-item-bar"></span>
          </a>
          <a href="#" class="mega-item">
            <span class="mega-item-title">AS 안내</span>
            <span class="mega-item-bar"></span>
          </a>
        </div>
      </div>
    </div>
  </div>
  
  <script>
    window.addEventListener('load', function() {
        // 1. 세션에 저장된 돌아갈 주소가 있는지 확인 (JSTL 사용)
        <c:if test="${not empty sessionScope.redirectURL and not empty sessionScope.user}">
            // 2. 로그인도 되어 있고, 가야 할 주소도 있다면?
            const targetURL = "${sessionScope.redirectURL}";
            
            // 3. 기록을 지워줘뎡 (안 그러면 로그인할 때마다 계속 그리로 가뎡!)
            <% session.removeAttribute("redirectURL"); %>
            
            // 4. 원래 가려던 장바구니 담기 주소로 슝!
            location.href = targetURL;
        </c:if>
    });
</script>
  
</header>