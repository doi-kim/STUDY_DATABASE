/* 8�� 31�� ������ ���� */

/* �ӽ� ���̺� ����(DDL) */
CREATE TABLE DEPT_TEMP -- ���̺� ����
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP; -- DEPT_TEMP ���̺� ��ȸ
DESC DEPT_TEMP; -- ���̺� ������ Ȯ���ϴ� ���
DROP TABLE DEPT_TEMP; -- ���̺� ����(���������� DROP �ϸ� ū�ϳ���!!��_��)

CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

/* ���̺� �����͸� �߰��ϴ� INSERT */
-- INSERT INTO ���̺��̸�(���̺�, ....) VALUES (���� �ش��ϴ� ������...)

-- ���Ե� ���� ���� ���� �ʰ� ���� �� ������ �� �ְ�, ���� �Է��ϴ� ������ ���� �� ����
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(50, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_TEMP (DEPTNO, LOC) VALUES(60, 'INCHEON');

-- ������ ���̺��� ������� �Է��ؾ� ��. ���� ������ �� ����
INSERT INTO DEPT_TEMP VALUES(70, 'NETWORK', 'BUSAN');
INSERT INTO DEPT_TEMP VALUES(80, 'WEB', NULL); -- ��������� NULL�̳� �����̶� �־���� ��
INSERT INTO DEPT_TEMP VALUES(90, 'MOBILE', ''); -- ���鵵 NULL�� �����

-------------------------------------------------------------------------------
CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP
WHERE 1 != 1; -- ���̺��� �����ϴµ� �����ʹ� �������� �ʰ� ���� �� ����ϴ� ���(WHERE 1 ^= 1; �̳� WHERE 1 <> 1; �� ����ص� ��)
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9001, '������', 'PRESIDENT', NULL, '2001/01/31', 9999, 1000, 10);
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9002, '������', 'MANAGER', 9001, '2002-08-31', 6000, 800, 20);
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9003, '�̹�', 'MANAGER', 9001, TO_DATE('2010/07/01', 'YYYY/MM/DD'), 5000, 700, 20);
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9004, '�̿���', 'MANAGER', 9001, '2020/07/01', 4500, 900, 20);
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(9005, '������', 'MANAGER', 9001, SYSDATE, 4400, 1500, 20);
    
/* ���������� �̿��� INSERT */
-- VALUES ���� ������� ����
-- �����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ� ��
-- �����Ͱ� �߰��Ǵ� ���̺��� �ڷ����� ���������� �ڷ����� ��ġ�ؾ� ��
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 1;
    
/* ���̺� �ִ� ������ �����ϱ� (UPDATE) */
-- ȸ�� ���� ����, ���� ���� ����, ���� �� �� ���� �� ���� ������ �߻��ϴ� ��쿡 �ش�
-- ���̺� ����� �������� ������ �����ϰ��� �ϴ� ��� ���
-- UPDATE ���������̺� SET �����ҿ� 
UPDATE DEPT_TEMP
    SET LOC = 'SEOUL';
SELECT * FROM DEPT_TEMP;
ROLLBACK; -- TCL ��ɾ��̸� �۾��� ���� ���·� �ǵ����� ��

UPDATE DEPT_TEMP
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
UPDATE DEPT_TEMP
    SET DNAME = 'FRONTEND',
        LOC = 'SUWON'
    WHERE DEPTNO = 90;

UPDATE DEPT_TEMP
    SET LOC = 'JEJU'
    WHERE LOC IS NULL;
    
COMMIT; -- �Ϸ��� ������ �� ���� ������ Ŀ���ؾ� ��
    
-------------------------------------------------------------------------------
SELECT * FROM EMP_TEMP;
SELECT * FROM DEPT_TEMP;

-- ������� �޿��� 5000 ������ ����鿡�� �߰� ����(COMM) 2000���� �����ϴ� ���� �ۼ�
UPDATE EMP_TEMP
    SET COMM = 2000
    WHERE SAL <= 5000;
    
