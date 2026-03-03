<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>펫온: 반려동물 종합 플랫폼</title>
    <%@ include file="/WEB-INF/views/common/head.jsp" %>

</head>
<body class="layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main">
    <!-- 상단 히어로 배너 영역 -->
    <%@ include file="/WEB-INF/views/home/hero.jsp" %>
	

    <!-- 쇼핑몰 추천 상품 -->
    <%-- <section class="section section-shop">
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
    </section> --%>
    
<section class="section section-shop">
    <div class="section-inner">
        <div class="section-header">
            <h3 class="section-title best-title">마감 임박 상품 🚨</h3>
            <p class="section-subtitle">재고가 20개 이하인 상품들입니다. 서두르세요!</p>
        </div>
        
        <div class="card-grid">
            <c:forEach var="itemvo" items="${lowStockList}">
                <a href="${pageContext.request.contextPath}/item/item_detail.do?item_idx=${itemvo.item_idx}" class="item-card">
                    <div class="item-thumb">
                        <img src="${pageContext.request.contextPath}/img/${itemvo.item_thumbnail_img}" alt="${itemvo.item_name}">
                        <span class="item-tag" style="background-color: #ff4d4d; color: white;">품절주의</span>
                    </div>
                    
                    <div class="item-info">
                        <p class="item-name">${itemvo.item_name}</p>
                        <div class="item-meta">
                            <span class="item-meta-star">★ 남은 수량:</span>
                            <span class="item-meta-count">${itemvo.item_stock}</span>
                        </div>
                        <p class="item-price">
                            <span class="item-price-sale">LAST</span>
    <span class="item-price-now">
        ${itemvo.item_now_price}원
    </span>
                        </p>
                    </div>
                </a>
            </c:forEach>
            
            <c:if test="${empty lowStockList}">
                <div class="item-card placeholder-box" style="grid-column: span 4; text-align: center; padding: 60px; border: 1px dashed #ccc;">
                    현재 마감 임박 상품이 없습니다.
                </div>
            </c:if>
        </div>
    </div>
</section>

       <!-- 보험 광고 배너 (다른 섹션과 동일 너비) -->
<section class="section section-banner">
    <div class="section-inner">
        <div class="bg-gradient-to-r from-slate-800 to-slate-900 rounded-3xl overflow-hidden relative shadow-lg">
            <div class="flex flex-col md:flex-row items-center">
                <!-- 텍스트 영역 -->
                <div class="p-8 md:p-12 md:w-1/2 z-10 relative">
                    <div class="inline-block px-3 py-1 bg-amber-400 text-slate-900 font-bold text-xs rounded-full mb-4">
                        PetOn Care Plus
                    </div>
                    <h2 class="text-3xl md:text-4xl font-extrabold text-white mb-4 leading-tight">
                        우리 아이 병원비 걱정,<br/>
                        <span class="text-amber-400">펫온 펫보험</span>으로 든든하게!
                    </h2>
                    <p class="text-slate-300 mb-8 text-base md:text-lg">
                        슬개골 탈구부터 피부병까지.<br/>
                        예상치 못한 의료비를 최대 90% 보장해드립니다.
                    </p>
                    <div class="flex flex-wrap gap-3">
                        <button
                                type="button"
                                class="px-6 md:px-8 py-3 bg-white text-slate-900 font-bold rounded-xl hover:bg-amber-50 transition-colors text-sm md:text-base">
                            내 보험료 확인하기
                        </button>
                        <button
                                type="button"
                                class="px-6 md:px-8 py-3 bg-transparent border border-slate-600 text-white font-bold rounded-xl hover:bg-slate-800 transition-colors text-sm md:text-base">
                            보장 내용 자세히보기
                        </button>
                    </div>
                </div>

                <!-- 이미지 영역 -->
                <div class="md:w-1/2 h-64 md:h-96 relative w-full">
                    <img
                            src="https://images.unsplash.com/photo-1599889305003-f9e211e31f8f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
                            alt="Happy dog with vet"
                            class="absolute inset-0 w-full h-full object-cover object-center"
                    />
                    <div
                            class="absolute inset-0 bg-gradient-to-t from-slate-900/90 md:bg-gradient-to-l md:from-transparent md:to-slate-900 via-slate-900/30 to-transparent"></div>
                </div>
            </div>
        </div>
    </div>
