/*

-- 시퀀스 (일련번호 관리객체)

create sequence seq_visit_idx
				(시퀀스명)
drop sequence seq_visit_idx
				
-- 시퀀스 테스트
select seq_visit_idx.nextVal from dual
							(임시테이블)

-- 방명록 테이블

create table visit
(
	idx			int,						-- 일련번호
	name		varchar2(100) not null,		-- 작성자
	content		varchar2(1000) not null,	-- 내용
	pwd			varchar2(100) not null,		-- 비밀번호
	ip			varchar2(100) not null,		-- IP
	regdate		date not null,				-- 등록일자
	modifydate	date						-- 수정날짜
)

-- 기본키 지정

alter table visit
	add constraint pk_visit_idx	primary key(idx)

-- Sample Data

insert into visit values(seq_visit_idx.nextVal,
						'장정은',
						'새해복많이받으세요',
						'1234',
						'172.30.1.57',
						sysdate,
						sysdate
						);
insert into visit values(seq_visit_idx.nextVal,
						'유서윤',
						'행복한한해되세요',
						'0000',
						'172.30.1.24',
						sysdate,
						sysdate
						);
insert into visit values(seq_visit_idx.nextVal,
						'송영훈',
						'송아지송아지얼룩송아지',
						'1111',
						'172.30.1.47',
						sysdate,
						sysdate
						);
insert into visit values(seq_visit_idx.nextVal,
						'김재우',
						'자리 좀 바꿔주세요 너무 시끄러워요',
						'2222',
						'172.30.1.73',
						sysdate,
						sysdate
						);
insert into visit values(seq_visit_idx.nextVal,
						'신동건',
						'반바지는 역시 춥네요',
						'2222',
						'172.30.1.37',
						sysdate,
						sysdate
						);
						
-- DAO : insert SQL
insert into visit values(seq_visit_idx.nextVal, ?, ?, ?, ?, sysdate, sysdate)


select * from visit order by idx desc;
delete from visit where pwd like '%img%';
delete from visit where idx=93;
ALTER TABLE VISIT MODIFY CONTENT VARCHAR2(3000);

*/