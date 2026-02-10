<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원가입 | PetOn</title>
  <%@ include file="/WEB-INF/views/common/head.jsp" %>

  <script type="text/javascript">
    function send(f) {
      let mem_id   = f.mem_id.value.trim();
      let mem_pwd  = f.mem_pwd.value.trim();
      let mem_name = f.mem_name.value.trim();
      let mem_tel  = f.mem_tel.value.trim();
      let mem_email= f.mem_email.value.trim();

      if (mem_id === "") { alert("아이디를 입력하세요"); return; }

      f.method = "post";
      f.action = "${pageContext.request.contextPath}/member/signUp.do";
      f.submit();
    }

    window.onload = function() {
      let all = document.querySelector("input[name='allAgree']");
      let agrees = document.querySelectorAll("input[name='agree']");

      all.onclick = function() {
        agrees.forEach(a => a.checked = all.checked);
      };

      document.querySelector("#mem_id").addEventListener("input", idCheck);
      document.querySelector("#mem_pwd").addEventListener("input", pwdMsg);
      document.querySelector("#mem_pwdCheck").addEventListener("input", pwdMsg);

      document.querySelector("#mem_id").addEventListener("input", checkValid);
      document.querySelector("#mem_pwd").addEventListener("input", checkValid);
      document.querySelector("input[name='mem_name']").addEventListener("input", checkValid);
      document.querySelector("input[name='mem_tel']").addEventListener("input", checkValid);
      document.querySelector("input[name='mem_email']").addEventListener("input", checkValid);

      document.querySelector("input[name='allAgree']").addEventListener("change", checkValid);

      agrees.forEach(a => {
        a.addEventListener("change", checkValid);
      });

      document.querySelector("input[name='signUp']").disabled = true;
      document.querySelector("input[name='signUp']").classList.add("opacity-50", "cursor-not-allowed");
    };

    function idCheck() {
      let mem_id = document.querySelector("#mem_id").value.trim();
      let mem_msg = document.querySelector("#mem_idMsg");

      if (mem_id === "") {
        mem_msg.textContent = "";
        return;
      }

      fetch("${pageContext.request.contextPath}/member/check_id.do?mem_id=" + encodeURIComponent(mem_id))
        .then(r => r.json())
        .then(data => {
          if (data.result) {
            mem_msg.style.color = "gray";
            mem_msg.textContent = "✔ 사용 가능한 아이디입니다.";
          } else {
            mem_msg.style.color = "red";
            mem_msg.textContent = "✘ 이미 사용 중인 아이디입니다.";
          }
        })
        .catch(err => console.log("에러 발생:", err));
    }

    function pwdMsg() {
      let mem_pwd = document.querySelector("#mem_pwd").value;
      let mem_pwdCheck = document.querySelector("#mem_pwdCheck").value;
      let mem_pwdMsg = document.querySelector("#mem_pwdMsg");

      if (mem_pwd === "" && mem_pwdCheck === "") {
        mem_pwdMsg.textContent = "";
        return;
      }

      if (mem_pwd === mem_pwdCheck) {
        mem_pwdMsg.style.color="gray";
        mem_pwdMsg.textContent = "✔ 비밀번호가 일치합니다.";
      } else {
        mem_pwdMsg.style.color="red";
        mem_pwdMsg.textContent = "✘ 비밀번호가 일치하지 않습니다.";
      }
    }

    function checkValid() {
      let mem_id   = document.querySelector("#mem_id").value.trim();
      let mem_pwd  = document.querySelector("#mem_pwd").value.trim();
      let mem_name = document.querySelector("input[name='mem_name']").value.trim();
      let mem_tel  = document.querySelector("input[name='mem_tel']").value.trim();
      let mem_email= document.querySelector("input[name='mem_email']").value.trim();

      let agrees = document.querySelectorAll("input[name='agree']");
      let agree1 = agrees[0].checked;
      let agree2 = agrees[1].checked;
      let agree3 = agrees[2].checked;

      let btn = document.querySelector("input[name='signUp']");

      let isValid =
        mem_id   !== "" &&
        mem_pwd  !== "" &&
        mem_name !== "" &&
        mem_tel  !== "" &&
        mem_email !== "" &&
        agree1 && agree2 && agree3;

      btn.disabled = !isValid;

      if (!isValid) {
        btn.classList.add("opacity-50","cursor-not-allowed");
      } else {
        btn.classList.remove("opacity-50","cursor-not-allowed");
      }
    }
  </script>
