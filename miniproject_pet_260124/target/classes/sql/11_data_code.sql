/*
-- 1) role 코드
INSERT INTO role (role_idx, role_name) VALUES (1, 'user');
INSERT INTO role (role_idx, role_name) VALUES (2, 'doctor');
INSERT INTO role (role_idx, role_name) VALUES (3, 'admin');

-- 2) grade 코드
INSERT INTO grade (grade_idx, grade_name, grade_discount_rate) VALUES (1, 'basic', 0.00);
INSERT INTO grade (grade_idx, grade_name, grade_discount_rate) VALUES (2, 'silver', 0.05);
INSERT INTO grade (grade_idx, grade_name, grade_discount_rate) VALUES (3, 'gold', 0.10);
INSERT INTO grade (grade_idx, grade_name, grade_discount_rate) VALUES (4, 'vip', 0.20);

-- 3) orders_status 코드
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (1, '결제대기');
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (2, '결제완료');
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (3, '배송중');
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (4, '배송완료');
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (5, '취소됨');
INSERT INTO orders_status (orders_status_idx, orders_status_name) VALUES (6, '환불완료');

-- 4) board_type 코드
-- 공지사항: 관리자만 글쓰기, 댓글 X
INSERT INTO board_type (
  board_type_idx, board_type_code, board_type_name,
  board_can_comment, board_min_role
) VALUES (
  1, 'NOTICE', '공지사항', 'N', 3
);

-- 이벤트: 관리자만 글쓰기, 댓글 X
INSERT INTO board_type (
  board_type_idx, board_type_code, board_type_name,
  board_can_comment, board_min_role
) VALUES (
  2, 'EVENT', '이벤트', 'N', 3
);

-- 연구소: 수의사 이상 글쓰기, 댓글 X
INSERT INTO board_type (
  board_type_idx, board_type_code, board_type_name,
  board_can_comment, board_min_role
) VALUES (
  3, 'LAB', '연구소', 'N', 2
);

-- QnA: 유저 이상 글쓰기, 댓글은 나중에 로직으로 수의사 이상 처리
INSERT INTO board_type (
  board_type_idx, board_type_code, board_type_name,
  board_can_comment, board_min_role
) VALUES (
  4, 'QNA', 'QnA', 'Y', 1
);

-- 자유게시판: 유저 모두 글/댓글 가능
INSERT INTO board_type (
  board_type_idx, board_type_code, board_type_name,
  board_can_comment, board_min_role
) VALUES (
  5, 'FREE', '자유게시판', 'Y', 1
);

*/