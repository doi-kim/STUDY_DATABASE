/* 9�� 1�� ����� ���� */

---------------------------------------------
/* DDL */
SELECT * FROM EMP;

/* CREATE ��ɾ� ����Ͽ� ���� ���̺� ���� */
CREATE TABLE EMP_DDL ( 
    EMPNO   NUMBER(4),
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    MGR     NUMBER(4),
    HIREDATE  DATE,
    SAL     NUMBER(7, 2),
    COMM    NUMBER(7, 2),
    DEPTNO  NUMBER(2)
);

DESC EMP_DDL; -- �������� Ȯ��

/* ���� ���̺��� ���� �����͸� �����Ͽ� �� ���̺� ���� */
CREATE TABLE DEPT_DDL
    AS SELECT * FROM DEPT;
    
DESC DEPT_DDL;
SELECT * FROM DEPT_DDL;

/* ���� ���̺� �� ������ �Ϻ� �����͸� �����Ͽ� �� ���̺� ���� */
CREATE TABLE EMP_DDL_30
    AS SELECT * FROM EMP
    WHERE DEPTNO = 30;

SELECT * FROM EMP_DDL_30;

/* ���� ���̺��� �� ������ �����Ͽ� �� ���̺� ���� */
CREATE TABLE EMP_DEPT_DDL
    AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
        D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
        WHERE 1 != 1; -- ���̺� ������ �����ϰ� �����ʹ� �������

DESC EMP_DEPT_DDL;

SELECT * FROM EMP_DEPT_DDL;

-------------------------------------------------------------------
/* ���̺� ���� : ALTER */
CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_ALTER;

-- ���̺� �� �߰� : ALTER�� ADD ���
-- ���� ���̺��� �÷�(��)�� ���ο� �÷��� �߰��ϴ� ��ɾ�
-- ���̺��� �� �ڿ� �߰��Ǹ� ���ϴ� ��ġ�� ���� �� ����
-- �߰��� �÷����� ���� NILL������ �Էµ�
ALTER TABLE EMP_ALTER
    ADD HP VARCHAR2(20); -- ũ�⸦ 20���� �־���
    
SELECT * FROM EMP_ALTER; 

-- ���̸� ���� : RENAME 
-- ALTER ��ɾ RENAME Ű���带 ����ϸ� ���̺��� �� �̸��� ������ �� ���� 
ALTER TABLE EMP_ALTER
    RENAME COLUMN HP TO TEL;
    
SELECT * FROM EMP_ALTER;

-- ���� �ڷ����� ���� : MODIFY
-- �ڷ��� ���� �� �̹� �����Ͱ� �����ϴ� ��� ũ�⸦ ũ�� �����ϴ� ���� ���� ������, ũ�⸦ ���̴� �� ��쿡 ���� �ȵ� �� ����
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(2); -- ���� �Ұ�
    
ALTER TABLE EMP_ALTER
    MODIFY EMPNO NUMBER(5); -- ���� ����

DESC EMP_ALTER;

/* ���̺� �̸��� �����ϴ� RENAME */ -- ALTER ���� �ܵ����� ���
RENAME EMP_ALTER TO EMP_RENAME;

SELECT * FROM EMP_RENAME;

/* ���̺��� �����͸� �����ϴ� TRUNCATE */
-- �����Ͱ� ����Ǿ� �ִ� ������ ����, ROLLBACK�� �ȵ�
TRUNCATE TABLE EMP_RENAME;

SELECT * FROM EMP_RENAME;

/* DELETE�� TRUNCATE ����?
�������� ������ ���� 
DML�� �ѹ� ���� -> ��������� �������,,,,,,,,,,
DDL�� �ѹ� X -> ����� ���ÿ� ����������� ��������,,,,,,, */

/* ���̺��� �����ϴ� ��ɾ� */ -- ���������� ���� �ȵžȵ�,,,��
DROP TABLE EMP_RENAME;

-----------------------------------------------------------------
/* �������� */

-- 1. ���� ���� ������ ������ EMP_HW ���̺��� ����� ������.

CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HTREDATE DATE,
    SAL NUMBER(7, 2),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2)
);
    
DESC EMP_HW;

-- 2. EMP_HW ���̺� BIGO ���� �߰��� ������. BIGO ���� �ڷ����� ������ ���ڿ��̰�, ���̴� 20�Դϴ�.
ALTER TABLE EMP_HW
    ADD BIGO VARCHAR2(20);
    
SELECT * FROM EMP_HW;

