/* ���� ���� */
-- SQL�� �ȿ��� �ۼ��ϴ� SELECT ���� �ǹ�
-- SELECT, FROM, WHERE �� ��� ���̵� �� �� ����
-- ���� ������ �ݵ�� ()��ȣ ���� �־�� �մϴ�
SELECT * FROM DEPT;
-- ���� ������ ���� ����� WHERE���� ����. (���� �������� ���� ����� 10�� ��ȯ��)

SELECT DNAME FROM DEPT
    WHERE DEPTNO = (SELECT DEPTNO 
                    FROM EMP
                    WHERE ENAME = 'KING');
                    
SELECT DNAME FROM DEPT
    WHERE DEPTNO = 10;
    
SELECT DEPTNO
    FROM EMP
    WHERE ENAME = 'KING';
------------------------------------------------------------------------------
-- ���� ������ JONES�� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�
-- ���� ������ ���� ����� JONES�� �޿��� ������ ��
SELECT *
    FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');

SELECT * FROM EMP;
SELECT SAL FROM EMP WHERE ENAME = 'JONES';

-- EMP ���̺��� ��� ���� �߿��� ��� �̸��� ALLEN�� ����� �߰� ���纸�� ���� �߰� ������ �޴� ��� ���� ���ϱ�
-- �߰� ���翡 ���� �񱳰��� ���������κ��� ������
SELECT *
    FROM EMP
WHERE COMM > (SELECT COMM 
                FROM EMP
                WHERE ENAME = 'ALLEN');
-- ������ ���������� ��¥�� ������
SELECT HIREDATE
    FROM EMP;
    
SELECT *
    FROM EMP
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'JAMES');

-- �������ΰ� �����ؼ� ����ϱ�
-- ������������ ���� EMP ���̺��� SAL�� ��� �޿��� ���� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D. DEPTNO
    AND E.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);

SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D. DEPTNO
    WHERE E.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);
    
SELECT AVG(SAL)
    FROM EMP;
------------------------------------------------------------------------------
-- ���� ����� �������� ������ ��������
-- IN : ���� ������ �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�ϸ� TRUE
-- �� �μ����� ���� �޿��� ���� ����� ã����
SELECT * 
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL) 
                    FROM EMP
                    GROUP BY DEPTNO);
    
SELECT MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
-----------------------------------------------------------------------------
-- ANY : ���� ������ ���ǽ��� �����ϴ� ���� ������ ����� �ϳ� �̻��̸� TRUE
-- ���� ������ ����� ������ �����ϱ� ������ ������ ������ �ʿ� (IN, ANY, ALL, EXISTS)
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > ANY(SELECT SAL 
                    FROM EMP
                    WHERE JOB = 'SALESMAN');

-- 1600, 1250, 1500

/* ������ ���� ���� */
    SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL 
                    FROM EMP
                    WHERE JOB = 'SALESMAN');
-----------------------------------------------------------------------------
-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ���
SELECT *
    FROM EMP
    WHERE SAL < ANY(SELECT SAL
                    FROM EMP
                    WHERE DEPTNO = 30)
    ORDER BY SAL, DEPTNO;
                    
SELECT SAL FROM EMP WHERE DEPTNO = 30; -- 1600, 1250, 2850, 1500, 900
-----------------------------------------------------------------------------
-- ������ ������ ALL : ���� ������ �� ������ ���� ������ ���� �˻� ����� ��� ���� ��ġ�ϸ� TRUE
SELECT SAL FROM EMP WHERE JOB = 'MANAGER';

-- �޿��� ���������� ����� �Ŵ��� �޿����� ��� ū ��츸 TRUE
SELECT EMPNO, ENAME, SAL
    FROM EMP
    WHERE SAL > ALL(SELECT SAL
                    FROM EMP
                    WHERE JOB = 'MANAGER');
                    
-- �޿��� 30�� �μ��� �޿����� ���� ��츸 TRUE
SELECT *
    FROM EMP
    WHERE SAL < ALL(SELECT SAL
                    FROM EMP
                    WHERE DEPTNO = 30)
    ORDER BY SAL, DEPTNO;
-----------------------------------------------------------------------------
-- EXISTS ������ : ���������� ��� ���� �ϳ� �̻� �����ϸ� TRUE, �������� ������ FALSE
-- ������� �Ѱ��� ������ ��ü�� TRUE�� ��
SELECT *
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 10);
                    
SELECT *
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                    FROM DEPT
                    WHERE DEPTNO = 20);                   
-----------------------------------------------------------------------------
/* ���߿� ���� ���� */
-- ���� ������ ����� �ΰ� �̻��� �÷����� ��ȯ�Ǿ� ���� ������ ����
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, SAL
                                FROM EMP
                                WHERE DEPTNO = 30);
                                
SELECT DEPTNO, SAL FROM EMP WHERE DEPTNO = 30;
-----------------------------------------------------------------------------
-- GROUP BY ���� ���Ե� ���߿� ��������
SELECT *
    FROM EMP
    WHERE (DEPNO, SAL) IN (SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                            GROUP BY DEPTNO);
                            
