SELECT * FROM TAB;
SELECT * FROM USER_TABLES;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;


--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.

SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >= 3000;


--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.

SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = '7782';
 

--4. EMP ���̺��� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.;

SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE BETWEEN '1981-2-20' AND '1981-5-1' ORDER BY HIREDATE;
 

--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.

SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME;

--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.

 SELECT ENAME Employee,SAL "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN(10,30);

--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

SELECT * FROM EMP WHERE HIREDATE LIKE '82%';

--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT * FROM EMP WHERE COMM IS NOT NULL;

--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.

 SELECT ENAME,SAL,COMM FROM EMP WHERE (SAL*1.1) < COMM; 

--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

SELECT * FROM EMP WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);

--11. EMP ���̺��� �̸��� L�� �� �ڰ� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.

SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (DEPTNO = 30 OR MGR = 7782);

-------------------------------------------------------------------------------------------

--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT SYSDATE "CURRENT DATE" FROM DUAL;


--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,SAL*1.15 "NEW SALARY",SAL*0.15 "INCREASE" FROM EMP;

--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE,6),'������') "�Ի� 6������" FROM EMP;


--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;

SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) "������� ����", SAL ,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL "���� �Ѱ�" FROM EMP;


--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.

--Dream Salary

--------------------------------------------------------------
--
--KING earns $5,000.00 monthly but wants $15,000.00
--
--BLAKE earns $2,850.00 monthly but wants $8,550.00
--
--CLARK earns $2,450.00 monthly but wants $7,350.00
--
--. . . . . . . . . .

--14 rows selected
 
SELECT * FROM EMP;

SELECT CONCAT(ENAME,CONCAT(' earns',TO_CHAR(SAL,'$9999.99')))||TO_CHAR(' monthly but wants')||TO_CHAR(SAL*3,'$99,999.99') "DREAM SALARY" FROM EMP;
 

--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 
 SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;

--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;

SELECT ENAME,JOB,HIREDATE,DECODE(TO_CHAR(HIREDATE,'D'),'1','�Ͽ���','2','������','3','ȭ����','4','������','5','�����','6','�ݿ���','�����') "�Ի��� ����" FROM EMP; 

SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "�Ի����"
FROM EMP; 
--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.

 SELECT * FROM EMP;
 
 SELECT ENAME,LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME) >= 6; 

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT * FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+ NVL(COMM,0) FROM EMP;


------------------------------------------------------------------------------------------------------------------
--SELECT * FROM CUSTOM;
--SELECT 
--case SEX 
--when '1' then '����'
--when '0' then '����'
--end gender,
--COUNT(*) �ο��� FROM CUSTOM
--GROUP BY SEX;
--
--WHEN '1' THEN '����' ELSE '����'
--
--SELECT 
--CASE �÷���                         
--	WHEN 1 THEN 100                          
--	WHEN 2 THEN 200                         
--	WHEN 3 THEN 300                         
--	WHEN 4 THEN 400                          
--	ELSE 500                        
--END AS RESULT             
--FROM DUAL;


--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT COUNT(*) �ο���, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�,SUM(SAL) "�޿��� ��" FROM EMP;

--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

 SELECT JOB, MAX(SAL) �ִ�޿�, MIN(SAL) �ּұ޿�,SUM(SAL) "�޿��� ��" FROM EMP GROUP BY JOB;

--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT JOB,COUNT(*) �ο��� FROM EMP GROUP BY JOB;
 

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT MAX(SAL)-MIN(SAL) �޿��� FROM EMP;

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)
--
--H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)
--
-------- --------- --------- --------- --------- ---------
--
--    81       10       950      5000    2282.5	  22825
--
--    82        1      1300      1300      1300      1300
--
--    80        1       800       800       800       800
 

SELECT * FROM EMP;

SELECT TO_CHAR(HIREDATE,'YY') H_YEAR,COUNT(TO_CHAR(HIREDATE,'YY')) "COUNT(*)",
MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YY');

--6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)
--
--    TOTAL      1980      1981      1982      1983
--
----------- --------- --------- --------- ---------
--
--       12         1        10         1         0
 
SELECT * FROM EMP;

SELECT CASE EXTRACT(YEAR FROM HIREDATE)
WHEN 1980 THEN 1 ELSE 0 END "1980" FROM EMP;

SELECT CASE EXTRACT(YEAR FROM HIREDATE)
WHEN 1981 THEN 1 ELSE 0 END "1981" FROM EMP;

SELECT CASE EXTRACT(YEAR FROM HIREDATE)
WHEN 1982 THEN 1 ELSE 0 END "1982" FROM EMP;

SELECT CASE EXTRACT(YEAR FROM HIREDATE)
WHEN 1983 THEN 1 ELSE 0 END "1983" FROM EMP;



