/*
-- 아이템 더미데이터
-- DELETE FROM item;

-- ===== 사료 (item_type_idx = 2) =====

INSERT INTO item (
    item_idx,
    item_name,
    item_origin_price,
    item_now_price,
    item_stock,
    item_type_idx,
    item_for,
    item_is_sale,
    item_brand,
    item_thumbnail_img,
    item_detail_img,
    item_regdate,
    item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '탐사 클래식 진도 사료, 10kg, 2개',
    36000,
    29660,
    33,
    2,
    'DOG',
    'Y',
    '탐사',
    'item_thumbnail/test01.jpg',
    'item_detail/long01.jpg',
    TO_DATE('2025.08.16','YYYY.MM.DD'),
    TO_DATE('2026.01.24','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '국견진도 프리미엄급 전연령 진돗개사료 강아지사료 개사료 샘플2봉증정',
    42200, 38800, 7,
    2, 'DOG', 'Y', '대림팜스',
    'item_thumbnail/test02.jpg', 'item_detail/long02.png',
    TO_DATE('2025.08.09','YYYY.MM.DD'), TO_DATE('2026.01.01','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    'now 퍼피 그레인프리 스몰브리드 건식사료',
    51000, 34540, 15,
    2, 'DOG', 'Y', '펫큐리안',
    'item_thumbnail/test03.png', 'item_detail/long03.jpeg',
    TO_DATE('2025.02.22','YYYY.MM.DD'), TO_DATE('2025.10.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '바이오진도 강아지 대형견 진돗개 대용량 사료',
    40900, 34090, 256,
    2, 'DOG', 'Y', '천하제일사료',
    'item_thumbnail/test04.png', 'item_detail/long04.jpg',
    TO_DATE('2025.04.12','YYYY.MM.DD'), TO_DATE('2026.01.01','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '펫발란스 어덜트 미디움 & 라지 브리드 치킨 라이스 반려견 사료',
    25850, 24600, 97,
    2, 'DOG', 'Y', '펫발란스',
    'item_thumbnail/test05.png', 'item_detail/long05.jpg',
    TO_DATE('2025.07.23','YYYY.MM.DD'), TO_DATE('2026.01.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '팜스코 에브리캣 10kg 참치맛+닭 대용량 고양이사료 전연령고양이사료',
    28500, 27300, 331,
    2, 'CAT', 'Y', '대림팜스',
    'item_thumbnail/test06.png', 'item_detail/long06.jpg',
    TO_DATE('2025.01.12','YYYY.MM.DD'), TO_DATE('2026.01.24','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    'ANF 식스프리플러스 인도어 캣 기능성 사료',
    31200, 21920, 74,
    2, 'CAT', 'Y', 'ANF',
    'item_thumbnail/test07.png', 'item_detail/long07.jpg',
    TO_DATE('2025.06.04','YYYY.MM.DD'), TO_DATE('2026.01.12','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '뉴트리나 프라임캣 블루 20kg 고양이사료 대용량 대포장 길냥이밥',
    31680, 31680, 53,
    2, 'CAT', 'N', '뉴트리나',
    'item_thumbnail/test08.jpg', 'item_detail/long08.jpg',
    TO_DATE('2025.09.27','YYYY.MM.DD'), TO_DATE('2026.01.05','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '코멧 베이직 전연령 고양이 사료',
    51300, 29910, 378,
    2, 'CAT', 'Y', '코멧',
    'item_thumbnail/test09.jpg', 'item_detail/long09.jpg',
    TO_DATE('2025.11.12','YYYY.MM.DD'), TO_DATE('2026.01.04','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '잘먹잘싸 전연령용 고양이 건식사료',
    19800, 19800, 34,
    2, 'CAT', 'N', '잘먹잘싸',
    'item_thumbnail/test10.jpg', 'item_detail/long10.png',
    TO_DATE('2025.11.27','YYYY.MM.DD'), TO_DATE('2026.01.02','YYYY.MM.DD')
);

-- ===== 간식 (item_type_idx = 3) =====

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '닥터뉴트리코어 강아지 가수분해 덴탈껌',
    29700, 28700, 132,
    3, 'DOG', 'Y', '닥터뉴트리코어',
    'item_thumbnail/test11.jpg', 'item_detail/long11.jpg',
    TO_DATE('2025.02.12','YYYY.MM.DD'), TO_DATE('2026.01.06','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '탐사 강아지 간식 리얼 촉촉 큐브 져키',
    21000, 12990, 76,
    3, 'DOG', 'Y', '탐사',
    'item_thumbnail/test12.jpg', 'item_detail/long12.jpg',
    TO_DATE('2025.05.27','YYYY.MM.DD'), TO_DATE('2026.01.03','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '탐사 강아지 고구마말랭이 간식',
    21000, 9890, 12,
    3, 'DOG', 'Y', '탐사',
    'item_thumbnail/test13.jpg', 'item_detail/long13.jpg',
    TO_DATE('2025.08.11','YYYY.MM.DD'), TO_DATE('2026.01.06','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '졸리마켓 강아지 대용량 육포',
    18070, 13900, 143,
    3, 'DOG', 'Y', '졸리마켓',
    'item_thumbnail/test14.jpg', 'item_detail/long14.jpg',
    TO_DATE('2025.05.05','YYYY.MM.DD'), TO_DATE('2026.01.04','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '모모펫 강아지 멍묵멍묵 마블링 대용량 간식',
    25000, 14980, 229,
    3, 'DOG', 'Y', '모모펫',
    'item_thumbnail/test15.png', 'item_detail/long15.jpg',
    TO_DATE('2025.09.14','YYYY.MM.DD'), TO_DATE('2026.01.08','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '바른생각 캣 스틱 간식 100p',
    31500, 25200, 23,
    3, 'CAT', 'Y', '바른생각',
    'item_thumbnail/test16.jpg', 'item_detail/long16.png',
    TO_DATE('2025.01.01','YYYY.MM.DD'), TO_DATE('2026.01.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '굿밸런스 고양이 짜먹는 간식 플러스',
    23880, 15800, 261,
    3, 'CAT', 'Y', '굿밸런스',
    'item_thumbnail/test17.jpg', 'item_detail/long17.jpg',
    TO_DATE('2025.07.23','YYYY.MM.DD'), TO_DATE('2026.01.11','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '동원뉴트리플랜 고양이 간식 습식캔',
    43200, 21570, 32,
    3, 'CAT', 'Y', '동원뉴트리플랜',
    'item_thumbnail/test18.jpg', 'item_detail/long18.jpg',
    TO_DATE('2025.03.21','YYYY.MM.DD'), TO_DATE('2026.01.09','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '브리더랩 반려동물 월간통살 스틱타입 간식',
    7680, 7680, 256,
    3, 'CAT', 'N', '피에스코리아',
    'item_thumbnail/test19.jpg', 'item_detail/long19.jpg',
    TO_DATE('2025.09.01','YYYY.MM.DD'), TO_DATE('2026.01.14','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '보양대첩 고양이 캔 수 닭고기와크렌베리 240g',
    9310, 9310, 62,
    3, 'CAT', 'N', '미소',
    'item_thumbnail/test20.jpg', 'item_detail/long20.jpg',
    TO_DATE('2025.02.21','YYYY.MM.DD'), TO_DATE('2026.01.15','YYYY.MM.DD')
);

-- 2차 추가데이터
-- 가구 = 1(일반)
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'펫인 애견 울타리 세트 실내용 반려동물 펜스',
    86800, 86800, 21,
    1,'DOG','N','펫인',
    'item_thumbnail/test21.jpg','item_detail/long21.jpg',
    TO_DATE('2025.05.01','YYYY.MM.DD'),TO_DATE('2026.01.01','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'잉글랜더 오트 강아지집 고양이 숨숨집 겸용 협탁 600*400, 화이트, 1개',
    59000, 29900, 234,
    1,'DOG','Y','잉글랜더',
    'item_thumbnail/test22.jpg','item_detail/long22.jpg',
    TO_DATE('2025.06.08','YYYY.MM.DD'),TO_DATE('2026.01.06','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'딩동펫 반려동물 모바일 2단 트롤리 행거',
    28000, 26600, 2,
    1,'DOG','Y','딩동펫',
    'item_thumbnail/test23.jpg','item_detail/long23.jpg',
    TO_DATE('2025.05.13','YYYY.MM.DD'),TO_DATE('2026.01.12','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'친환경 원목 고양이 침대 해먹 강아지침대 + 시트세트',
    35000, 23400, 63,
    1,'DOG','Y','와이지글로벌',
    'item_thumbnail/test24.jpg','item_detail/long24.jpg',
    TO_DATE('2025.04.09','YYYY.MM.DD'),TO_DATE('2026.01.20','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'미니행거 강아지 옷장',
    16060, 16060, 12,
    1,'DOG','N','당감샵',
    'item_thumbnail/test25.jpg','item_detail/long25.jpg',
    TO_DATE('2025.02.11','YYYY.MM.DD'),TO_DATE('2026.01.21','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'레이원 강아지 울타리 반려동물 울타리 화장실 분리 울타리',
    39900, 29900, 13,
    1,'DOG','Y','레이원무역',
    'item_thumbnail/test26.jpg','item_detail/long26.jpg',
    TO_DATE('2025.05.21','YYYY.MM.DD'),TO_DATE('2026.01.13','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'시티캣 친환경 캣휠 원목 저소음 지름 100cm',
    160550, 158940, 67,
    1,'CAT','Y','망고',
    'item_thumbnail/test27.jpg','item_detail/long27.png',
    TO_DATE('2025.01.12','YYYY.MM.DD'),TO_DATE('2026.01.17','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'코멧 펫 고양이 쇼파 스크래쳐, 타원형, 1개',
    4990, 4990, 99,
    1,'CAT','N','코멧',
    'item_thumbnail/test28.jpg','item_detail/long28.jpg',
    TO_DATE('2025.03.20','YYYY.MM.DD'),TO_DATE('2026.01.12','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'펫인꼬 대형 캣폴 캣타워',
    94450, 93500, 75,
    1,'CAT','Y','펫인',
    'item_thumbnail/test29.jpg','item_detail/long29.jpg',
    TO_DATE('2025.11.10','YYYY.MM.DD'),TO_DATE('2026.01.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'딩동펫 고양이 스크래쳐 캣타워',
    109000, 103550, 18,
    1,'CAT','Y','딩동펫',
    'item_thumbnail/test30.jpg','item_detail/long30.jpg',
    TO_DATE('2025.07.15','YYYY.MM.DD'),TO_DATE('2026.01.14','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'북유럽풍 고양이 하우스 침대 협탁 사이드 테이블, 화이트 원목색, 1개',
    59800, 39800, 99,
    1,'CAT','Y','BYOU',
    'item_thumbnail/test31.jpg','item_detail/long31.jpeg',
    TO_DATE('2025.06.16','YYYY.MM.DD'),TO_DATE('2026.01.18','YYYY.MM.DD')
);

-- 배변용품 = 6
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'쎄니펫 고양이 강아지 배변 탈취 세정제 암모니아 요산 분해 제거 무향',
    28800, 17940, 13,
    6,'DOG','Y','쎄니펫',
    'item_thumbnail/test32.jpg','item_detail/long32.png',
    TO_DATE('2025.04.19','YYYY.MM.DD'),TO_DATE('2026.01.15','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'탐사 실속형 배변패드',
    11990, 11990, 24,
    6,'DOG','N','탐사',
    'item_thumbnail/test33.jpg','item_detail/long33.jpg',
    TO_DATE('2025.12.17','YYYY.MM.DD'),TO_DATE('2026.01.10','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'탐사 강아지 그물망 배변판',
    10500, 5790, 27,
    6,'DOG','Y','탐사',
    'item_thumbnail/test34.jpg','item_detail/long34.jpg',
    TO_DATE('2025.07.13','YYYY.MM.DD'),TO_DATE('2026.01.02','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'오늘 강아지 반려견 배변패드 20g',
    26170, 25900, 62,
    6,'DOG','Y','DOG창고',
    'item_thumbnail/test35.jpg','item_detail/long35.jpg',
    TO_DATE('2025.11.02','YYYY.MM.DD'),TO_DATE('2026.01.11','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'어반워키스 반려동물 휴대용 산화생분해 배변봉투, 1개, 324개입',
    10050, 10050, 75,
    6,'DOG','N','재주',
    'item_thumbnail/test36.jpg','item_detail/long36.png',
    TO_DATE('2025.01.17','YYYY.MM.DD'),TO_DATE('2026.01.09','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'삼육오일 응고형 365샌드 리얼 카사바 고양이 모래',
    39800, 34900, 99,
    6,'CAT','Y','유니커머스',
    'item_thumbnail/test37.jpg','item_detail/long37.jpg',
    TO_DATE('2025.07.18','YYYY.MM.DD'),TO_DATE('2026.01.16','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'탐사 베이직 대용량 고양이 화장실 + 모래삽 세트',
    14270, 9990, 12,
    6,'CAT','Y','탐사',
    'item_thumbnail/test38.jpg','item_detail/long38.jpg',
    TO_DATE('2025.02.16','YYYY.MM.DD'),TO_DATE('2026.01.03','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'티유 사막화방지 벌집구조 고양이 화장실 모래매트',
    14800, 8750, 37,
    6,'CAT','Y','티유',
    'item_thumbnail/test39.jpg','item_detail/long39.jpg',
    TO_DATE('2025.06.05','YYYY.MM.DD'),TO_DATE('2026.01.10','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'삼육오일 고양이 두부모래 2.0',
    59600, 44500, 19,
    6,'CAT','Y','유니커머스',
    'item_thumbnail/test40.jpg','item_detail/long40.jpg',
    TO_DATE('2025.08.15','YYYY.MM.DD'),TO_DATE('2026.01.17','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'바이엑스 vi-x 펫전용 500ml 고양이 반려동물 배변 냄새 제거 탈취제',
    15500, 11400, 13,
    6,'CAT','Y','반다비앤에이치',
    'item_thumbnail/test41.jpg','item_detail/long41.jpg',
    TO_DATE('2029.09.03','YYYY.MM.DD'),TO_DATE('2026.01.11','YYYY.MM.DD')
);

-- 쿠션 = 8
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'미마코 통세탁 사계절 애견 강아지 방석 대형 쿠션',
    30000, 21600, 99,
    8,'DOG','Y','온오퍼',
    'item_thumbnail/test42.jpg','item_detail/long42.png',
    TO_DATE('2025.12.14','YYYY.MM.DD'),TO_DATE('2026.01.18','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'펫루미 푹신푹신 반려동물 꿀잠 방석',
    29900, 10900, 48,
    8,'DOG','Y','아일루미',
    'item_thumbnail/test43.jpg','item_detail/long43.jpg',
    TO_DATE('2925.04.06','YYYY.MM.DD'),TO_DATE('2026.01.15','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'코멧 펫 강아지 쿠션',
    19000, 7700, 78,
    8,'DOG','Y','코멧',
    'item_thumbnail/test44.jpg','item_detail/long44.jpg',
    TO_DATE('2025.06.14','YYYY.MM.DD'),TO_DATE('2026.01.16','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'포미온 반려동물 사계절용 꿀잠유도 펫쿠션',
    50000, 16100, 23,
    8,'DOG','Y','포미온',
    'item_thumbnail/test45.jpg','item_detail/long45.png',
    TO_DATE('2025.08.04','YYYY.MM.DD'),TO_DATE('2026.01.05','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'K-STORE 포근한 쇼파용 강아지 방석',
    36900, 21900, 11,
    8,'DOG','Y','k스토어',
    'item_thumbnail/test46.jpg','item_detail/long46.jpg',
    TO_DATE('2025.01.07','YYYY.MM.DD'),TO_DATE('2026.01.09','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'푸푸앤코 대형 쿠션 고양이 침대 강아지 방석',
    49900, 40000, 12,
    8,'CAT','Y','제이에이치컴퍼니',
    'item_thumbnail/test47.jpg','item_detail/long47.png',
    TO_DATE('2025.09.11','YYYY.MM.DD'),TO_DATE('2026.01.08','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'데코원 원스 극세사 강아지 방석 솜포함',
    24900, 24900, 95,
    8,'CAT','N','데코원',
    'item_thumbnail/test48.jpg','item_detail/long48.jpg',
    TO_DATE('2025.03.12','YYYY.MM.DD'),TO_DATE('2026.01.04','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'런레이더 반려동물 강아지 마약 방석',
    22900, 20690, 23,
    8,'DOG','Y','펫앤마마',
    'item_thumbnail/test49.jpg','item_detail/long49.png',
    TO_DATE('2025.01.05','YYYY.MM.DD'),TO_DATE('2026.01.01','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'제이_ 푹신한 강아지방석 고양이방석 애견 쿠션 둥지 집. 2가지 색상',
    34900, 19900, 87,
    8,'CAT','Y','제이마켓',
    'item_thumbnail/test50.jpg','item_detail/long50.jpg',
    TO_DATE('2025.02.16','YYYY.MM.DD'),TO_DATE('2026.01.12','YYYY.MM.DD')
);

-- 장난감 = 4
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'해밀펫 블루투스 점핑볼 강아지 움직이는 장난감 노즈워크',
    45900, 32800, 511,
    4,'DOG','Y','유라보',
    'item_thumbnail/test51.jpg','item_detail/long51.png',
    TO_DATE('2025.07.23','YYYY.MM.DD'),TO_DATE('2026.01.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'BEST AWARDS 리스펫 리스펫 강아지 파스텔러버 터그놀이 로프 장난감',
    8990, 8990, 41,
    4,'DOG','N','리스펫',
    'item_thumbnail/test52.jpg','item_detail/long52.jpg',
    TO_DATE('2025.12.11','YYYY.MM.DD'),TO_DATE('2026.01.06','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'코멧 펫 당근 실타래 장난감',
    3100, 1300, 990,
    4,'DOG','Y','코멧',
    'item_thumbnail/test53.jpg','item_detail/long53.jpg',
    TO_DATE('2025.11.06','YYYY.MM.DD'),TO_DATE('2026.01.05','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'SC FMCG 강아지터그장난감 반려동물 신문지 장난감',
    19000, 8800, 1110,
    4,'DOG','Y','송천에프엠씨지',
    'item_thumbnail/test54.jpg','item_detail/long54.jpg',
    TO_DATE('2025.11.17','YYYY.MM.DD'),TO_DATE('2026.01.21','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'딩동펫 반려동물 베프인형장난감 2종 세트',
    7000, 7000, 3280,
    4,'DOG','N','딩동펫',
    'item_thumbnail/test55.jpg','item_detail/long55.jpg',
    TO_DATE('2025.02.18','YYYY.MM.DD'),TO_DATE('2026.01.02','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'딩동펫 반려동물 크림 실타래 장난감 8종 세트, 블루, 1세트',
    9800, 9010, 124,
    4,'DOG','Y','딩동펫',
    'item_thumbnail/test56.jpg','item_detail/long56.jpg',
    TO_DATE('2025.03.07','YYYY.MM.DD'),TO_DATE('2026.01.13','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,'딩동펫 기린실타래인형 애견장난감',
    4900, 3900, 191,
    4,'DOG','Y','딩동펫',
    'item_thumbnail/test57.jpg','item_detail/long57.jpg',
    TO_DATE('2025.09.25','YYYY.MM.DD'),TO_DATE('2026.01.09','YYYY.MM.DD')
);



-- 3차 추가 더미데이터
-- type: 4=장난감, 5=위생용품, 10=하우스/이동장(켄넬)

-- 1) 장난감
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '댕냥픽 터그볼 움직이는 장난감 강아지 터그 공',
    20000, 13900, 321,
    4, 'DOG', 'Y', '댕냥픽',
    'item_thumbnail/test58.jpg', 'item_detail/long58.png',
    TO_DATE('2025.12.26','YYYY.MM.DD'), TO_DATE('2026.01.20','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '나띵베럴 삑삑이 강아지 장난감 애착인형',
    23400, 10000, 21,
    4, 'DOG', 'Y', '나띵배럴',
    'item_thumbnail/test59.jpg', 'item_detail/long59.png',
    TO_DATE('2025.03.08','YYYY.MM.DD'), TO_DATE('2026.01.14','YYYY.MM.DD')
);


-- 2) 위생용품 (item_type_idx = 5)
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '쉬즈곤 부스트 샴푸 캣 저자극 애플 블라썸향',
    16000, 11900, 32,
    5, 'CAT', 'Y', '쉬즈곤',
    'item_thumbnail/test60.jpg', 'item_detail/long60.jpg',
    TO_DATE('2025.08.19','YYYY.MM.DD'), TO_DATE('2026.01.10','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '리스펫랩 더 밸런스 샴푸 포 캣',
    12000, 8900, 18,
    5, 'CAT', 'Y', '리스펫',
    'item_thumbnail/test61.jpg', 'item_detail/long61.jpg',
    TO_DATE('2025.09.27','YYYY.MM.DD'), TO_DATE('2026.01.04','YYYY.MM.DD')
);

-- now_price/stock 누락 → 원가/stock 그대로 유지, is_sale = 'N'
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '하이포닉 알러제닉 저자극 모든고양이용 무향 샴푸',
    25000, 25000, 13,
    5, 'CAT', 'N', '하이포닉',
    'item_thumbnail/test62.jpg', 'item_detail/long62.png',
    TO_DATE('2025.06.09','YYYY.MM.DD'), TO_DATE('2026.01.31','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '연생각 개놀자 오가닉 펜타곤 넥카라',
    45000, 24490, 163,
    5, 'GENERAL', 'Y', '자연생각',
    'item_thumbnail/test63.jpg', 'item_detail/long63.jpg',
    TO_DATE('2025.08.20','YYYY.MM.DD'), TO_DATE('2026.01.07','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '에티펫 반려동물용 눈귀입 깨끗 아쿠아티슈 80p',
    15000, 10830, 4523,
    5, 'GENERAL', 'Y', '맑은 미소',
    'item_thumbnail/test64.jpg', 'item_detail/long64.jpg',
    TO_DATE('2025.08.10','YYYY.MM.DD'), TO_DATE('2026.01.22','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '붐붐포 반려동물 듀얼 돌기 손가락 일회용 칫솔 치카 패드 60p',
    15900, 7900, 301,
    5, 'GENERAL', 'Y', '붐붐포',
    'item_thumbnail/test65.jpg', 'item_detail/long65.jpg',
    TO_DATE('2025.07.28','YYYY.MM.DD'), TO_DATE('2026.01.08','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '에티펫 반려동물 손발엉덩이 깨끗 아쿠아티슈, 80개입, 4개',
    10010, 10010, 34,
    5, 'GENERAL', 'N', '맑은 미소',
    'item_thumbnail/test66.jpg', 'item_detail/long66.jpg',
    TO_DATE('2025.05.01','YYYY.MM.DD'), TO_DATE('2026.01.15','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '버박 에피오틱 귀세정제',
    15000, 15000, 897,
    5, 'GENERAL', 'N', '버박',
    'item_thumbnail/test67.jpg', 'item_detail/long67.jpg',
    TO_DATE('2025.07.02','YYYY.MM.DD'), TO_DATE('2026.01.24','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '쉬즈곤 반려동물 부스트 치약 고구마향, 70g, 1개',
    19000, 8900, 382,
    5, 'GENERAL', 'Y', '쉬즈곤',
    'item_thumbnail/test68.jpg', 'item_detail/long68.png',
    TO_DATE('2025.04.11','YYYY.MM.DD'), TO_DATE('2026.01.03','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '에티펫 반려동물 손발엉덩이 깨끗 아쿠아티슈, 80개입, 2개',
    5370, 5370, 26,
    5, 'GENERAL', 'N', '맑은 미소',
    'item_thumbnail/test69.jpg', 'item_detail/long69.jpg',
    TO_DATE('2025.04.01','YYYY.MM.DD'), TO_DATE('2026.01.02','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '휘슬 반려동물 주방세제 펫 볼 버블워시',
    15900, 7290, 213,
    5, 'GENERAL', 'Y', '휘슬',
    'item_thumbnail/test70.jpg', 'item_detail/long70.png',
    TO_DATE('2025.06.20','YYYY.MM.DD'), TO_DATE('2026.01.23','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '[동물병원 입점] 몽셰펫 반려동물 덴탈 스프레이 뿌리는 치약 구취/치석제거',
    30000, 15400, 94,
    5, 'GENERAL', 'Y', '몽셰펫',
    'item_thumbnail/test71.jpg', 'item_detail/long71.jpg',
    TO_DATE('2025.09.12','YYYY.MM.DD'), TO_DATE('2026.01.06','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '버박 CET 치약 닭고기맛, 70g, 1개',
    15990, 15990, 16,
    5, 'GENERAL', 'N', '버박',
    'item_thumbnail/test72.jpg', 'item_detail/long72.png',
    TO_DATE('2025.01.03','YYYY.MM.DD'), TO_DATE('2026.01.11','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '하이포닉 노스팅 편백수 강아지 귀세정제, 120ml, 1개',
    19000, 18620, 26,
    5, 'GENERAL', 'Y', '하이포닉',
    'item_thumbnail/test73.jpg', 'item_detail/long73.jpg',
    TO_DATE('2025.05.02','YYYY.MM.DD'), TO_DATE('2026.01.01','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '리스펫 반려동물 LED 다보여 발톱깎이 4.3 x 15 cm, 핑크, 1개',
    12900, 8990, 12,
    5, 'GENERAL', 'Y', '리스펫',
    'item_thumbnail/test74.jpg', 'item_detail/long74.jpg',
    TO_DATE('2025.05.04','YYYY.MM.DD'), TO_DATE('2026.01.05','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 펫 미니 클리퍼 YP-7012, 화이트, 1개',
    11970, 11370, 11,
    5, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test75.jpg', 'item_detail/long75.jpg',
    TO_DATE('2025.11.13','YYYY.MM.DD'), TO_DATE('2026.01.25','YYYY.MM.DD')
);


-- 3) 켄넬/이동장 = item_type_idx 10 (하우스/이동장)
INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 반려동물 에어켄넬',
    52900, 45230, 13,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test76.jpg', 'item_detail/long76.jpg',
    TO_DATE('2025.04.05','YYYY.MM.DD'), TO_DATE('2026.01.26','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '마마쇼 세이프락 강아지 고양이 켄넬 이동장 캐리어',
    14900, 11980, 209,
    10, 'GENERAL', 'Y', '마마쇼',
    'item_thumbnail/test77.jpg', 'item_detail/long77.jpg',
    TO_DATE('2025.12.03','YYYY.MM.DD'), TO_DATE('2026.01.04','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '페밀리펫 행복켄넬 반려견 이동장',
    39780, 39780, 19,
    10, 'GENERAL', 'N', '행복켄넬',
    'item_thumbnail/test78.jpg', 'item_detail/long78.jpg',
    TO_DATE('2025.03.14','YYYY.MM.DD'), TO_DATE('2026.01.19','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 반려동물 아이볼 다용도 통풍 메쉬 이동가방',
    27900, 25110, 323,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test79.jpg', 'item_detail/long79.jpg',
    TO_DATE('2025.03.06','YYYY.MM.DD'), TO_DATE('2026.01.27','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 반려동물 나들이 하드켄넬',
    16900, 16050, 3,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test80.jpg', 'item_detail/long80.jpg',
    TO_DATE('2025.02.07','YYYY.MM.DD'), TO_DATE('2026.01.28','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 반려동물 더블캐리 이동장 켄넬',
    27200, 25840, 29,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test81.jpg', 'item_detail/long81.jpg',
    TO_DATE('2025.06.04','YYYY.MM.DD'), TO_DATE('2026.01.18','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '푸르미 반려동물 전용 하드형 이동장',
    16900, 14990, 99,
    10, 'GENERAL', 'Y', '푸르미',
    'item_thumbnail/test82.jpg', 'item_detail/long82.jpg',
    TO_DATE('2025.01.08','YYYY.MM.DD'), TO_DATE('2026.01.29','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 강아지 컨비니언트 접이식 켄넬',
    41900, 37710, 26,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test83.jpg', 'item_detail/long83.jpg',
    TO_DATE('2025.02.09','YYYY.MM.DD'), TO_DATE('2026.01.30','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '딩동펫 반려동물 에어켄넬 하드캐리어',
    52900, 45230, 910,
    10, 'GENERAL', 'Y', '딩동펫',
    'item_thumbnail/test84.jpg', 'item_detail/long84.jpg',
    TO_DATE('2025.01.15','YYYY.MM.DD'), TO_DATE('2026.01.04','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '마술사 대용량 우주선 반려동물 이동가방 3면통풍',
    59900, 39900, 18,
    10, 'GENERAL', 'Y', '마술사',
    'item_thumbnail/test85.jpg', 'item_detail/long85.jpg',
    TO_DATE('2025.07.21','YYYY.MM.DD'), TO_DATE('2026.01.16','YYYY.MM.DD')
);

INSERT INTO item (
    item_idx, item_name, item_origin_price, item_now_price, item_stock,
    item_type_idx, item_for, item_is_sale, item_brand,
    item_thumbnail_img, item_detail_img, item_regdate, item_moddate
) VALUES (
    seq_item_idx.NEXTVAL,
    '아미토 애완동물 전용 이동장 반려동물 켄넬',
    39900, 22310, 99,
    10, 'GENERAL', 'Y', '아미토',
    'item_thumbnail/test86.jpg', 'item_detail/long86.jpg',
    TO_DATE('2025.02.22','YYYY.MM.DD'), TO_DATE('2026.01.17','YYYY.MM.DD')
);

COMMIT;


*/
