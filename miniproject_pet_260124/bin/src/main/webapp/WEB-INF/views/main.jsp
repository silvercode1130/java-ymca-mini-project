<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>펫온: 반려동물 종합 플랫폼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">

</head>
<body class="layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main">
    <!-- 상단 히어로 배너 영역 -->
    <section class="hero-section">
        <div class="hero-banner">
            <div class="hero-slider" id="mainHeroSlider">
                <!-- 슬라이드 1 -->
                <div class="hero-slide" data-slide-index="0">
                    <div class="hero-bg-image hero-bg-1"></div>
                    <div class="hero-overlay"></div>
                    <div class="hero-content-wrap">
                        <div class="hero-content">
                            <span class="hero-tag">EVENT</span>
                            <h2 class="hero-title">2026 펫페스타 개최</h2>
                            <p class="hero-subtitle">사랑하는 반려동물과 함께하는 축제</p>
                            <a href="${pageContext.request.contextPath}/event/festa2026" class="btn btn-primary hero-cta">
                                이벤트 보러가기
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 슬라이드 2 -->
                <div class="hero-slide" data-slide-index="1">
                    <div class="hero-bg-image hero-bg-2"></div>
                    <div class="hero-overlay"></div>
                    <div class="hero-content-wrap">
                        <div class="hero-content">
                            <span class="hero-tag">SHOP</span>
                            <h2 class="hero-title">하림 펫푸드 세일 이벤트</h2>
                            <p class="hero-subtitle">우리 아이 건강을 위한 선택</p>
                            <a href="${pageContext.request.contextPath}/shop/event/harim" class="btn btn-primary hero-cta">
                                특가 상품 확인하기
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 슬라이드 3 -->
                <div class="hero-slide" data-slide-index="2">
                    <div class="hero-bg-image hero-bg-3"></div>
                    <div class="hero-overlay"></div>
                    <div class="hero-content-wrap">
                        <div class="hero-content">
                            <span class="hero-tag">NEWS</span>
                            <h2 class="hero-title">반려동물 보호법, 이렇게 바뀝니다</h2>
                            <p class="hero-subtitle">꼭 알아야 할 2026년 개정안</p>
                            <a href="${pageContext.request.contextPath}/lab/news/pet-law-2026" class="btn btn-primary hero-cta">
                                뉴스 보러가기
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 슬라이더 컨트롤 -->
            <div class="hero-controls">
                <button type="button" class="hero-arrow hero-arrow-prev" aria-label="이전 배너"></button>
                <div class="hero-dots">
                    <button type="button" class="hero-dot is-active" data-target-index="0" aria-label="1번 배너"></button>
                    <button type="button" class="hero-dot" data-target-index="1" aria-label="2번 배너"></button>
                    <button type="button" class="hero-dot" data-target-index="2" aria-label="3번 배너"></button>
                </div>
                <button type="button" class="hero-arrow hero-arrow-next" aria-label="다음 배너"></button>
            </div>
        </div>
    </section>

    <!-- 자주 찾는 서비스 -->
    <section class="section section-shortcuts">
        <div class="section-inner">
            <h3 class="section-title">
                <span class="section-title-bar"></span>
                자주 찾는 서비스
            </h3>
            <div class="shortcut-grid shortcut-grid-8">
                <div class="shortcut-card">
                    <div class="shortcut-icon">🏥</div>
                    <span class="shortcut-title">동물병원</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">✂️</div>
                    <span class="shortcut-title">미용</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">🐱</div>
                    <span class="shortcut-title">펫시터</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">🐕</div>
                    <span class="shortcut-title">훈련소</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">🌈</div>
                    <span class="shortcut-title">장례</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">🏠</div>
                    <span class="shortcut-title">입양</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">📄</div>
                    <span class="shortcut-title">보험</span>
                </div>
                <div class="shortcut-card">
                    <div class="shortcut-icon">🦮</div>
                    <span class="shortcut-title">산책</span>
                </div>
            </div>
        </div>
    </section>

    <!-- 쇼핑몰 추천 상품 -->
    <section class="section section-shop">
        <div class="section-inner">
            <div class="section-header">
                <h3 class="section-title best-title">이번 주 인기 상품 🏆</h3>
				<p class="section-subtitle">집사님들이 가장 많이 선택한 베스트셀러</p>
                <a href="${pageContext.request.contextPath}/shop" class="section-link">전체 보기</a>
            </div>
            <div class="card-grid">
                <c:forEach var="item" items="${todayRecommendList}">
                    <a href="${pageContext.request.contextPath}/shop/item/detail?itemIdx=${item.item_idx}"
                       class="item-card">
                        <div class="item-thumb">
                            <img src="${item.item_thumbnail_img}" alt="${item.item_name}">
                            <span class="item-tag item-tag-for-${item.item_for}">${item.item_for}</span>
                        </div>
                        <div class="item-info">
                            <p class="item-name">${item.item_name}</p>
                            <div class="item-meta">
                                <span class="item-meta-star">★ 4.9</span>
                                <span class="item-meta-count">(1,234)</span>
                            </div>
                            <p class="item-price">
                                <span class="item-price-sale">10%</span>
                                <span class="item-price-now">
                                    <fmt:formatNumber value="${item.item_now_price}" type="number"/>원
                                </span>
                                <c:if test="${item.item_origin_price > item.item_now_price}">
                                    <span class="item-price-origin">
                                        <fmt:formatNumber value="${item.item_origin_price}" type="number"/>원
                                    </span>
                                </c:if>
                            </p>
                        </div>
                    </a>
                </c:forEach>
                <c:if test="${empty todayRecommendList}">
                    <div class="item-card placeholder-box">
                        오늘의 추천 상품을 준비 중입니다.
                    </div>
                </c:if>
            </div>
        </div>
    </section>

    <!-- 커뮤니티 최신글 / QnA 최신글 -->
    <section class="section section-community">
        <div class="section-inner section-inner-flex community-wrap">
            <div class="section-block community-block">
                <div class="section-header">
                    <h3 class="section-title community-title">커뮤니티 최신글 🔥</h3>
                    <a href="${pageContext.request.contextPath}/board?type=FREE" class="section-link">더 보기</a>
                </div>
                <ul class="board-list board-list-card">
                    <c:forEach var="post" items="${latestCommunityList}">
                        <li>
                            <a href="${pageContext.request.contextPath}/board/detail?boardIdx=${post.board_idx}">
                                <div class="board-card">
                                    <div class="board-card-header">
                                        <span class="board-tag-pill board-tag-${post.board_tag}">
                                            ${post.board_tag}
                                        </span>
                                        <span class="board-date">
                                            <fmt:formatDate value="${post.board_regdate}" pattern="yyyy.MM.dd"/>
                                        </span>
                                    </div>
                                    <div class="board-card-title">${post.board_title}</div>
                                    <div class="board-card-meta">
                                        <span>조회 ${post.board_readhit}</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${empty latestCommunityList}">
                        <li class="board-empty">최신 커뮤니티 글이 없습니다.</li>
                    </c:if>
                </ul>
            </div>

            <div class="section-block community-block">
                <div class="section-header">
                    <h3 class="section-title">QnA 최신글</h3>
                    <a href="${pageContext.request.contextPath}/board?type=QNA" class="section-link">더 보기</a>
                </div>
                <ul class="board-list board-list-card">
                    <c:forEach var="qna" items="${latestQnaList}">
                        <li>
                            <a href="${pageContext.request.contextPath}/board/detail?boardIdx=${qna.board_idx}">
                                <div class="board-card">
                                    <div class="board-card-header">
                                        <span class="board-tag-pill">QnA</span>
                                        <span class="board-date">
                                            <fmt:formatDate value="${qna.board_regdate}" pattern="yyyy.MM.dd"/>
                                        </span>
                                    </div>
                                    <div class="board-card-title">${qna.board_title}</div>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    <c:if test="${empty latestQnaList}">
                        <li class="board-empty">등록된 QnA 글이 없습니다.</li>
                    </c:if>
                </ul>
            </div>
        </div>
    </section>
</main>

<!-- 오른쪽 플로팅 툴박스 -->
<aside class="floating-toolbox">
    <button type="button" class="toolbox-btn" title="내 정보">
        <span class="toolbox-icon">👤</span>
    </button>
    <button type="button" class="toolbox-btn" title="알림">
        <span class="toolbox-icon">🔔</span>
    </button>
    <button type="button" class="toolbox-btn" title="설정">
        <span class="toolbox-icon">⚙️</span>
    </button>
    <div class="toolbox-divider"></div>
    <button type="button" class="toolbox-btn" id="btnScrollTop" title="맨 위로">
        <span class="toolbox-icon">↑</span>
    </button>
    <button type="button" class="toolbox-btn" id="btnScrollBottom" title="맨 아래로">
        <span class="toolbox-icon">↓</span>
    </button>
</aside>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
