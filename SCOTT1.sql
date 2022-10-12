/* ���� ���� �Լ� - ������ �Լ� */
SELECT ENAME, UPPER(ENAME)�빮��, LOWER(ENAME)�ҹ���, INITCAP(ENAME)ù�ڸ��빮��
FROM EMP;

SELECT *
    FROM EMP
WHERE UPPER(ENAME) = 'JAMES';

SELECT *
    FROM EMP
WHERE UPPER(ENAME) = UPPER('james');

SELECT *
    FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%JAM%');

/* ���ڿ� ���̸� ���ϴ� �Լ� */
SELECT ENAME, LENGTH(ENAME)�̸��Ǳ���
FROM EMP;
-----------------------------------------
SELECT ENAME, LENGTH(ENAME)�̸��Ǳ���
    FROM EMP
WHERE LENGTH(ENAME) >= 5;
-- LENGTH() : ���ڿ��� ���̸� ��ȯ
-- LENGTHB() : ���ڿ��� ����Ʈ���� ��ȯ
-- DUAL : SYS �������� �����ϴ� ���̺�� �Լ��� ������ ���̺� ���� ���� �����غ��� ���� DUMMY���̺�
SELECT LENGTH('������'), LENGTHB('������')
FROM DUAL;

SELECT 20*30 FROM DUAL;

/* MOD : �������� ���ϴ� �Լ� */
SELECT MOD(5,4) FROM DUAL;

/* ABS() : ���밪�� ���ϴ� �Լ� */
SELECT -10, ABS(-10) FROM DUAL;

/* ROUND() : �ݿø��� ����� ��ȯ�ϴ� �Լ� */
-- �ݿø��� ��ġ ���� ����, �������� ������ �Ҽ��� ù° �ڸ����� �ݿø�, ���� ���� ����(��������)
SELECT 12.3456, ROUND(12.6456), ROUND(12.3456, 2), ROUND(16.3456, -1), ROUND(62.3456, -2)
FROM DUAL;

/* TRUNC : ������ �� ����� ��ȯ�ϴ� �Լ� */
-- ������ �ڸ����� ������ �� ����, �������� ������ �Ҽ��� ù°�ڸ�, ���� ���� ����
SELECT 12.3456, TRUNC(12.6456), TRUNC(12.3456, 2), TRUNC(16.3456, -1), TRUNC(62.3456, -2)
FROM DUAL;

/* MOD(���, ���� ��) : ����� �������� ��ȯ�ϴ� �Լ� */
SELECT MOD(21, 5) FROM DUAL;

/* CEIL : �Ҽ��� ���ϰ� ������ ������ �ø� */
SELECT CEIL(12.345) FROM DUAL;

/* FLOOR : �Ҽ��� ���ϸ� ������ ���� */
SELECT FLOOR(12.945) FROM DUAL;

/* POWER(A, B) : A�� B��ŭ �����ϴ� �Լ� */
SELECT POWER(3, 4) FROM DUAL;
SELECT POWER(3, 3.1) FROM DUAL;

/* SUBSTR(���ڿ�������, ������ġ) : ���ڿ��� ������ġ����(�ε��� �ƴ�) ������ ��ȯ
-- SUBSTR(���ڿ�������, ������ġ, ����) : ���ڿ��� ���� ��ġ���� ���̸�ŭ ��ȯ */
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;
-------------------------------------------------------------------------------
-- ������ �ڿ������� ī��Ʈ��
SELECT JOB, 
    SUBSTR(JOB, -LENGTH(JOB)),
    SUBSTR(JOB, -LENGTH(JOB), 2),
    SUBSTR(JOB, -3)
FROM EMP;
-------------------------------------------------------------------------------
/* INSTR() : ���ڿ� ������ �ȿ� Ư�� ���ڳ� ���ڿ��� ��� ���ԵǾ� �ִ��� ��ġ Ȯ�� */
-- INSTR(����ڿ�, ã�����¹���, ��ġ�� ���ָ� ó������, ���° ������ ��������)

SELECT INSTR('HELLO, ORACLE!!!', 'L') AS "INSTR�⺻",
    INSTR('HELLO, ORACLE!!!', 'L', 5) AS "INSTR��ġ����",
    INSTR('HELLO, ORACLE!!!', 'L', 2,3) AS "INSTR��ġ����"
