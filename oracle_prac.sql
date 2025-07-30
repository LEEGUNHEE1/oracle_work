--FOOD_FACTORY ���̺��� �������� ��ġ�� ��ǰ������ ���� ID, ���� �̸�, �ּҸ� ��ȸ�ϴ� SQL���� �ۼ����ּ���.
--�̶� ����� ���� ID�� �������� �������� �������ּ���.

SELECT FACTORY_ID,FACTORY_NAME,ADDRESS FROM FOOD_FACTORY WHERE ADDRESS LIKE '������%' ORDER BY FACTORY_ID;


--���� ��ȣ�ҿ� ���� ���� �� ���� ����1�� ���̵�� �̸��� ��ȸ�ϴ� SQL ���� �ۼ����ּ���. 
--�̶� ����� ���̵� ������ ��ȸ���ּ���.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION ='Sick'
ORDER BY ANIMAL_ID;


--���� ��ȣ�ҿ� ���� ���� ���� ������ ���� ���Դ��� ��ȸ�ϴ� SQL ���� �ۼ����ּ���.

SELECT MIN(DATETIME) FROM ANIMAL_INS;


--���� ��ȣ�ҿ� ���� ���� ��, �̸��� ���� ä�� ���� ������ ID�� ��ȸ�ϴ� SQL ���� �ۼ����ּ���. 
--��, ID�� �������� ���ĵǾ�� �մϴ�.

SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NULL ORDER BY ANIMAL_ID;


--������ ���� ��, �̸�, ���� �� �߼�ȭ ���θ� ���̵� ������ ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ���α׷����� �𸣴� ������� NULL�̶�� ��ȣ�� �𸣱� ������, �̸��� ���� ������ �̸��� "No name"���� ǥ���� �ּ���.

SELECT ANIMAL_TYPE,NVL(NAME,'No name') NAME, SEX_UPON_INTAKE FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--���� ��ȣ�ҿ� ���� ���� �̸� �� �� �� �̻� ���� �̸��� �ش� �̸��� ���� Ƚ���� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� �̸��� ���� ������ ���迡�� �����ϸ�, ����� �̸� ������ ��ȸ���ּ���.

SELECT NAME,COUNT(*) FROM ANIMAL_INS GROUP BY NAME HAVING COUNT(*) >= 2 AND NAME IS NOT NULL ORDER BY NAME;

--��ȣ�ҿ� ���ư��� �ҸӴϰ� �⸣�� ���� ã�� ����� ã�ƿԽ��ϴ�.
-- �� ����� ���ϱ� �ҸӴϰ� �⸣�� ���� �̸��� 'el'�� ���ٰ� �մϴ�. 
-- ���� ��ȣ�ҿ� ���� ���� �̸� ��, �̸��� "EL"�� ���� ���� ���̵�� �̸��� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� �̸� ������ ��ȸ���ּ���. ��, �̸��� ��ҹ��ڴ� �������� �ʽ��ϴ�.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE UPPER(NAME) LIKE '%EL%' AND ANIMAL_TYPE='Dog' ORDER BY NAME;


--ANIMAL_INS ���̺� ��ϵ� ��� ���ڵ忡 ����, �� ������ ���̵�� �̸�, ���� ��¥1�� ��ȸ�ϴ� SQL���� �ۼ����ּ���.
-- �̶� ����� ���̵� ������ ��ȸ�ؾ� �մϴ�.

SELECT ANIMAL_ID,NAME,TO_CHAR(DATETIME,'YYYY-MM-DD') FROM ANIMAL_INS ORDER BY ANIMAL_ID;



--FOOD_WAREHOUSE ���̺��� ��⵵�� ��ġ�� â���� ID, �̸�, �ּ�, �õ��ü� ���θ� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� �õ��ü� ���ΰ� NULL�� ���, 'N'���� ��½��� �ֽð� ����� â�� ID�� �������� �������� �������ּ���.

SELECT WAREHOUSE_ID,WAREHOUSE_NAME,ADDRESS,NVL(FREEZER_YN,'N') 
FROM FOOD_WAREHOUSE WHERE ADDRESS LIKE '��⵵%' ORDER BY WAREHOUSE_ID;


