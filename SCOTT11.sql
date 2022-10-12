SET SERVEROUTPUT ON; -- ���� ����� ȭ�鿡 ���

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO, PL/SQL!!!!!');
END;

/* ���� ���� */
DECLARE
    V_EMPNO NUMBER(4) := 8000; -- ���� �̸� ��������(ũ��) := (����� ������ ���� ����)
    V_ENAME VARCHAR2(10); -- ���� ���Ŀ� ���� �������� ����
BEGIN 
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_ENAME);
END;

/* ��� ���� �� ����ϱ� */
DECLARE
    V_TAX CONSTANT NUMBER(1) := 5;
BEGIN
    -- NUMBER := 6; 
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;

DECLARE
    V_TAX NUMBER(1) := 5;
BEGIN
    V_TAX := 6;
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;

/* ������ ����Ʈ �� �����ϱ� */
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

/* ������ NULL �� ���� ���� */
DECLARE
    V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
    V_DEPTNO := 20;
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

/* ������ ����ϱ� */
-- �������� ����Ŭ �����ͺ��̽��� �����ϴ� Ư�� ���̺� ���� �ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ����� �ǹ�
-- ���� ������ ���� %TYPE, ���� ������ ���� %ROWTYPE�� ����մϴ�.
DECLARE 
    V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

-- V_DEPT_ROW : �����͸� ������ ���� �̸�(������ Ÿ���� ��) - �ϳ��� �� ������ �����ϴ� �ڷ���
-- DEPT : Ư�� ���̺��� ����
-- %ROWTYPE : ���� ���� ���� �� ����
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
        FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;

/* ���� ��� */
-- IF-THEN : Ư�� ������ �����ϴ� ��� �۾� ����
-- IF-THEN-ELSE : Ư�� ������ �����ϴ� ���� �������� �ʴ� ��� ����
-- IF-THEN-ELSIF : ���� ���� ó��
DECLARE
    V_NUMBER NUMBER := 14;
BEGIN 
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ�� �Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER�� ¦�� �Դϴ�.');
    END IF;
END;

DECLARE
    IF V_SCORE >= 90 THEN
        DBSE_OUTPUT.PUT_LINE('B����');
    ELSIF V_SCORE >= 80 THEN
        DBSE_OUTPUT.PUT_LINE('C����');
    ELSIF V_SCORE >= 70 THEN
        DBSE_OUTPUT.PUT_LINE('D����');
    ELSIF V_SCORE >= 60 THEN
        DBSE_OUTPUT.PUT_LINE('F����');
    END IF;
END;

/* CASE ���ǹ� */
DECLARE
    V_SCORE NUMBER := 78;
BEGIN
    CASE TRUNC(V_SCORE / 10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;

DECLARE
    V_SCORE NUMBER := 78;
BEGIN
    CASE
        WHEN V_SCORE >= 90 THEN DBMS_OUTPUT.PUT_LINE('A����');
        WHEN V_SCORE >= 80 THEN DBMS_OUTPUT.PUT_LINE('B����');
        WHEN V_SCORE >= 70 THEN DBMS_OUTPUT.PUT_LINE('C����');
        WHEN V_SCORE >= 60 THEN DBMS_OUTPUT.PUT_LINE('D����');
        ELSE DBMS_OUTPUT.PUT_LINE('F����');
    END CASE;
END;
    
/* �ݺ��� */
-- LOOP : �⺻ �ݺ���
-- WHILE LOOP : Ư�� ���ǽ��� ����� ���� �ݺ� ����
-- FOR LOOP : �ݺ� Ƚ���� ���Ͽ� �ݺ�
-- EXIT : �������� �ݺ��� ����
-- EXIT-WHEN : �ݺ� ���Ḧ ���� ���ǽ��� �����ϰ� �����ϸ� �ݺ� ����
-- CONTINUE : ���� ���� �ݺ��� ���� �ֱ⸦ �ǳʶ�
-- CONTINUE-WHEN : Ư�� ������ �����ϰ� ���ǽ��� �����ϸ� ���� �ݺ� �ֱ⸦ �ǳʶ�
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 5;
    END LOOP;
END;

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
        IF V_NUM > 5 THEN EXIT;
        END IF;
    END LOOP;
END;

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHITE V_NUM < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;

/* FOR LOOP */
-- FOR LOOP : �ݺ��� Ƚ���� ������ �� �ִ� �ݺ���
-- REVERSE : �ݴ�� ��ȸ��
BEGIN
    FOR I IN 0..5 LOOP
        DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;

/* CONTINUE */
-- ����Ŭ 11G ���� �űԷ� �߰���
BEGIN
    FOR I IN 0..5 LOOP
        CONTINUE WHEN MOD(I, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� I�� �� : ' || I);
    END LOOP;
END;
    
    
    
    
    
    
    
    
    
    
    













