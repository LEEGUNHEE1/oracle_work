--PLSQL
--CMD에서 실행
--기본적으로 출력기능 OFF되있음, 창 닫으면 다시 OFF로 바뀜
SET SERVEROUTPUT ON;

--익명블록, FILE로 보통 저장해놓고 사용

--데이터타입 가져오기
DECLARE
TYPE FIRSTTYPE IS RECORD
(A 사원.사원명%TYPE, B 사원.직급%TYPE,C 사원.급여%TYPE);

--FIRSTTYPE 타입의 변수 CUS 생성, 원본데이터 직접 안씀
CUS FIRSTTYPE;

BEGIN
SELECT 사원명,직급,급여 INTO CUS FROM 사원
WHERE 사원번호=2001;

DBMS_OUTPUT.PUT_LINE('사원명  직급  급여');
DBMS_OUTPUT.PUT_LINE('------------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'   '||CUS.B||'   '||TO_CHAR(CUS.C));
DBMS_OUTPUT.PUT_LINE('현재 질의한 계정명 : '||USER);
DBMS_OUTPUT.PUT_LINE('질의한 시간 : '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));
END;
/

--사원테이블의 행의 모든 데이터타입 가져옴
DECLARE 
SAWON_REC 사원%ROWTYPE;

BEGIN
SELECT * INTO SAWON_REC FROM 사원 WHERE 사원번호=2001;
DBMS_OUTPUT.PUT_LINE('사원번호 : '||SAWON_REC.사원번호);
DBMS_OUTPUT.PUT_LINE('사원명 : '||SAWON_REC.사원명);
DBMS_OUTPUT.PUT_LINE('직급 : '||SAWON_REC.직급);
DBMS_OUTPUT.PUT_LINE('급여 : '||SAWON_REC.급여);
END;
/

--사원명,직급 컬럼타입 가져오고 인덱스 부여
DECLARE
TYPE SA_COL_TYPE IS TABLE OF 사원.사원명%TYPE
INDEX BY BINARY_INTEGER;

TYPE JIK_COL_TYPE IS TABLE OF 사원.직급%TYPE
INDEX BY BINARY_INTEGER;

--앞에가 변수명 뒤에가 데이터타입, 변수 선언
SANAME_COL SA_COL_TYPE;
SAJIK_COL JIK_COL_TYPE;

-- := 대입연산자, I에 0대입
I BINARY_INTEGER := 0;

BEGIN
FOR K IN (SELECT 사원명,직급 FROM 사원) LOOP
I := I+1; -- ORCLE은 인덱스1부터 시작
SANAME_COL(I) := K.사원명;
SAJIK_COL(I) := K.직급;

END LOOP;--FOR문 닫기

DBMS_OUTPUT.PUT_LINE('사원명  직급');
DBMS_OUTPUT.PUT_LINE('------------');

--1부터 I까지 반복
FOR J IN 1..I LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(SANAME_COL(J),12)||RPAD(SAJIK_COL(J),9));
END LOOP;
END;
/








