SELECT COUNT(*) TOTAL,
SUM(CASE EXTRACT(YEAR FROM HIREDATE)WHEN 1980 THEN 1 ELSE 0 END) "1980",
SUM(CASE EXTRACT(YEAR FROM HIREDATE)WHEN 1981 THEN 1 ELSE 0 END) "1981",
SUM(CASE EXTRACT(YEAR FROM HIREDATE)WHEN 1982 THEN 1 ELSE 0 END) "1982",
SUM(CASE EXTRACT(YEAR FROM HIREDATE)WHEN 1983 THEN 1 ELSE 0 END) "1983"
FROM EMP;


--7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(CASE,SUM)
--
--JOB         Deptno 10    Deptno 20     Deptno 30     Total
--
-----------   ---------    ---------     ---------     ---------
--
--CLERK          1300         1900          950          4150
--
--SALESMAN                                 5600          5600
--
--PRESIDENT	    5000                                     5000
--
--MANAGER	    2450          2975          2850         8275
--
--ANALYST	                 3000                        3000

SELECT * FROM EMP;

SELECT JOB ,
SUM(CASE DEPTNO WHEN 10 THEN SAL END) DEPTNO10,
SUM(CASE DEPTNO WHEN 20 THEN SAL END) DEPTNO20,
SUM(CASE DEPTNO WHEN 30 THEN SAL END) DEPTNO30,
SUM(SAL) TOTAL FROM EMP GROUP BY JOB;


--------------------------------------------------------------------------------------------------------------------

--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT ENAME,A.DEPTNO,DNAME FROM EMP A,DEPT B WHERE A.DEPTNO=B.DEPTNO;
 

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT ENAME,JOB,SAL,DNAME FROM EMP A, DEPT B WHERE A.DEPTNO=B.DEPTNO AND B.LOC = 'NEW YORK';
 

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT ENAME,DNAME,LOC FROM EMP A,DEPT B WHERE A.DEPTNO = B.DEPTNO AND A.COMM IS NOT NULL AND A.COMM <> 0;
 

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT * FROM EMP;

SELECT * FROM DEPT;
 
 SELECT ENAME,JOB,DNAME,LOC FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND ENAME LIKE '%L%';
 

--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)
--
--Employee        Emp# Manager         Mgr#
--
------------ --------- ---------- ---------
--
--KING            7839
--
--BLAKE           7698 KING            7839
--
--CLARK           7782 KING            7839
--
--. . . . . . . . . .
--
--14 rows selected.
 
 SELECT * FROM EMP;
 
 DESC EMP;
 
 
 SELECT A.ENAME Employee,A.EMPNO EMP#,B.ENAME MANAGER, B.EMPNO MGR# FROM EMP A,EMP B 
 WHERE A.MGR = B.EMPNO(+) ORDER BY B.ENAME DESC;
 
--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

 SELECT A.ENAME,A.HIREDATE,B.ENAME,B.HIREDATE FROM EMP A,EMP B WHERE A.MGR = B.EMPNO AND A.HIREDATE < B.HIREDATE;
 

--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.
--
--Employee and their salary
--
-------------------------------------------------------------------
--
--KING      **************************************************
--
--BLAKE     ****************************
--
--CLARK     ************************
--
--JONES     *****************************
--
--MARTIN    ************
--
--ALLEN     ****************
--
--TURNER    ***************
--
--. . . . . . . . . .
--
--14 rows selected.
 
SELECT ENAME||'  '||LPAD(' ',SAL/100,'*') "Employee and their salary" FROM EMP;
 
-------------------------------------------------------------------------------------------------

--1. EMP ���̺��� Blake�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;

SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE';

SELECT ENAME,HIREDATE FROM EMP A,(SELECT DEPTNO FROM EMP WHERE ENAME='BLAKE') B WHERE A.DEPTNO = B.DEPTNO;

--2. EMP ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� ������ ��ȣ�� �̸��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �޿��� ���� ������ ����Ͽ���.

SELECT * FROM EMP;

SELECT AVG(SAL) AVG FROM EMP;

SELECT EMPNO,ENAME FROM EMP A,(SELECT AVG(SAL) AVG FROM EMP) B WHERE SAL >= AVG ORDER BY SAL SELECT AVG(SAL) FROM EMP; 

 

--3. EMP ���̺��� �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� �������� ���� ��� ��ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �����ȣ ������ ����Ͽ���.

 SELECT * FROM EMP;
 
 SELECT ENAME,DEPTNO FROM EMP WHERE ENAME LIKE '%T%';
 
 SELECT EMPNO,A.ENAME,SAL FROM EMP A ,(SELECT ENAME,DEPTNO FROM EMP WHERE ENAME LIKE '%T%') B WHERE A.DEPTNO=B.DEPTNO ORDER BY EMPNO;


--4. EMP ���̺��� �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;

SELECT * FROM TABS;

SELECT * FROM DEPT;

SELECT ENAME,JOB,SAL FROM EMP A ,DEPT B WHERE A.DEPTNO = B.DEPTNO AND B.LOC='DALLAS';  
 

