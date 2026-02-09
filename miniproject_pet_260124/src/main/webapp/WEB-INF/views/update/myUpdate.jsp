<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>

<style type="text/css">
  .myImgBtn { 
  						width: 100px; 
  						height: 100px; 
  						border: 1px solid #ccc; 
  						cursor: pointer; 
  						position: relative; 
  						}
  						
   #preview { 
   						width: 100%; 
   						height: 100%; 
   						object-fit: cover; 
   						}
   						
   .msg-style { 
   						font-size: 12px; 
   						margin-left: 10px; 
   						}
   
   
</style>

<!-- jQuery 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Daum 주소 검색 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

// 주소창 띄우기
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);

            // 우편번호
            $("#mem_zipcode").val(data.zonecode);

            // 기본주소
            $("#mem_addr").val(data.address);

            // 상세주소는 직접 입력
            $("#mem_addr_detail").val("");
            $("#mem_addr_detail").focus();
        }
    }).open();
}


//아이디/닉네임 중복 체크 (통합 및 에러 수정)
const originalNickname = "${profile.mem_nickname}";

document.addEventListener("DOMContentLoaded", function () {
    console.log("중복 체크 JS 로딩됨");

    // input 요소 가져오기
    const idInput = document.querySelector("#id");
    const nicknameInput = document.querySelector("#nickname");

    // 메시지 span
    const idMsg = document.querySelector("#idMsg");
    const nicknameMsg = document.querySelector("#nicknameMsg");

    // 공통 함수
    function checkDuplicate(type) {
        let value, msgElement, url;

        if(type === "id") {
            value = idInput.value.trim();
            msgElement = idMsg;
            url = "/member/check_id.do?mem_id=";
        } else {
            value = nicknameInput.value.trim();
            msgElement = nicknameMsg;
            url = "/member/check_nickname.do?mem_nickname=";
        }

        if(value === "") {
            msgElement.textContent = "";
            return;
        }
        
     // ⭐ 기존 닉네임이면 중복체크 안 함
        if (type === "nickname" && value === originalNickname) {
            nicknameMsg.style.color = "gray";
            nicknameMsg.textContent = "현재 사용 중인 닉네임입니다.";
            return;
        }

        fetch(url + encodeURIComponent(value))
            .then(response => response.json())  // JSON으로 받기
            .then(data => {
                if(data.result) {
                    msgElement.style.color = "gray";
                    msgElement.textContent = "✔ 사용 가능합니다.";
                } else {
                    msgElement.style.color = "red";
                    msgElement.textContent = "✘ 이미 사용 중입니다.";
                }
            })
            .catch(err => {
                console.error("중복 체크 에러:", err);
                msgElement.style.color = "red";
                msgElement.textContent = "중복 확인 실패";
            });
    }

    // 이벤트 등록
    if(idInput) {
        idInput.addEventListener("input", () => checkDuplicate("id"));
    }

    if(nicknameInput) {
        nicknameInput.addEventListener("input", () => checkDuplicate("nickname"));
    }
});



// 미리보기 기능
function previewImage(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


// 주소 저장 버튼
function saveAddr() {
    const memZip = document.getElementById("mem_zipcode").value;
    const memAddr = document.getElementById("mem_addr").value;
    const memDetail = document.getElementById("mem_addr_detail").value;
    const memIdx  = document.getElementById("mem_idx").value;

    fetch("/member/updateAddrAjax.do", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body:
            "mem_zipcode=" + encodeURIComponent(memZip)
          + "&mem_addr=" + encodeURIComponent(memAddr)
          + "&mem_addr_detail=" + encodeURIComponent(memDetail)
          + "&mem_idx=" + encodeURIComponent(memIdx)
    })
    .then(res => res.text())
    .then(result => {
        if (result === "ok") {
            alert("주소 저장 완료!");
            location.reload();
        }
    });
}


// 이미지 저장
function saveImg() {
    const fileInput = document.getElementById("mem_img");

    if (!fileInput || fileInput.files.length === 0) {
        alert("파일을 선택해주세요");
        return;
    }

    const file = fileInput.files[0];

    const formData = new FormData();
    formData.append("mem_img", file);

    fetch("/member/updateProfileImgAjax.do", {
        method: "POST",
        body: formData
    })
    .then(res => res.text())
    .then(result => {
        console.log("업로드 결과:", result);
    });
}


</script>

</head>
<body>
  <!--  <form class="myUpdate" action="/update/myUpdate.do"  method="post" enctype="multipart/form-data"> -->
   <form class="myUpdate"  action="/update/myUpdate.do" method="post">
      
      <div class="title">
         <h2>${ user.mem_name }님의 정보 수정</h2>
      </div>
   
      <input type="hidden"   id="mem_idx"   name="mem_idx"  value="${user.mem_idx}">
      <input type="hidden" id="mem_role_idx"   name="mem_role_idx"   value="${ user.mem_role_idx }">
      <input type="hidden"  id="mem_grade_idx"   name="mem_grade_idx"   value="${ user.mem_grade_idx }">
    <%--    <input type="hidden"   id="addr_idx"   name="addr_idx"  value="${profile.addr_idx}"> --%>
      
      
