--PLSQL
--CMD���� ����
--�⺻������ ��±�� OFF������, â ������ �ٽ� OFF�� �ٲ�
SET SERVEROUTPUT ON;

--�͸���, FILE�� ���� �����س��� ���

--������Ÿ�� ��������
DECLARE
TYPE FIRSTTYPE IS RECORD
(A ���.�����%TYPE, B ���.����%TYPE,C ���.�޿�%TYPE);

--FIRSTTYPE Ÿ���� ���� CUS ����, ���������� ���� �Ⱦ�
CUS FIRSTTYPE;

BEGIN
SELECT �����,����,�޿� INTO CUS FROM ���
WHERE �����ȣ=2001;

DBMS_OUTPUT.PUT_LINE('�����  ����  �޿�');
DBMS_OUTPUT.PUT_LINE('------------------');
DBMS_OUTPUT.PUT_LINE(CUS.A||'   '||CUS.B||'   '||TO_CHAR(CUS.C));
DBMS_OUTPUT.PUT_LINE('���� ������ ������ : '||USER);
DBMS_OUTPUT.PUT_LINE('������ �ð� : '||TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS'));
END;
/

--������̺��� ���� ��� ������Ÿ�� ������
DECLARE 
SAWON_REC ���%ROWTYPE;

BEGIN
SELECT * INTO SAWON_REC FROM ��� WHERE �����ȣ=2001;
DBMS_OUTPUT.PUT_LINE('�����ȣ : '||SAWON_REC.�����ȣ);
DBMS_OUTPUT.PUT_LINE('����� : '||SAWON_REC.�����);
DBMS_OUTPUT.PUT_LINE('���� : '||SAWON_REC.����);
DBMS_OUTPUT.PUT_LINE('�޿� : '||SAWON_REC.�޿�);
END;
/

--�����,���� �÷�Ÿ�� �������� �ε��� �ο�
DECLARE
TYPE SA_COL_TYPE IS TABLE OF ���.�����%TYPE
INDEX BY BINARY_INTEGER;

TYPE JIK_COL_TYPE IS TABLE OF ���.����%TYPE
INDEX BY BINARY_INTEGER;

--�տ��� ������ �ڿ��� ������Ÿ��, ���� ����
SANAME_COL SA_COL_TYPE;
SAJIK_COL JIK_COL_TYPE;

-- := ���Կ�����, I�� 0����
I BINARY_INTEGER := 0;

BEGIN
FOR K IN (SELECT �����,���� FROM ���) LOOP
I := I+1; -- ORCLE�� �ε���1���� ����
SANAME_COL(I) := K.�����;
SAJIK_COL(I) := K.����;

END LOOP;--FOR�� �ݱ�

DBMS_OUTPUT.PUT_LINE('�����  ����');
DBMS_OUTPUT.PUT_LINE('------------');

--1���� I���� �ݺ�
FOR J IN 1..I LOOP
DBMS_OUTPUT.PUT_LINE(RPAD(SANAME_COL(J),12)||RPAD(SAJIK_COL(J),9));
END LOOP;
END;
/








































