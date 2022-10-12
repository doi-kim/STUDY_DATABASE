SELECT SAL
FROM EMP;

SELECT SUM(SAL)
FROM EMP;

SELECT ENAME, SAL
FROM EMP;

-- ����� ǥ���ϱ� ���ؼ� �׷����� ������
SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

/* �հ� ���ϱ� */
SELECT SUM(DISTINCT SAL), -- DISTINCT : �ߺ� ����
    SUM(SAL)
FROM EMP;

SELECT DEPTNO, SUM(SAL), SUM(NVL(COMM, 0))
FROM EMP
GROUP BY DEPTNO;

/* ������ ������ �����ִ� COUNT �Լ� */
SELECT DEPTNO, COUNT(*)
    FROM EMP
GROUP BY DEPTNO;

SELECT COUNT(*)
    FROM EMP
WHERE DEPTNO = 30;

-- NULL�� �ƴ� ��츦 ���ؼ� ���� �޴� ��� �ο� ���ϱ�
-- COUNT�� ����ó���� �ϱ� ������ NULL�� ���� �Ұ� 
-- WHERE COMM IS NOT NULL; �� �־ �Ȱ��� ���
SELECT COUNT(COMM)
    FROM EMP
WHERE COMM IS NOT NULL;

SELECT COUNT(COMM)
    FROM EMP;
    
-------------------------------------------------------------------------------
SELECT MAX(SAL)
    FROM EMP
WHERE DEPTNO = 10;

SELECT MIN(SAL)
    FROM EMP
WHERE DEPTNO = 10;
-------------------------------------------------------------------------------
SELECT MAX(HIREDATE) -- ���� �ֱ� �Ի���
    FROM EMP
WHERE DEPTNO = 20;
-------------------------------------------------------------------------------
-- GROUP BY�� ����ؼ� ��� ���
SELECT DEPTNO, AVG(SAL)
    FROM EMP
WHERE DEPTNO = 30
GROUP BY DEPTNO;

SELECT DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, ROUND(AVG(SAL))
    FROM EMP
GROUP BY DEPTNO;

-- GROUP BY �� ���� ��� �Ѵٸ�??
SELECT ROUND(AVG(SAL), 2) "10�� ���"
    FROM EMP
WHERE DEPTNO = 10;
SELECT ROUND(AVG(SAL), 2) "20�� ���"
    FROM EMP
WHERE DEPTNO = 20;
SELECT ROUND(AVG(SAL), 2) "30�� ���"
    FROM EMP
WHERE DEPTNO = 30;

SELECT ROUND(AVG(SAL), 2) "10�� ���" FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT ROUND(AVG(SAL), 2) "20�� ���" FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT ROUND(AVG(SAL), 2) "30�� ���" FROM EMP WHERE DEPTNO = 30;
-------------------------------------------------------------------------------
/* �μ� ��ȣ �� ��å�� ��� �޿��� �����ϱ� */
SELECT DEPTNO, JOB, ROUND(AVG(SAL), 2)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

/* �μ� �ڵ�, �޿� �հ�, �μ� ���, �ο��� �� ���� */
SELECT DEPTNO �μ��ڵ�, SUM(SAL) �հ�, ROUND(AVG(SAL), 2) ���, COUNT(*) �ο���
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
-------------------------------------------------------------------------------
/* HAVING �� */
-- GROUP BY �� ������ ����� �� �ְ� ������ �����ϴ� �뵵�� ����
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO;
-------------------------------------------------------------------------------
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
-- WHERE AVG(SAL) >= 2000 : �׷�(����) �Լ������� WHERE �� ��� �ȵ�
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-------------------------------------------------------------------------------
/* WHERE ���� HAVING �� ��θ� ����ϴ� ��� */
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000 -- ���� ����࿡ ���ؼ� ������ ���� ������ ��
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;
-------------------------------------------------------------------------------
-- HAVING ���� ����Ͽ� EMP ���̺��� �μ��� ��å�� ��� �޿��� 500�̻��� 
-- ������� �μ� ��ȣ, ��å, �μ�, ��� �޿� ���
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;
-------------------------------------------------------------------------------
/* [�������� 1��] */
-- EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ������� ���
-- ��, ��� �޿��� ����� ���� �Ҽ��� �����ϰ� �� �μ����� ���
SELECT DEPTNO, 
    TRUNC(AVG(SAL)) AS AVR_SAL, 
    MAX(SAL) AS MAX_SAL, 
    MIN(SAL) AS MIN_SAL,
    COUNT(*) AS CNT
    FROM EMP