<%--       <div class="myImgBtn" style="width: 150px; height: 150px; border: 1px solid #ddd; border-radius: 10px; overflow: hidden; position: relative; cursor: pointer;" onclick="document.getElementById('fileInput').click();">
    
       <input type="file" name="mem_photo" id="fileInput" onchange="previewImage(this)" style="display: none;">
       
       <img id="preview"  alt="(프로필 이미지)"
     		src="${empty profile.mem_img ? '/resources/images/no_profile.png' : profile.mem_img}"
            style="width: 100%; height: 100%; object-fit: cover;">
       
       <div style="position: absolute; bottom: 0; width: 100%; background: rgba(0,0,0,0.5); color: #fff; font-size: 12px; text-align: center; padding: 5px 0;">
           사진 변경
            
       </div>
   </div> --%>
   		
   	<div>
   		<input type="file" id="mem_img"> <br>
		<button type="button" onclick="saveImg()">이미지 저장</button>
   	</div>	
      
	<hr>
      
      <div><!-- #추가 - 중복방지 기능 추가 -->
         <label>닉네임</label>
         <input type="text"  id="nickname" name="mem_nickname"  value="${ profile.mem_nickname }">
         <span id="nicknameMsg" class="msg-style"></span>
      </div>
      
      <div>
         <label>자기소개</label> <br>
         <textarea name="mem_intro"  rows="5"  cols="30">${ profile.mem_intro }</textarea>
      </div>
           
      <hr>
      
      <div>
         회원 종류 ${ role.role_name } <br>
         <span style="font-size: 12px; color: gray;">수의사임을 증명하시면 커뮤니티에 전문적인 답변을 달 수 있습니다.</span>  
      </div> <br> 
      
      <div>
         회원 등급 ${ grade.grade_name } <br>
         등급별 할인율 ${ grade.grade_discount_rate } <br>
         <span style="font-size: 12px; color: gray;">회원 등급이 올라가면 할인율이 높아집니다.</span>
      </div>
      
      <hr>
      
      <div>
         <label>아이디</label><!-- #추가 - 중복 ID 점검 + 버튼 비활성화 -->
         <input type="text"  id="id"  name="mem_id"  value="${ user.mem_id }">
          <span id="idMsg" class="msg-style"></span>
      </div>
      
      <div>
         <label>비밀번호</label><!-- #추가 - 이전 pwd랑 겹치는지 점검 + 버튼 비활성화 -->
         <input type="text"  id="pwd"  name="mem_pwd"  value="${ user.mem_pwd }">
      </div>
      
      <div>
         <label>이름</label>
         <input type="text"   id="name"  name="mem_name"  value="${ user.mem_name }">
      </div>
      
      <div>
         <label>생년월일</label>
         <input type="date"  id="bday"  name="mem_bday"  value="${ fn:substring(user.mem_bday,0,10)}">
         <%-- <span style="color: gray; font-size: 12px; ">
         	<fmt:parseDate value="${user.mem_bday}"
							               pattern="yyyy-MM-dd HH:mm:ss"
							               var="bdayDate" />
			<fmt:formatDate value="${bdayDate}" pattern="yyyy-MM-dd" />
         </span>  --%>
         
      </div>
      
      <div>
         <label>전화번호</label>
         <input type="text"  id="tel"  name="mem_tel"  value="${ user.mem_tel }">
      </div>
      
      <div>
         <label>이메일</label>
         <input type="email"  id="email"  name="mem_email"  value="${ user.mem_email }">
      </div>
      
      <hr>
      
      <div>
            등록지 주소
            <!-- for(MemberAddrVo addr : addr_list)  -->
            <c:forEach var="addrVo"  items="${ addr_list }">
                (${ addrVo.mem_zipcode }) ${ addrVo.mem_addr } - ${ addrVo.mem_addr_detail } <br>
            </c:forEach>
      </div>
      
      <hr>
      
      <div>
          <label>주소등록 하기</label> <br>
          <input type="text" id="mem_zipcode" name="mem_zipcode" placeholder="우편번호" readonly> <br>
          <input type="text" id="mem_addr" name="mem_addr"   placeholder="기본 주소" readonly> <br>
          <input type="text" id="mem_addr_detail" name="mem_addr_detail"   placeholder="상세 주소"> <br>
          <button type="button" onclick="findAddr()">주소 검색</button>
          <button type="button" onclick="saveAddr()">주소 저장</button>     
      </div>
      
      <hr>
      
      <div><!-- #추가 - 저장 버튼 누르면 db가 저장되거나 수정됨 -->
         <input type="submit" value="저장">
      </div> 
      
   </form>
</body>
</html>