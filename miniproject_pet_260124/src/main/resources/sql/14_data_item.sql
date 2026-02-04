/*
-- 아이템 더미데이터
INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 연어 사료 1kg',
    25000,
    'img/dog_food_salmon_thumb.jpg',
    'img/dog_food_salmon_detail.jpg',
    100,
    'DOG_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 닭고기 사료 2kg',
    32000,
    'img/dog_food_chicken_thumb.jpg',
    'img/dog_food_chicken_detail.jpg',
    80,
    'DOG_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 저알레르기 사료',
    38000,
    'img/dog_food_hypo_thumb.jpg',
    'img/dog_food_hypo_detail.jpg',
    50,
    'DOG_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 참치 사료 1.5kg',
    27000,
    'img/cat_food_tuna_thumb.jpg',
    'img/cat_food_tuna_detail.jpg',
    90,
    'CAT_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 치킨 사료 2kg',
    34000,
    'img/cat_food_chicken_thumb.jpg',
    'img/cat_food_chicken_detail.jpg',
    70,
    'CAT_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 실내전용 사료',
    36000,
    'img/cat_food_indoor_thumb.jpg',
    'img/cat_food_indoor_detail.jpg',
    60,
    'CAT_FOOD'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 삑삑이 공 장난감',
    8000,
    'img/dog_toy_ball_thumb.jpg',
    'img/dog_toy_ball_detail.jpg',
    200,
    'DOG_TOY'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 로프 장난감',
    9000,
    'img/dog_toy_rope_thumb.jpg',
    'img/dog_toy_rope_detail.jpg',
    150,
    'DOG_TOY'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 낚시대 장난감',
    7000,
    'img/cat_toy_fishing_thumb.jpg',
    'img/cat_toy_fishing_detail.jpg',
    180,
    'CAT_TOY'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 터널 장난감',
    15000,
    'img/cat_toy_tunnel_thumb.jpg',
    'img/cat_toy_tunnel_detail.jpg',
    60,
    'CAT_TOY'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 기본 목줄',
    12000,
    'img/dog_walk_leash_thumb.jpg',
    'img/dog_walk_leash_detail.jpg',
    120,
    'DOG_WALK'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 하네스 세트',
    22000,
    'img/dog_walk_harness_thumb.jpg',
    'img/dog_walk_harness_detail.jpg',
    90,
    'DOG_WALK'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 이동장(소형)',
    30000,
    'img/cat_walk_carrier_thumb.jpg',
    'img/cat_walk_carrier_detail.jpg',
    40,
    'CAT_WALK'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 방묘문',
    45000,
    'img/cat_walk_gate_thumb.jpg',
    'img/cat_walk_gate_detail.jpg',
    25,
    'CAT_WALK'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 방석 소형',
    18000,
    'img/dog_furniture_bed_small_thumb.jpg',
    'img/dog_furniture_bed_small_detail.jpg',
    70,
    'DOG_FURNITURE'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '강아지 소파형 쿠션',
    28000,
    'img/dog_furniture_sofa_thumb.jpg',
    'img/dog_furniture_sofa_detail.jpg',
    50,
    'DOG_FURNITURE'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 캣타워 기본형',
    55000,
    'img/cat_furniture_tower_basic_thumb.jpg',
    'img/cat_furniture_tower_basic_detail.jpg',
    30,
    'CAT_FURNITURE'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '고양이 캣타워 대형',
    89000,
    'img/cat_furniture_tower_large_thumb.jpg',
    'img/cat_furniture_tower_large_detail.jpg',
    15,
    'CAT_FURNITURE'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '공용 배변 패드 50매',
    19000,
    'img/common_pad_thumb.jpg',
    'img/common_pad_detail.jpg',
    200,
    'COMMON_SUPPLY'
);

INSERT INTO item (
    item_idx,
    item_name,
    item_price,
    item_thumbnail_img,
    item_detail_img,
    item_stock,
    item_category
) VALUES (
    seq_item_idx.NEXTVAL,
    '공용 펫 샴푸 저자극',
    16000,
    'img/common_shampoo_thumb.jpg',
    'img/common_shampoo_detail.jpg',
    130,
    'COMMON_SUPPLY'
);


*/