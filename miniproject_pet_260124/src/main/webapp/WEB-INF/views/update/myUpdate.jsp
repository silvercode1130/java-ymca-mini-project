<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 | PetOn</title>
<%@ include file="/WEB-INF/views/common/head.jsp" %>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
// 주소창 띄우기
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            $("#mem_zipcode").val(data.zonecode);
            $("#mem_addr").val(data.address);
            $("#mem_addr_detail").val("").focus();
        }
    }).open();
}

// 주소 저장 버튼
function saveAddr() {
    const memZipcode    = document.getElementById("mem_zipcode").value;
    const memAddr       = document.getElementById("mem_addr").value;
    const memAddrDetail = document.getElementById("mem_addr_detail").value;
    const memIdx        = document.getElementById("mem_idx").value;

    fetch("${pageContext.request.contextPath}/member/updateAddrAjax.do", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body:
            "mem_zipcode="     + encodeURIComponent(memZipcode) +
            "&mem_addr="       + encodeURIComponent(memAddr) +
            "&mem_addr_detail="+ encodeURIComponent(memAddrDetail) +
            "&mem_idx="        + encodeURIComponent(memIdx)
    })
    .then(res => res.text())
    .then(result => {
        if (result === "ok") {
            alert("주소 저장 완료!");
        } else {
            alert("주소 저장 실패");
        }
    });
}

/* function saveAddr() {    버튼 작동 x -> 버릴 코드
$.ajax({
url: "/member/updateAddrAjax.do",
type: "POST",
data: {
  mem_idx: $("input[name=mem_idx]").val(),
  mem_zipcode: $("#mem_zipcode").val(),
  mem_addr: $("#mem_addr").val(),
  mem_addr_detail: $("#mem_addr_detail").val()
},
success: function(res) {
  alert("주소 저장 완료!");
}
});
} */