--PRODUCT ���̺��� ��ǰ ī�װ� �ڵ�(PRODUCT_CODE �� 2�ڸ�) �� ��ǰ ������ ����ϴ� SQL���� �ۼ����ּ���.
-- ����� ��ǰ ī�װ� �ڵ带 �������� �������� �������ּ���.

SELECT SUBSTR(PRODUCT_CODE,1,2) CATEGORY,COUNT(PRODUCT_CODE) 
FROM PRODUCT GROUP BY SUBSTR(PRODUCT_CODE,1,2) ORDER BY SUBSTR(PRODUCT_CODE,1,2);


--USER_INFO ���̺��� 2021�⿡ ������ ȸ�� �� ���̰� 20�� �̻� 29�� ������ ȸ���� �� ������ ����ϴ� SQL���� �ۼ����ּ���.

SELECT COUNT(USER_ID) USERS FROM USER_INFO WHERE EXTRACT(YEAR FROM JOINED)=2021 AND AGE BETWEEN 20 AND 29;


--DOCTOR ���̺��� ������� ��οܰ�(CS)�̰ų� �Ϲݿܰ�(GS)�� �ǻ��� �̸�, �ǻ�ID, �����, ������ڸ� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� ������ڸ� �������� �������� �����ϰ�, ������ڰ� ���ٸ� �̸��� �������� �������� �������ּ���.

SELECT DR_NAME,DR_ID,MCDP_CD,TO_CHAR(HIRE_YMD,'YYYY-MM-DD') FROM DOCTOR 
WHERE MCDP_CD='CS' OR MCDP_CD='GS' ORDER BY HIRE_YMD DESC,DR_NAME;


--���� ��ȣ�ҿ� ���� ��� ������ �̸��� ��ȣ �������� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� ANIMAL_ID �������� �����ּ���. SQL�� �����ϸ� ������ ���� ��µǾ�� �մϴ�.


SELECT NAME,DATETIME FROM ANIMAL_INS ORDER BY ANIMAL_ID DESC;



--���� ��ȣ�ҿ� ���� ���� �� ���� ����1�� ���̵�� �̸��� ��ȸ�ϴ� SQL ���� �ۼ����ּ���. 
--�̶� ����� ���̵� ������ ��ȸ���ּ���.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE NOT INTAKE_CONDITION='Aged' ORDER BY ANIMAL_ID;


--FOOD_PRODUCT ���̺��� ������ ���� ��� ��ǰ�� ��ǰ ID, ��ǰ �̸�, ��ǰ �ڵ�,
--��ǰ�з�, ��ǰ ������ ��ȸ�ϴ� SQL���� �ۼ����ּ���.

SELECT *  FROM FOOD_PRODUCT WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT);


--���� ��ȣ�ҿ� ���� ��� ������ ���̵�� �̸��� ANIMAL_ID������ ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--SQL�� �����ϸ� ������ ���� ��µǾ�� �մϴ�.

SELECT ANIMAL_ID,NAME FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--���� ��ȣ�ҿ� ���� ������ �̸��� �� ������ ��ȸ�ϴ� SQL ���� �ۼ����ּ���. 
--�̶� �̸��� NULL�� ���� �������� ������ �ߺ��Ǵ� �̸��� �ϳ��� Ĩ�ϴ�.

SELECT COUNT(*) COUNT FROM (SELECT DISTINCT NAME FROM ANIMAL_INS) WHERE NAME IS NOT NULL;


--���� ��ȣ�ҿ� ���� ��� ������ ���̵�� �̸�, ��ȣ �������� �̸� ������ ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--��, �̸��� ���� ���� �߿����� ��ȣ�� ���߿� ������ ������ ���� ������� �մϴ�.

SELECT ANIMAL_ID,NAME,DATETIME FROM ANIMAL_INS ORDER BY NAME,DATETIME DESC;


--���� ��ȣ�ҿ� ������ �� ���� ���Դ��� ��ȸ�ϴ� SQL ���� �ۼ����ּ���.

SELECT COUNT(*) COUNT FROM ANIMAL_INS;


--PRODUCT ���̺��� �Ǹ� ���� ��ǰ �� ���� ���� �ǸŰ��� ����ϴ� SQL���� �ۼ����ּ���. �̶� �÷����� MAX_PRICE�� �������ּ���.

