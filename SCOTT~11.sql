/* 8�� 31�� �������� �����ϱ� */

-- DEPT ���̺��� �����ؼ� DEPT_TEMP ���̺� �����
CREATE TABLE DEPT_TEMP
AS SELECT * FROM DEPT;

-- DEPT_TEMP ���̺� ��ȸ
SELECT * FROM DEPT_TEMP;

-- DEPT_TEMP ���̺� �����ϱ�
DROP TABLE DEPT_TEMP;

--------------------------------------------------------

-- <DEPT_TEMP ���̺� ������ �߰��ϱ�>
INSERT INTO DEPT_TEMP(DEPTNO, ENAME, LOC)
            VALUES(50, 'DATABASE', 'SEOUL');
-- ���Ե� ���� ���� ���� �ʰ� ���� �� ������ �� �ְ�, ���� �Է��ϴ� ������ ���� �� ����
INSERT INTO DEPT_TEMP (DEPTNO, LOC) VALUES(70, 'INCHEON');

-- <INSERT������ ������ �Է��ϱ�(�� ������ ������ ��)>
INSERT INTO DEPT_TEMP VALUES(60, 'NETWORK', 'BUSAN');
-- ������ ���̺��� ������� �Է��ؾ� ��. ���� ������ �� ����
INSERT INTO DEPT_TEMP VALUES(80, 'WEB', NULL); -- ��������� NULL�̳� �����̶� �־���� ��
INSERT INTO DEPT_TEMP VALUES(90, 'MOBILE', ''); -- ���鵵 NULL�� �����

--------------------------------------------------------

-- <���̺� ��¥ ������ �Է��ϱ�>
-- EMP ���̺��� �����ؼ� EMP_TEMP ���̺� �����
CREATE TABLE EMP_TEMP
    AS SELECT * 
        FROM EMP 
        WHERE 1 != 1; -- ���̺��� �����ϸ鼭 �����ʹ� �����ϰ� ���� ���� �� ���(WHERE 1 ^= 1; �̳� WHERE 1 <> 1; �� ����ص� ��)
-- INSERT�� �Է��ϱ�
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(1011, '������', 'LEADER', NULL, '1991/03/08', 3500, 200, 10); -- ��¥ ������ YYYY/MM/DD ����
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(1012, '�ϼ���', 'SINGER', 1011, '1994-03-22', 3200, 250, 20);-- ��¥ ������ YYYY-MM-DD ����
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(1013, 'Ȳ����', 'SINGER', 1011, TO_DATE('1995/08/09', 'YYYY/MM/DD'), 4000, 250, 20); -- TO_DATE �Լ� ����Ͽ� ��¥ ������ �Է�
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(1014, '�˼���', 'ACTOR', 1011, SYSDATE, 3000, 300, 30); -- SYSDATE ����Ͽ� ��¥ ������ �Է�
-- EMP_TEMP ���̺� ��ȸ
SELECT * FROM EMP_TEMP;

--------------------------------------------------------

-- <���� ������ �̿��� INSERT>
-- VALUES���� ������� ����
-- �����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ� ��
-- �����Ͱ� �߰��Ǵ� ���̺��� �ڷ����� ���������� �ڷ����� ��ġ�ؾ� ��
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
            AND S.GRADE = 1;
            
--------------------------------------------------------

-- <���̺� �ִ� ������ �����ϱ�(UPDATE)>

-- DEPT ���̺��� �����ؼ� DEPT_TEMP2 ���̺� �����
CREATE TABLE DEPT_TEMP2
AS SELECT * FROM DEPT;

-- DEPT_TEMP2 ���̺� ��ȸ
SELECT * FROM DEPT_TEMP2;

-- UPDATE���� �⺻ ����
UPDATE ���������̺�
    SET �����ҿ� = �������Է�;
    
-- ������ ��ü �����ϱ�
UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL';
    
-- ������ ����� �ǵ����� ���� ��
ROLLBACK;

-- ������ �Ϻκи� �����ϱ�
UPDATE DEPT_TEMP2
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
-- ���� Ǯ���
-- EMP_TEMP ���̺��� ����� �߿��� �޿��� 2500 ������ ����� �߰� ������ 50���� �����ϴ� �ڵ� �ۼ�
UPDATE EMP_TEMP
    SET COMM = 50
    WHERE SAL <= 2500;

-- <���������� ����Ͽ� ������ �����ϱ�>
-- DEPT_TEMP2 ���̺��� �μ��̸��� ������ �����ϴµ�, 
-- DEPT ���̺��� �μ���ȣ�� 40�� ������� �μ��̸��� ������ �����ͼ� 
-- DEPT_TEMP2 ���̺��� �μ���ȣ�� 40�� ������� �����͸� ����
UPDATE DEPT_TEMP2
    SET (DNAME, LOC) = (SELECT DNAME, LOC 
                        FROM DEPT 
                        WHERE DEPTNO = 40)
    WHERE DEPTNO = 40;

