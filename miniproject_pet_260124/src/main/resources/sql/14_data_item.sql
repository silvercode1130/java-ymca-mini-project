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

*/