</head>
<body class="layout-body bg-amber-50/50">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<main class="layout-main pt-20">
  <div class="min-h-[calc(100vh-160px)] flex items-center justify-center px-4 py-12">
    <div class="bg-white rounded-3xl shadow-xl p-8 w-full max-w-2xl border border-amber-100">

      <!-- 타이틀 -->
      <div class="text-center mb-8">
        <div class="w-12 h-12 bg-amber-400 rounded-full flex items-center justify-center text-white mx-auto mb-4 shadow-md text-xl">
          🐾
        </div>
        <h2 class="text-3xl font-extrabold text-gray-900 mb-2">회원가입</h2>
        <p class="text-gray-500 text-sm">PetOn의 가족이 되어주세요!</p>
      </div>

      <!-- 회원가입 폼 -->
      <form class="space-y-6" onsubmit="event.preventDefault(); send(this);">
        <!-- 아이디 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            아이디 <span class="text-red-500">*</span>
          </label>
          <input name="mem_id" id="mem_id" type="text"
                 placeholder="아이디"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
          <span id="mem_idMsg" class="block text-xs mt-1 pl-1"></span>
          <p class="text-xs text-gray-400 mt-1 pl-1">3자 이상, 영어/숫자 조합을 추천합니다.</p>
        </div>

        <!-- 비밀번호 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            비밀번호 <span class="text-red-500">*</span>
          </label>
          <input name="mem_pwd" id="mem_pwd" type="password"
                 placeholder="비밀번호"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
        </div>

        <!-- 비밀번호 확인 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            비밀번호 확인 <span class="text-red-500">*</span>
          </label>
          <input name="pwdCheck" id="mem_pwdCheck" type="password"
                 placeholder="비밀번호 확인"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
          <span id="mem_pwdMsg" class="block text-xs mt-1 pl-1"></span>
          <p class="text-xs text-gray-400 mt-1 pl-1">영문/숫자/특수문자를 섞으면 더 안전해요.</p>
        </div>

        <!-- 이름 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            이름 <span class="text-red-500">*</span>
          </label>
          <input name="mem_name" id="mem_name" type="text"
                 placeholder="이름"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
        </div>

        <!-- 생년월일 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            생년월일
          </label>
          <input name="mem_bday" id="mem_bday" type="date"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
        </div>

        <!-- 연락처 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            연락처 <span class="text-red-500">*</span>
          </label>
          <input name="mem_tel" id="mem_tel" type="text"
                 placeholder="010-0000-0000"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
        </div>

        <!-- 이메일 -->
        <div>
          <label class="block text-sm font-bold text-gray-700 mb-1">
            이메일 <span class="text-red-500">*</span>
          </label>
          <input name="mem_email" id="mem_email" type="email"
                 placeholder="example@peton.com"
                 class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl
                        focus:outline-none focus:ring-2 focus:ring-amber-400 transition-all"
          />
        </div>

        <!-- 약관 동의 -->
        <div class="space-y-2 pt-4">
          <div class="flex items-center gap-2">
            <input type="checkbox" id="allAgree" name="allAgree"
                   class="w-4 h-4 rounded border-gray-300 text-amber-500 focus:ring-amber-400" />
            <label for="allAgree" class="text-sm font-bold text-gray-800 cursor-pointer">
              전체 동의
            </label>
          </div>

          <div class="space-y-1 ml-1">
            <div class="flex items-center gap-2 text-sm">
              <input type="checkbox" name="agree"
                     class="w-4 h-4 rounded border-gray-300 text-amber-500 focus:ring-amber-400" />
              <span>서비스 이용약관 동의 (필수)</span>
              <button type="button"
                      class="ml-auto px-2 py-1 text-xs border border-gray-200 rounded-lg text-gray-500 hover:bg-gray-50"
                      onclick="location.href='${pageContext.request.contextPath}/agree/agreeService.do'">
                내용보기
              </button>
            </div>

            <div class="flex items-center gap-2 text-sm">
              <input type="checkbox" name="agree"
                     class="w-4 h-4 rounded border-gray-300 text-amber-500 focus:ring-amber-400" />
              <span>개인정보 수집 및 동의 (필수)</span>
              <button type="button"
                      class="ml-auto px-2 py-1 text-xs border border-gray-200 rounded-lg text-gray-500 hover:bg-gray-50"
                      onclick="location.href='${pageContext.request.contextPath}/agree/agreePrivacy.do'">
                내용보기
              </button>
            </div>

            <div class="flex items-center gap-2 text-sm">
              <input type="checkbox" name="agree"
                     class="w-4 h-4 rounded border-gray-300 text-amber-500 focus:ring-amber-400" />
              <span>만 14세 이상입니다 (필수)</span>
            </div>

            <div class="flex items-center gap-2 text-sm">
              <input type="checkbox" name="agree"
                     class="w-4 h-4 rounded border-gray-300 text-amber-500 focus:ring-amber-400" />
              <span>(선택) 마케팅 정보 수신 동의</span>
              <button type="button"
                      class="ml-auto px-2 py-1 text-xs border border-gray-200 rounded-lg text-gray-500 hover:bg-gray-50"
                      onclick="location.href='${pageContext.request.contextPath}/agree/agreeMarketing.do'">
                내용보기
              </button>
            </div>
          </div>

          <p class="text-xs text-red-500 mt-1">
            ⚠️ 필수 동의사항에 동의해야 회원가입이 가능합니다.
          </p>
        </div>

        <!-- 회원가입 버튼 -->
        <div class="pt-4">
          <input type="button" name="signUp" value="회원가입" onclick="send(this.form);"
                 class="w-full py-4 rounded-xl font-bold text-lg shadow-md
                        bg-amber-400 text-white hover:bg-amber-500 hover:shadow-lg
                        transition-all transform active:scale-95"/>
        </div>
      </form>
    </div>
  </div>
</main>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
