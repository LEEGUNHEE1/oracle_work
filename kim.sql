--kim
/*
1. query
   select data�˻���

2. dml(data maipulation language)
    insert, update, delete
    
3. ddl(data difinition language)
    create, alter, drop, rename
    
4. tcl(transaction control language)
    truncation, commit, rollback, savepoint
    
5. dcl(data control language)
    grant, revoke
*/

select * from tab;

--�ּ�

select * from personnel;
SELECT * from DIVISION;
SELECT * from PAYGRADE;
SELECT * from BONUS;

SELECT pname, pay,job,DNO,pno from PERSONNEL;

SELECT job from PERSONNEL;

--�ߺ�����
SELECT DISTINCT job from PERSONNEL;

--pay�������� �������� ����
SELECT * from PERSONNEL
ORDER by pay ASC;

--asc�� ����Ʈ
SELECT * from PERSONNEL
ORDER by pname;

--�������� ����
SELECT * from PERSONNEL
ORDER by pay DESC;

SELECT * from PERSONNEL
ORDER by startdate DESC;

SELECT * from PERSONNEL
ORDER by 4 DESC;

SELECT PNAME,job,STARTDATE,DNO from PERSONNEL
ORDER by 4 DESC;

--��Ī, as ���� ����
SELECT pno as �����ȣ,pname as �̸�,pay ���� from PERSONNEL;

--�Ļ� �÷�, ������ �����鼭 ���갡��
SELECT PNAME,pay,PAY+1000 ���ʽ� FROM PERSONNEL;
SELECT PNAME,pay,PAY+1000 "�� �� ��" FROM PERSONNEL;
SELECT PNAME,pay,PAY+1000 ��_��_�� FROM PERSONNEL;

--ORDER BY ������ ��Ī ��� ����
SELECT PNAME,pay,PAY+1000 ���ʽ� FROM PERSONNEL
ORDER BY ���ʽ�;
--���� �̷��� ��
SELECT PNAME,pay,PAY+1000 ���ʽ� FROM PERSONNEL
ORDER BY PAY+1000;

--NULL,���Ķ� ū������ �ν�
SELECT * FROM PERSONNEL
ORDER BY MANAGER ASC;

SELECT * FROM PERSONNEL
ORDER BY MANAGER DESC;

--����� �޿��� �ϳ�ġ ������ ���Ͻÿ�
SELECT PNO,PNAME,PAY,JOB,PAY*12 AS ���� FROM PERSONNEL;

--�÷� �ٿ��� ����
SELECT PNAME || PNO FROM PERSONNEL;
SELECT PNAME || ' ' ||PNO FROM PERSONNEL;

--NVL(A,B) A�� NULL�̸� B���
SELECT PAY,BONUS,NVL(BONUS*1.1,0) �λ�� FROM PERSONNEL;

--������(WHERE), ������
-- =, >= , <=, <>, >, <

--�޿��� 1600�� ���
SELECT * FROM PERSONNEL WHERE PAY = 1600;

--����� 1116�� ���
SELECT * FROM PERSONNEL WHERE PNO = 1116;

--�޿��� 2000������ ���
SELECT * FROM PERSONNEL WHERE PAY <= 2000;

--90�� 12�� 17�Ͽ� �Ի��� ���
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17';

SELECT * FROM NLS_SESSION_PARAMETERS;

--������ CLERK�� ���
SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

--�̸��� JAMES�� ���
SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES'; --O

SELECT * FROM PERSONNEL WHERE PNAME = 'james'; -- X
















