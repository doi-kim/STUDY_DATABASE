/* 9�� 2�� �ݿ��� */

/* �ε��� */
SELECT ROWID FROM EMP; -- ������Ʈ ��ȣ, ���Ϲ�ȣ, ����ȣ, ROW��ȣ
SELECT * FROM USER_INDEXES; -- SCOTT ������ ������ �ִ� �ε��� ����
SELECT * 
    FROM USER_INDEXES
    WHERE TABLE_NAME = 'EMP';
-- �ε��� Ű ���
CREATE INDEX IDX_EMP_SAL ON EMP(SAL); -- ���� �ε��� ���
-- ���� �ε��� ��� (�ִ� 32������ ��� ����)
CREATE INDEX IDX_EMP_TUPLE ON EMP(JOB, DEPTNO);
-- ����ũ �ε��� : �ε����� ������ �÷��� �ش� ���̺��� ������ ��(�ߺ��� �Ǹ� �ȵ�)
CREATE UNIQUE INDEX IDX_EMP_UK ON EMP(EMPNO, MGR);
-- �ε��� ����
DROP INDEX IDX_EMP_UK;
---------------------------------------------------------------
/* ���̺� �� */
-- �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü
-- �������� �ܼ�ȭ �� �� ����
-- ���ȼ� �������� ����� �� ����
CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
        FROM EMP
        WHERE DEPTNO = 20);
        
SELECT * FROM EMP;
SELECT * FROM VW_EMP20;
SELECT * FROM USER_VIEWS;
---------------------------------------------------------------
/* ������ */
-- ����Ŭ�� Ư�� ��Ģ�� �´� ���� ���ڸ� �������ִ� ��ü
CREATE SEQUENCE SEQ_EMPID
START WITH 300
INCREMENT BY 2 -- 2�� ����
MAXVALUE 320 -- 320���� ����
NOCYCLE
NOCACHE;

SELECT SEQ_EMPID.NEXTVAL FROM DUAL;
---------------------------------------------------------------
/* ���Ǿ� */
-- �������� ��Ī�� �ο��ϴ� ���
CREATE SYNONYM E FOR EMP;
SELECT * FROM E;
SELECT * FROM EMP;
DROP SYNONYM E; -- ���Ǿ� ����
---------------------------------------------------------------
/* ���� ���� */

-- 1. ������ SQL���� �ۼ� �غ�����.
-- �� EMP ���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� ����� ������.
CREATE TABLE EMPIDX
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP;
SELECT * FROM EMPIDX; 

-- �� ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� ����� ������.
CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);


-- �� ���������� �ε����� �� �����Ǿ����� ������ ������ ���� �並 ���� Ȯ���� ������. 
SELECT * 
    FROM USER_INDEXES
    WHERE INDEX_NAME = 'IDX_EMPIDX_EMPNO';

/* 2. View ���
���� 1������ ������ EMPIDX ���̺��� ������ �� �޿�(SAL)�� 1500 �ʰ��� ����鸸 �����
�� EMPIDX_OVER15K �並 ������ ������. �� �̸��� ���� �䰡 �̹� ������ ��쿡 ���ο� ��
������ ��ü �����ؾ� �մϴ�. EMPIDX_OVER15K ��� ��� ��ȣ, ��� �̸�, ��å, �μ� ��ȣ,
�޿�, �߰� ���� ���� ������ �ֽ��ϴ�. �߰� ���� ���� ��쿡 �߰� ������ �����ϸ� O, ��������
������ X�� ����մϴ�. */
CREATE OR REPLACE VIEW EMPIDX_OVER15K
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM, 'O', 'X') AS COMM
        FROM EMPIDX
        WHERE SAL > 1500);

SELECT * FROM EMPIDX_OVER15K;

-- 3. ���� 3���� SQL���� �ۼ�
-- �� DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��� ������.
CREATE TABLE DEPTSEQ
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT;
SELECT * FROM DEPTSEQ; 

-- �� ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� ������ Ư���� �°� ������ ������.
CREATE SEQUENCE SEQ_DEPTSEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 99
MINVALUE 1
NOCYCLE
NOCACHE;

SELECT *
    FROM USER_SEQUENCES;

-- �� ���������� ������ DEPTSEQ�� ����Ͽ� �����ʰ� ���� �� �� �μ��� ���ʴ�� �߰��� ������. 


