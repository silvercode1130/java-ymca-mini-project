/*
-- 5. 커뮤니티
CREATE TABLE board_type (
    board_type_idx    NUMBER         PRIMARY KEY,
    board_type_code   VARCHAR2(50)   UNIQUE NOT NULL,
    board_type_name   VARCHAR2(100)  NOT NULL,
    board_can_comment CHAR(1)        DEFAULT 'Y' CHECK (board_can_comment IN ('Y','N')),
    board_min_role    NUMBER         NOT NULL
);

CREATE TABLE board (
    board_idx      NUMBER          PRIMARY KEY,
    mem_idx        NUMBER          NOT NULL,
    board_title    VARCHAR2(200)   NOT NULL,
    board_content  CLOB,
    board_ip       VARCHAR2(40),
    board_type_idx NUMBER		   NOT NULL,
    board_regdate  DATE            DEFAULT SYSDATE,
    board_moddate  DATE,
    CONSTRAINT fk_board_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_board_board_type
        FOREIGN KEY (board_type_idx) REFERENCES board_type(board_type_idx)
);

CREATE TABLE board_file (
    file_idx            NUMBER          PRIMARY KEY,
    board_idx           NUMBER          NOT NULL,
    file_original_name  VARCHAR2(255),
    file_saved_name     VARCHAR2(255),
    file_path           VARCHAR2(500),
    file_size           NUMBER,
    file_type           VARCHAR2(50),
    file_regdate        DATE            DEFAULT SYSDATE,
    CONSTRAINT fk_board_file_board
        FOREIGN KEY (board_idx) REFERENCES board(board_idx)
        ON DELETE CASCADE
);

CREATE TABLE reply (
    reply_idx       NUMBER          PRIMARY KEY,
    board_idx       NUMBER          NOT NULL,
    mem_idx         NUMBER          NOT NULL,
    reply_content   VARCHAR2(1000),
    reply_ip        VARCHAR2(40),
    reply_regdate   DATE            DEFAULT SYSDATE,
    reply_moddate   DATE,
    CONSTRAINT fk_reply_board
        FOREIGN KEY (board_idx) REFERENCES board(board_idx)
        ON DELETE CASCADE,
    CONSTRAINT fk_reply_member
        FOREIGN KEY (mem_idx)  REFERENCES member(mem_idx)
);

*/