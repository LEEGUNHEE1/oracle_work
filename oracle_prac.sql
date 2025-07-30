--FOOD_FACTORY 테이블에서 강원도에 위치한 식품공장의 공장 ID, 공장 이름, 주소를 조회하는 SQL문을 작성해주세요.
--이때 결과는 공장 ID를 기준으로 오름차순 정렬해주세요.

SELECT FACTORY_ID,FACTORY_NAME,ADDRESS FROM FOOD_FACTORY WHERE ADDRESS LIKE '강원도%' ORDER BY FACTORY_ID;


--동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
--이때 결과는 아이디 순으로 조회해주세요.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION ='Sick'
ORDER BY ANIMAL_ID;


--동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.

SELECT MIN(DATETIME) FROM ANIMAL_INS;


--동물 보호소에 들어온 동물 중, 이름이 없는 채로 들어온 동물의 ID를 조회하는 SQL 문을 작성해주세요. 
--단, ID는 오름차순 정렬되어야 합니다.

SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NULL ORDER BY ANIMAL_ID;


--동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
--이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.

SELECT ANIMAL_TYPE,NVL(NAME,'No name') NAME, SEX_UPON_INTAKE FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 
--이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.

SELECT NAME,COUNT(*) FROM ANIMAL_INS GROUP BY NAME HAVING COUNT(*) >= 2 AND NAME IS NOT NULL ORDER BY NAME;

--보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다.
-- 이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 
-- 동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
--이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE UPPER(NAME) LIKE '%EL%' AND ANIMAL_TYPE='Dog' ORDER BY NAME;


--ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 아이디 순으로 조회해야 합니다.

SELECT ANIMAL_ID,NAME,TO_CHAR(DATETIME,'YYYY-MM-DD') FROM ANIMAL_INS ORDER BY ANIMAL_ID;



--FOOD_WAREHOUSE 테이블에서 경기도에 위치한 창고의 ID, 이름, 주소, 냉동시설 여부를 조회하는 SQL문을 작성해주세요. 
--이때 냉동시설 여부가 NULL인 경우, 'N'으로 출력시켜 주시고 결과는 창고 ID를 기준으로 오름차순 정렬해주세요.

SELECT WAREHOUSE_ID,WAREHOUSE_NAME,ADDRESS,NVL(FREEZER_YN,'N') 
FROM FOOD_WAREHOUSE WHERE ADDRESS LIKE '경기도%' ORDER BY WAREHOUSE_ID;


--PRODUCT 테이블에서 상품 카테고리 코드(PRODUCT_CODE 앞 2자리) 별 상품 개수를 출력하는 SQL문을 작성해주세요.
-- 결과는 상품 카테고리 코드를 기준으로 오름차순 정렬해주세요.

SELECT SUBSTR(PRODUCT_CODE,1,2) CATEGORY,COUNT(PRODUCT_CODE) 
FROM PRODUCT GROUP BY SUBSTR(PRODUCT_CODE,1,2) ORDER BY SUBSTR(PRODUCT_CODE,1,2);


--USER_INFO 테이블에서 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원이 몇 명인지 출력하는 SQL문을 작성해주세요.

SELECT COUNT(USER_ID) USERS FROM USER_INFO WHERE EXTRACT(YEAR FROM JOINED)=2021 AND AGE BETWEEN 20 AND 29;


--DOCTOR 테이블에서 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성해주세요. 
--이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.

SELECT DR_NAME,DR_ID,MCDP_CD,TO_CHAR(HIRE_YMD,'YYYY-MM-DD') FROM DOCTOR 
WHERE MCDP_CD='CS' OR MCDP_CD='GS' ORDER BY HIRE_YMD DESC,DR_NAME;


--동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
--이때 결과는 ANIMAL_ID 역순으로 보여주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.


SELECT NAME,DATETIME FROM ANIMAL_INS ORDER BY ANIMAL_ID DESC;



--동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
--이때 결과는 아이디 순으로 조회해주세요.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE NOT INTAKE_CONDITION='Aged' ORDER BY ANIMAL_ID;


--FOOD_PRODUCT 테이블에서 가격이 제일 비싼 식품의 식품 ID, 식품 이름, 식품 코드,
--식품분류, 식품 가격을 조회하는 SQL문을 작성해주세요.

SELECT *  FROM FOOD_PRODUCT WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);


--동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. 
--SQL을 실행하면 다음과 같이 출력되어야 합니다.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 
--이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.

SELECT COUNT(*) COUNT FROM (SELECT DISTINCT NAME FROM ANIMAL_INS) WHERE NAME IS NOT NULL;


--동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요. 
--단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.

SELECT ANIMAL_ID,NAME,DATETIME FROM ANIMAL_INS ORDER BY NAME,DATETIME DESC;


--동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.

SELECT COUNT(*) COUNT FROM ANIMAL_INS;


--PRODUCT 테이블에서 판매 중인 상품 중 가장 높은 판매가를 출력하는 SQL문을 작성해주세요. 이때 컬럼명은 MAX_PRICE로 지정해주세요.

SELECT MAX(PRICE) MAX_PRICE FROM PRODUCT;


--동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.

SELECT NAME FROM ANIMAL_INS WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);


--동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.

SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NOT NULL ORDER BY ANIMAL_ID;