-- ���������� ����Ͽ� ������ �����ϱ�
UPDATE DEPT_TEMP
    SET(DNAME, LOC) = (SELECT DNAME, LOC
                            FROM DEPT
                            WHERE DEPTNO = 40)
    WHERE DEPTNO = 10;

-- ���̺� �ִ� ������ �����ϱ�
DELETE FROM EMP_TEMP
    WHERE JOB = 'PRESIDENT';
    
DELETE FROM EMP_TEMP
    WHERE EMPNO IN (SELECT E.EMPNO
                            FROM EMP_TEMP E, SALGRADE S
                            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                            AND S.GRADE = 1 AND DEPTNO = 30);

DELETE FROM EMP_TEMP
    WHERE SAL < 1000;

DELETE FROM EMP_TEMP; -- ���̺� ��ü �� �����

-------------------------------------------------------------------------------
ROLLBACK;

/* ���� Ǯ�� ���� ���̺� ���� */
CREATE TABLE EX_EMP AS SELECT * FROM EMP;
CREATE TABLE EX_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EX_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM EX_EMP;
SELECT * FROM EX_DEPT;
SELECT * FROM EX_SALGRADE;
DESC EX_EMP;

-- 1. EX_DEPT�� 50, 60, 70, 80 �μ��� ���(INSERT)�ϼ���. (�μ� �̸��� ������ �������...)
INSERT INTO EX_DEPT VALUES(50, 'DATABASE', 'SEOUL');
INSERT INTO EX_DEPT VALUES(60, 'MOBILE', 'BUSAN');
INSERT INTO EX_DEPT VALUES(70, 'FRONTEND', 'SOKCHO');
INSERT INTO EX_DEPT VALUES(80, 'BACKEND', 'INCHEON');

-- 2. EX_EMP�� 8���� ��� ������ ��� �ϼ���. (������ �������..), DEPTNO�� 50, 60, 70, 80 �߿��� ����
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8000, '������', 'DANCER', 7566, '20/08/24', 2900, 500, 50);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8001, '�̼���', 'DESIGNER', 7566, '20/12/30', 3100, NULL, 60);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8002, '�赵��', 'SINGER', 7369, '20/08/24', 3000, 550, 70);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8003, '����ȣ', 'PROGAMER', NULL, '21/02/01', 2800, 600, 80);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8004, '�����', 'ARTIST', 7566, '21/08/14', 2900, 500, 50);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8005, '������', 'TEACHER', 7369, '22/05/16', 3000, 500, 70);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8006, '��·�', 'DANCER', 7369, '21/12/31', 5100, 450, 60);
INSERT INTO EX_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES(8007, '�輺Ź', 'WORKER', NULL, '22/09/23', 35000, 200, 80); 

-- 3. EX_EMP�� ���� ��� �� 50�� �μ��� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �̵�
UPDATE EX_EMP
    SET DEPTNO = 70
    WHERE SAL > (SELECT AVG(SAL) 
                    FROM EX_EMP 
                    WHERE DEPTNO = 50); 

-- 4. EX_EMP�� ���� ��� �� 60�� �μ��� ��� �߿� �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �̵�
UPDATE EX_EMP
    SET SAL = SAL*1.1, 
        DEPTNO = 80
    WHERE HIREDATE > (SELECT MIN(HIREDATE) 
                        FROM EX_EMP 
                        WHERE DEPTNO = 60);

-- 5. EX_EMP�� ���� ��� �� �޿� ����� 5�� ����� ����
DELETE FROM EX_EMP
    WHERE EMPNO IN (SELECT E.EMPNO 
                    FROM EX_EMP E, EX_SALGRADE S 
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 5);
                    
ROLLBACK;
-------------------------------------------------------------------------------
/* TCL */
CREATE TABLE DEPT_TCL
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL 
    SET LOC = 'BUSAN'
    WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL
    WHERE DNAME='RESEARCH';
    
ROLLBACK;
-------------------------------------------------------------------------------
/* �������� */

SELECT * FROM DEPT;