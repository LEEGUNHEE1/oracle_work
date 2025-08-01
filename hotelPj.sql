---------------------------------------------------
--������Ʈ
--��޺� ������
CREATE TABLE GRADESALE
(����ڵ�� VARCHAR2(15) CONSTRAINT GRADESALE_GRADE_PK PRIMARY KEY,
�̿�Ƚ�� NUMBER(4), ������ NUMBER(15));

--����� ����
CREATE TABLE USERINFO
(ID VARCHAR2(10) CONSTRAINT USERINFO_ID_PK PRIMARY KEY,
������̸� VARCHAR2(4) NOT NULL, ���� NUMBER(3) NOT NULL,
���� VARCHAR2(3) NOT NULL, PW VARCHAR2(12) NOT NULL,
�ּ� VARCHAR2(15), ���ּ� VARCHAR2(15),
����ڵ�� VARCHAR2(10) CONSTRAINT USERINFO_GRADE_FK REFERENCES GRADESALE(����ڵ��));
--����
CREATE TABLE REVIEW
(NO NUMBER(5) CONSTRAINT REVIEW_NO_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT REVIEW_ID_FK REFERENCES USERINFO(ID),
���� VARCHAR2(100) NOT NULL, �������� VARCHAR2(10), ��¥ DATE);



--��������
CREATE TABLE ROOM
(ȣ�� NUMBER(4) CONSTRAINT ROOM_ȣ��_PK PRIMARY KEY, ���ǵ�� VARCHAR2(15), ���Ǻ� VARCHAR2(2),
�뷡�� VARCHAR2(2), �������� VARCHAR2(2), �ݾ� NUMBER(6) NOT NULL, �̿��ο� NUMBER(2));

--���೻��
CREATE TABLE RESERVE
(ȣ�� NUMBER(4) CONSTRAINT RESERVE_ȣ��_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT RESERVE_ID_FK REFERENCES USERINFO(ID), �Խǽð� DATE, ��ǽð� DATE, �ѱݾ� NUMBER(7),
CONSTRAINT RESERVE_ȣ��_FK FOREIGN KEY (ȣ��) REFERENCES ROOM(ȣ��));

--����� �̿볻��
CREATE TABLE DETAIL
(NO NUMBER(5) CONSTRAINT DETAIL_NO_PK PRIMARY KEY,
ID VARCHAR2(10) CONSTRAINT DETAIL_ID_FK REFERENCES USERINFO(ID),
ȣ�� NUMBER(4) CONSTRAINT DETAIL_ȣ��_FK REFERENCES ROOM(ȣ��),
�Խǳ�¥ DATE, ��ǳ�¥ DATE, �ݾ� NUMBER(6));

DESC ROOM;
DESC GRADESALE;
DESC USERINFO;
DESC REVIEW;
DESC RESERVE;
DESC DETAIL;

SELECT * FROM USER_CONSTRAINTS;

