/* 6�� SQL���� ���� ��� */

-- 1. ����� ������ ����� ���� ������ �������� ����
-- CREATE USER TEST IDENTIFIED BY TEST1234;
-- USER TEST CREATE SESSION .......: LOGON DENIED
-- ���� �ο� �ʿ� : GRANT CREATE SESSION TO TEST;

-- 2. 
CREATE TABLE DEPARTMENT(
    DEPTCODE NUMBER PRIMARY KEY,
    DEPTNAME VARCHAR2(10) NOT NULL
);

CREATE TABLE EMPLOYEE(
    EMPNO NUMBER PRIMARY KEY,
    EMPNAME VARCHAR2(10) NOT NULL,
    DEPTNO NUMBER REFERENCES DEPARTMENT(DEPTCODE)
);

/* � ������ ����ϴ� ���� ������� USING Ű���忡 ���� �������� ����� ���� ����ؾ� �� */
SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
    FROM EMPLOYEE
JOIN DEPARTMENT USING(DEPTNO); -- �� ������ ������??�� ����

-- ������ �ɾ�� ��
-- �̰� ����!!!!!!!!!!!!!!!!!!
SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
    FROM EMPLOYEE JOIN DEPARTMENT
    ON DEPTNO = DEPTCODE;
    
SELECT EMPNO, EMPNAME, DEPTNO, DEPTNAME
    FROM EMPLOYEE, DEPARTMENT
    WHERE DEPTNO = DEPTCODE;
    
--------------------------------------------------------------------
/* ������ ���� */

-- 1. NUMBER(3, 2) : �ִ� 3�ڸ����� �Ҽ��� ���� 2�ڸ� ���

-- 2. DML���� UPDATE ���� ���� ���� : �����ͺ��̽��� ��ϵ� �����͸� �����ϱ� ���� ����ϴ� ���

-- 3. DML INSERT : �����ͺ��̽��� ��ϵ� �����͸� �߰��ϱ� ���� ����ϴ� ���

-- 4. �ڷ��� CHAR(100) : ������ ���ڿ��� 100�ڸ� �Է¹޴´ٴ� �ǹ�

-- 5. OUTER JOIN�� ���� ���� : �ƿ��� ������ ����ϴ� ������ ���� ���̺��� �����Ͱ� ��� ��ȸ(���� ����)�ǰ�, ��� ���̺� �����Ͱ� ���� ��� �ش� �÷��� ���� �������� ���ؼ��̴�.

-- 6. NVL �Լ��� ���� �����ϰ� BONUS �÷��� NULL���� ���� �� NULL�� 0���� ���
    SELECT NVL(BONUS, 0) FROM EMP;
    
-- 7. DML �� SELECT ���� ���� ���� : �����ͺ��̽��� ��ϵ� �����͸� ��ȸ�ϱ� ���� ����ϴ� ���

-- 8. DML �� DELETE ���� ���� ���� : �����ͺ��̽��� ��ϵ� �����͸� �����ϱ� ���� ����ϴ� ���

-- 9. DML �� CREATE ���� ���� ���� : �����ͺ��̽� ���̺�(��ü)�� �����ϴ� ��ɾ�

-- 10. NVARCHAR�� ���� ���� : �����ڵ� �������� �����ϱ� ���� �ڷ����̸� ��� ���ڸ� 2BYTE�� ó����

-- 11. ���ڿ� ������ '210505'�� '2021��5��5��'�� ǥ���� �� �ֵ��� SELECT ���� �ۼ�
SELECT TO_CHAR(TO_DATE('210505'),'YYYY"��"MM"��"DD"��"') FROM DUAL;
SELECT TO_CHAR(TO_DATE('210505','YY/MM/DD'), 'YYYY"��"MM"��"DD"��"') FROM DUAL;

-- 12. FORIGEN KEY ���� ���ǿ� ���� ���� : 
-- �����ϰ� �ִ� ���̺��� �÷� ���� �����ϴ� ���� ����ϴ� ���� ����
-- �����ϰ� �ִ� �⺻ Ű�� ������ Ÿ���� ��ġ�ؾ� �ϰ�, �ܷ� Ű�� �����ǰ� �ִ� �⺻Ű�� ������ �� ����

-- 13. ����Ŭ���� �����ϴ� ������ ������ ���� ���� : 
-- �����ͺ��̽��� �����͸� ������ ��� ������ ������ ����
-- ����ڿ��Դ� �б� �������� ������ ����, DDL ����� ����� ������ ������ ������ ��ȸ�Ѵ�. ������� ���� ���� ���� ������ �ݿ�

-- 14. NOT NULL ���� ���� : �����Ϳ� NULL�� ������� �ʴ� ���� ����

-- 15. CHAR�� VARCHAR2 �ڷ����� ������ ��� : CHAR�� �������� �������̸� �ִ� 2000����Ʈ���� ��� ����, VARCHAR2�� ���� ���� �������̸� �ִ� 4000����Ʈ���� ��� ����

-- 16. INNER JOIN : ������ �Ǵ� Ű���� �������� ������ ������� ����ϴ� ���� ������� �� ���̺��� NULL ���� �������� ����

-- 17. PRIMARY ���� ���� ���� : NULL ���� ���� �� ����, �ߺ��� ������� ����

-- 18. EMP ���̺��� ����̸�, �Ի���, �ٹ������� ��ȸ
SELECT ENAME "�̸�", HIREDATE "�Ի���", TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "�ٹ�������"
FROM EMP;

-- 19. �̹� ������ EMP ���̺��� EMP_NAME �÷��� UNIQUE ���� ���� �߰�
ALTER TABLE EMP ADD UNIQUE(EMP_NAME);

-- 20. �̹� ������ EMP ���̺� ENAME �÷��� NOT NULL ���� ���� �߰�
ALTER TABLE EMP_DDL MODIFY ENAME NOT NULL;

-- 21. ����Ŭ �������� �ۼ��� JOIN�� ANSI ǥ�� �������� �����ϱ�
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME, D.LOC, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 22. SQL���� �� �뵵 ���� :
-- SELECT :
-- DML :
-- DDL :
-- TCL : Ʈ����� ����, COMMIT, ROLLBACK

-- 23. RANK() OVER, DENSE_RANK() OVER �Լ��� ���� ����
-- RANK() OVER : ������ ���� ���� ������ ���� ��ŭ �ǳʶٰ� ���� ���
-- DENSE_RANK() OVER : ������ ���� ������ ����� ������ ������ ���

-- 24. 