SELECT DEPTNO, MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
-----------------------------------------------------------------------------
/* ���蹮��!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM �� ���ٰ� ORDER BY �� �ֱ� !!!!!!!!!!!!!!!!!!!!!!!!! */

/* FROM ���� ����ϴ� �������� */
-- ���������� FROM ���� ���������� �̿��ϴ� ������� �ζ��κ��� �θ��ϴ�.
-- ���뵵�� ���̺��� �ʹ� ū ��� �ʿ��� ��� ���� ����ϰ��� �� ��
-- ���� ������ �ʿ��� ��� � ����մϴ�.
-- ������ FROM ���� �ʹ� ���� ���������� ����ϸ� �������� ��������, ������ ������ �� �ֽ��ϴ�.
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10, 
        (SELECT * FROM DEPT)D
    WHERE E10.DEPTNO = D.DEPTNO;
-----------------------------------------------------------------------------
-- ���� ������ �ʿ��� ��� : �޿��� ���� ��� 3�� ��� (���蹮��!!!!!!! ����!!!!!!!!!!!)
-- ROWNUM : ����Ŭ���� �����ϸ� ���ȣ�� �Ű��ش�.
SELECT ROWNUM, ENAME, SAL
    FROM (SELECT * 
        FROM EMP
        ORDER BY SAL DESC)
WHERE ROWNUM <= 3;
-----------------------------------------------------------------------------
/* SELECT ���� ����ϴ� �������� */
-- SELECT ������ ����ϴ� ������ ���������� ��Į�� ����������� �մϴ�.
-- SELECT ���� ����ϴ� ���������� �ݵ�� �ϳ��� ����� ��ȯ�ϵ��� �ۼ��ؾ� �մϴ�.
SELECT * FROM DEPT;            
SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME, JOB, SAL,
        (SELECT GRADE
            FROM SALGRADE
            WHERE EMP.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
        DEPTNO,
        (SELECT DNAME
            FROM DEPT
            WHERE EMP.DEPTNO = DEPT.DEPTNO) DNAME
    FROM EMP;
-----------------------------------------------------------------------------
-- �ึ�� �μ���ȣ�� �� ���� �μ���ȣ�� ������ ������� �޿� ����� ���ؼ� ��ȯ
-- ����̸� / �μ���ȣ / �޿� / �μ������
SELECT ENAME, DEPTNO, SAL,
    (SELECT TRUNC(AVG(SAL)) 
        FROM EMP
        WHERE DEPTNO = E.DEPTNO) AS "�μ���ձ޿�"
    FROM EMP E;
    
SELECT TRUNC(AVG(SAL))
    FROM EMP
    WHERE DEPTNO = 30;
-----------------------------------------------------------------------------
-- �μ� ��ġ�� NEWYORK �� ��쿡 ����, �׿� �μ��� �������� ��ȯ�ϴ� �ڵ� �ۼ�
-- CASE�� 
SELECT EMPNO, ENAME,
    CASE 
        WHEN DEPTNO = (SELECT DEPTNO
                        FROM DEPT
                        WHERE LOC = 'NEW YORK')
        THEN '����'
        ELSE '����'
    END AS �Ҽ�
FROM EMP;
-----------------------------------------------------------------------------
/* �������� 1 */
-- ��ü ��� �� ALLEN�� ���� ��å�� ������� ��� ����, �μ� ������ ���
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND JOB = (SELECT JOB 
                    FROM EMP 
                WHERE ENAME = 'ALLEN');
                
SELECT E.JOB, E.EMPNO, E.ENAME, S.SAL, D.DEPTNO, D.DNAME
    FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
    AND JOB = (SELECT JOB 
                FROM EMP 
            WHERE ENAME = 'ALLEN');
                
/* �������� 2 */      
-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ��� ���� ���
-- ������ ���������� ���� ���� : >, <, =, <=, >-, <>, !=, ^=
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
    FROM EMP E, DEPT D, SALGRADE S
WHERE D.DEPTNO = E.DEPTNO
    AND E.SAL BETWEEN S.LOSAL AND S.HISAL -- ������
    AND SAL > (SELECT AVG(SAL)
                FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO;

/* �������� 3 */
-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ����
-- ������ ���������� ���� ���� : IN (NOT IN), ANY(�ϳ��� ����), SOME(�ϳ��� ����), ALL(��� �����ؾ� ��),
-- EXIST : ������ ����� �ϳ��� �����ϸ� TRUE (�ϳ��� ���ԵǾ� ������ �� ���)
SELECT E.EMPNO, E.ENAME, E.JOB, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO
    AND E.DEPTNO = 10
    AND JOB NOT IN (SELECT DISTINCT JOB
                    FROM EMP
                    WHERE DEPTNO = 30);

/* �������� 4 */
-- ��å�� SALESMAN�� ������� �ְ�޿����� ���� ��� ���
-- ������ ������ ������� ����
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL -- ������ (����ΰ� �ٸ��� ������ ������ �Ǵ�.)
    AND SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

-- ������ ���
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND SAL > ALL (SELECT DISTINCT SAL  -- ��å�� SALESMAN�� ��� ����� �޿����� ū ���(ALL�� ��� �����ؾ� ��)
                    FROM EMP
                    WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;
-----------------------------------------------------------------------------
