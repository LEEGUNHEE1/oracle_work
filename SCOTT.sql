SELECT * FROM TAB;
SELECT * FROM USER_TABLES;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;


--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.

SELECT EMPNO,ENAME,JOB,SAL FROM EMP WHERE SAL >= 3000;


--3. EMP 테이블에서 사원번호가 7782인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.

SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = '7782';
 

--4. EMP 테이블에서 February 20, 1981과 May 1, 1981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.;

SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE BETWEEN '1981-2-20' AND '1981-5-1' ORDER BY HIREDATE;
 

--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.

SELECT * FROM EMP WHERE DEPTNO IN(10,20) ORDER BY ENAME;

--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.

 SELECT ENAME Employee,SAL "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN(10,30);

--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

SELECT * FROM EMP WHERE HIREDATE LIKE '82%';

--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

 SELECT * FROM EMP WHERE COMM IS NOT NULL;

--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.

 SELECT ENAME,SAL,COMM FROM EMP WHERE (SAL*1.1) < COMM; 

--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.

SELECT * FROM EMP WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);

--11. EMP 테이블에서 이름에 L이 두 자가 있고  부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.

SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (DEPTNO = 30 OR MGR = 7782);

-------------------------------------------------------------------------------------------

--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.

SELECT SYSDATE "CURRENT DATE" FROM DUAL;


--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.

SELECT * FROM EMP;

SELECT EMPNO,ENAME,JOB,SAL,SAL*1.15 "NEW SALARY",SAL*0.15 "INCREASE" FROM EMP;

--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.

SELECT * FROM EMP;

SELECT ENAME,HIREDATE,NEXT_DAY(ADD_MONTHS(HIREDATE,6),'월요일') "입사 6개월차" FROM EMP;


--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.

SELECT * FROM EMP;

SELECT ENAME,HIREDATE,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE)) "현재까지 월수", SAL ,ROUND(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL "월급 총계" FROM EMP;


--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.

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
 

--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.

 SELECT * FROM EMP;
 
 SELECT ENAME,LPAD(SAL,15,'*') FROM EMP;

--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.

SELECT * FROM EMP;

SELECT ENAME,JOB,HIREDATE,DECODE(TO_CHAR(HIREDATE,'D'),'1','일요일','2','월요일','3','화요일','4','수요일','5','목요일','6','금요일','토요일') "입사한 요일" FROM EMP; 

SELECT ENAME,JOB,HIREDATE,TO_CHAR(HIREDATE,'DAY') "입사요일"
FROM EMP; 
--8. EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.

 SELECT * FROM EMP;
 
 SELECT ENAME,LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME) >= 6; 

--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.

SELECT * FROM EMP;

SELECT ENAME,JOB,SAL,COMM,SAL+ NVL(COMM,0) FROM EMP;


------------------------------------------------------------------------------------------------------------------
--SELECT * FROM CUSTOM;
--SELECT 
--case SEX 
--when '1' then '남자'
--when '0' then '여자'
--end gender,
--COUNT(*) 인원수 FROM CUSTOM
--GROUP BY SEX;
--
--WHEN '1' THEN '남자' ELSE '여자'
--
--SELECT 
--CASE 컬럼명                         
--	WHEN 1 THEN 100                          
--	WHEN 2 THEN 200                         
--	WHEN 3 THEN 300                         
--	WHEN 4 THEN 400                          
--	ELSE 500                        
--END AS RESULT             
--FROM DUAL;


--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP;

SELECT COUNT(*) 인원수, MAX(SAL) 최대급여, MIN(SAL) 최소급여,SUM(SAL) "급여의 합" FROM EMP;

--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP;

 SELECT JOB, MAX(SAL) 최대급여, MIN(SAL) 최소급여,SUM(SAL) "급여의 합" FROM EMP GROUP BY JOB;

--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP;

SELECT JOB,COUNT(*) 인원수 FROM EMP GROUP BY JOB;
 

--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP;

SELECT MAX(SAL)-MIN(SAL) 급여차 FROM EMP;

--5. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(group by)
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

--6. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum)
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


--7. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(CASE,SUM)
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
SUM(SAL) FROM EMP GROUP BY JOB;



