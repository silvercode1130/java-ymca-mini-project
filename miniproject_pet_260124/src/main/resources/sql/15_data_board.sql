/*
-- board 더미
-- 1) 공지사항: 관리자(mem_idx = 1), NOTICE(1)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content,
    board_ip, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 1,
    '사이트 이용 안내', '커뮤니티 이용 수칙을 안내드립니다.',
    '172.30.1.10', 1, SYSDATE, SYSDATE
);

-- 2) 연구소 글: 수의사(mem_idx = 2), LAB(3)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content,
    board_ip, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 2,
    '강아지 피부질환 케이스 공유', '최근 진료한 피부질환 사례를 공유합니다.',
    '172.30.1.11', 3, SYSDATE, SYSDATE
);

-- 3) 자유게시판 글: 일반 유저(mem_idx = 5), FREE(5)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content,
    board_ip, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 5,
    '우리 집 고양이 자랑', '사진은 댓글에 올릴게요!',
    '172.30.1.12', 5, SYSDATE, SYSDATE
);

-- 4) QnA 글: 일반 유저(mem_idx = 8), QnA(4)
INSERT INTO board (
    board_idx, mem_idx, board_title, board_content,
    board_ip, board_type_idx, board_regdate, board_moddate
) VALUES (
    seq_board_idx.NEXTVAL, 8,
    '강아지가 밥을 안 먹어요ㅠ', '이틀째 밥을 안 먹는데 왜 이런거죠ㅠㅠ',
    '172.30.1.88', 4, SYSDATE, SYSDATE
);

-- reply 더미
-- 예시: 자유게시판 글(board_idx = 3번이라고 가정)에 일반 유저 댓글
INSERT INTO reply (
    reply_idx, board_idx, mem_idx,
    reply_content, reply_ip, reply_regdate, reply_moddate
) VALUES (
    seq_reply_idx.NEXTVAL, 3, 6,
    '고양이 너무 귀여워요!', '172.30.1.20', SYSDATE, SYSDATE
);

-- 예시: QnA 글(board_idx = 4번이라고 가정)에 수의사 댓글
INSERT INTO reply (
    reply_idx, board_idx, mem_idx,
    reply_content, reply_ip, reply_regdate, reply_moddate
) VALUES (
    seq_reply_idx.NEXTVAL, 4, 2,
    '해당 증상은 병원 내원 후 검진을 권장드립니다.', '172.30.1.21', SYSDATE, SYSDATE
);

*/