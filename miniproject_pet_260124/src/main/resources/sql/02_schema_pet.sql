/*
-- 2. 반려동물
CREATE TABLE pet (
    pet_idx      NUMBER        PRIMARY KEY,
    mem_idx      NUMBER        NOT NULL,
    pet_name     VARCHAR2(50)  NOT NULL,
    is_primary   CHAR(1)       DEFAULT 'N' CHECK (is_primary IN ('Y','N')),
    pet_species  VARCHAR2(50),
    pet_gender   VARCHAR2(10),
    pet_breed    VARCHAR2(50),
    pet_age      NUMBER(3),
    pet_bday     DATE,
    CONSTRAINT fk_pet_member
        FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)
        ON DELETE CASCADE
);

*/