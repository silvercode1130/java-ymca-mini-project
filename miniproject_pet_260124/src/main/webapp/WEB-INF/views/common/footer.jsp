<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<footer class="site-footer">
  <div class="footer-inner">
    <div class="footer-grid">
      <!-- Brand -->
      <div class="footer-col">
        <div class="footer-brand">
          <div class="footer-logo-circle">P</div>
          <span class="footer-logo-name">PetOn</span>
        </div>
        <p class="footer-text">
          반려동물과 함께하는 행복한 세상.<br>
          모든 반려인들을 위한 종합 정보 플랫폼입니다.
        </p>
        <div class="footer-socials">
          <a href="#" class="footer-social">I</a>
          <a href="#" class="footer-social">F</a>
          <a href="#" class="footer-social">Y</a>
          <a href="#" class="footer-social">X</a>
        </div>
      </div>

      <!-- Links 1 -->
      <div class="footer-col">
        <h4 class="footer-col-title">회사 소개</h4>
        <ul class="footer-links">
          <li><a href="#" class="footer-link">브랜드 스토리</a></li>
          <li><a href="#" class="footer-link">채용 정보</a></li>
          <li><a href="${pageContext.request.contextPath}/agree/agreeService.do" class="footer-link">이용약관</a></li>
          <li><a href="${pageContext.request.contextPath}/agree/agreePrivacy.do" class="footer-link strong">개인정보처리방침</a></li>
        </ul>
      </div>

      <!-- Links 2 -->
      <div class="footer-col">
        <h4 class="footer-col-title">고객 지원</h4>
        <ul class="footer-links">
          <li><a href="${pageContext.request.contextPath}/notice/list.do" class="footer-link">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/service">자주 묻는 질문</a></li>
          <li><a href="#">1:1 문의</a></li>
          <li><a href="#">제휴 문의</a></li>
        </ul>
      </div>

      <!-- Contact -->
      <div class="footer-col">
        <h4 class="footer-col-title">고객센터</h4>
        <p class="footer-phone">1588-0000</p>
        <p class="footer-small">평일 09:00 - 18:00</p>
        <p class="footer-small">주말 및 공휴일 휴무</p>
      </div>
    </div>

    <div class="footer-bottom">
      <p>© 2026 PetOn. All rights reserved.</p>
      <p>서울특별시 강남구 테헤란로 123 펫빌딩 4층</p>
    </div>
  </div>
</footer>