--5. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 
 SELECT A.ENAME,A.SAL FROM EMP A ,EMP B WHERE A.MGR=B.EMPNO AND B.ENAME='KING';

 

--6. EMP ���̺��� SALES�μ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;
 
 SELECT * FROM DEPT;

SELECT ENAME,JOB FROM EMP A,DEPT B WHERE A.DEPTNO=B.DEPTNO AND B.DNAME='SALES';

 

--7. EMP ���̺��� ������ �μ� 30�� ���� ���޺��� ���� ����� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT * FROM EMP;

SELECT MIN(SAL) SAL FROM EMP WHERE DEPTNO=30;

SELECT A.* FROM EMP A,(SELECT MIN(SAL) SAL FROM EMP WHERE DEPTNO=30) B WHERE A.SAL > B.SAL;


--8. EMP ���̺��� �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
 SELECT * FROM EMP;

 SELECT * FROM DEPT;

SELECT A.ENAME DEPTNI10_NAME,B.ENAME DEPTNI30_NAME,A.JOB JOB FROM EMP A,EMP B WHERE A.DEPTNO=10 AND B.DEPTNO=30 AND A.JOB=B.JOB;

 

--9. EMP ���̺��� WARD�� ������ ���޵� ���� ����� ��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;

SELECT JOB,SAL FROM EMP WHERE ENAME='WARD';

SELECT * FROM EMP A, (SELECT JOB,SAL FROM EMP WHERE ENAME='WARD') B WHERE A.JOB=B.JOB AND A.SAL=B.SAL AND A.ENAME <> 'WARD'; 


--10. EMP ���̺��� ������ JONES�� ���ų� ������ FORD�̻��� ����� ������ �̸�,����,�μ���ȣ,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
--�� ������, ������ ���� ������ ����Ͽ���.

 
SELECT JOB FROM EMP WHERE ENAME='JONES';

SELECT SAL FROM EMP WHERE ENAME='FORD';

SELECT ENAME,A.JOB ,DEPTNO,A.SAL FROM EMP A,(SELECT JOB FROM EMP WHERE ENAME='JONES') B,(SELECT SAL FROM EMP WHERE ENAME='FORD') C
WHERE A.JOB = B.JOB OR A.SAL >= C.SAL ORDER BY A.JOB,A.SAL DESC;
 

--11. EMP ���̺��� SMITH �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT SAL FROM EMP WHERE ENAME='SMITH';
 SELECT SAL FROM EMP WHERE ENAME='WARD';
 
 SELECT ENAME,JOB,A.SAL FROM EMP A,(SELECT SAL FROM EMP WHERE ENAME='SMITH') B, (SELECT SAL FROM EMP WHERE ENAME='WARD') C 
 WHERE A.SAL=B.SAL OR A.SAL=C.SAL; 
 

--12. EMP ���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

  SELECT * FROM EMP;

 SELECT * FROM DEPT;
 
 SELECT DEPTNO FROM DEPT WHERE LOC ='CHICAGO'; 
 
 SELECT DISTINCT A.JOB FROM EMP A,(SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO') B WHERE A.DEPTNO=B.DEPTNO;

 SELECT A.ENAME,B.JOB FROM EMP A,(SELECT DISTINCT A.JOB JOB FROM EMP A,(SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO') B WHERE A.DEPTNO=B.DEPTNO) B
 WHERE A.JOB = B.JOB;
 
 SELECT * FROM EMP
WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO =
(SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO'));
 

--13. EMP ���̺��� ������ �μ��� ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT DEPTNO, AVG(SAL) AVG FROM EMP GROUP BY DEPTNO;
 
 SELECT A.DEPTNO,ENAME,SAL FROM EMP A,( SELECT DEPTNO, AVG(SAL) AVG FROM EMP GROUP BY DEPTNO) B 
 WHERE A.DEPTNO =B.DEPTNO AND SAL > AVG;

--14. EMP ���̺��� ������ ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

 SELECT JOB, AVG(SAL) AVG FROM EMP GROUP BY JOB;
 
 
 SELECT EMPNO,ENAME,SAL FROM EMP A,(SELECT JOB, AVG(SAL) AVG FROM EMP GROUP BY JOB) B 
 WHERE A.JOB =B.JOB AND SAL < AVG;

 

--15. EMP ���̺��� ��� �Ѹ� �̻����κ��� ���� ���� �� �ִ� ����� ����,�̸�,�����ȣ,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

  SELECT * FROM EMP;
  
  SELECT DISTINCT A.JOB,A.ENAME,A.EMPNO,A.DEPTNO FROM EMP A ,EMP B WHERE B.MGR=A.EMPNO; 

 

--16. EMP ���̺��� ���� ����� �����ȣ,�̸�,����,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;

SELECT MAX(HIREDATE) FROM EMP;

SELECT EMPNO,ENAME,JOB,DEPTNO FROM EMP A,(SELECT MAX(HIREDATE) HIREDATE FROM EMP) B WHERE A.HIREDATE=B.HIREDATE;


