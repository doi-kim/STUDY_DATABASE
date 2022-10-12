SHOW USER;
------------------------------------------------------------------------------
SELECT *
FROM EMPLOYEES;
------------------------------------------------------------------------------
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'E', 1, 1)
FROM employees;
------------------------------------------------------------------------------

/* HR ���� ���� */

-- 1. EMPLOYEES ���̺��� King�� ������ �ҹ��ڷ� �˻��ϰ� �����ȣ, ����, ������(�ҹ��ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LOWER(FIRST_NAME)||' '||LOWER(LAST_NAME), LOWER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
WHERE LOWER(LAST_NAME) = 'king';

-- 2. EMPLOYEES ���̺��� King�� ������ �빮�ڷ� �˻��ϰ� �����ȣ, ����, ������(�빮�ڷ�),�μ���ȣ�� ����϶�.
SELECT EMPLOYEE_ID, LOWER(FIRST_NAME)||' '||LOWER(LAST_NAME), UPPER(JOB_ID), DEPARTMENT_ID
    FROM EMPLOYEES
WHERE UPPER(LAST_NAME) = 'KING';

-- 3. DEPARTMENTS ���̺��� �μ���ȣ�� �μ��̸�, ��ġ��ȣ�� ���Ͽ� ����ϵ��� �϶�.
SELECT * FROM DEPARTMENTS;

SELECT DEPARTMENT_ID || ' ' || DEPARTMENT_NAME || ' ' || LOCATION_ID
FROM DEPARTMENTS;

-- 4. EMPLOYEES ���̺��� �̸��� ù ���ڰ� ��K�� ���� ũ�� ��Y������ ���� ����� ������
-- �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�.
-- �� �̸������� �����Ͽ���.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
WHERE SUBSTR(FIRST_NAME, 1, 1) > 'K' AND SUBSTR(FIRST_NAME, 1, 1) < 'Y'
ORDER BY FIRST_NAME;

-- 5. EMPLOYEES ���̺��� 20�� �μ� �� �̸��� ���� �� �޿��� �ڸ����� 
-- �����ȣ, �̸�, �̸��� �ڸ���(LENGTH), �޿�, �޿��� �ڸ����� ����϶�.
-- LENGTHB�� BYTE ȥ������ ����!
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME), SALARY, LENGTH(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20; 

-- LENGTH('���ڿ�') : �ڸ��� ��ȯ, LENGTHB('���ڿ�') : ����Ʈ �� ��ȯ
SELECT LENGTH('������')
FROM DUAL;

SELECT LENGTHB('������')
FROM DUAL;

SELECT LENGTH('LOSA')
FROM DUAL;

SELECT LENGTHB('LOSA')
FROM DUAL;

-- 6. EMPLOYEES ���̺��� �̸� �� ��e������ ��ġ�� ����϶�.
-- INSTR(���ڿ�, 'ã�����ϴ¹���', ������ġ, ���°��������(�����ϸ� ù��°)) 
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'e', 1) FROM EMPLOYEES;

SELECT FIRST_NAME, INSTR(FIRST_NAME, 'l', 1, 2) FROM EMPLOYEES;

-- 7. EMPLOYEES ���̺��� �μ���ȣ�� 80�� ����� �޿��� 30���� ���� �������� ���Ͽ� ����϶�.
SELECT FIRST_NAME, SALARYMOD(SALARY, 30)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80; 

-- 8. EMPLOYEES ���̺��� ������� �ٹ��� ���� ���� ���� �ΰ��� ����Ͽ���.
-- �� �ٹ� �ϼ��� ���� ��� ������ ����Ͽ���.
SELECT FIRST_NAME �̸�, HIRE_DATE �Ի���, 
    TRUNC((SYSDATE-HIRE_DATE)/7) || '�� ' || 
    TRUNC(MOD((SYSDATE-HIRE_DATE), 7)) || '��'  AS "�ٹ���,��"
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

SELECT FIRST_NAME, HIRE_DATE,
    TRUNC(SYSDATE - HIRE_DATE) AS "�ٹ� �ϼ�",
    TRUNC((SYSDATE - HIRE_DATE) / 7) AS "�ٹ� ����"
    FROM EMPLOYEES
ORDER BY "�ٹ� �ϼ�" DESC;

SELECT FIRST_NAME �̸�, HIRE_DATE �Ի���, 
    FLOOR(TO_DATE(20220831, 'YYYYMMDD') - TO_DATE(HIRE_DATE)) TOTAL,
    FLOOR(FLOOR(TO_DATE(20220831, 'YYYYMMDD') - TO_DATE(HIRE_DATE)) / 7) WEEKS,
    MOD(FLOOR(TO_DATE(20220831, 'YYYYMMDD') - TO_DATE(HIRE_DATE)), 7) DAYS
FROM EMPLOYEES
ORDER BY HIRE_DATE; 

-- 9. EMPLOYEES ���̺��� �μ� 50���� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����϶�
-- 0 : ���� ���ڸ��� �ǹ�, �� �ڸ��� 0���� ä��
-- 9 : ���� ���ڸ��� �ǹ�, �� �ڸ��� ä���� ����
SELECT FIRST_NAME, SALARY, TO_CHAR(SALARY, '$999,999,999')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50; 
 
-- 10. EMPLOYEES ���̺��� �μ����� �ο���, ��� �޿�, �����޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID, COUNT(*), ROUND(AVG(SALARY), 1), MIN(SALARY), MAX(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 11. EMPLOYEES ���̺��� 30�� �μ� �� �̸��� ��� ������ �����Ͽ� ���
SELECT FIRST_NAME || ' ' || JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30;

-- 12. EMPLOYEES ���̺��� ������ �޿��� ����� 10000 �̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���Ͽ� ���
SELECT JOB_ID, AVG(SALARY), SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
    HAVING AVG(SALARY) >= 10000;
    
-- 13. EMPLOYEES ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���Ͽ� ���
SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
    HAVING COUNT(*) > 4
ORDER BY DEPARTMENT_ID;

                