-- 3. EMP_HW ���̺��� BIGO �� ũ�⸦ 30���� ������ ������.
ALTER TABLE EMP_HW
    MODIFY BIGO VARCHAR2(30);

-- 4. EMP_HW ���̺��� BIGO �� �̸��� REMARK�� ������ ������.
ALTER TABLE EMP_HW
    RENAME COLUMN BIGO TO REMARK; 

-- 5. EMP_HW ���̺� EMP ���̺��� �����͸� ��� ������ ������. �� REMAKE ���� NULL�� �����մϴ�.
SELECT * FROM EMP;

INSERT INTO EMP_HW
    SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL FROM EMP;

-- 6. EMP_HW ���̺� ����
DROP TABLE EMP_HW;

----------------------------------------------------------------
/* ���� ���� */
-- �� ���� ������� �ʴ� NOT NULL, �ߺ� ���οʹ� ��� ����, �ݵ�� ���� ���� �����ؾ� ���� �ǹ�
CREATE TABLE TABLE_NOT_NULL(
    LOGIN_ID    VARCHAR(20) NOT NULL, -- NULL �� ���� �� ����, �ݵ�� ���� �Է��ؾ���
    LOGIN_PWD   VARCHAR(20) NOT NULL,
    TEL         VARCHAR(20) 
);

DESC TABLE_NOT_NULL;

INSERT INTO TABLE_NOT_NULL(LOGIN_ID, LOGIN_PWD, TEL) 
    VALUES('�����̻�����', NULL, '010-5006-4146'); -- �ȵ�, NULL �� ���� �� ����
    
INSERT INTO TABLE_NOT_NULL(LOGIN_ID, TEL) 
    VALUES('�����̻�����', '010-5006-4146'); -- �ȵ�, NOT NULL�̶� �н����� �� �־������

INSERT INTO TABLE_NOT_NULL(LOGIN_ID, LOGIN_PWD) 
    VALUES('�����̻�����', '010-5006-4146'); -- ��, TEL�� NOT NULL�� �ƴϱ� ����
    
INSERT INTO TABLE_NOT_NULL(LOGIN_ID, LOGIN_PWD, TEL) 
    VALUES('�����̻�����', 'JKS2024', '010-5006-4146'); -- ��
    
SELECT * FROM TABLE_NOT_NULL;

-- ���� ������ Ȯ���ϴ� ��ɾ�
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

-- ���� ������ Ȯ���ϴ� ��ɾ�
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TABLE_NOT_NULL';

-- ���� ���� �̸��� ���� �����ϱ�
-- ���̺��� TABLE_NOT_NULL �����ؼ� �������� -> ���̺� �������� �־ ��!!!!^_^
CREATE TABLE TABLE_NOT_NULL2 (
    LOGIN_ID VARCHAR(20) CONSTRAINT TB_LOGIN_ID_NN NOT NULL,
    LOGIN_PWD VARCHAR(20) CONSTRAINT TB_LOGIN_PW_NN NOT NULL,
    TEL VARCHAR(20)
);

-- �̹� ������ ���̺� ���� ���� �����ϱ�
ALTER TABLE TABLE_NOT_NULL
    MODIFY TEL NOT NULL;
    
SELECT * FROM TABLE_NOT_NULL;

-- �̹� ���Ե� �����Ϳ� NULL�� �����ϱ� ������ ���� �ش� �÷��� NULL�� ����
UPDATE TABLE_NOT_NULL
    SET TEL = '010-1234-5678'
    WHERE LOGIN_PWD = '010-5006-4146';
    
DESC TABLE_NOT_NULL;

--------------------------------------------------------
-- �ߺ����� �ʴ� �� : UNIQUE
-- �ش� ���� ������ �������� �ߺ��� ������� �ʰ��� �� �� ���
-- NULL�� ���� �������� ������ �ǹ� �ϹǷ� �ߺ� ��󿡼� ���ܵ�
-- ���̺��� �����ϸ鼭 UNIQUE ���� ���� ����
CREATE TABLE TABLE_UNIQUE (
    LOGIN_ID VARCHAR2(20) UNIQUE, -- LOGIN_ID���� UNIQUE ���� ����
    LOGIN_PWD VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(20)
);

DESC TABLE_UNIQUE;

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('�����̻�����', 'PW123456', '010-5006-4146');
    
SELECT * FROM TABLE_UNIQUE;

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
    VALUES('�޺���ɲ�', 'PW123456', '010-5006-4146');
    
INSERT INTO TABLE_UNIQUE(LOGIN_PWD, TEL) 
    VALUES('PW123456', '010-5006-4146'); -- ��, UNIQUE ������ NULL üũ�� ���� 

