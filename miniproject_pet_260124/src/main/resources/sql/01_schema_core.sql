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
<<<<<<< HEAD
<<<<<<< HEAD
    mem_ip		   VARCHAR2(100)  NOT NULL,
=======
>>>>>>> 679c9cf1c2906963eb33e6d0af837efa9ab6c166
=======
    mem_ip		   VARCHAR2(100)  NOT NULL,
>>>>>>> origin/je
    mem_role_idx   NUMBER         NOT NULL,
    mem_grade_idx  NUMBER         NOT NULL,
    mem_bday       DATE,
    mem_regdate    DATE           DEFAULT SYSDATE,
<<<<<<< HEAD
<<<<<<< HEAD
    mem_is_deleted CHAR(1)		  DEFAULT 'N',
    mem_deldate	   DATE,
    CONSTRAINT fk_member_role
        FOREIGN KEY (mem_role_idx)  REFERENCES role(role_idx),
    CONSTRAINT fk_member_grade
        FOREIGN KEY (mem_grade_idx) REFERENCES grade(grade_idx),
    CONSTRAINT ck_mem_is_deleted
    	CHECK (mem_is_deleted IN ('Y','N'))
=======
    CONSTRAINT fk_member_role
        FOREIGN KEY (mem_role_idx)  REFERENCES role(role_idx),
    CONSTRAINT fk_member_grade
        FOREIGN KEY (mem_grade_idx) REFERENCES grade(grade_idx)
>>>>>>> 679c9cf1c2906963eb33e6d0af837efa9ab6c166
=======
    mem_is_deleted CHAR(1) 		  DEFAULT 'N',
    mem_deldate	   DATE,
    CONSTRAINT fk_member_role
        FOREIGN KEY (mem_role_idx)  REFERENCES role(role_idx),
    CONSTRAINT fk_member_grade
        FOREIGN KEY (mem_grade_idx) REFERENCES grade(grade_idx),
    CONSTRAINT ck_mem_is_deleted
    	CHECK (mem_is_deleted IN ('Y','N'))
>>>>>>> origin/je
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