FROM DUAL;  

-------------------------------------------------------------------------------
/* Ư�� ���ڰ� ���Ե� �� ã�� */
SELECT *
    FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

SELECT *
    FROM EMP
WHERE ENAME LIKE '%S%';
-------------------------------------------------------------------------------
/* REPLACE() : Ư�� ���ڿ��� ���Ե� ���� �Ǵ� ���ڿ��� �ٸ� ���ڿ��� ��ü, ��ü�� ���ڸ� �������� ������ �ش� ���ڿ� ���� */
-- REPLACE(���ڿ�, ã�¹��ڿ�, [����]��ü�ҹ��ڿ�)
SELECT '010-5006-4146' AS �����������ڿ�,
    REPLACE('010-5006-4146', '-', '*') AS ���ڿ�����,
    REPLACE('010-5006-4146', '-') AS ���ڿ�����
FROM DUAL;
-------------------------------------------------------------------------------
/* LPAD, RPAD : ���� ���� ĭ���� �����ϰ� ��ĭ ��ŭ�� Ư�� ���ڷ� ä��� �Լ� */
SELECT LPAD('ORACLE', 10, '+') FROM DUAL;
SELECT RPAD('ORACLE', 10, '+') FROM DUAL;
SELECT LPAD('ORACLE', 10) FROM DUAL; -- 3��°�� ���� �������� ������ �������� ä��
SELECT RPAD('ORACLE', 10) FROM DUAL;

SELECT
    RPAD('200222-', 14, '*') AS �ֹε�Ϲ�ȣ,
    RPAD('010-5006-', 13, '*') AS ��ȭ��ȣ
FROM DUAL;
-------------------------------------------------------------------------------
/* �� ���ڿ��� ��ġ�� CONCAT �Լ� */
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP
WHERE ENAME = 'JAMES';
-------------------------------------------------------------------------------
/* TRIM / LTRIM / RTLIM : ���ڿ� ������ Ư�� ���ڿ��� ���� (��/��) */
-- TRIM�� �հ� �� ���ڿ��� ���� �� �����Ƿ� �߰� ���ڿ� ���ﶧ�� REPLACE ����
SELECT '[' || TRIM(' =ORACLE=') || ']' AS TRIM,
    '[' || LTRIM(' =ORACLE= ') || ']',
    '[' || LTRIM('<=ORACLE=>', '<=') || ']' AS LTRIM_2,
    '[' || RTRIM(' =ORACLE= ') || ']' AS RTRLM,
    '[' || RTRIM('<=ORACLE=>', '=>') || ']' AS LTRIM_2
FROM DUAL;
-------------------------------------------------------------------------------
/* ��¥ �����͸� �ٷ�� �Լ� */
-- ��¥������ + ���� : ��¥���� ���ڸ�ŭ ����� ��¥�� ������
-- ��¥������ - ���� : ��¥���� ���ڸ�ŭ ������ ��¥�� ������
-- ��¥������ - ��¥������ : �� ��¥�� �ϼ��� ������
-- ��¥������ + ��¥������ : �ȵ�

/* SYSDATE : ����Ŭ�� ��ġ�� �ü���� ���� �ð��� ������ */
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE AS ����,
    SYSDATE-1 AS ����,
    SYSDATE+1 AS ����
FROM DUAL;
-------------------------------------------------------------------------------
-- ADD_MONTHS(��¥������, ���Ұ�����)
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 4)
FROM DUAL;
-------------------------------------------------------------------------------
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS �Ի�10�ֳ�
FROM EMP;
-------------------------------------------------------------------------------
/* MONTHS_BETWEEN(��¥������, ��¥������) : �� ��¥ ���� ���� �� ���̸� ���ϴ� �Լ� */
-- TRUNC�� �����ؼ� �������� ��
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    TRUNC(MONTHS_BETWEEN(HIREDATE, SYSDATE)) AS MONTH1,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
FROM EMP;
------------------------------------------------------------------------------
/* NEXT_DAY(��¥������, ���Ϲ���) : Ư�� ��¥ �������� ���ƿ��� ������ ��¥�� ����ϴ� �Լ� */
/* LAST_DAY(��¥������) : Ư�� ��¥�� ���� ���� ������ ��¥�� ����� �ִ� �Լ� */
SELECT SYSDATE,
    NEXT_DAY(SYSDATE, '�ݿ���'),
    LAST_DAY(SYSDATE)