GROUP BY DEPTNO;

/* [�������� 2��] */
-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB, COUNT(*)
    FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >= 3;

/* [�������� 3��] */
-- ������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_DATE, DEPTNO, COUNT(*) AS CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

/* [�������� 4��] */
-- �߰� ������ �޴� ��� ���� ���� �ʴ� ������� ��� (O, X�� ǥ�� �ʿ�)
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
    COUNT(*) AS CNT
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

/* [�������� 5��] */
-- �� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ����ϰ�
-- �� �μ��� �Ұ�� �Ѱ� ���
SELECT DEPTNO, 
    TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
    COUNT(*) AS CNT,
    MAX(SAL) AS MAX_SAL,
    SUM(SAL) AS SUM_SAL,
    AVG(SAL) AS AVG_SAL
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
ORDER BY DEPTNO;
-------------------------------------------------------------------------------
/* ���� */
-- UNION : SQL���� ����� ���� �������� ��ȯ, �ߺ� ����
-- UNION ALL : �ߺ����Ÿ� ���� ����
-- INTERSECT : ������, �� �� ���Ե� ����� ��ȯ
-- MINUS : ������, �տ��� �ڸ� �� ���

-- ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION 
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;

-- ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 1000
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL < 2000;

-- ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL < 2000;
-------------------------------------------------------------------------------
/* ���� */
SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

-- � ����(EQUI JOIN) : ���̺��� ������ �� ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ���
-- ���� ���� ���Ǵ� ���� ���
-- ����Ŭ ���
SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�, D.LOC �μ���ġ
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;

SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�, LOC �μ���ġ -- LOC�� �տ� D �Ⱥٿ�����(������ ���̱� ����)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;
-- ANSI ���
SELECT E.EMPNO, E.ENAME, D.DNAME, LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;
-------------------------------------------------------------------------------
-- WHERE ���� ���ǽ��� �߰��Ͽ� ��� ���� ����
-- ����Ŭ ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND SAL >= 3000;

-- ANSI ���
SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO 
WHERE SAL >= 3000;
-------------------------------------------------------------------------------
/* �������� */
-- EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� � ������ ���� �� �޿��� 2500 �����̰�,
-- �����ȣ�� 9999 ������ ����� ������ ���
SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, E.SAL �޿�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�, D.LOC �μ���ġ
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL <= 2500
        AND E.EMPNO <= 9999
ORDER BY E.EMPNO;

-- ANSI
SELECT E.EMPNO �����ȣ, E.ENAME ����̸�, E.SAL �޿�, D.DEPTNO �μ���ȣ, D.DNAME �μ��̸�, D.LOC �μ���ġ
    FROM EMP E JOIN DEPT D 
    ON E.DEPTNO = D.DEPTNO
    WHERE E.SAL <= 2500 AND E.EMPNO <= 9999
ORDER BY E.EMPNO;
-------------------------------------------------------------------------------
-- �� ���� : ���� �÷��� ���� �ٸ� ������ ����Ͽ� ������ �� �����. �� ������ ���� ������ ����
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- ANSI
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;
-------------------------------------------------------------------------------
/* ��ü ���� */
-- �ڱ� �ڽŰ� �ڽ��� ������ �ϴ� ��
-- ��� ������ �ش� ����� ���� ����� ��� ������ ������ ����ϰ��� �� �� ���
SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS "����ǻ����ȣ",
    E2.ENAME AS "������̸�"
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO;
    
-- ANSI
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS "����ǻ����ȣ",
    E2.ENAME AS "������̸�"
    FROM EMP E1 JOIN EMP E2
    ON E1.MGR = E2.EMPNO;
-------------------------------------------------------------------------------
/* �ܺ� ���� */
-- ����(INNER)������ ��� ���� �÷��� ���� ���� ���ٸ� �ش� ���� ��ȸ���� �ʽ��ϴ�.
-- �ܺ� ������ ���� ���ΰ� �ٸ��� �����Ǵ� ���� ����ϱ� ���ؼ� ���
-- �ƿ��� ������ ����ϴ� ������ ���� ���̺��� �����Ͱ� ��� ��ȸ��
-- LEFT OUTER JOIN : ���ʿ� ����� ���̺��� �÷����� �������� JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS "����ǻ����ȣ",
    E2.ENAME AS "������̸�"
    FROM EMP E1, EMP E2
    WHERE E1.MGR = E2.EMPNO(+)
    ORDER BY E1.EMPNO;

-- ANSI
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS "����ǻ����ȣ",
    E2.ENAME AS "������̸�"
    FROM EMP E1 LEFT OUTER JOIN EMP E2
    ON E1.MGR = E2.EMPNO(+)
    ORDER BY E1.EMPNO;
