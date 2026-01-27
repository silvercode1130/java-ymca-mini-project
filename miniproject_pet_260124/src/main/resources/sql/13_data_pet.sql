/*
-- pet 더미데이터 (회원 5~10 중 일부만 펫 보유)

-- user1 (mem_idx = 5) - 강아지 1마리 (대표)
INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 5, '콩이', 'Y',
  '강아지', 'F', '말티즈', 3, TO_DATE('2022-03-10', 'YYYY-MM-DD')
);

-- user2 (mem_idx = 6) - 고양이 2마리 (대표 1마리)
INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 6, '호두', 'Y',
  '고양이', 'M', '코리안숏헤어', 2, TO_DATE('2023-01-05', 'YYYY-MM-DD')
);

INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 6, '라떼', 'N',
  '고양이', 'F', '러시안블루', 4, TO_DATE('2021-07-20', 'YYYY-MM-DD')
);

-- user3 (mem_idx = 7) - 반려동물 없음

-- user4 (mem_idx = 8) - 강아지 1마리
INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 8, '보리', 'Y',
  '강아지', 'M', '시바이누', 5, TO_DATE('2020-11-11', 'YYYY-MM-DD')
);

-- user5 (mem_idx = 9) - 고양이 1마리
INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 9, '나비', 'Y',
  '고양이', 'F', '샴', 1, TO_DATE('2024-02-01', 'YYYY-MM-DD')
);

-- user6 (mem_idx = 10) - 강아지 2마리
INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 10, '몽이', 'Y',
  '강아지', 'M', '푸들', 4, TO_DATE('2021-09-09', 'YYYY-MM-DD')
);

INSERT INTO pet (
  pet_idx, mem_idx, pet_name, is_primary,
  pet_species, pet_gender, pet_breed, pet_age, pet_bday
) VALUES (
  seq_pet_idx.NEXTVAL, 10, '탄이', 'N',
  '강아지', 'M', '웰시코기', 2, TO_DATE('2023-06-15', 'YYYY-MM-DD')
);

*/