FROM DUAL;

SELECT SYSDATE,
    NEXT_DAY('1970/01/01', '�ݿ���'),
    LAST_DAY('1970/01/01')
FROM DUAL;
------------------------------------------------------------------------------
/* ����Ŭ���� ��¥ �����͸� ����� �� ���� ���� */
-- CC, SCC : ����
-- YYYY, YEAR, YY, Y : ������ ǥ���ϴ� ����
-- Q : �б�
-- MONTH, MON, MM, RM : 
-- WW : �ش� ������ ��° ������ Ȯ��
-- W : �ش���� �������� Ȯ��
-- HH12, HH24 : �ð��� ǥ��
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS FORMAT_CC,
    TO_CHAR(SYSDATE, 'YY') AS FORMAT_YY,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS FORMAT_Q,
    TO_CHAR(SYSDATE, 'DD') AS FORMAT_DD,
    TO_CHAR(SYSDATE, 'DDD') AS FORMAT_DDD,
    TO_CHAR(SYSDATE, 'HH') AS FORMAT_HH,
    TO_CHAR(SYSDATE, 'HH12') AS FORMAT_HH12,
    TO_CHAR(SYSDATE, 'HH24') AS FORMAT_HH24,
    TO_CHAR(SYSDATE, 'WW') AS FORMAT_WW,
    TO_CHAR(SYSDATE, 'W') AS FORMAT_W
FROM DUAL;
------------------------------------------------------------------------------
SELECT EMPNO, ENAME, EMPNO + '500' -- '500'�� �������ε� ���� + ���� => ���������� ���
    FROM EMP
WHERE ENAME = 'FORD';

/* SELECT EMPNO, ENAME, EMPNO + 'ABCD' -- 'ABCD'�� ���ڷ� �ٲ� �� ���� Ÿ���̱� ������ ������
    FROM EMP
WHERE ENAME = 'FORD'; */
------------------------------------------------------------------------------
/* ���� ����ȯ */
-- ��¥ �Ǵ� ���ڸ� ���ڷ� ��ȯ�ϱ� :  TO_CHAR �Լ�
-- TO_CHAR(��¥������, '��µǱ⸦ ���ϴ� ���� ����')
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH/MI/SS') AS ���糯¥�ͽð�
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS ����,
    TO_CHAR(SYSDATE, 'YY') AS "2�ڸ� ����",
    TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS "��/��/�� ��:��:��",
    TO_CHAR(SYSDATE, 'Q') AS �б�,
    TO_CHAR(SYSDATE, 'DD') AS ��¥,
    TO_CHAR(SYSDATE, 'DDD') AS �����¥,
    TO_CHAR(SYSDATE, 'PM HH') AS "���� �ð�",
    TO_CHAR(SYSDATE, 'WW') AS "1���� ������"
FROM DUAL;
------------------------------------------------------------------------------
/* Ư�� �� ���缭 ��¥ ����ϱ� */
-- TO_CHAR(��¥ ������, '�������', 'NLS_DATE_LANGUAGE=KOREAN')
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KR,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JP,
    TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_EN,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KR,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JP,
    TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_EN
FROM DUAL;

/* Ư�� �� ���缭 ���� ����ϱ� */
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'DD', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KR,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JP,
    TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_EN,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KR,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JP,
    TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_EN
FROM DUAL;
    
-- ���� ������ ���� ���
-- 9 : ������ ���ڸ��� �ǹ� (���ڸ��� ä���� ����)
-- 0 : ���ڸ��� 0���� ä��
-- $ : �޷� ǥ�ø� ����
-- L : ���� ȭ�� ���� ��ȣ�� �ٿ��� �����(LOCAL)
-- . : �Ҽ����� ǥ��
-- , : õ������ ���� ��ȣ�� ǥ��

SELECT SAL,
    TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,
    TO_CHAR(SAL, '$999,999.00') AS SAL_1,
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL, '000999999.99') AS SAL_3,
    TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

SELECT 
    TO_CHAR(SYSDATE, 'YY/MM/DD')
FROM DUAL;

------------------------------------------------------------------------------
SELECT TO_NUMBER('1300') - TO_NUMBER('1500')
FROM DUAL;

