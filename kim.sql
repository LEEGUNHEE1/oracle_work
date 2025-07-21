--kim
/*
1. query
   select data검색어

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

--주석

select * from personnel;
SELECT * from DIVISION;
SELECT * from PAYGRADE;
SELECT * from BONUS;

SELECT pname, pay,job,DNO,pno from PERSONNEL;

SELECT job from PERSONNEL;

--중복제거
SELECT DISTINCT job from PERSONNEL;

--pay기준으로 오름차순 정렬
SELECT * from PERSONNEL
ORDER by pay ASC;

--asc가 디폴트
SELECT * from PERSONNEL
ORDER by pname;

--내림차순 정렬
SELECT * from PERSONNEL
ORDER by pay DESC;

SELECT * from PERSONNEL
ORDER by startdate DESC;

SELECT * from PERSONNEL
ORDER by 4 DESC;

SELECT PNAME,job,STARTDATE,DNO from PERSONNEL
ORDER by 4 DESC;

--별칭, as 생략 가능
SELECT pno as 사원번호,pname as 이름,pay 월급 from PERSONNEL;

--파생 컬럼, 데이터 꺼내면서 연산가능
SELECT PNAME,pay,PAY+1000 보너스 FROM PERSONNEL;
SELECT PNAME,pay,PAY+1000 "보 너 스" FROM PERSONNEL;
SELECT PNAME,pay,PAY+1000 보_너_스 FROM PERSONNEL;

--ORDER BY 에서만 별칭 사용 가능
SELECT PNAME,pay,PAY+1000 보너스 FROM PERSONNEL
ORDER BY 보너스;
--보통 이렇게 씀
SELECT PNAME,pay,PAY+1000 보너스 FROM PERSONNEL
ORDER BY PAY+1000;

--NULL,정렬때 큰값으로 인식
SELECT * FROM PERSONNEL
ORDER BY MANAGER ASC;

SELECT * FROM PERSONNEL
ORDER BY MANAGER DESC;

--사원의 급여와 일년치 연봉을 구하시오
SELECT PNO,PNAME,PAY,JOB,PAY*12 AS 연봉 FROM PERSONNEL;

--컬럼 붙여서 보기
SELECT PNAME || PNO FROM PERSONNEL;
SELECT PNAME || ' ' ||PNO FROM PERSONNEL;

--NVL(A,B) A가 NULL이면 B출력
SELECT PAY,BONUS,NVL(BONUS*1.1,0) 인상분 FROM PERSONNEL;

--조건절(WHERE), 행제한
-- =, >= , <=, <>, >, <

--급여가 1600인 사원
SELECT * FROM PERSONNEL WHERE PAY = 1600;

--사번이 1116인 사원
SELECT * FROM PERSONNEL WHERE PNO = 1116;

--급여가 2000이하인 사원
SELECT * FROM PERSONNEL WHERE PAY <= 2000;

--90년 12월 17일에 입사한 사원
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17';

SELECT * FROM NLS_SESSION_PARAMETERS;

--업무가 CLERK인 사원
SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

--이름이 JAMES인 사원
SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES'; --O

SELECT * FROM PERSONNEL WHERE PNAME = 'james'; -- X
