--------------------------------------------------------

-- <���̺� �ִ� ������ �����ϱ�(DELETE)>

-- EMP ���̺��� �����ؼ� EMP_TEMP2 ���̺� �����
CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

-- EMP_TEMP2 ���̺� ��ȸ
SELECT * FROM EMP_TEMP2;

-- DELETE���� �⺻ ����
DELETE FROM ���̺��̸�
    WHERE ������ �����͸� �����ϱ� ���� ���ǽ�; -- ������ ��� ��� ������ ����
    
-- ������ �Ϻκи� �����ϱ�
DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';
    
-- <���������� ����Ͽ� ������ �����ϱ�>
-- WHERE���� ���������� ����Ͽ� ������ �Ϻθ� �����ϱ�
-- SALGRADE ���̺��� ������ ���������� ��� ���� Ȱ���Ͽ�,
-- EMP_TEMP2 ���̺��� �޿� ����� 3���(�޿��� 1401~2000)�� 30�� �μ��� ����鸸 ����
DELETE EMP_TEMP2
    WHERE EMPNO IN(SELECT E.EMPNO 
                     FROM EMP_TEMP2 E, SALGRADE S
                     WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                     AND S.GRADE = 3
                     AND DEPTNO = 30);

-- ������ ��ü ����
DELETE FROM EMP_TEMP2;

-- ���� Ǯ���
-- EMP_TEMP ���̺��� �޿��� 3000 ������ ����� �����ϴ� �ڵ� �ۼ�
DELETE EMP_TEMP
    WHERE SAL < = 3000;

--------------------------------------------------------

/* �������� */

-- <���� SQL���� �����Ͽ� �� ���� �� ���徿 �����ϰ� ���� Ǯ���>
CREATE TABLE EX_EMP AS SELECT * FROM EMP;
CREATE TABLE EX_DEPT AS SELECT * FROM DEPT;
CREATE TABLE EX_SALGRADE AS SELECT * FROM SALGRADE;

-- 1. EX_DEPT ���̺� 50, 60, 70, 80�� ����ϴ� SQL���� �ۼ�
SELECT * FROM EX_DEPT;

INSERT INTO EX_DEPT(DEPTNO, DNAME, LOC) VALUES(50, 'DRAMA', 'SUWON');
INSERT INTO EX_DEPT(DEPTNO, DNAME, LOC) VALUES(60, 'RAP', 'YONGIN');
INSERT INTO EX_DEPT(DEPTNO, DNAME, LOC) VALUES(70, 'VOCAL', 'SOKCHO');
INSERT INTO EX_DEPT(DEPTNO, DNAME, LOC) VALUES(80, 'WRITER', 'INCHEON');

-- 2. EX_EMP ���̺� ���� 8���� ��� ������ ����ϴ� SQL���� �ۼ�
SELECT * FROM EX_EMP;

INSERT INTO EX_EMP
    VALUES(8000, '������', 'DANCER', 7566, '20/08/24', 2900, 500, 50);
INSERT INTO EX_EMP
    VALUES(8001, '�̼���', 'DESIGNER', 7566, '20/12/30', 3100, NULL, 60);
INSERT INTO EX_EMP
    VALUES(8002, '�赵��', 'SINGER', 7369, '20/08/24', 3000, 550, 70);
INSERT INTO EX_EMP
    VALUES(8003, '����ȣ', 'PROGAMER', NULL, '21/02/01', 2800, 600, 80);
INSERT INTO EX_EMP
    VALUES(8004, '�����', 'ARTIST', 7566, '21/08/14', 2900, 500, 50);
INSERT INTO EX_EMP
    VALUES(8005, '������', 'TEACHER', 7369, '22/05/16', 3000, 500, 70);
INSERT INTO EX_EMP
    VALUES(8006, '��·�', 'DANCER', 7369, '21/12/31', 5100, 450, 60);
INSERT INTO EX_EMP
    VALUES(8007, '�輺Ź', 'WORKER', NULL, '22/09/23', 35000, 200, 80); 

-- 3. EX_EMP�� ���� ��� �� 50�� �μ��� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� 70�� �μ��� �̵�
UPDATE EX_EMP
    SET DEPTNO = 70
    WHERE SAL > (SELECT AVG(SAL)
                    FROM EX_EMP
                    WHERE DEPTNO = 50);

-- 4. EX_EMP�� ���� ��� �� 60�� �μ��� ��� �߿� �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ� 80�� �μ��� �̵�
UPDATE EX_EMP
    SET SAL = SAL*1.0
        DEPTNO = 80
    WHERE HIREDATE > (SELECT MIN(HIREDATE)
                        FROM EX_EMP
                        WHERE DEPTNO = 60);

-- 5. EX_EMP�� ���� ��� �� �޿� ����� 5�� ����� ����
DELETE FROM EX_EMP
    WHERE SAL = (SELECT SAL 
                    FROM EX_EMP E, SALGRADE S 
                    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL 
                    AND GRADE = 5);



    