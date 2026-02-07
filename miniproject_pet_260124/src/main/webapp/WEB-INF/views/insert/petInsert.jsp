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
document.addEventListener("DOMContentLoaded", function () {
    const bdayInput = document.getElementById("pet_bday");
    const ageSpan   = document.getElementById("pet_age");

    if (!bdayInput || !ageSpan) return; // 혹시 모를 안전장치

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
});



// 강아지버튼 누르면 강아지 select 뜨고
// 고양이버튼 누르면 고양이 select 뜨게 하는 기능
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
	<form class="petUpdate" action="/insert/petInsert.do" method="post">
		<div class="title">
			<h2>반려동물 등록</h2>
		</div>
		
		<div class="petName">
			<input type="text"  name="pet_name"  id="pet_name" placeholder="이름">
		</div>
		
		<div class="petBday">
			<input type="date"  name="pet_bday"  id="pet_bday" >
		</div>
		
		<div class="petAge">
			나이 : <span id="pet_age">-</span> 살
		</div>
		
		<div class="isPrimary">
			<input type="radio"  name="is_primary"  id="is_primary"  value="Y">대표동물 o
			<input type="radio"  name="is_primary"  id="is_primary"   value="N">대표동물 x
		</div>
		
		<input type="radio" name="pet_species" value="DOG"
		       checked onclick="showDog()"> 강아지
		
		<input type="radio" name="pet_species" value="CAT"
		       onclick="showCat()"> 고양이
				
		<div class="dog_breed"  id="dog_breed">
		    <select name="pet_breed">
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
		   <select name="pet_breed">
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
		
		<div>
			<input type="radio" name="pet_gender" value="M">남아
			<input type="radio" name="pet_gender" value="F">여아
		</div>
		
		<div>
			<input type="radio"  name="isNeutered">중성화 o
			<input type="radio"  name="isNeutered">중성화 x
		</div>
		
		<div>
			<input type="submit" value="등록">
			<input type="button"  value="취소"  onclick="location.href='/profile/petProfile_form.do'">
		</div> 
	
	</form>
</body>
</html>