SELECT MAX(PRICE) MAX_PRICE FROM PRODUCT;


--���� ��ȣ�ҿ� ���� ���� ���� ������ �̸��� ��ȸ�ϴ� SQL ���� �ۼ����ּ���.

SELECT NAME FROM ANIMAL_INS WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);


--���� ��ȣ�ҿ� ���� ���� ��, �̸��� �ִ� ������ ID�� ��ȸ�ϴ� SQL ���� �ۼ����ּ���. ��, ID�� �������� ���ĵǾ�� �մϴ�.

SELECT ANIMAL_ID FROM ANIMAL_INS WHERE NAME IS NOT NULL ORDER BY ANIMAL_ID;


--USER_INFO ���̺��� ���� ������ ���� ȸ���� �� ������ ����ϴ� SQL���� �ۼ����ּ���. �̶� �÷����� USERS�� �������ּ���.

SELECT COUNT(*) USERS FROM USER_INFO WHERE AGE IS NULL;


--������ ���̵�� �̸�, �߼�ȭ ���θ� ���̵� ������ ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� �߼�ȭ�� �Ǿ��ִٸ� 'O', �ƴ϶�� 'X'��� ǥ�����ּ���.

SELECT ANIMAL_ID,NAME,CASE WHEN SEX_UPON_INTAKE 
LIKE 'Neutered%' OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O' ELSE 'X' END SEX_UPON_INTAKE FROM ANIMAL_INS ORDER BY ANIMAL_ID;


--PATIENT ���̺��� 12�� ������ ����ȯ���� ȯ���̸�, ȯ�ڹ�ȣ, �����ڵ�, ����, ��ȭ��ȣ�� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ��ȭ��ȣ�� ���� ���, 'NONE'���� ��½��� �ֽð� ����� ���̸� �������� �������� �����ϰ�, 
--���� ���ٸ� ȯ���̸��� �������� �������� �������ּ���.


SELECT PT_NAME,PT_NO,GEND_CD,AGE,CASE WHEN TLNO is NULL THEN 'NONE' ELSE TLNO END
 FROM PATIENT where GEND_CD = 'W' AND AGE <= 12 ORDER BY AGE DESC,PT_NAME;


--APPOINTMENT ���̺��� 2022�� 5���� ������ ȯ�� ���� ������ڵ� ���� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶�, �÷����� '����� �ڵ�', '5������Ǽ�'�� �������ֽð� ����� ������� ������ ȯ�� ���� �������� �������� �����ϰ�, 
--������ ȯ�� ���� ���ٸ� ����� �ڵ带 �������� �������� �������ּ���.

SELECT MCDP_CD "����� �ڵ�", COUNT(*) "5������Ǽ�" FROM APPOINTMENT WHERE TO_CHAR(APNT_YMD,'YYYY-MM') = '2022-05' 
GROUP BY MCDP_CD ORDER BY COUNT(*),MCDP_CD;


--��ݱ⿡ �Ǹŵ� ���̽�ũ���� ���� ���ֹ����� �������� �������� �����ϰ� ���ֹ����� 
--���ٸ� ���� ��ȣ�� �������� �������� �����Ͽ� ��ȸ�ϴ� SQL ���� �ۼ����ּ���.


SELECT FLAVOR FROM FIRST_HALF ORDER BY TOTAL_ORDER DESC,SHIPMENT_ID;



--���� ��ȣ�ҿ� ���� ���� �� ����̿� ���� ���� �� �������� ��ȸ�ϴ� SQL���� �ۼ����ּ���.
-- �̶� ����̸� ������ ���� ��ȸ���ּ���.

SELECT ANIMAL_TYPE,COUNT(*) FROM ANIMAL_INS GROUP BY ANIMAL_TYPE 
HAVING ANIMAL_TYPE='Cat' OR ANIMAL_TYPE='Dog' ORDER BY ANIMAL_TYPE;


--��ȣ�ҿ����� �� �ÿ� �Ծ��� ���� Ȱ���ϰ� �Ͼ���� �˾ƺ��� �մϴ�. 09:00���� 19:59����, 
--�� �ð��뺰�� �Ծ��� �� ���̳� �߻��ߴ��� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� �ð��� ������ �����ؾ� �մϴ�.