SELECT '1300' - '1500'
FROM DUAL;
------------------------------------------------------------------------------
/* TO_DATE('���ڿ�', '���ڿ�����') : ���ڿ��� ��õ� ��¥�� ��ȯ�ϴ� �Լ� */
SELECT 
    TO_DATE('22/08/25', 'YY/MM/DD')
FROM DUAL;

SELECT 
    TO_DATE('2022-08-25', 'YY/MM/DD')
FROM DUAL;

SELECT 
    TO_DATE('20220825', 'YY/MM/DD')
FROM DUAL;
------------------------------------------------------------------------------
/* NULL ó�� �Լ� */
-- Ư�������� �࿡ ���� �����Ͱ� ���� ��� �������� ���� NULL�� �˴ϴ�. (���� ������ �ǹ�)
-- ����Ŭ���� ���̺��� ������ �� NULL���� ������ ���ϵ��� ������ �� �ֽ��ϴ�. (NOT NULL)
-- 0������ �ٸ� �ǹ�, �׷��� NULL�� ������ �� �� ����
-- NVL(NULL ���θ� üũ�� ������, �ش� �����Ͱ� NULL�� ��� ��ü�� ��)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM, 
    NVL(COMM, 0), 
    SAL+NVL(COMM, 0)
FROM EMP;
/* NVL2 (NULL ���θ� üũ�� ������, NULL�� �ƴ� ���, NULL�� ���) */
SELECT EMPNO, ENAME, SAL, COMM,
    NVL2(COMM, 'O', 'X'),
    NVL2(COMM, SAL*12+COMM,  SAL*12) AS �ѿ���
FROM EMP;
------------------------------------------------------------------------------
/* NULLIF(A, B) : �� ���� �����ϸ� NULL ��ȯ�ϰ� �ƴϸ� ù��° �� ��ȯ */
SELECT NULLIF(10, 10),
    NULLIF('A', 'B')
FROM DUAL;
------------------------------------------------------------------------------
/* DECODE : �־��� ������ ���� ���ǰ��� ��ġ�ϴ� ���� ����ϰ� ������ �⺻�� ��� */
-- DECODE(�˻� ����� �� ���� ������, [����1], [����2], .............)
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
        'MANAGER', SAL*1.1,
        'SALESMAN', SAL*1.05,
        'ANALYST', SAL,
        SAL*1.03) AS "�޿� �λ��"
FROM EMP;

-- CASE(�˻� ����� �� ���� ������, WHEN ���� THEN ����� ����..... ELSE)
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL*1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL*1.03
    END AS "�޿� �λ��"
FROM EMP;

SELECT EMPNO, ENAME, COMM, 
    CASE
        WHEN COMM IS NULL THEN '�ش���� ����'
        WHEN COMM = 0 THEN '�������'
        WHEN COMM > 0 THEN '���� : ' || COMM
    END AS "����ǥ��"
FROM EMP;
------------------------------------------------------------------------------
/* �ǽ� ���� */

-- 1�� ����
-- RPAD('���ڿ�', �ѱ���, �����ʿ�ä�﹮��) : ���� ���� ĭ���� �����ϰ� ��ĭ ��ŭ�� Ư�� ���ڷ� ä��� �Լ�
-- SUBSTR('���ڿ�', ������ġ, ����) : ���ڿ��� ���� ��ġ���� ���̸�ŭ ��ȯ
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
WHERE LENGTH(ENAME) = 5;


-- 2�� ����
SELECT EMPNO, ENAME, SAL,
     TRUNC(SAL / 21.5, 2) AS DAY_PAY, 
     ROUND(SAL / 21.5 / 8, 1) AS TIME_PAY
FROM EMP;


-- 3�� ����
-- ��� ���� Ÿ���� ���ƾ� �ϹǷ� COMM�� ������� 'N/A'�� ���� ���ڿ��� ������
SELECT EMPNO, ENAME, HIREDATE, 
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������'), 'YYYY/MM/DD') AS R_JOB,
    NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- 4�� ����
SELECT EMPNO, ENAME, MGR,
    CASE 
      WHEN MGR IS NULL THEN '0000'
      WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '78' THEN '8888'
      WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '77' THEN '7777'
      WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '76' THEN '6666'
      ELSE TO_CHAR(MGR)
    END AS CHG_MGR
FROM EMP;


    
    
    
