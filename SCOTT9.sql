/* 5�� �����ͺ��̽� ���� ��� */

-- 1. ����� ���� ����� ����� SYSTEM�̳� SYS �������� ������ ���� �� ����
-- CREATE USER TEST IDENTIFIED BY 1234; : ������ ����� ���
-- GRANT RESOURCE : ���̺� ���� ����
-- GRANT CONNECT : ����ڿ� ���� DB ���� ����

-- 2. �μ��ڵ�(10 �Ǵ� 20)�� ���� ������ ��ġ�ϰ�, �޿��� 3000�̻��̰�, ���ʽ� �ְ�, ��å �̸��� _ �տ� �����ڰ� �ִ� ����� ENAME, EMPNO, DEPTNO, SAL ��ȸ
SELECT ENAME, EMPNO, DEPTNO, SAL
    FROM EMP
    WHERE (DEPTNO = 10 OR DEPTNO = 20) -- OR ������ ��ȣ�� ����
    AND SAL >= 3000 -- �޿��� 3000 �̻��� �Ǵ� ����
    AND COMM IS NOT NULL -- ���ʽ��� �ִ� ����� ���� ����
    AND JOB LIKE '___\_%' ESCAPE '\'; -- ���ϵ�ī�� ���� ó��
    
-- 3. NULL�� ���� ��
SELECT * FROM EMP -- NULL�� ���� �񱳴� �񱳿����� ��� �Ұ��ϰ� IS NULL / IS NOT NULL�� ���� ó��
    WHERE COMM IS NULL
    AND MGR IS NOT NULL;
    
--------------------------------------------------------------
-- ������ ���� �ذ� �ó�����

-- 1. NUMBER(3, 2) :  �� ���̰� 3�̰� �� �� �Ҽ��� ���� ǥ�ð� 2�ڸ��� �ǹ�

-- 2. DDL(DATA DEFINITION LANGUAGE) : ���̺��� ����(CREATE), ����(ALTER), ����(DROP)�ϴ� ���� �����ϴ� ���

-- 3. DML(DATA MANIPULATION LANGUAGE) : �����͸� ����(INSERT), ����(UPDATE), ����(DELETE)�ϴ� ���� �����͸� �����ϴ� ���

-- 4. DML �߿� INSERT : �����ͺ��̽��� �����͸� �߰��ϱ� ���� ����ϴ� ���

-- 5. CHAR(100) : ���� ���ڿ� �ڷ����� �ǹ��ϸ�, 100BYTE�� ������ ���ڿ��� �Ҵ�

-- 6. SELECT���� OUTER JOIN �̶� : �����ϴ� ���̺��� ���ʿ��� �����Ͱ� �ְ�, �ٸ� ���ʿ��� �����Ͱ� ���� ��� ��� ����ϴ� ���

-- 7. NVL �Լ� : �÷��� NULL�� ���ԵǾ� ���� �� �ι�° �Ű������� ������ ��ȯ�Ͽ� ����ϴ� �Լ�, NVL(COMM, 0)

-- 8. SELECT ���� ���� ���� : �����ͺ��̽��� �����͸� ��ȸ�ϱ� ���� ���

-- 9. DML �� DELETE �� ���� ���� : �����ͺ��̽��� �����͸� �����ϱ� ���� ���

-- 10. DDL �� CREATE : �����ͺ��̽��� ���̺�(��ü)�� �����ϴ� ���

-- 11. ������ Ÿ�� �� NVARCHAR : �����ڵ� ���ڸ� �����ϱ� ���� �ڷ����̸�, �ѱ��� 2BYTE ũ��� �Ҵ��

-- 12. ���ڿ� �����͸� '210505' -> '2021��5��5��'
SELECT TO_CHAR(TO_DATE('210505','YY/MM/DD'), 'YYYY"��"MM"��"DD"��"') FROM DUAL;

-- 13. FOREIGN KEY ���� ���� : ���� �ٸ� ���̺��� ���Ը� �����ϴµ� ����ϴ� ���� ����
     -- �����ϰ� �ִ� �⺻ Ű�� ������ Ÿ�԰� ��ġ�ؾ� �ϸ�, �ܷ�Ű�� �����ǰ� �ִ� �⺻Ű�� ������ �� ����

-- 14. NOT NULL ���� ����: �����Ϳ� NULL�� ������� �ʴ� ���� ����

-- 15. ����Ŭ���� �����ϴ� ������ ������ ���� ����
     -- �����ͺ��̽��� �����͸� ������ ��� ������ ����Ǿ� ����. ������ �����ϱ� ���� ������ �ý����� ������ �ְ�, ����ڴ� �б� ���� ���̺�

-- 16. CHAR�� VARCHAR2�� ������ ���� : CHAR�� �������� �������̸� �ִ� 2000����Ʈ���� ��� ����
     -- VARCHAR�� ���� ���� �������̸� �ִ� 4000����Ʈ���� ��� ����

-- 17. INNER JOIN : ������ �Ǵ� Ű���� �������� ������ ������� ����ϴ� ���� ������� NULL ���� �������� ����

-- 18. PRIMARY ���� ���� : NULL�� ������� ����, �ߺ��� ������� ����

-- 19. �ٹ� �������� ��ȸ�ϴ� SELECT�� �ۼ�
SELECT ENAME, HIREDATE "�Ի���", TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "�ٹ�������"
FROM EMP;

-- 20. �̹� ������ EMP���̺��� ENAME �÷��� UNIQUE ���� ���� �߰��ϴ� ���� �ۼ�
-- ���� ���� �߰�
ALTER TABLE EMP ADD UNIQUE(ENAME);
-- ���� ���� ����
ALTER TABLE EMP DROP UNIQUE(ENAME);
-- ���� ���� ����
ALTER TABLE EMP MODIFY ENAME UNIQUE;
ALTER TABLE EMP ADD CONSTRAINT EMP_UQ_TEST UNIQUE(ENAME);

-- 21. �̹� ������ EMP ���̺� �ȿ� �ִ� MGR�� NULL ���� ���� �߰�
ALTER TABLE EMP MODIFY MGR CONSTRAINT EMP_MGR_NN NOT NULL;

-- 22. ����Ŭ ������ ANSI ǥ�� �������� �����ϱ�
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;
    
-- JOIN ~ ON
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;
    
-- JOIN ~ USING
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING (DEPTNO);
    
-- 23. SQL�� �� �뵵�� �����Ͻÿ�.
  -- SELECT :
  -- DML :
  -- DDL :
  -- TCL(TRANSCTION CONTROL LANGUAGE) :  Ʈ����� ����, COMMIT, ROLLBACK

-- 24. RANK() OVER �Լ� : ������ ���� ������ ����� ������ �ο��� ��ŭ �ǳʶٰ� ���� ���

-- 25. RANK() OVER �Լ��� DENSE_RANK() OVER �Լ�
  -- DENSE_RANK() OVER : ������ ���� ������ ����� ������ ������ ���
