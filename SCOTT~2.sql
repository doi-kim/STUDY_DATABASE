-- �׷� �Լ� --

/* [�������� 1��] */
-- EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��ձ޿�, �ְ�޿�, �����޿�, ������� ���
-- ��, ��� �޿��� ����� ���� �Ҽ��� �����ϰ� �� �μ����� ���
SELECT DEPTNO �μ���ȣ , TRUNC(AVG(SAL)) ��ձ޿�, MAX(SAL) �ְ�޿�, MIN(SAL) �����޿�, COUNT(*) �����
FROM EMP
GROUP BY DEPTNO;

/* [�������� 2��] */
-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB ��å, COUNT(*) �ο�
FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >= 3;

/* [�������� 3��] */
-- ������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT TO_CHAR(HIREDATE, 'YYYY') �Ի翬��, DEPTNO �μ�, COUNT(*) �����
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

/* [�������� 4��] */
-- �߰� ������ �޴� ��� ���� ���� �ʴ� ������� ��� (O, X�� ǥ�� �ʿ�)
SELECT NVL2(COMM, 'O', 'X') AS "�߰�����", COUNT(*) AS "�����"
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

/* [�������� 5��] */
-- �� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ����ϰ�
-- �� �μ��� �Ұ�� �Ѱ� ���
SELECT DEPTNO �μ�, TO_CHAR(HIREDATE, 'YYYY') �Ի翬��,  COUNT(*) �����, MAX(SAL) �ְ�޿�, SUM(SAL) �޿���, TRUNC(AVG(SAL)) ��ձ޿�
FROM EMP
GROUP BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY')
ORDER BY DEPTNO;