---------------------------------------------------------------
-- �����ϰ� �ϳ��� �ִ� �� : PRIMARY KEY
-- UNIQUE�� NOT NULL ���� ������ ���յ� ����
-- ��, �ߺ��� ������� �ʰ� NULL ���� ���� �� ����
-- ������ �� : ��� ��ȣ, �ֹε�Ϲ�ȣ �� ������ ���� �ַ� �����ؼ� �����
-- ���̺� �� �Ѱ��� ���� ����
-- �ڵ����� �ε����� �������
CREATE TABLE TABLE_PK (
    LOGIN_ID    VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) NOT NULL,
    TEL         VARCHAR2(20)
);

DESC TABLE_PK;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
    FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'TABLE_PK'; -- �������� ��, NULL�� CHECK�ϴ� �ű� ������ NULL�̸� C�� ��
    
CREATE TABLE TABLE_PK2 (
    LOGIN_ID    VARCHAR2(20) CONSTRAINT TB_LOGIN_ID_PK PRIMARY KEY,
    LOGIN_PWD   VARCHAR2(20) CONSTRAINT TB_LOGIN_ID_PWD NOT NULL,
    TEL VARCHAR(20)
);

SELECT * FROM TABLE_PK2;

INSERT INTO TABLE_PK2 VALUES('�����̻�����', 'JKS2024', '010-5006-4146');
INSERT INTO TABLE_PK2 VALUES('����������', 'JKS2024', '010-5006-4146');
INSERT INTO TABLE_PK2 VALUES('�򸶿콺', 'JKS2024', '010-5006-4146');

-------------------------------------------------------------
/* FOREIGN KEY �����ϱ� */
-- ���� �ٸ� ���̺��� ���踦 �����ϴµ� ����ϴ� ���� ����
-- �����ϰ� �ִ� �⺻Ű�� ������ Ÿ�԰� ��ġ�ؾ��ϰ�, �ܷ�Ű�� �����Ǵ� �⺻Ű�� ������ �� ����
CREATE TABLE DEPT_FK (
    DEPTNO  NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_FK PRIMARY KEY,
    DNAME   VARCHAR2(14),
    LOC     VARCHAR2(13)
);

DESC DEPT_FK;

-- EMP_FK : EMP_FK ���̺��� DEPTNO ���� DEPT_FK ���̺��� DEPTNO ���� �����ϴ� FOREIGN KEY ���� ���� �߰�
CREATE TABLE EMP_FK (
    EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7, 2),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO)
);

-- EMP_FK ���̺� �����͸� ����(DEPTNO �����Ͱ� ���� ����, DEPT_FK �� �����Ͱ� ���� �ȸ������)
INSERT INTO EMP_FK
    VALUES(9998, '������', '����', NULL, '2022/01/02', 3000, 300, 10); -- �μ��� ��� �������� ����
    
INSERT INTO EMP_FK
    VALUES(9999, '������', '������', NULL, '2022/01/02', 3000, 300, 20); 

INSERT INTO DEPT_FK
    VALUES(10, '������', '����'); -- �μ��� ���� ����� ���� �������� �ٽ� �ϸ� ��
    
INSERT INTO DEPT_FK
    VALUES(20, '�򸶿콺', '����');
    
SELECT * FROM EMP_FK;

DELETE FROM DEPT_FK WHERE DEPTNO = 10; -- 10�� �μ��� ��������� �ֱ� ������ 10�� �μ��� ���� �� ����

DELETE FROM EMP_FK WHERE ENAME = '������'; -- 10�� �μ��� �ִ� ��������� ������ ������ ���� ���� 10�� �μ��� ���� �� ����

-------------------------------------------------------------------------
-- ������ ���¿� ������ ���ϴ� CHECK
-- ���� ������ �� �ִ� ���� ���� �Ǵ� ������ ������ �� ���
-- ���̺� ���� �� CHECK ���� ���� �����ϱ�
CREATE TABLE TABLE_CHECK (
    LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGIN_PK PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPW_CK CHECK (LENGTH(LOGIN_PWD) > 3),
    TEL VARCHAR2(20)
);

DESC TABLE_CHECK;

INSERT INTO TABLE_CHECK
    VALUES('�����̻�����', '1234', '010-5006-4146');
    
-------------------------------------------------------------------------
-- �⺻���� ���ϴ� DEFAULT
CREATE TABLE TABLE_DEFAULT (
    LOGIN_ID VARCHAR2(20) PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20)
);

DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES('�����̻�����', NULL, '010-5006-4146');

SELECT * FROM TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES('����������', '010-5006-4146');