// 비밀번호 변경 토글 (아코디언)
document.addEventListener("DOMContentLoaded", function () {
    const pwSection = document.getElementById("password-section");
    const pwToggleBtn = document.getElementById("btn-toggle-password");

    if (pwToggleBtn && pwSection) {
        pwToggleBtn.addEventListener("click", function () {
            const isHidden = pwSection.style.display === "none" || pwSection.style.display === "";
            pwSection.style.display = isHidden ? "grid" : "none";
        });
    }
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
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">💗</span>
            <span class="flex-1 text-left">마이펫</span>
          </a>
          <a href="${pageContext.request.contextPath}/orders/list"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap text-gray-500 hover:bg-gray-50 font-medium">
            <span class="text-gray-400">📦</span>
            <span class="flex-1 text-left">나의 주문</span>
          </a>
          <a href="${pageContext.request.contextPath}/update/myUpdate_form.do"
             class="flex items-center gap-3 px-4 py-3 rounded-xl transition-all whitespace-nowrap bg-amber-50 text-amber-600 font-bold">
            <span class="text-amber-500">⚙️</span>
            <span class="flex-1 text-left">회원정보수정</span>
          </a>
        </nav>
      </div>
    </aside>

    <!-- 오른쪽: 회원 정보 수정 -->
    <section class="flex-1 min-w-0 flex flex-col gap-8">

      <!-- form: 기본 회원정보 + 비번 변경 (회원 테이블) -->
      <form id="memberUpdateForm"
		      class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8"
		      action="${pageContext.request.contextPath}/update/myUpdate.do"
		      method="post">


        <h2 class="text-2xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-100">
          기본 회원정보
        </h2>

        <!-- 숨겨진 값들 -->
        <input type="hidden" id="mem_idx"  name="mem_idx"  value="${user.mem_idx}">
        <input type="hidden" name="mem_role_idx"  value="${user.mem_role_idx}">
        <input type="hidden" name="mem_grade_idx" value="${user.mem_grade_idx}">

        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">

          <!-- 아이디 (읽기 전용) -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">아이디</label>
            <input 
              type="text" 
              id="id"
              name="mem_id"
              value="${user.mem_id}" 
              readonly
              class="w-full px-4 py-3 rounded-xl bg-gray-100 border border-gray-200 text-gray-500 font-medium cursor-not-allowed"
            />
          </div>

          <!-- 이름 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">이름</label>
            <input 
              type="text" 
              id="name"
              name="mem_name"
              value="${user.mem_name}"
              class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
            />
          </div>

          <!-- 전화번호 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">전화번호</label>
            <input 
              type="text" 
              id="tel"
              name="mem_tel"
              value="${user.mem_tel}"
              class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
            />
          </div>

          <!-- 생년월일 -->
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">생년월일</label>
            <input 
              type="date" 
              id="bday"
              name="mem_bday"
              value="${user.mem_bday}"
              class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
            />
          </div>

          <!-- 이메일 -->
          <div class="md:col-span-2">
            <label class="block text-sm font-bold text-gray-700 mb-2">이메일</label>
            <input 
              type="email" 
              id="email"
              name="mem_email"
              value="${user.mem_email}"
              class="w-full md:w-2/3 px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
            />
          </div>

        </div>

        <!-- 비밀번호 변경 (간단 아코디언) -->
        <div class="mt-8 border rounded-xl border-gray-200 overflow-hidden">
          <button 
            type="button"
            id="btn-toggle-password"
            class="w-full px-6 py-4 flex justify-between items-center bg-gray-50 hover:bg-gray-100 transition-colors text-left"
          >
            <span class="font-bold text-gray-700 flex items-center gap-2">
              비밀번호 변경
            </span>
            <span class="text-gray-400 text-sm">열기/닫기</span>
          </button>
          
          <div id="password-section"
               class="p-6 bg-white border-t border-gray-200 grid grid-cols-1 md:grid-cols-2 gap-6"
               style="display:none;">
            <div class="md:col-span-2">
              <label class="block text-sm font-bold text-gray-700 mb-2">현재 비밀번호</label>
              <input 
                type="password" 
                name="current_pwd"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400"
              />
            </div>
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">새 비밀번호</label>
              <input 
                type="password"
                name="new_pwd"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400"
              />
            </div>
            <div>
              <label class="block text-sm font-bold text-gray-700 mb-2">새 비밀번호 확인</label>
              <input 
                type="password"
                name="new_pwd_confirm"
                class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400"
              />
            </div>
          </div>
        </div>

        <!-- 회원 등급/역할 안내 (읽기만) -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6 text-sm">
          <div class="bg-amber-50 rounded-2xl px-4 py-3">
            <div class="font-bold text-amber-800 mb-1">회원 종류</div>
            <div class="text-amber-900">${role.role_name}</div>
            <p class="mt-1 text-xs text-amber-700">
              수의사임을 증명하시면 커뮤니티에서 전문적인 답변을 남길 수 있어요.
            </p>
          </div>
          <div class="bg-gray-50 rounded-2xl px-4 py-3">
            <div class="font-bold text-gray-800 mb-1">회원 등급</div>
            <div class="text-gray-900">${grade.grade_name}</div>
            <p class="mt-1 text-xs text-gray-600">
              등급별 할인율: ${grade.grade_discount_rate}  
              등급이 올라갈수록 더 많은 혜택을 받으실 수 있어요.
            </p>
          </div>
        </div>
      </form>

      <!-- 배송지 정보 카드 (주소 전용, Ajax 저장) -->
      <div class="bg-white rounded-3xl shadow-sm border border-gray-100 p-8">
        <h2 class="text-2xl font-bold text-gray-900 mb-8 pb-4 border-b border-gray-100">배송지 정보</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label class="block text-sm font-bold text-gray-700 mb-2">우편번호</label>
            <div class="flex gap-2">
              <input 
                type="text" 
                id="mem_zipcode"
                name="mem_zipcode"
                value="${member_addr.mem_zipcode}"
                readonly
                class="flex-1 px-4 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none font-medium text-gray-700"
              />
              <button type="button"
                      onclick="findAddr()"
                      class="px-4 py-3 bg-gray-800 text-white rounded-xl font-bold text-sm hover:bg-gray-700 transition-colors whitespace-nowrap">
                우편번호 검색
              </button>
            </div>
          </div>

          <div class="md:col-span-2">
            <label class="block text-sm font-bold text-gray-700 mb-2">기본 주소</label>
            <input 
              type="text" 
              id="mem_addr"
              name="mem_addr"
              value="${member_addr.mem_addr}"
              readonly
              class="w-full px-4 py-3 rounded-xl bg-gray-50 border border-gray-200 focus:outline-none font-medium text-gray-700"
            />
          </div>

          <div class="md:col-span-2">
            <label class="block text-sm font-bold text-gray-700 mb-2">상세 주소</label>
            <input 
              type="text" 
              id="mem_addr_detail"
              name="mem_addr_detail"
              value="${member_addr.mem_addr_detail}"
              class="w-full px-4 py-3 rounded-xl border border-gray-200 focus:outline-none focus:ring-2 focus:ring-amber-400 focus:border-transparent font-medium text-gray-900"
            />
          </div>
        </div>

        <div class="flex justify-end mt-6">
          <button type="button"
                  onclick="saveAddr()"
                  class="px-6 py-3 rounded-xl bg-amber-400 text-white font-bold hover:bg-amber-500 shadow-md transition-all text-sm">
            배송지 정보 저장
          </button>
        </div>
      </div>

      <!-- Global Actions -->
      <div class="flex justify-end items-center gap-3">
        <button type="button"
                class="px-6 py-3 rounded-xl border-2 border-gray-200 text-gray-600 font-bold hover:bg-gray-50 transition-colors"
                onclick="location.href='${pageContext.request.contextPath}/main'">
          취소
        </button>
        <button type="submit"
		        form="memberUpdateForm"
		        class="px-8 py-3 rounded-xl bg-amber-400 text-white font-bold hover:bg-amber-500 shadow-md transition-all">
		  변경사항 저장
		</button>

      </div>

    </section>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
