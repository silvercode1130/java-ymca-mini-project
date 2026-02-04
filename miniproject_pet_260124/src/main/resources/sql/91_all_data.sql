-- item 더미는 데이터가 많으므로 14_data_item.sql 에서 별도 실행

-- member 더미 (admin 1명, doctor 3명, user 6명)

-- admin 1명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'admin1', '1234', '관리자', '010-0000-0000', 'admin1@pet.com',
  '172.30.1.0', 3, 4, TO_DATE('1990-01-01', 'YYYY-MM-DD'), SYSDATE
);

-- doctor 3명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc1', '1234', '수의사1', '010-1111-1111', 'doc1@pet.com',
  '172.30.1.1', 2, 3, TO_DATE('1985-03-10', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc2', '1234', '수의사2', '010-2222-2222', 'doc2@pet.com',
  '172.30.1.2', 2, 2, TO_DATE('1988-07-22', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc3', '1234', '수의사3', '010-3333-3333', 'doc3@pet.com',
  '172.30.1.3', 2, 1, TO_DATE('1992-11-05', 'YYYY-MM-DD'), SYSDATE
);

-- user 6명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user1', '1234', '홍길동', '010-4444-4444', 'user1@pet.com',
  '172.30.1.4', 1, 1, TO_DATE('1995-02-14', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user2', '1234', '김철수', '010-5555-5555', 'user2@pet.com',
  '172.30.1.5', 1, 2, TO_DATE('1993-06-30', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user3', '1234', '이영희', '010-6666-6666', 'user3@pet.com',
  '172.30.1.6', 1, 1, TO_DATE('1998-09-01', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user4', '1234', '박민수', '010-7777-7777', 'user4@pet.com',
  '172.30.1.7', 1, 3, TO_DATE('1991-12-25', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user5', '1234', '정아름', '010-8888-8888', 'user5@pet.com',
  '172.30.1.8', 1, 2, TO_DATE('1994-04-18', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_ip, mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user6', '1234', '최지훈', '010-9999-9999', 'user6@pet.com',
  '172.30.1.9', 1, 1, TO_DATE('1999-08-09', 'YYYY-MM-DD'), SYSDATE
);


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


-- board 더미

-- 1) 공지사항: 관리자(mem_idx = 1), NOTICE(1)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '사이트 이용 안내', '커뮤니티 이용 수칙을 안내드립니다.',
    '172.30.1.10', 'NONE', 129, 1, SYSDATE, SYSDATE
);

-- 2) 연구소 글: 수의사(mem_idx = 2), LAB(3)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '강아지 피부질환 케이스 공유', '최근 진료한 피부질환 사례를 공유합니다.',
    '172.30.1.11', 'DOG', 34, 3, SYSDATE, SYSDATE
);

-- 3) 자유게시판 글: 일반 유저(mem_idx = 5), FREE(5)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 5,
    '우리 집 고양이 자랑', '사진은 댓글에 올릴게요!',
    '172.30.1.12', 'CAT', 13, 5, SYSDATE, SYSDATE
);

-- 4) QnA 글: 일반 유저(mem_idx = 8), QnA(4)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 8,
    '강아지가 밥을 안 먹어요ㅠ', '이틀째 밥을 안 먹는데 왜 이런거죠ㅠㅠ',
    '172.30.1.88', 'DOG', 5, 4, SYSDATE, SYSDATE
);

-- reply 더미
-- 예시: 자유게시판 글(board_idx = 3번이라고 가정)에 일반 유저 댓글
INSERT INTO reply (
    reply_idx, board_idx, mem_idx,
    reply_content, reply_ip, reply_regdate, reply_moddate,
    reply_ref, reply_step, reply_depth
) VALUES (
    seq_reply_idx.NEXTVAL, 3, 6,
    '고양이 너무 귀여워요!', '172.30.1.20', SYSDATE, SYSDATE,
    seq_reply_idx.CURRVAL, 0, 0
);

-- 예시: QnA 글(board_idx = 4번이라고 가정)에 수의사 댓글
INSERT INTO reply (
    reply_idx, board_idx, mem_idx,
    reply_content, reply_ip, reply_regdate, reply_moddate,
    reply_ref, reply_step, reply_depth
) VALUES (
    seq_reply_idx.NEXTVAL, 4, 2,
    '해당 증상은 병원 내원 후 검진을 권장드립니다.', '172.30.1.21', SYSDATE, SYSDATE,
    seq_reply_idx.CURRVAL, 0, 0
);