--USER_INFO 테이블에서 나이 정보가 없는 회원이 몇 명인지 출력하는 SQL문을 작성해주세요. 이때 컬럼명은 USERS로 지정해주세요.

SELECT COUNT(*) USERS FROM USER_INFO WHERE AGE IS NULL;


--동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
--이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.

SELECT ANIMAL_ID,NAME,CASE WHEN SEX_UPON_INTAKE 
LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O' ELSE 'X' END SEX_UPON_INTAKE FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요. 
--이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 
--나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.


SELECT PT_NAME,PT_NO,GEND_CD,AGE,CASE WHEN TLNO is NULL THEN 'NONE' ELSE TLNO END
 FROM PATIENT where GEND_CD = 'W' AND AGE <= 12 ORDER BY AGE DESC,PT_NAME;


--APPOINTMENT 테이블에서 2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL문을 작성해주세요. 
--이때, 컬럼명은 '진료과 코드', '5월예약건수'로 지정해주시고 결과는 진료과별 예약한 환자 수를 기준으로 오름차순 정렬하고, 
--예약한 환자 수가 같다면 진료과 코드를 기준으로 오름차순 정렬해주세요.

SELECT MCDP_CD "진료과 코드", COUNT(*) "5월예약건수" FROM APPOINTMENT WHERE TO_CHAR(APNT_YMD,'YYYY-MM') = '2022-05' 
GROUP BY MCDP_CD ORDER BY COUNT(*),MCDP_CD;


--상반기에 판매된 아이스크림의 맛을 총주문량을 기준으로 내림차순 정렬하고 총주문량이 
--같다면 출하 번호를 기준으로 오름차순 정렬하여 조회하는 SQL 문을 작성해주세요.


SELECT FLAVOR FROM FIRST_HALF ORDER BY TOTAL_ORDER DESC,SHIPMENT_ID;



--동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요.
-- 이때 고양이를 개보다 먼저 조회해주세요.

SELECT ANIMAL_TYPE,COUNT(*) FROM ANIMAL_INS GROUP BY ANIMAL_TYPE 
HAVING ANIMAL_TYPE='Cat' OR ANIMAL_TYPE='Dog' ORDER BY ANIMAL_TYPE;


--보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 09:00부터 19:59까지, 
--각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
--이때 결과는 시간대 순으로 정렬해야 합니다.

SELECT HOUR,COUNT(*) COUNT FROM (SELECT TO_NUMBER(TO_CHAR(DATETIME,'HH24')) HOUR FROM ANIMAL_OUTS 
WHERE TO_CHAR(DATETIME,'HH24') >='09' AND TO_CHAR(DATETIME,'HH24') <'20') A GROUP BY HOUR ORDER BY HOUR;


--CAR_RENTAL_COMPANY_CAR 테이블에서 '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차가 
--자동차 종류 별로 몇 대인지 출력하는 SQL문을 작성해주세요. 이때 자동차 수에 대한 컬럼명은 CARS로 지정하고, 
--결과는 자동차 종류를 기준으로 오름차순 정렬해주세요.

SELECT A.CAR_TYPE,COUNT(*) CARS FROM (SELECT CAR_TYPE FROM CAR_RENTAL_COMPANY_CAR WHERE 
(OPTIONS LIKE '%가죽시트%' OR OPTIONS LIKE '%통풍시트%' OR OPTIONS LIKE '%열선시트%'))
 A GROUP BY CAR_TYPE ORDER BY CAR_TYPE;


--'경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 
--출력하는 SQL문을 작성해주세요.결과는 출판일을 기준으로 오름차순 정렬해주세요.

SELECT BOOK_ID,AUTHOR_NAME,TO_CHAR(PUBLISHED_DATE,'YYYY-MM-DD') 
FROM BOOK A, AUTHOR B 
WHERE A.AUTHOR_ID = B.AUTHOR_ID AND CATEGORY ='경제'
ORDER BY PUBLISHED_DATE;


--상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 아이스크림의 총주문량을 총주문량이 작은 순서대로 조회하는 
--SQL 문을 작성해주세요. 이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.

SELECT B.INGREDIENT_TYPE INGREDIENT_TYPE,SUM(A.TOTAL_ORDER) TOTAL_ORDER
FROM FIRST_HALF A,ICECREAM_INFO B 
WHERE A.FLAVOR = B.FLAVOR 
GROUP BY B.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER;


--2022년 1월의 카테고리 별 도서 판매량을 합산하고, 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 
--출력하는 SQL문을 작성해주세요.결과는 카테고리명을 기준으로 오름차순 정렬해주세요.

SELECT CATEGORY,SUM(SALES) TOTAL_SALES FROM BOOK A, BOOK_SALES B 
WHERE A.BOOK_ID=B.BOOK_ID AND TO_CHAR(SALES_DATE,'YYYY-MM')='2022-01' GROUP BY CATEGORY ORDER BY CATEGORY;


--아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
--이때 결과는 보호 시작일 순으로 조회해야 합니다.

SELECT NAME,DATETIME FROM 
(SELECT A.NAME,A.DATETIME 
 FROM ANIMAL_INS A, ANIMAL_OUTS B 
 WHERE A.ANIMAL_ID = B.ANIMAL_ID(+) AND B.ANIMAL_ID IS NULL 
 ORDER BY A.DATETIME) WHERE ROWNUM <= 3;
































