----------------------------------------------------------------------
/* ���� ���� (1) */

-- 1. product ���̺� ����
CREATE TABLE PRODUCT(
    PRODUCT_ID      NUMBER PRIMARY KEY,
    PRODUCT_NAME    VARCHAR2(20) NOT NULL,
    REG_DATE        DATE
);

DESC PRODUCT;

-- 2. product ���̺� ������ ����
INSERT INTO PRODUCT
    VALUES(1, 'COMPUTER', '21/01/02');
INSERT INTO PRODUCT
    VALUES(2, 'SMARTPHONE', '22/02/03');
INSERT INTO PRODUCT
    VALUES(3, 'TELEVISION', '22/07/01');
    
SELECT * FROM PRODUCT;
    

-- 3. product ���̺� �� �߰� 
ALTER TABLE PRODUCT
    ADD WEIGHT NUMBER CHECK(LENGTH(WEIGHT) >= 0);
ALTER TABLE PRODUCT
    ADD PRICE NUMBER CHECK(LENGTH(PRICE) >= 0);

DESC PRODUCT;

--------------------------------------------------------------

/* ���� ���� (2) */

-- �����̺�(Customer Table)
CREATE TABLE CUSTOM(
    CUSTOM_ID    NUMBER PRIMARY KEY,
    USER_NAME    VARCHAR2(12) NOT NULL,
    PHONE        VARCHAR2(20),
    EMAIL        VARCHAR2(20),
    REG_DATE     DATE DEFAULT '1900/01/01'
);

DESC CUSTOM;

-- �� ���̺� �߰�
ALTER TABLE CUSTOM
    ADD AGE NUMBER CHECK(AGE BETWEEN 1 AND 199);
ALTER TABLE CUSTOM
    ADD SEX VARCHAR2(1) CHECK(SEX = 'M' OR SEX = 'F');
ALTER TABLE CUSTOM
    ADD BIRTH_DATE DATE;
    
DESC CUSTOM;

-- ���� ���� �߰� �ϱ�
ALTER TABLE CUSTOM
    MODIFY PHONE UNIQUE;
ALTER TABLE CUSTOM
    MODIFY EMAIL UNIQUE;
    
-- �����ϱ�
ALTER TABLE CUSTOM
    RENAME COLUMN SEX TO GENDER;
ALTER TABLE CUSTOM
    RENAME COLUMN PHONE TO MOBILE;
ALTER TABLE CUSTOM
    MODIFY USER_NAME VARCHAR2(20);
    
DESC CUSTOM;  

-- ������ �߰��ϱ�
INSERT INTO CUSTOM
    VALUES('11', '������', '010-1991-0308', 'YOONJ1@GMAIL.COM', '1991/03/08', 32, 'M', '1991/03/08');
INSERT INTO CUSTOM
    VALUES(123, '�ϼ���', '010-1994-0322', 'SENG322@GMAIL.COM', '1994/03/22', 29, 'M', '1994/03/22');
INSERT INTO CUSTOM
    VALUES(109, 'Ȳ����', '010-1995-0809', 'HMH0809@GMAIL.COM', '1995/08/09', 28, 'M', '1995/08/09');
INSERT INTO CUSTOM
    VALUES(22, '�����', '010-1234-5678', 'WY2@GMAIL.COM', '2002/05/05', 21, 'F', '2010/12/24');
INSERT INTO CUSTOM
    VALUES(32, '�̿���', '010-2345-5678', 'YJ22@GMAIL.COM', '2003/08/05', 22, 'F', '2020/11/02');
INSERT INTO CUSTOM
    VALUES(124, '�����', '010-3456-5678', 'JKS0224@GMAIL.COM', '1992/08/05', 31, 'M', '2010/12/24');
INSERT INTO CUSTOM
    VALUES(81, '����ȣ', '010-7110-5678', 'JCH1@GMAIL.COM', '2002/12/31', 21, 'M', '2009/02/27');
INSERT INTO CUSTOM
    VALUES(93, '�赵��', '010-2045-1005', 'DY123@GMAIL.COM', '2002/09/11', 11, 'F', '2022/01/02');
INSERT INTO CUSTOM
    VALUES(82, '������', '010-1111-5678', 'EJ22@GMAIL.COM', '2003/08/05', 22, 'F', '2021/11/12');
INSERT INTO CUSTOM
    VALUES(28, '�̼���', '010-2115-5008', 'SB22@GMAIL.COM', '2005/08/05', 24, 'F', '2020/12/02');
    
SELECT * FROM CUSTOM;
    

    
    
