---------------------------------------------------
--프로젝트
--등급별 할인율
CREATE TABLE GRADESALE
(사용자등급 VARCHAR2(15) CONSTRAINT GRADESALE_GRADE_PK PRIMARY KEY,
이용횟수 NUMBER(4), 할인율 NUMBER(15));

--사용자 정보
CREATE TABLE USERINFO
(ID VARCHAR2(10) CONSTRAINT USERINFO_ID_PK PRIMARY KEY,
사용자이름 VARCHAR2(4) NOT NULL, 나이 NUMBER(3) NOT NULL,
성별 VARCHAR2(3) NOT NULL, PW VARCHAR2(12) NOT NULL,
주소 VARCHAR2(15), 상세주소 VARCHAR2(15),
사용자등급 VARCHAR2(10) CONSTRAINT USERINFO_GRADE_FK REFERENCES GRADESALE(사용자등급));
--리뷰
CREATE TABLE REVIEW
(NO NUMBER(5) CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT REVIEW_ID_FK REFERENCES USERINFO(ID),
내용 VARCHAR2(100) NOT NULL, 객실정보 VARCHAR2(10), 날짜 DATE);



--객실정보
CREATE TABLE ROOM
(호수 NUMBER(4) CONSTRAINT ROOM_호수_PK PRIMARY KEY, 객실등급 VARCHAR2(15), 오션뷰 VARCHAR2(2),
노래방 VARCHAR2(2), 욕조여부 VARCHAR2(2), 금액 NUMBER(6) NOT NULL, 이용인원 NUMBER(2));

--예약내용
CREATE TABLE RESERVE
(호수 NUMBER(4) CONSTRAINT RESERVE_호수_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT RESERVE_ID_FK REFERENCES USERINFO(ID), 입실시간 DATE, 퇴실시간 DATE, 총금액 NUMBER(7),
CONSTRAINT RESERVE_호수_FK FOREIGN KEY (호수) REFERENCES ROOM(호수));

--사용자 이용내역
CREATE TABLE DETAIL
(NO NUMBER(5) CONSTRAINT DETAIL_NO_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT DETAIL_ID_FK REFERENCES USERINFO(ID),
호수 NUMBER(4) CONSTRAINT DETAIL_호수_FK REFERENCES ROOM(호수),
입실날짜 DATE, 퇴실날짜 DATE, 금액 NUMBER(6));

DESC ROOM;
DESC GRADESALE;
DESC USERINFO;
DESC REVIEW;
DESC RESERVE;
DESC DETAIL;

SELECT * FROM USER_CONSTRAINTS;

--호수, 등급, 오션뷰, 노래방, 욕조, 금액, 인원
INSERT INTO ROOM VALUES (101, '스탠다드', 'O', 'X', 'O', 40000, 2);
INSERT INTO ROOM VALUES (102, '스탠다드', 'O', 'X', 'O', 40000, 2);
INSERT INTO ROOM VALUES (103, '스탠다드', 'X', 'X', 'X', 36000, 2);
INSERT INTO ROOM VALUES (104, '스탠다드', 'O', 'X', 'X', 38000, 2);
INSERT INTO ROOM VALUES (105, '스탠다드', 'X', 'X', 'X', 36000, 2);
INSERT INTO ROOM VALUES (201, '디럭스', 'O', 'X', 'X', 42000, 3);
INSERT INTO ROOM VALUES (202, '디럭스', 'O', 'X', 'X', 42000, 3);
INSERT INTO ROOM VALUES (203, '디럭스', 'X', 'O', 'O', 45000, 3);
INSERT INTO ROOM VALUES (204, '디럭스', 'O', 'X', 'O', 45000, 3);
INSERT INTO ROOM VALUES (205, '디럭스', 'O', 'O', 'O', 48000, 3);
INSERT INTO ROOM VALUES (301, '럭셔리', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (302, '럭셔리', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (303, '럭셔리', 'X', 'X', 'O', 50000, 4);
INSERT INTO ROOM VALUES (304, '럭셔리', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (305, '럭셔리', 'O', 'O', 'O', 55000, 4);
INSERT INTO ROOM VALUES (501, '파티룸', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (502, '파티룸', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (503, '파티룸', 'X', 'O', 'O', 68000, 6);
INSERT INTO ROOM VALUES (504, '파티룸', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (505, '파티룸', 'X', 'O', 'O', 68000, 6);

--등급, 횟수, 할인률
INSERT INTO GRADESALE VALUES ('브론즈', 5, 3000);
INSERT INTO GRADESALE VALUES ('실버', 7, 6000);
INSERT INTO GRADESALE VALUES ('골드', 9, 8000);
INSERT INTO GRADESALE VALUES ('다이아', 12, 10000);
INSERT INTO GRADESALE VALUES ('플레티넘', 15, 12000);

commit;

SELECT * FROM ROOM;
DESC ROOM;

SELECT * FROM GRADESALE;
DESC GRADESALE;

insert into gradesale values('노말',0,0);

commit;

SELECT * FROM REVIEW;
DESC REVIEW;

SELECT * FROM DETAIL;
DESC DETAIL;

SELECT * FROM USERINFO;

alter table userinfo modify (사용자이름 VARCHAR2(10),성별 VARCHAR2(4),주소 VARCHAR2(40)); 

DESC USERINFO;

insert into userinfo values('a123','김',20,'man','a123','주소','상세주소','브론즈');
insert into userinfo values('ab123','이',20,'man','ab123','주소','상세주소','다이아');

SELECT * FROM RESERVE;
DESC RESERVE;

insert into reserve values(101,'a123','2023-05-05','2023-05-06',20000);
insert into reserve values(201,'a123','2023-05-05','2023-05-06',50000);
insert into reserve values(102,'ab123','2023-05-05','2023-05-06',30000);
insert into reserve values(202,'ab123','2023-05-05','2023-05-06',30000);

commit;
select a.호수 호수,객실등급,오션뷰,노래방,욕조여부,금액,이용인원,b.호수 b호수 from room a,reserve b where a.호수 = b.호수;

select a.호수 호수,객실등급,오션뷰,노래방,욕조여부,금액,이용인원,b.호수 b호수 from room a,reserve b 
where a.호수 = b.호수(+) and b.호수 is null;

SELECT 호수,입실시간,퇴실시간,총금액 FROM RESERVE where id = 'a123'; 

select 호수,객실등급,오션뷰,노래방,욕조여부,금액,이용인원 from room where 호수 = 101;


SELECT * FROM GRADESALE;
SELECT * FROM RESERVE;
DESC RESERVE;

commit;

select 금액 from room where 호수 = 501;
select 할인율 from USERINFO a, GRADESALE b where a.ID='ab123' and a.사용자등급 = b.사용자등급;
UPDATE reserve set 호수=501,입실시간='2025-05-09',퇴실시간='2025-05-10',총금액 = (select 금액 from room where 호수 = 501) - (select 할인율 from USERINFO a, GRADESALE b where a.ID='ab123' and a.사용자등급 = b.사용자등급) where 호수 = 202;

ROLLBACK;