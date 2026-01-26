/*
-- 0. 코드 테이블
CREATE TABLE role (
    role_idx    NUMBER        PRIMARY KEY,
    role_name   VARCHAR2(20)  NOT NULL           -- user / doctor / admin
);

CREATE TABLE grade (
    grade_idx             NUMBER        PRIMARY KEY,
    grade_name            VARCHAR2(20)  NOT NULL, -- basic / silver / gold / vip
    grade_discount_rate   NUMBER(5,2)   NOT NULL  -- 0.05, 0.10, 0.20
);

-- 1. 회원
CREATE TABLE member (
    mem_idx        NUMBER         PRIMARY KEY,
    mem_id         VARCHAR2(50)   UNIQUE NOT NULL,
    mem_pwd        VARCHAR2(100)  NOT NULL,
    mem_name       VARCHAR2(50),
    mem_tel        VARCHAR2(20),
    mem_email      VARCHAR2(100),
    mem_role_idx   NUMBER         NOT NULL,
    mem_grade_idx  NUMBER         NOT NULL,
    mem_bday       DATE,
    mem_regdate    DATE           DEFAULT SYSDATE,
    CONSTRAINT fk_member_role
        FOREIGN KEY (mem_role_idx)  REFERENCES role(role_idx),
    CONSTRAINT fk_member_grade
        FOREIGN KEY (mem_grade_idx) REFERENCES grade(grade_idx)
);

CREATE TABLE member_profile (
    mem_idx        NUMBER        PRIMARY KEY,
    mem_nickname   VARCHAR2(50),
    mem_intro      VARCHAR2(255),
    mem_img        VARCHAR2(255),
    CONSTRAINT fk_profile_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE
);

CREATE TABLE member_addr (
    addr_idx          NUMBER        PRIMARY KEY,
    mem_idx           NUMBER        NOT NULL,
    mem_zipcode       VARCHAR2(10),
    mem_addr          VARCHAR2(255),
    mem_addr_detail   VARCHAR2(255),
    CONSTRAINT fk_addr_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE
);

*/