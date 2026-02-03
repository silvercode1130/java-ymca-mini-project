<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>펫온 연구소 | PetOn Laboratory</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
</head>
<body class="layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main">
    <!-- Lab 헤더 -->
    <section class="lab-hero-section">
        <div class="lab-hero-inner">
            <div class="lab-hero-card">
                <div class="lab-hero-bg-icon">
                    <!-- 단순 SVG 아이콘으로 대체 -->
                    <svg width="260" height="260" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M9 2v2l-3 6v8a4 4 0 0 0 4 4h4a4 4 0 0 0 4-4v-8l-3-6V2H9zm2 2h2v2.1l2.4 4.8H8.6L11 6.1V4z"/>
                    </svg>
                </div>

                <div class="lab-hero-text">
                    <span class="lab-hero-badge">PetOn Laboratory</span>
                    <h1 class="lab-hero-title">반려동물 연구소 🧪</h1>
                    <p class="lab-hero-desc">
                        수의사와 반려동물 전문가들이 직접 검증한 믿을 수 있는 정보.<br>
                        우리 아이의 건강하고 행복한 삶을 위한 연구 결과를 확인하세요.
                    </p>
                </div>

                <div class="lab-hero-search">
                    <h3 class="lab-search-title">궁금한 내용을 검색해보세요</h3>
                    <div class="lab-search-box">
                        <span class="lab-search-icon">🔍</span>
                        <input type="text"
                               class="lab-search-input"
                               placeholder="예: 분리불안, 사료 추천">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 카테고리 탭 (정적인 UI) -->
    <section class="section">
        <div class="section-inner">
            <div class="lab-tabs-wrap">
                <div class="lab-tabs">
                    <button type="button" class="lab-tab is-active">
                        <span class="lab-tab-icon">🧪</span>
                        <span class="lab-tab-label">전체 연구</span>
                    </button>
                    <button type="button" class="lab-tab">
                        <span class="lab-tab-icon">🐶</span>
                        <span class="lab-tab-label">강아지 연구소</span>
                    </button>
                    <button type="button" class="lab-tab">
                        <span class="lab-tab-icon">🐱</span>
                        <span class="lab-tab-label">고양이 연구소</span>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- 오늘의 추천 연구 (상단 대표 카드) -->
    <section class="section">
        <div class="section-inner">
            <div class="section-header">
                <div class="section-title-wrap">
                    <span class="section-title-index"></span>
                    <h2 class="section-title">오늘의 추천 연구</h2>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/lab/detail?labIdx=1"
               class="lab-featured-card">
                <div class="lab-featured-thumb">
                    <img src="https://images.unsplash.com/photo-1701513519108-b0a234f26161?ixlib=rb-4.1.0&q=80&w=1080"
                         alt="반려견 건강검진, 몇 살부터 시작해야 할까요?">
                </div>
                <div class="lab-featured-body">
                    <div class="lab-featured-tags">
                        <span class="lab-tag lab-tag-amber">건강</span>
                        <span class="lab-tag lab-tag-gray">
                            🐶 강아지
                        </span>
                    </div>
                    <h3 class="lab-featured-title">
                        반려견 건강검진, 몇 살부터 시작해야 할까요?
                    </h3>
                    <p class="lab-featured-desc">
                        많은 보호자들이 궁금해하는 건강검진 시기와 항목. 연령별 필수 검진 항목과
                        주의사항을 수의학 전문의가 상세하게 알려드립니다. 조기 발견이 장수의 지름길입니다.
                    </p>
                    <div class="lab-featured-meta">
                        <div class="lab-author">
                            <span class="lab-author-avatar"></span>
                            <span class="lab-author-name">김하림 수의사</span>
                        </div>
                        <span class="lab-date">2026.01.30</span>
                    </div>
                </div>
            </a>
        </div>
    </section>

    <!-- 연구 리스트 (지금은 목업 데이터 그대로 JSP에 하드코딩) -->
    <section class="section">
        <div class="section-inner">
            <div class="lab-grid">
                <!-- 1 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,dog"
                             alt="강아지 분리불안, 3일 만에 개선하는 훈련법">
                        <span class="lab-type-badge lab-type-dog">🐶 DOG</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">행동학 연구</span>
                        <h4 class="lab-card-title">
                            강아지 분리불안, 3일 만에 개선하는 훈련법
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">강형욱 소장</span>
                            <span class="lab-card-views">조회 12,500</span>
                        </div>
                    </div>
                </article>

                <!-- 2 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,cat"
                             alt="고양이 신장 질환 예방을 위한 음수량 늘리기">
                        <span class="lab-type-badge lab-type-cat">🐱 CAT</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">영양학 연구</span>
                        <h4 class="lab-card-title">
                            고양이 신장 질환 예방을 위한 음수량 늘리기
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">김명철 수의사</span>
                            <span class="lab-card-views">조회 8,900</span>
                        </div>
                    </div>
                </article>

                <!-- 3 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,dog,health"
                             alt="노령견 관절 관리, 영양제보다 중요한 산책 습관">
                        <span class="lab-type-badge lab-type-dog">🐶 DOG</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">건강 연구</span>
                        <h4 class="lab-card-title">
                            노령견 관절 관리, 영양제보다 중요한 산책 습관
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">설채현 수의사</span>
                            <span class="lab-card-views">조회 15,400</span>
                        </div>
                    </div>
                </article>

                <!-- 4 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,cat,night"
                             alt="고양이가 밤마다 우는 이유와 해결책">
                        <span class="lab-type-badge lab-type-cat">🐱 CAT</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">심리 연구</span>
                        <h4 class="lab-card-title">
                            고양이가 밤마다 우는 이유와 해결책
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">나응식 수의사</span>
                            <span class="lab-card-views">조회 7,200</span>
                        </div>
                    </div>
                </article>

                <!-- 5 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,dog,food"
                             alt="강아지가 먹으면 절대 안 되는 과일 5가지">
                        <span class="lab-type-badge lab-type-dog">🐶 DOG</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">식품 연구</span>
                        <h4 class="lab-card-title">
                            강아지가 먹으면 절대 안 되는 과일 5가지
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">펫푸드 연구소</span>
                            <span class="lab-card-views">조회 22,000</span>
                        </div>
                    </div>
                </article>

                <!-- 6 -->
                <article class="lab-card">
                    <div class="lab-card-thumb">
                        <img src="https://source.unsplash.com/random/400x300?pet,cat,scratch"
                             alt="스크래쳐 위치만 바꿔도 가구 훼손이 줄어든다?">
                        <span class="lab-type-badge lab-type-cat">🐱 CAT</span>
                    </div>
                    <div class="lab-card-body">
                        <span class="lab-card-category">행동학 연구</span>
                        <h4 class="lab-card-title">
                            스크래쳐 위치만 바꿔도 가구 훼손이 줄어든다?
                        </h4>
                        <div class="lab-card-meta">
                            <span class="lab-card-author">묘한 연구소</span>
                            <span class="lab-card-views">조회 5,600</span>
                        </div>
                    </div>
                </article>
            </div>

            <!-- 페이지네이션 (목업) -->
            <div class="lab-pagination">
                <button type="button" class="lab-page is-active">1</button>
                <button type="button" class="lab-page">2</button>
                <button type="button" class="lab-page">3</button>
                <button type="button" class="lab-page">4</button>
                <button type="button" class="lab-page">5</button>
                <button type="button" class="lab-page lab-page-next">›</button>
            </div>
        </div>
    </section>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
