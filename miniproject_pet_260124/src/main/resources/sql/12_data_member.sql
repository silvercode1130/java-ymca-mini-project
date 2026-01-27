/*
-- member 더미 (admin 1명, doctor 3명, user 6명)

-- admin 1명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'admin1', '1234', '관리자', '010-0000-0000', 'admin1@pet.com',
  3, 4, TO_DATE('1990-01-01', 'YYYY-MM-DD'), SYSDATE
);

-- doctor 3명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc1', '1234', '수의사1', '010-1111-1111', 'doc1@pet.com',
  2, 3, TO_DATE('1985-03-10', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc2', '1234', '수의사2', '010-2222-2222', 'doc2@pet.com',
  2, 2, TO_DATE('1988-07-22', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'doc3', '1234', '수의사3', '010-3333-3333', 'doc3@pet.com',
  2, 1, TO_DATE('1992-11-05', 'YYYY-MM-DD'), SYSDATE
);

-- user 6명
INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user1', '1234', '홍길동', '010-4444-4444', 'user1@pet.com',
  1, 1, TO_DATE('1995-02-14', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user2', '1234', '김철수', '010-5555-5555', 'user2@pet.com',
  1, 2, TO_DATE('1993-06-30', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user3', '1234', '이영희', '010-6666-6666', 'user3@pet.com',
  1, 1, TO_DATE('1998-09-01', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user4', '1234', '박민수', '010-7777-7777', 'user4@pet.com',
  1, 3, TO_DATE('1991-12-25', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user5', '1234', '정아름', '010-8888-8888', 'user5@pet.com',
  1, 2, TO_DATE('1994-04-18', 'YYYY-MM-DD'), SYSDATE
);

INSERT INTO member (
  mem_idx, mem_id, mem_pwd, mem_name, mem_tel, mem_email,
  mem_role_idx, mem_grade_idx, mem_bday, mem_regdate
) VALUES (
  seq_mem_idx.NEXTVAL, 'user6', '1234', '최지훈', '010-9999-9999', 'user6@pet.com',
  1, 1, TO_DATE('1999-08-09', 'YYYY-MM-DD'), SYSDATE
);

*/