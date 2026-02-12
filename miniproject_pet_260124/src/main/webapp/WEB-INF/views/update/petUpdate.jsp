<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>반려동물 수정 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
    // ✅ 수정 화면 진입 시, 기존 종(DOG/CAT)에 맞춰 버튼/품종 토글
    const currentSpecies = "${vo.pet_species}";
    if (currentSpecies === "CAT") {
        setPetType("CAT");
    } else {
        setPetType("DOG");
    }

    // ✅ 생일 변경 시 나이 계산(등록 화면과 동일)
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
});

// 강아지 / 고양이 버튼 + 품종 토글 (등록 화면과 동일)
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


// 펫 삭제
function deletePet(pet_idx) {
    if (confirm("정말로 이 반려동물 정보를 삭제하시겠습니까?")) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/petDelete.do';
        
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'pet_idx';
        input.value = pet_idx;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
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

    <!-- 오른쪽: 반려동물 수정 폼 -->
    <section class="flex-1 min-w-0 flex justify-center">
      <div class="w-full max-w-4xl">

        <form class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8"
              action="${pageContext.request.contextPath}/update/petUpdate.do"
              method="post">

          <h2 class="text-2xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-100">
            반려동물 정보 수정
          </h2>

          <!-- ✅ pet_idx 반드시 hidden으로 -->
          <input type="hidden" name="pet_idx" value="${vo.pet_idx}" />

          <!-- hidden: 실제 전송할 종 -->
          <input type="hidden" name="pet_species" id="pet_species" value="${vo.pet_species}" />

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

            <!-- 종류 버튼 -->
            <div class="md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">
                종류 <span class="text-red-500">*</span>
              </label>
              <div class="flex gap-4">
                <button type="button" id="btn-dog" onclick="setPetType('DOG')"
                        class="flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-gray-200 hover:border-gray-300 text-gray-500">
                  강아지
                </button>
                <button type="button" id="btn-cat" onclick="setPetType('CAT')"
                        class="flex-1 py-3 px-4 rounded-xl border-2 flex items-center justify-center gap-2 font-bold border-gray-200 hover:border-gray-300 text-gray-500">
                  고양이
                </button>
              </div>
            </div>

            <!-- 이름 -->
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">
                이름 <span class="text-red-500">*</span>
              </label>
              <input type="text" name="pet_name" id="pet_name"
                     value="${vo.pet_name}"
                     class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900" />
            </div>

            <!-- 품종(강아지/고양이 토글) -->
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">품종</label>

              <div id="dog_breed">
                <select name="pet_breed"
                        class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900 bg-white">
                  <option value="">품종 모름 / 없음</option>
                  <option value="골든 리트리버" <c:if test="${vo.pet_breed eq '골든 리트리버'}">selected</c:if>>골든 리트리버</option>
                  <option value="닥스훈트" <c:if test="${vo.pet_breed eq '닥스훈트'}">selected</c:if>>닥스훈트</option>
                  <option value="래브라도 리트리버" <c:if test="${vo.pet_breed eq '래브라도 리트리버'}">selected</c:if>>래브라도 리트리버</option>
                  <option value="말티즈" <c:if test="${vo.pet_breed eq '말티즈'}">selected</c:if>>말티즈</option>
                  <option value="비글" <c:if test="${vo.pet_breed eq '비글'}">selected</c:if>>비글</option>
                  <option value="비숑" <c:if test="${vo.pet_breed eq '비숑'}">selected</c:if>>비숑</option>
                  <option value="시베리안허스키" <c:if test="${vo.pet_breed eq '시베리안허스키'}">selected</c:if>>시베리안허스키</option>
                  <option value="시츄" <c:if test="${vo.pet_breed eq '시츄'}">selected</c:if>>시츄</option>
                  <option value="요크셔테리어" <c:if test="${vo.pet_breed eq '요크셔테리어'}">selected</c:if>>요크셔테리어</option>
                  <option value="웰시코기" <c:if test="${vo.pet_breed eq '웰시코기'}">selected</c:if>>웰시코기</option>
                  <option value="진돗개" <c:if test="${vo.pet_breed eq '진돗개'}">selected</c:if>>진돗개</option>
                  <option value="치와와" <c:if test="${vo.pet_breed eq '치와와'}">selected</c:if>>치와와</option>
                  <option value="푸들" <c:if test="${vo.pet_breed eq '푸들'}">selected</c:if>>푸들</option>
                </select>
              </div>

              <div id="cat_breed" style="display:none;">
                <select name="pet_breed"
                        class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900 bg-white">
                  <option value="">품종 모름 / 없음</option>
                  <option value="노르웨이 숲" <c:if test="${vo.pet_breed eq '노르웨이 숲'}">selected</c:if>>노르웨이 숲</option>
                  <option value="러시안블루" <c:if test="${vo.pet_breed eq '러시안블루'}">selected</c:if>>러시안블루</option>
                  <option value="랙돌" <c:if test="${vo.pet_breed eq '랙돌'}">selected</c:if>>랙돌</option>
                  <option value="메인쿤" <c:if test="${vo.pet_breed eq '메인쿤'}">selected</c:if>>메인쿤</option>
                  <option value="먼치킨" <c:if test="${vo.pet_breed eq '먼치킨'}">selected</c:if>>먼치킨</option>
                  <option value="브리티시 숏헤어" <c:if test="${vo.pet_breed eq '브리티시 숏헤어'}">selected</c:if>>브리티시 숏헤어</option>
                  <option value="샴 고양이" <c:if test="${vo.pet_breed eq '샴 고양이'}">selected</c:if>>샴 고양이</option>
                  <option value="스코티시 폴드" <c:if test="${vo.pet_breed eq '스코티시 폴드'}">selected</c:if>>스코티시 폴드</option>
                  <option value="스핑크스" <c:if test="${vo.pet_breed eq '스핑크스'}">selected</c:if>>스핑크스</option>
                  <option value="아메리칸 숏헤어" <c:if test="${vo.pet_breed eq '아메리칸 숏헤어'}">selected</c:if>>아메리칸 숏헤어</option>
                </select>
              </div>
            </div>

            <!-- 성별 -->
            <div class="md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">성별</label>
              <div class="flex gap-6">
                <label class="flex items-center gap-2 font-medium text-gray-700">
                  <input type="radio" name="pet_gender" value="M" <c:if test="${vo.pet_gender eq 'M'}">checked</c:if> />
                  남아
                </label>
                <label class="flex items-center gap-2 font-medium text-gray-700">
                  <input type="radio" name="pet_gender" value="F" <c:if test="${vo.pet_gender eq 'F'}">checked</c:if> />
                  여아
                </label>
              </div>
            </div>

            <!-- 생일 -->
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">생일</label>
              <input type="date" name="pet_bday" id="pet_bday"
                     value="${vo.pet_bday}"
                     class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900" />
            </div>

            <!-- 나이(표시용) -->
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">나이</label>
              <div class="w-full px-4 py-3 rounded-xl border border-gray-200 bg-gray-50 font-medium text-gray-700">
                <span id="pet_age">${vo.pet_age}</span> 살
              </div>
            </div>

            <!-- 대표동물 -->
            <div class="md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">대표 반려동물</label>
              <div class="flex gap-6">
                <label class="flex items-center gap-2 font-medium text-gray-700">
                  <input type="radio" name="is_primary" value="Y" <c:if test="${vo.is_primary eq 'Y'}">checked</c:if> />
                  예
                </label>
                <label class="flex items-center gap-2 font-medium text-gray-700">
                  <input type="radio" name="is_primary" value="N" <c:if test="${vo.is_primary ne 'Y'}">checked</c:if> />
                  아니오
                </label>
              </div>
            </div>

          </div>

          <div class="flex justify-end gap-3 mt-10 pt-6 border-t border-gray-100">
		    <button type="button"
		            class="px-6 py-3 rounded-xl border border-red-200 text-red-500 font-bold hover:bg-red-50 transition-colors mr-auto"
		            onclick="deletePet(${vo.pet_idx})">
		        삭제
		    </button>
          
            <button type="button"
                    class="px-6 py-3 rounded-xl border border-gray-200 text-gray-600 font-bold hover:bg-gray-50 transition-colors"
                    onclick="location.href='${pageContext.request.contextPath}/profile/petProfile_form.do'">
              취소
            </button>
            <button type="submit"
                    class="px-6 py-3 rounded-xl bg-amber-400 text-white font-bold hover:bg-amber-500 shadow-md transition-all">
              저장하기
            </button>
          </div>

        </form>

      </div>
    </section>

  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
