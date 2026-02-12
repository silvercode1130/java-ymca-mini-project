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
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '사이트 이용 안내', '커뮤니티 이용 수칙을 안내드립니다.',
    '172.30.1.10', 'NONE', NULL, 129, 1, SYSDATE, SYSDATE
);

-- 2) 연구소 글: 수의사(mem_idx = 2), LAB(3)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '강아지 피부질환 케이스 공유', '최근 진료한 피부질환 사례를 공유합니다.',
    '172.30.1.11', 'DOG', NULL, 34, 3, SYSDATE, SYSDATE
);

-- 3) 자유게시판 글: 일반 유저(mem_idx = 5), FREE(5)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 5,
    '우리 집 고양이 자랑', '사진은 댓글에 올릴게요!',
    '172.30.1.12', 'CAT', NULL, 13, 5, SYSDATE, SYSDATE
);

-- 4) QnA 글: 일반 유저(mem_idx = 8), QnA(4)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 8,
    '강아지가 밥을 안 먹어요ㅠ', '이틀째 밥을 안 먹는데 왜 이런거죠ㅠㅠ',
    '172.30.1.88', 'DOG', NULL, 5, 4, SYSDATE, SYSDATE
);

-- =========================
-- 공지사항 (board_type_idx = 1) 5개
-- 작성자: 관리자 (mem_idx = 1)
-- =========================
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '사이트 점검 안내', '안정적인 서비스 제공을 위해 새벽 시간대 서버 점검이 진행됩니다.',
    '172.30.1.100', 'NONE', NULL, 45, 1, SYSDATE-10, SYSDATE-10
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '커뮤니티 이용 수칙 안내', '반려동물과 관련 없는 글, 욕설 및 비방 글은 사전 통보 없이 삭제될 수 있습니다.',
    '172.30.1.101', 'NONE', NULL, 80, 1, SYSDATE-9, SYSDATE-9
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '개인정보 처리방침 변경 안내', '서비스 개편에 따라 개인정보 처리방침 내용이 일부 수정되었습니다. 자세한 내용은 공지 본문을 참고해주세요.',
    '172.30.1.102', 'NONE', NULL, 63, 1, SYSDATE-8, SYSDATE-8
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '신규 기능 오픈 안내', '마이펫 건강일지와 QnA 알림 기능이 추가되었습니다. 많은 이용 부탁드립니다.',
    '172.30.1.103', 'NONE', NULL, 97, 1, SYSDATE-7, SYSDATE-7
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '서비스 정식 오픈 안내', '베타 테스트를 마치고 정식 서비스를 오픈합니다. 이용해 주신 모든 분들께 감사드립니다.',
    '172.30.1.104', 'NONE', NULL, 120, 1, SYSDATE-6, SYSDATE-6
);


-- =========================
-- 이벤트 (board_type_idx = 2) 4개
-- 작성자: 관리자 (mem_idx = 1)
-- =========================
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '신규 회원 가입 이벤트', '이벤트 기간 동안 신규 가입 회원분들께 사료 샘플 쿠폰을 드립니다.',
    '172.30.1.105', 'NONE', NULL, 150, 2, SYSDATE-5, SYSDATE-5
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    'QnA 작성 감사 이벤트', '수의사 QnA 게시판에 질문을 남겨주시면 추첨을 통해 소정의 상품을 드립니다.',
    '172.30.1.106', 'NONE', NULL, 73, 2, SYSDATE-4, SYSDATE-4
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '반려동물 사진 콘테스트', '자유게시판에 우리집 반려동물 사진을 올려주세요. 귀여운 친구들을 소개해주세요!',
    '172.30.1.107', 'NONE', NULL, 98, 2, SYSDATE-3, SYSDATE-3
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '출석 체크 이벤트', '매일 로그인만 해도 포인트가 적립되는 출석 체크 이벤트를 진행합니다.',
    '172.30.1.108', 'NONE', NULL, 45, 2, SYSDATE-2, SYSDATE-2
);


-- =========================
-- 연구소 (board_type_idx = 3) 10개
-- 작성자: 수의사 이상 (mem_idx 2,3,4)
-- 태그: DOG/CAT/NONE 섞음
-- =========================

-- doc1 (mem_idx = 2)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '노령견 심장질환 케이스 리뷰', '최근 내원한 노령견 심장질환 환자의 진단 및 처치 과정을 공유합니다.',
    '172.30.1.201', 'DOG', NULL, 32, 3, SYSDATE-12, SYSDATE-12
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '강아지 구토 증상 감별 진단', '반복적인 구토 증상을 보이는 환자의 감별 진단 포인트를 정리했습니다.',
    '172.30.1.202', 'DOG', NULL, 27, 3, SYSDATE-11, SYSDATE-11
);

-- doc2 (mem_idx = 3)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 3,
    '고양이 비만 관리 프로토콜', '실제 비만 고양이 환자에게 적용한 식이 조절 및 운동 프로그램을 공유합니다.',
    '172.30.1.203', 'CAT', NULL, 40, 3, SYSDATE-10, SYSDATE-10
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 3,
    '신장질환 환자 혈액검사 비교', '신장질환 진행 단계별 혈액검사 수치를 비교 분석한 내용을 정리했습니다.',
    '172.30.1.204', 'NONE', NULL, 21, 3, SYSDATE-9, SYSDATE-9
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 3,
    '강아지 피부 알레르기 관리 팁', '알레르기성 피부질환 환자에서 보호자 교육 시 활용할만한 설명 포인트를 정리했습니다.',
    '172.30.1.205', 'DOG', NULL, 36, 3, SYSDATE-8, SYSDATE-8
);