SELECT HOUR,COUNT(*) COUNT FROM (SELECT TO_NUMBER(TO_CHAR(DATETIME,'HH24')) HOUR FROM ANIMAL_OUTS 
WHERE TO_CHAR(DATETIME,'HH24') >='09' AND TO_CHAR(DATETIME,'HH24') <'20') A GROUP BY HOUR ORDER BY HOUR;


--CAR_RENTAL_COMPANY_CAR ���̺��� '��ǳ��Ʈ', '������Ʈ', '���׽�Ʈ' �� �ϳ� �̻��� �ɼ��� ���Ե� �ڵ����� 
--�ڵ��� ���� ���� �� ������ ����ϴ� SQL���� �ۼ����ּ���. �̶� �ڵ��� ���� ���� �÷����� CARS�� �����ϰ�, 
--����� �ڵ��� ������ �������� �������� �������ּ���.

SELECT A.CAR_TYPE,COUNT(*) CARS FROM (SELECT CAR_TYPE FROM CAR_RENTAL_COMPANY_CAR WHERE 
(OPTIONS LIKE '%���׽�Ʈ%' OR OPTIONS LIKE '%��ǳ��Ʈ%' OR OPTIONS LIKE '%������Ʈ%'))
 A GROUP BY CAR_TYPE ORDER BY CAR_TYPE;


--'����' ī�װ��� ���ϴ� �������� ���� ID(BOOK_ID), ���ڸ�(AUTHOR_NAME), ������(PUBLISHED_DATE) ����Ʈ�� 
--����ϴ� SQL���� �ۼ����ּ���.����� �������� �������� �������� �������ּ���.

SELECT BOOK_ID,AUTHOR_NAME,TO_CHAR(PUBLISHED_DATE,'YYYY-MM-DD') 
FROM BOOK A, AUTHOR B 
WHERE A.AUTHOR_ID = B.AUTHOR_ID AND CATEGORY ='����'
ORDER BY PUBLISHED_DATE;


--��ݱ� ���� �� ���̽�ũ�� ���� Ÿ�԰� ���� Ÿ�Կ� ���� ���̽�ũ���� ���ֹ����� ���ֹ����� ���� ������� ��ȸ�ϴ� 
--SQL ���� �ۼ����ּ���. �̶� ���ֹ����� ��Ÿ���� �÷����� TOTAL_ORDER�� �������ּ���.

SELECT B.INGREDIENT_TYPE INGREDIENT_TYPE,SUM(A.TOTAL_ORDER) TOTAL_ORDER
FROM FIRST_HALF A,ICECREAM_INFO B 
WHERE A.FLAVOR = B.FLAVOR 
GROUP BY B.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER;


--2022�� 1���� ī�װ� �� ���� �Ǹŷ��� �ջ��ϰ�, ī�װ�(CATEGORY), �� �Ǹŷ�(TOTAL_SALES) ����Ʈ�� 
--����ϴ� SQL���� �ۼ����ּ���.����� ī�װ����� �������� �������� �������ּ���.

SELECT CATEGORY,SUM(SALES) TOTAL_SALES FROM BOOK A, BOOK_SALES B 
WHERE A.BOOK_ID=B.BOOK_ID AND TO_CHAR(SALES_DATE,'YYYY-MM')='2022-01' GROUP BY CATEGORY ORDER BY CATEGORY;


--���� �Ծ��� �� �� ���� ��, ���� ���� ��ȣ�ҿ� �־��� ���� 3������ �̸��� ��ȣ �������� ��ȸ�ϴ� SQL���� �ۼ����ּ���. 
--�̶� ����� ��ȣ ������ ������ ��ȸ�ؾ� �մϴ�.

SELECT NAME,DATETIME FROM 
(SELECT A.NAME,A.DATETIME 
 FROM ANIMAL_INS A, ANIMAL_OUTS B 
 WHERE A.ANIMAL_ID = B.ANIMAL_ID(+) AND B.ANIMAL_ID IS NULL 
 ORDER BY A.DATETIME) WHERE ROWNUM <= 3;
































































