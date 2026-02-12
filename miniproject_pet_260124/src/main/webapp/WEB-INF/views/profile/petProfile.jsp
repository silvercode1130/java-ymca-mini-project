<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이펫 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const today = new Date();
    // 1. 위에서 추가한 .pet-info-item 클래스로 요소들을 가져와
    const petItems = document.querySelectorAll(".pet-info-item"); 

    petItems.forEach(item => {
        const bdayValue = item.getAttribute("data-bday");
        const ageTarget = item.querySelector(".age-display");

        if (bdayValue && ageTarget) {
            // 날짜 형식이 yyyy-mm-dd 인지 확인하고 Date 객체 생성
            const bday = new Date(bdayValue);
            
            if (!isNaN(bday)) {
                let age = today.getFullYear() - bday.getFullYear();
                const m = today.getMonth() - bday.getMonth();
                
                // 생일이 아직 안 지났으면 한 살 빼기
                if (m < 0 || (m === 0 && today.getDate() < bday.getDate())) {
                    age--;
                }
                
                // 계산된 나이 입력 (음수 방지)
                ageTarget.innerText = age >= 0 ? age : 0;
            }
        }
    });
});
</script>

</head>
<body class="bg-gray-50 layout-body">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main max-w-6xl mx-auto px-4 py-8">
  <div class="flex flex-col md:flex-row gap-8">

    <!-- 왼쪽: 마이페이지 사이드바 -->
    <aside class="w-full md:w-64 flex-shrink-0">
      <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 sticky top-24">
        <h2 class="text-xl font-extrabold text-gray-900 mb-6 px-2">마이페이지</h2>
        <nav class="flex flex-row md:flex-col gap-2 overflow-x-auto md:overflow-visible pb-4 md:pb-0">
          <a href="${pageContext.request.contextPath}/profile/myProfile.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">👤</span>
            <span class="flex-1 text-left">나의 프로필</span>
          </a>
          <a href="${pageContext.request.contextPath}/profile/petProfile_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap bg-amber-50 text-amber-600 font-bold">
            <span class="text-amber-500">💗</span>
            <span class="flex-1 text-left">마이펫</span>
          </a>
          <a href="${pageContext.request.contextPath}/orders/list"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">📦</span>
            <span class="flex-1 text-left">나의 주문</span>
          </a>
          <a href="${pageContext.request.contextPath}/update/myUpdate_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">⚙️</span>
            <span class="flex-1 text-left">회원정보수정</span>
          </a>
        </nav>
      </div>
    </aside>

    <!-- 오른쪽: 마이펫 리스트 -->
    <section class="flex-1 min-w-0 flex justify-center">
      <div class="w-full max-w-4xl">

        <c:choose>
          <c:when test="${not empty petList}">
            <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8">
              <h2 class="text-2xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-100">
                마이펫
              </h2>

              <p class="text-sm text-gray-500 mb-6">
                '강아지 온라인 국가 동물등록'을 희망할 시
                <span class="font-semibold"> 동물보호관리시스템</span>에 방문하여 반려동물 등록을 진행해주세요.<br/>
                고양이 온라인 국가 등록은 불가합니다.
              </p>

              <div class="flex flex-col gap-4">
				  <c:forEach var="pet" items="${petList}">
				    <div class="pet-item pet-info-item flex items-center justify-between p-4 border border-gray-100 rounded-2xl hover:border-amber-300 hover:bg-amber-50/40 transition-colors" 
     				data-bday="${pet.pet_bday}">
				      <div>
				        <div class="flex items-center gap-2">
				          <span class="text-lg font-bold text-gray-900">${pet.pet_name}</span>
				          <c:if test="${pet.is_primary eq 'Y'}">
				            <span class="text-xs font-bold text-amber-500 bg-amber-50 px-2 py-1 rounded-full">대표 반려동물</span>
				          </c:if>
				        </div>
				        <p class="mt-1 text-sm text-gray-600">
				          종류: 
				          <c:choose>
				            <c:when test="${pet.pet_species eq 'DOG'}">강아지</c:when>
				            <c:when test="${pet.pet_species eq 'CAT'}">고양이</c:when>
				            <c:otherwise>${pet.pet_species}</c:otherwise>
				          </c:choose>
				          · 성별:
				          <c:choose>
				            <c:when test="${pet.pet_gender eq 'M'}">남아</c:when>
				            <c:when test="${pet.pet_gender eq 'F'}">여아</c:when>
				            <c:otherwise>${pet.pet_gender}</c:otherwise>
				          </c:choose>
				          · 품종: <c:out value="${fn:replace(pet.pet_breed, ',', '')}" default="-" />
				        </p>
				        <p class="mt-1 text-xs text-gray-400">
				          나이: <span class="age-display">-</span>살
				          · 생일: <c:out value="${pet.pet_bday}" default="-" />
				        </p>
				      </div>
				
				      <button 
				        type="button"
				        class="px-4 py-2 rounded-xl border border-gray-200 text-gray-600 text-sm font-bold hover:bg-gray-50 transition-colors"
				        onclick="location.href='${pageContext.request.contextPath}/update/petUpdate_form.do?pet_idx=${pet.pet_idx}'">
				        수정
				      </button>
				    </div>
				  </c:forEach>
				</div>
	
	             <div class="flex justify-end mt-10 pt-6 border-t border-gray-100">
	               <button 
	                 type="button"
	                 class="px-6 py-3 rounded-xl bg-amber-400 text-white font-bold hover:bg-amber-500 shadow-md transition-all"
	                 onclick="location.href='${pageContext.request.contextPath}/insert/petInsert_form.do'">
	                 반려동물 등록
	               </button>
	             </div>
	           </div>
	         </c:when>

          <c:otherwise>
            <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8 min-h-[500px] flex flex-col items-center justify-center text-center">
              <h2 class="text-2xl font-bold text-gray-900 mb-8 w-full text-left pb-4 border-b border-gray-100">
                마이펫
              </h2>

              <div class="w-48 h-48 mb-6 rounded-full bg-amber-50 flex items-center justify-center overflow-hidden">
                <img 
                  src="https://images.unsplash.com/photo-1723639418929-6ad8caa93a6e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
                  alt="No Pet"
                  class="w-full h-full object-cover opacity-80"
                />
              </div>

              <h3 class="text-xl font-bold text-gray-800 mb-2">등록된 반려동물이 없어요 😢</h3>
              <p class="text-gray-500 mb-8 max-w-sm">
                사랑스러운 우리 아이를 등록하고 맞춤형 서비스를 받아보세요!<br/>
                강아지, 고양이 친구들을 위한 다양한 혜택이 기다리고 있어요.
              </p>
              <button 
                type="button"
                class="px-8 py-4 rounded-xl bg-amber-400 text-white font-bold text-lg hover:bg-amber-500 shadow-md transition-all flex items-center gap-2"
                onclick="location.href='${pageContext.request.contextPath}/insert/petInsert_form.do'">
                반려동물 등록하기
              </button>
            </div>
          </c:otherwise>
        </c:choose>

      </div>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