-- doc3 (mem_idx = 4)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 4,
    '고양이 하부요로질환(FLUTD) 사례', '혈뇨와 배뇨 곤란을 주소로 내원한 환자의 치료 과정을 공유합니다.',
    '172.30.1.206', 'CAT', NULL, 29, 3, SYSDATE-7, SYSDATE-7
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 4,
    '응급 환자 CPR 프로토콜', '심정지 환자 CPR 진행 시 참고할 수 있는 프로토콜을 정리했습니다.',
    '172.30.1.207', 'NONE', NULL, 18, 3, SYSDATE-6, SYSDATE-6
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 4,
    '강아지 슬개골 탈구 수술 후 관리', '슬개골 탈구 수술 환자의 재활 및 보호자 교육 내용을 공유합니다.',
    '172.30.1.208', 'DOG', NULL, 25, 3, SYSDATE-5, SYSDATE-5
);

-- 추가로 doc1, doc2 한 번씩 더
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '고양이 예방접종 스케줄 정리', '연령별, 생활환경별 권장 예방접종 스케줄을 표로 정리했습니다.',
    '172.30.1.209', 'CAT', NULL, 19, 3, SYSDATE-4, SYSDATE-4
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 3,
    '만성질환 환자 보호자 상담 팁', '당뇨, 신부전 등 만성질환 보호자 상담 시 활용할 수 있는 문장들을 정리했습니다.',
    '172.30.1.210', 'NONE', NULL, 22, 3, SYSDATE-3, SYSDATE-3
);


-- =========================
-- QnA (board_type_idx = 4) 5개
-- 작성자: 전원 가능 (mem_idx 2~10 중 섞어서)
-- 태그: DOG/CAT
-- =========================
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 5,
    '강아지가 발을 자꾸 핥아요', '최근 계속 발을 핥고 있었는데 혹시 병원에 가야 할 정도인지 궁금합니다.',
    '172.30.1.301', 'DOG', NULL, 12, 4, SYSDATE-5, SYSDATE-5
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 6,
    '고양이가 밥은 안 먹고 간식만 찾네요', '사료는 잘 안 먹고 간식만 찾는데 어떻게 해야 할까요?',
    '172.30.1.302', 'CAT', NULL, 9, 4, SYSDATE-4, SYSDATE-4
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 7,
    '중성화 수술 후 아이가 너무 처져 있어요', '수술한 지 이틀 됐는데 계속 잘 움직이질 않아요. 정상 범위인지 궁금합니다.',
    '172.30.1.303', 'DOG', NULL, 7, 4, SYSDATE-3, SYSDATE-3
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 9,
    '고양이 털 빠짐이 너무 심해요', '계절 때문인지 모르겠는데 갑자기 털이 많이 빠져서 걱정됩니다.',
    '172.30.1.304', 'CAT', NULL, 5, 4, SYSDATE-2, SYSDATE-2
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 10,
    '강아지가 산책만 나가면 설사를 해요', '집에 있을 땐 괜찮은데 산책 다녀오면 꼭 설사를 합니다.',
    '172.30.1.305', 'DOG', NULL, 4, 4, SYSDATE-1, SYSDATE-1
);


-- =========================
-- 자유게시판 (board_type_idx = 5) 6개
-- 작성자: 전원 가능 (주로 user 5~10)
-- 태그: DOG/CAT 섞음
-- =========================
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 5,
    '우리 집 콩이 첫 미용 다녀왔어요', '강아지 미용 처음 맡겼는데 생각보다 너무 잘해주셔서 자랑 올려요 ㅎㅎ',
    '172.30.1.401', 'DOG', NULL, 20, 5, SYSDATE-6, SYSDATE-6
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 6,
    '호두, 라떼 형제 싸움 말리기', '둘이 사이 좋다가도 가끔 심하게 싸우는데 비슷한 경험 있는 집사님들 계신가요?',
    '172.30.1.402', 'CAT', NULL, 17, 5, SYSDATE-5, SYSDATE-5
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 8,
    '보리랑 첫 캠핑 다녀왔어요', '강아지랑 같이 가기 좋은 캠핑장 추천도 받아요!',
    '172.30.1.403', 'DOG', NULL, 14, 5, SYSDATE-4, SYSDATE-4
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 9,
    '나비가 처음으로 콧소리를 냈어요', '골골송인 줄 알았는데 콧소리더라구요 ㅋㅋ 너무 귀엽네요.',
    '172.30.1.404', 'CAT', NULL, 11, 5, SYSDATE-3, SYSDATE-3
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 10,
    '몽이랑 탄이 산책 루틴 공유', '두 마리 같이 산책시키는 집사님들 계신가요? 저희 루틴 공유해봅니다.',
    '172.30.1.405', 'DOG', NULL, 16, 5, SYSDATE-2, SYSDATE-2
);

INSERT INTO board (
    board_idx, mem_idx, board_title, board_content, board_ip,
    board_tag, board_thumbnail, board_readhit, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 7,
    '반려동물 용품 최애 쇼핑몰 추천해요', '가성비 좋은 쇼핑몰 몇 군데 써보고 비교해봤어요. 정보 공유합니다!',
    '172.30.1.406', 'NONE', NULL, 9, 5, SYSDATE-1, SYSDATE-1
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