--ȣ��, ���, ���Ǻ�, �뷡��, ����, �ݾ�, �ο�
INSERT INTO ROOM VALUES (101, '���Ĵٵ�', 'O', 'X', 'O', 40000, 2);
INSERT INTO ROOM VALUES (102, '���Ĵٵ�', 'O', 'X', 'O', 40000, 2);
INSERT INTO ROOM VALUES (103, '���Ĵٵ�', 'X', 'X', 'X', 36000, 2);
INSERT INTO ROOM VALUES (104, '���Ĵٵ�', 'O', 'X', 'X', 38000, 2);
INSERT INTO ROOM VALUES (105, '���Ĵٵ�', 'X', 'X', 'X', 36000, 2);
INSERT INTO ROOM VALUES (201, '�𷰽�', 'O', 'X', 'X', 42000, 3);
INSERT INTO ROOM VALUES (202, '�𷰽�', 'O', 'X', 'X', 42000, 3);
INSERT INTO ROOM VALUES (203, '�𷰽�', 'X', 'O', 'O', 45000, 3);
INSERT INTO ROOM VALUES (204, '�𷰽�', 'O', 'X', 'O', 45000, 3);
INSERT INTO ROOM VALUES (205, '�𷰽�', 'O', 'O', 'O', 48000, 3);
INSERT INTO ROOM VALUES (301, '���Ÿ�', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (302, '���Ÿ�', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (303, '���Ÿ�', 'X', 'X', 'O', 50000, 4);
INSERT INTO ROOM VALUES (304, '���Ÿ�', 'O', 'X', 'O', 52000, 4);
INSERT INTO ROOM VALUES (305, '���Ÿ�', 'O', 'O', 'O', 55000, 4);
INSERT INTO ROOM VALUES (501, '��Ƽ��', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (502, '��Ƽ��', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (503, '��Ƽ��', 'X', 'O', 'O', 68000, 6);
INSERT INTO ROOM VALUES (504, '��Ƽ��', 'O', 'O', 'O', 70000, 6);
INSERT INTO ROOM VALUES (505, '��Ƽ��', 'X', 'O', 'O', 68000, 6);

--���, Ƚ��, ���η�
INSERT INTO GRADESALE VALUES ('�����', 5, 3000);
INSERT INTO GRADESALE VALUES ('�ǹ�', 7, 6000);
INSERT INTO GRADESALE VALUES ('���', 9, 8000);
INSERT INTO GRADESALE VALUES ('���̾�', 12, 10000);
INSERT INTO GRADESALE VALUES ('�÷�Ƽ��', 15, 12000);

commit;

SELECT * FROM ROOM;
DESC ROOM;

SELECT * FROM GRADESALE;
DESC GRADESALE;

insert into gradesale values('�븻',0,0);

commit;

SELECT * FROM REVIEW;
DESC REVIEW;

SELECT * FROM DETAIL;
DESC DETAIL;

SELECT * FROM USERINFO;

alter table userinfo modify (������̸� VARCHAR2(10),���� VARCHAR2(4),�ּ� VARCHAR2(40)); 

DESC USERINFO;

insert into userinfo values('a123','��',20,'man','a123','�ּ�','���ּ�','�����');
insert into userinfo values('ab123','��',20,'man','ab123','�ּ�','���ּ�','���̾�');

SELECT * FROM RESERVE;
DESC RESERVE;

insert into reserve values(101,'a123','2023-05-05','2023-05-06',20000);
insert into reserve values(201,'a123','2023-05-05','2023-05-06',50000);
insert into reserve values(102,'ab123','2023-05-05','2023-05-06',30000);
insert into reserve values(202,'ab123','2023-05-05','2023-05-06',30000);

commit;
select a.ȣ�� ȣ��,���ǵ��,���Ǻ�,�뷡��,��������,�ݾ�,�̿��ο�,b.ȣ�� bȣ�� from room a,reserve b where a.ȣ�� = b.ȣ��;

select a.ȣ�� ȣ��,���ǵ��,���Ǻ�,�뷡��,��������,�ݾ�,�̿��ο�,b.ȣ�� bȣ�� from room a,reserve b 
where a.ȣ�� = b.ȣ��(+) and b.ȣ�� is null;

SELECT ȣ��,�Խǽð�,��ǽð�,�ѱݾ� FROM RESERVE where id = 'a123'; 

select ȣ��,���ǵ��,���Ǻ�,�뷡��,��������,�ݾ�,�̿��ο� from room where ȣ�� = 101;


SELECT * FROM GRADESALE;
SELECT * FROM RESERVE;
DESC RESERVE;

commit;

select �ݾ� from room where ȣ�� = 501;
select ������ from USERINFO a, GRADESALE b where a.ID='ab123' and a.����ڵ�� = b.����ڵ��;
UPDATE reserve set ȣ��=501,�Խǽð�='2025-05-09',��ǽð�='2025-05-10',�ѱݾ� = (select �ݾ� from room where ȣ�� = 501) - (select ������ from USERINFO a, GRADESALE b where a.ID='ab123' and a.����ڵ�� = b.����ڵ��) where ȣ�� = 202;

ROLLBACK;