<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>반려동물 등록 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>

<script type="text/javascript">
// type="date"를 기준으로 pet_age 자동 계산
document.addEventListener("DOMContentLoaded", function () {
    const bdayInput = document.getElementById("pet_bday");
    const ageSpan   = document.getElementById("pet_age");

    if (bdayInput && ageSpan) {
        bdayInput.addEventListener("change", function () {
            const bday  = new Date(this.value);
            if (isNaN(bday)) {
                ageSpan.innerText = "-";
                return;
            }

            const today = new Date();
            let age = today.getFullYear() - bday.getFullYear();

            const m = today.getMonth() - bday.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < bday.getDate())) {
                age--;
            }

            ageSpan.innerText = age >= 0 ? age : 0;
        });
    }

    // 초기 상태: DOG 선택
    setPetType('DOG');
});

// 강아지 / 고양이 버튼 + 품종 토글
function setPetType(type) {
    const dogBtn = document.getElementById("btn-dog");
    const catBtn = document.getElementById("btn-cat");
    const speciesInput = document.getElementById("pet_species");
    const dogBreed = document.getElementById("dog_breed");
    const catBreed = document.getElementById("cat_breed");

    if (!dogBtn || !catBtn || !speciesInput || !dogBreed || !catBreed) return;

    if (type === 'DOG') {
        speciesInput.value = 'DOG';
        dogBtn.className = "flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-amber-400 bg-amber-50 text-amber-700";
        catBtn.className = "flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-gray-200 hover:border-gray-300 text-gray-500";
        dogBreed.style.display = "block";
        catBreed.style.display = "none";
    } else {
        speciesInput.value = 'CAT';
        catBtn.className = "flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-amber-400 bg-amber-50 text-amber-700";
        dogBtn.className = "flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-gray-200 hover:border-gray-300 text-gray-500";
        catBreed.style.display = "block";
        dogBreed.style.display = "none";
    }
}
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

    <!-- 오른쪽: 반려동물 등록 폼 -->
    <section class="flex-1 min-w-0 flex justify-center">
      <div class="w-full max-w-4xl">
        <form class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8"
              action="${pageContext.request.contextPath}/insert/petInsert.do"
              method="post">

          <h2 class="text-2xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-100">
            반려동물 등록
          </h2>

          <div class="flex flex-col lg:flex-row gap-12">
            <!-- Left: 펫 아바타 영역 (임시 이미지) -->
            <div class="flex flex-col items-center gap-4">
              <div class="relative group">
                <div class="w-40 h-40 rounded-3xl overflow-hidden border-4 border-amber-50 shadow-inner rotate-3 hover:rotate-0 transition-transform duration-300">
                  <img 
                    src="https://images.unsplash.com/photo-1615233500064-caa995e2f9dd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
                    alt="Pet"
                    class="w-full h-full object-cover"
                  />
                </div>
              </div>
              <div class="text-center">
                <div class="text-xs font-bold text-amber-500 bg-amber-50 px-2 py-1 rounded-full inline-block mb-1">
                  새 반려동물
                </div>
                <p class="text-sm text-gray-400">
                  등록 후 대표 반려동물로 설정할 수 있어요.
                </p>
              </div>
            </div>

            <!-- Right: Form -->
            <div class="flex-1 grid grid-cols-1 md:grid-cols-2 gap-6">

              <!-- hidden: 실제 전송할 종 -->
              <input type="hidden" name="pet_species" id="pet_species" value="DOG" />

              <!-- 종류 버튼 -->
              <div class="md:col-span-2">
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  종류 <span class="text-red-500">*</span>
                </label>
                <div class="flex gap-4">
                  <button
                    type="button"
                    id="btn-dog"
                    onclick="setPetType('DOG')"
                    class="flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-amber-400 bg-amber-50 text-amber-700"
                  >
                    강아지
                  </button>
                  <button
                    type="button"
                    id="btn-cat"
                    onclick="setPetType('CAT')"
                    class="flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-gray-200 hover:border-gray-300 text-gray-500"
                  >
                    고양이
                  </button>
                </div>
              </div>

              <!-- 이름 -->
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  이름 <span class="text-red-500">*</span>
                </label>
                <input 
                  type="text" 
                  name="pet_name"
                  id="pet_name"
                  placeholder="이름을 입력해주세요"
                  class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
                />
              </div>

              <!-- 품종 (강아지/고양이 토글) -->
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  품종
                </label>

                <div id="dog_breed">
                  <select name="pet_breed"
                          class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900 bg-white">
                    <option value="">품종 모름 / 없음</option>
                    <option value="골든 리트리버">골든 리트리버</option>
                    <option value="닥스훈트">닥스훈트</option>
                    <option value="래브라도 리트리버">래브라도 리트리버</option>
                    <option value="말티즈">말티즈</option>
                    <option value="비글">비글</option>
                    <option value="비숑">비숑</option>
                    <option value="시베리안허스키">시베리안허스키</option>
                    <option value="시츄">시츄</option>
                    <option value="요크셔테리어">요크셔테리어</option>
                    <option value="웰시코기">웰시코기</option>
                    <option value="진돗개">진돗개</option>
                    <option value="치와와">치와와</option>
                    <option value="푸들">푸들</option>
                  </select>
                </div>

                <div id="cat_breed" style="display:none;">
                  <select name="pet_breed"
                          class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900 bg-white">
                    <option value="">품종 모름 / 없음</option>
                    <option value="노르웨이 숲">노르웨이 숲</option>
                    <option value="러시안블루">러시안블루</option>
                    <option value="랙돌">랙돌</option>
                    <option value="메인쿤">메인쿤</option>
                    <option value="먼치킨">먼치킨</option>
                    <option value="브리티시 숏헤어">브리티시 숏헤어</option>
                    <option value="샴 고양이">샴 고양이</option>
                    <option value="스코티시 폴드">스코티시폴드</option>
                    <option value="스핑크스">스핑크스</option>
                    <option value="아메리칸 숏헤어">아메리칸 숏헤어</option>
                    <option value="코리안 숏헤어">코리안 숏헤어</option>
                    <option value="페르시안">페르시안</option>
                  </select>
                </div>
              </div>

              <!-- 성별 -->
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  성별
                </label>
                <div class="flex items-center gap-4 mt-1 text-sm text-gray-700">
                  <label class="flex items-center gap-1">
                    <input type="radio" name="pet_gender" value="M">
                    남아
                  </label>
                  <label class="flex items-center gap-1">
                    <input type="radio" name="pet_gender" value="F">
                    여아
                  </label>
                </div>
              </div>

              <!-- 대표 반려동물 여부 -->
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  대표 반려동물
                </label>
                <div class="flex items-center gap-4 mt-1 text-sm text-gray-700">
                  <label class="flex items-center gap-1">
                    <input type="radio" name="is_primary" value="Y">
                    대표로 설정
                  </label>
                  <label class="flex items-center gap-1">
                    <input type="radio" name="is_primary" value="N" checked>
                    대표 아님
                  </label>
                </div>
              </div>

              <!-- 생일/입양일 -->
              <div>
                <label class="block text-sm font-bold text-gray-700 mb-2">
                  생일 (또는 입양일)
                </label>
                <input 
                  type="date" 
                  name="pet_bday"
                  id="pet_bday"
                  class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
                />
                <p class="mt-2 text-xs text-gray-400">
                  나이 : <span id="pet_age">-</span> 살
                </p>
              </div>

            

            </div>
          </div>

          <!-- Actions -->
          <div class="flex justify-end items-center gap-3 mt-12 pt-6 border-t border-gray-100">
            <button 
              type="button"
              class="px-6 py-3 rounded-xl border-2 border-gray-200 text-gray-600 font-bold hover:bg-gray-50 transition-colors"
              onclick="location.href='${pageContext.request.contextPath}/profile/petProfile_form.do'">
              취소
            </button>
            <button 
              type="submit"
              class="px-6 py-3 rounded-xl bg-amber-400 text-white font-bold hover:bg-amber-500 shadow-md transition-all">
              등록
            </button>
          </div>

        </form>
      </div>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