</section>




        <!-- 커뮤니티 최신글 / QnA 최신글 -->
    <section class="section section-community">
        <div class="section-inner community-wrap" style="display: grid; grid-template-columns: 1fr 1fr; gap: 32px;">
            <!-- FREE 커뮤니티 -->
            <div class="community-block">
                <div class="section-header" style="margin-bottom: 12px;">
                    <h3 class="section-title community-title">커뮤니티 최신글 🔥</h3>
                    <a href="${pageContext.request.contextPath}/free/list.do" class="section-link">더 보기</a>
                </div>

                <ul class="board-list" style="list-style: none; margin: 0; padding: 0;">
                    <c:forEach var="post" items="${latestCommunityList}">
                        <li style="margin: 4px 0;">
                            <a href="${pageContext.request.contextPath}/free/view.do?board_idx=${post.board_idx}"
                               class="board-row"
                               style="display: flex; justify-content: flex-end; gap: 8px; font-size: 14px; color: #333; text-decoration: none;">
                                <!-- 오른쪽 정렬을 위해 전체를 flex-end로 -->
                                <span class="board-date" style="color:#999; white-space: nowrap;">
                                    <fmt:formatDate value="${post.board_regdate}" pattern="yy.MM.dd"/>
                                </span>
                                <span class="board-meta-read" style="color:#bbb; white-space: nowrap;">
                                    조회 ${post.board_readhit}
                                </span>
                                <span class="board-title" style="flex: 1; text-align: right; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <span class="board-tag-pill"
                                          style="display:inline-block; margin-right:4px; padding:2px 6px; border-radius:999px; font-size:11px; background-color:#f3f4ff; color:#4f46e5; vertical-align:middle;">
                                        ${post.board_tag}
                                    </span>
                                    ${post.board_title}
                                </span>
                            </a>
                        </li>
                    </c:forEach>

                    <c:if test="${empty latestCommunityList}">
                        <li class="board-empty" style="padding: 8px 0; font-size: 14px; color: #999; text-align: right;">
                            최신 커뮤니티 글이 없습니다.
                        </li>
                    </c:if>
                </ul>
            </div>

            <!-- QnA -->
            <div class="community-block">
                <div class="section-header" style="margin-bottom: 12px;">
                    <h3 class="section-title">QnA 최신글</h3>
                    <a href="${pageContext.request.contextPath}/qna/list.do" class="section-link">더 보기</a>
                </div>

                <ul class="board-list" style="list-style: none; margin: 0; padding: 0;">
                    <c:forEach var="qna" items="${latestQnaList}">
                        <li style="margin: 4px 0;">
                            <a href="${pageContext.request.contextPath}/qna/view.do?board_idx=${qna.board_idx}"
                               class="board-row"
                               style="display: flex; justify-content: flex-end; gap: 8px; font-size: 14px; color: #333; text-decoration: none;">
                                <span class="board-date" style="color:#999; white-space: nowrap;">
                                    <fmt:formatDate value="${qna.board_regdate}" pattern="yy.MM.dd"/>
                                </span>
                                <span class="board-meta-read" style="color:#bbb; white-space: nowrap;">
                                    조회 ${qna.board_readhit}
                                </span>
                                <span class="board-title" style="flex: 1; text-align: right; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                    <span class="board-tag-pill"
                                          style="display:inline-block; margin-right:4px; padding:2px 6px; border-radius:999px; font-size:11px; background-color:#fee2e2; color:#b91c1c; vertical-align:middle;">
                                        QnA
                                    </span>
                                    ${qna.board_title}
                                </span>
                            </a>
                        </li>
                    </c:forEach>

                    <c:if test="${empty latestQnaList}">
                        <li class="board-empty" style="padding: 8px 0; font-size: 14px; color: #999; text-align: right;">
                            등록된 QnA 글이 없습니다.
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </section>

</main>

<!-- 오른쪽 플로팅 툴박스 -->
<aside class="floating-toolbox">
    <!-- <button type="button" class="toolbox-btn" title="내 정보">
        <span class="toolbox-icon">👤</span>
    </button>
    <button type="button" class="toolbox-btn" title="알림">
        <span class="toolbox-icon">🔔</span>
    </button>
    <button type="button" class="toolbox-btn" title="설정">
        <span class="toolbox-icon">⚙️</span>
    </button>
    <div class="toolbox-divider"></div> -->
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
