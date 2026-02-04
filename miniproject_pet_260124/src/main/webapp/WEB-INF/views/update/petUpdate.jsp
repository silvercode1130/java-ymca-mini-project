<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 정보 수정</title>

<style type="text/css">
	.petImgBtn {
		width: 100px;
		height: 100px;
	}
	
	/* 기본은 select 숨기기 */
	.dog_breed, .cat_breed {
		display: none;		
		width: 110px;
	}
	
	.dog_breed select,
	.cat_breed select {
		width: 110px;
		box-sizing: border-box;
	}
	
</style>

<script type="text/javascript">

// type="date"를 기준으로 pet_age 자동 계산
window.onload = function () {
    document.getElementById("pet_bday").addEventListener("change", function () {
        const bday = new Date(this.value);
        const today = new Date();

        let age = today.getFullYear() - bday.getFullYear();
        const m = today.getMonth() - bday.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < bday.getDate())) {
            age--;
        }
        document.getElementById("pet_age").innerText = age >= 0 ? age : 0;
    });
};


// 펫 삭제
function petDelete (f) {
	
	if (!confirm("⚠️ 삭제 하시겠습니까?")) return;
	
	f.method = "POST";
	f.action = "/delete/petDelete.do";
	f.submit();
}


//강아지버튼 누르면 강아지 select 뜨고
//고양이버튼 누르면 고양이 select 뜨게 하는 기능
function showDog() {
	 document.getElementById("dog_breed").style.display = "block";
	 document.getElementById("cat_breed").style.display = "none";
}

function showCat() {
	 document.getElementById("cat_breed").style.display = "block";
	 document.getElementById("dog_breed").style.display = "none";
}



</script>

</head>
<body>
	<form class="petUpdate" action="">
		<div class="title">
			<h2>${ vo.pet_name }의 정보 수정	</h2>
		</div>
		
		<input type="hidden" name="pet_idx" value="${param.pet_idx}">
		
		<!-- #보류 - 펫프로필에 이미지라는 DB가 안생길지도 모름 -->
 		<div class="petImgBtn">
			<button name="pet_img"  id="pet_img"  type="button"  onclick="document.getElementById('fileInput').click();">
				<img alt="(프로필 이미지)" src="${ vo.pet_img }">
				<input type="file" id="fileInput" accept="image/*" style="display:none;">
			</button>
		</div>
		
		<div class="petName">
			<input type="text"  name="pet_name"  id="pet_name" placeholder="이름">
		</div>
		
		<div class="petBday">
			<input type="date"  name="pet_bday"  id="pet_bday" >
		</div>
		
		<div class="petAge"><!-- #확인 - 나이 자동 연산 되는지 체크
						           지금은 pet_age로 등록된 DB값이 없어서 확인 불가 -->
			나이 : <span id="pet_age">-</span> 살
		</div>
		
		<div class="isPrimary">
			<input type="radio"  name="is_primary"  id="is_primary_y"  value="y">대표동물 o
			<input type="radio"  name="is_primary"  id="is_primary_n"   value="n">대표동물 x
		</div>
		
		<!-- #추가 - css에 맞게 강아지 사진 추가 
						   DB에 값 저장되게 하는 기능 추가 -->
		<button class="dogBtn"  type="button"  onclick="showDog()">
			<img alt="(강아지)" src="">
		</button>
		
		<!-- #추가 - css에 맞게 고양이 사진 추가 
						   DB에 값 저장되게 하는 기능 추가 -->
		<button class="catBtn"  type="button"  onclick="showCat()">
			<img alt="(고양이)" src="">
		</button>
		
		<div class="dog_breed"  id="dog_breed">
		    <select>
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

		<div class="cat_breed"  id="cat_breed">
		   <select>
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
		
		<div><!-- radio는 name이 같으면 둘 중 하나만 선택해야 함 -->
			<input type="radio"  name="petGender">남아
			<input type="radio"  name="petGender">여아
		</div>
		
		<div>
			<input type="radio"  name="is_primary">중성화 여부
		</div>
		
		<div><!-- #추가 - 수정시 값 수정  /  삭제시 값 삭제 기능 추가 -->
			<input type="button"  value="저장"  onclick="location.href='/profile/petProfile.do'">
			<input type="button"  value="취소"  onclick="location.href='/profile/petProfile.do'">
		</div>
		
		<div>
			<!-- #보류 - 죽은 반려동물 옆에 이모지 넣기 -->
			<input type="button"  value="추모프로필 전환"  onclick="">
		</div>
	
	</form>
	
		<!-- #연결 - 메인홈(재웅님)이랑 연결이 안되어 있어서 404 에러 뜸 -->
	<form action="/petDelete.do" method="post">
	    <button type="submit">삭제</button>
	</form>
	
</body>
</html>