-------------------------------------------------------------------------------
-- RIGHT OUTER JOIN 
SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+)= D.DEPTNO
ORDER BY E.DEPTNO;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO(+)= D.DEPTNO
ORDER BY E.DEPTNO;

-- NATURAL JOIN
-- ���� ���ΰ� ��������� WHERE ���������� ������. ���� ��� ����
-- �� ���̺� ������ �̸��� ���� �÷��� ��� ���ε�
-- ���������� DEPTNO���� �������� � ���ε�
SELECT EMPNO, ENAME, DNAME
    FROM EMP NATURAL JOIN DEPT;

-- NATURAL JOIN�� ANSI ����    
SELECT E.EMPNO, E.ENAME, E.JOB, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, DNAME, D.LOC -- �� ���̺� �� DEPTNO�� �ִµ� �տ� ���� ���̺� �Ҽ������� �ٿ����� �ȵ�
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

-- ANSI / JOIN ~ USING
-- �������ΰ� �����ϸ� ���� ������ ����ؼ� ��� ����
-- NATURAL JOIN�� �ڵ����� ���� ���ؿ��� �����ϴ� �Ͱ� �޸� USING Ű���忡 ���� �������� ����� ���� ���
-- FROM TALE1 JOIN TABLE2 USING(���ο� ����� ���ؿ�)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D USING(DEPTNO)
    WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;
-------------------------------------------------------------------------------
-- FULL OUTER JOIN 
-- ���� ���̺� ��� OUTER JOIN ��� ����(����ʿ� NULL�� �����ϴ��� ��� ���)
SELECT E.ENAME, E.DEPTNO, D.DEPTNO, D.DNAME
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO;
-------------------------------------------------------------------------------
/* [���� ���� 1] */
-- �޿��� 2000�ʰ��� ������� ������ ���(�μ���ȣ, �μ��̸�, �����ȣ, ����̸�, �޿�)
-- ����Ŭ ������ ANSI �������� ����
SELECT * FROM EMP; 
SELECT * FROM DEPT;

-- ����Ŭ
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.SAL
    FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY D.DEPTNO;

-- ANSI
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.SAL
    FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO AND E.SAL > 2000
ORDER BY D.DEPTNO;

-- NATURAL JOIN
SELECT DEPTNO, D.DNAME, E.ENAME, E.EMPNO, E.SAL
    FROM EMP E NATURAL JOIN DEPT D
WHERE E.SAL > 2000
ORDER BY DEPTNO;

/* [���� ���� 2] */
-- �μ���ȣ, �μ��̸�, ��ձ޿�, �ִ�޿�, �ּұ޿�, ����� ���
-- ����Ŭ ������ ANSI �������� ����

-- ����Ŭ
SELECT D.DEPTNO, D.DNAME, 
    TRUNC(AVG(SAL)) AS "��� �޿�",
    MAX(SAL) AS "�ִ� �޿�",
    MIN(SAL) AS "�ּ� �޿�",
    COUNT(*) AS "�����"
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

-- ANSI
SELECT D.DEPTNO, D.DNAME, 
    TRUNC(AVG(SAL)) AS "��� �޿�",
    MAX(SAL) AS "�ִ� �޿�",
    MIN(SAL) AS "�ּ� �޿�",
    COUNT(*) AS "�����"
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME;

/* [���� ���� 3] */
-- ��� �μ���ȣ, �μ��̸�, �����ȣ, ����̸�, ��å, �޿��� ����̸������� �����Ͽ� ���
-- ����Ŭ ������ ANSI �������� ����

-- RIGHT OUTER JOIN
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E RIGHT OUTER JOIN DEPT D -- ä��� ���� �÷���
    ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

-- ����Ŭ
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

-- ANSI
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.ENAME;

/* [���� ���� 4] */
-- �μ���ȣ(D), �μ��̸�, �����ȣ, ����̸�, �޿�, ���ӻ���ǻ����ȣ, �μ���ȣ(E), �ּұ޿�, �ִ�޿�, �޿����, ��������ȣ, ����̸�
-- 3���� ���̺� (EMP, DEPT, SALGRADE)
SELECT * FROM SALGRADE; 

SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL, E.MGR, E.DEPTNO, S.LOSAL, S.HISAL, S.GRADE, 
E.EMPNO "�����ȣ", E2.ENAME "����̸�"
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.MGR = E2.EMPNO
ORDER BY D.DEPTNO, E.EMPNO;
