-- �ߺ��� �����ϰ� ��ǥ���� ��ȸ�ϱ� ���� Ű���� : DISTINCT (NULL���� ����)
SELECT DISTINCT department_id
FROM employees;

-- NULL ���� ������ ��ǥ�� ��ȸ
SELECT DISTINCT department_id
FROM employees
WHERE department_id IS NOT NULL;

-- �μ��ڵ��� ��ǥ���� ������������ ����(NULL ���� �� �Ʒ��� ����)
SELECT DISTINCT department_id
FROM employees
ORDER BY 1;

-- �μ��ڵ��� ��ǥ���� ������������ ����
--��, NULL���� �� ���� �����ϵ��� �Ѵ�.
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 NULLS FIRST;

-- �μ� �ڵ��� ��ǥ���� ������������ ����
-- ��, NULL���� �� �Ʒ��� �����ϵ��� �Ѵ�.
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 DESC NULLS LAST;

SELECT DISTINCT department_id, employee_id
FROM employees;

--[�������� 4-1]
--�츮ȸ�翡 �Ŵ����� �ִ� ������� �������� �ľ��ϰ��� �Ѵ�.
--�Ŵ����� ������� manager_id �� ��ȸ
SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL;

--�׷��Լ�
-- ������ ���� ������ ���� ��ȯ�ϴ� �Լ� : COUNT(���ǥ��), COUNT(*)
SELECT COUNT(*) cnt1,                                           --ȸ�� ����� ��
               COUNT(department_id) cnt2,                      --�μ� ��ġ�� ���� ����� ��(�׷� �Լ��̹Ƿ� NULL ����)
               COUNT(DISTINCT department_id) cnt3,
               --DISTINCT�� NULL���� �����ϰ� �׷��Լ��� NULL�� ����
               COUNT(commission_pct) cnt4
FROM employees;

-- ȸ�� ����� �� �μ��ڵ� 60�� �μ��� ���� ������� ���� �ľ��ϰ��� �Ѵ�.
SELECT COUNT(*) cnt
FROM employees
WHERE department_id = 60;

--�츮 ȸ�� ����� �� clerk ������ ������ �ϴ� ������� �� ��ȸ
SELECT COUNT(*) cnt
FROM employees
--WHERE job_id LIKE '%CLERK%';
WHERE LOWER (job_id) LIKE '%clerk%';

--������ ���� ���Ͽ� ��ȯ�ϴ� �Լ� : SUM(���ǥ��) - ���ڿ��� ��� ����
-- �츮 ȸ�� ��� ������� �޿��� ���� ����� ��ȸ
SELECT SUM(salary) sum_sal
FROM employees;

-- �츮 ȸ�� �μ� �ڵ� 60�� �μ��� ���� ������� �޿��� ���� ����� ��ȸ
SELECT SUM(salary) sum_sal
FROM employees
WHERE department_id = 60;

-- ȸ�翡�� account ������ �ϴ� ������� �޿��� ���� ����� ��ȸ
--��, ����� ������ Ÿ���� ���ڰ� �ƴ� ���ڷ� ǥ���ؾ��Ѵ�.
SELECT TO_CHAR(SUM(salary), '999,999') sum_sal
FROM employees
WHERE  LOWER(job_id) LIKE '%account%';

-- ������ �� �� ���� ū/���� ���� ��ȯ�ϴ� �Լ� : MAX/MIN(���ǥ��)

-- ȸ�翡�� ���� ����/���� �޿��� ��ȸ
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees;

--ȸ�� ����� �� ���� ����/���߿� ������ ���� ��ȸ
SELECT MIN(last_name) min_name, MAX(last_name) max_name
FROM employees;

-- ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի� ���� ��ȸ
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees;

-- �μ��ڵ尡 60���� ����� �� ���� ����/���� �޿��� ��ȸ
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
WHERE department_id = 60;

-- ȸ�� clerk ������ ������ �ϴ� ������� �Ի������� �ľ��ϰ��� �Ѵ�.
--clerk ������ ������ �ϴ� ����� �� ���� ���� �Ի��� �Ի� ����, ���� �ֱ� �Ի��� �Ի����� ��ȸ
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--AVG(���ǥ��) : ������ ���� ����� ��ȯ - ���ڸ� ����

-- ȸ�� ������� �޿� ��� ��ȸ
SELECT ROUND(SUM(salary) / COUNT(*), 2) avg_sal1,
               ROUND(AVG(salary), 2) avg_sal2
FROM employees;

-- ȸ�� �μ��ڵ� 60�� �μ��� ���� ������� �޿� ��� ��ȸ
-- �޿� ����� �Ҽ� ��°�ڸ����� �ݿø��ؼ� ǥ��
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 60;


-----------------------------------------------------------------------------------------------
--�ǽ�
--01. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���� ��ȸ�Ͻÿ�.
SELECT COUNT(*) cnt
FROM employees
WHERE LOWER(last_name) LIKE '%z%';


--02. �츮ȸ�� ����� �ְ�޿��� �����޿� �� �޿����� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �ְ�޿��� �����޿��� �޿����� ��ȸ�Ͻÿ�.
SELECT MAX(salary) - MIN(salary) result
FROM employees;

--03. �츮ȸ�翡 �Ŵ����� �ִ� ������� ���� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �Ŵ����� ������� ���� ��ȸ�Ͻÿ�.
SELECT COUNT(DISTINCT manager_id) manager
FROM employees;

--04. �츮ȸ�� account ������ �ϴ� ������� �޿���ո� ��ȸ�Ͻÿ�.
--�Ҽ����� 2�ڸ����� ���Ͻÿ�.
SELECT ROUND(AVG(salary), 2) avg_sal1
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

-----------------------------------------------------------------------------------------------
--[�������� 4-2]
--01. �츮ȸ�� ����� �� Ŀ�̼��� �޴� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--Ŀ�̼��� �޴� ����� ���� ��ȸ
SELECT COUNT(commission_pct) comm
FROM employees;




--02. �츮ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի����� ��ȸ
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees;




--03. �츮ȸ�� �μ��ڵ� 90���� �μ��� ���� ������� �޿���� ��ȸ
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 90;


-----------------------------------------------------------------------------------------------
--01. �츮ȸ�� ������� ���, ��, �μ��ڵ�, �޿� ��ȸ�Ͽ� �μ��ڵ� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary
FROM employees
ORDER BY department_id;

--02. �μ��ڵ� 50�� �μ��� �޿���ո� ��ȸ
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 50;

---------------------------------------------------------------------------------------------

--Ư�� ������ �ξ� �������� �׷��� ���� �׷캰�� �ϳ��� ����� ��ȸ�Ҷ� GRUOP BY�� ���
--GROUP BY - Ư�� �������� �׷��� ���� �� 
--HAVING - �׷� �Լ� ���� ����

--SELECT ��Ͽ� �׷� �Լ��� ����� ǥ��(COUNT, MAX, MIN, SUM, AVG, ...)�� 
--�׷� �Լ��� ������� ���� ǥ��(�Ϲ� Į��)�� �Բ� �ִٸ�
--��.��.�� �׷��Լ��� ������� ���� ǥ���� ���ؼ���
--GROUP BY ���� �������� ����ؾ߸� �Ѵ�.
--�׷��� GRUOP BY���� ��õ� �÷��� SELECT ���� ������ �ʾƵ� �ȴ�.

SELECT department_id, job_id, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 50
-- �׷��Լ��� ������� ���� �Ϲ� Į����
GROUP BY department_id, job_id;

--ȸ�� �� �μ��� �μ��ڵ�, �޿��հ�, �޿����, �μ������� ��ȸ�Ͻÿ�
SELECT department_id, SUM(salary) sum_sal, ROUND(AVG(salary), 0) avg_sal, COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

--�� �μ���, �������� �μ��ڵ�, �����ڵ�, �޿���� ��ȸ
SELECT department_id, job_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id, job_id
-- ���� �μ��ڵ庰�� �������� ������ �� �� ���� ���� �ڵ庰�� �������� ����
ORDER BY 1;
--ORDER BY ���� �׻� �������� 

-- ȸ�� �μ��ڵ尡 10,20,30,40,60 �� �μ��� ���� ������� ������ �ľ�
-- �ش� �μ����� �μ��ڵ�, �μ�����, �μ��޿����
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id IN(10,20,30,40,60)
GROUP BY department_id;

--ȸ�� clerk ������ ������ �ϴ� ������� ������ �ľ�
-- ���� : clerk ������ �������� �����ڵ�, �����, ����� �޿� ��� ��ȸ
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%'
GROUP BY job_id;

-- �� GRUOP BY�� �����ϸ� �ߺ��� ���� ���ŵȴ�.

-- WHERE ������ ����ϴ� ������ HAVING ���� ����� ���� ������,
-- �׷��Լ��� ���Ե� ������ HAVING�������� ����� ���� �ִ�.
--WHERE : �Ϲ����Ǹ� ����
--HAVING : �Ϲ�����, �׷� �Լ� ���� ���� ��� ����
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING department_id IN(10,20,30,40,60);

--�� �μ����� �Ҽӵ� ����� ���� 5�� ������ �μ��� �� ���� ��ȸ
SELECT department_id, COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) <= 5
--HAVING ���� WHERE�� ���� ������� ��� X
ORDER BY 1;

--�� �μ��� ����� ���� ���� �ľ�
-- ���� : ��� ���� 10�� �̻��� �μ��� �μ��ڵ�, ��� ��, �޿� ���, �ִ�޿�, �����޿� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, 
               MAX(salary) max_sal, MIN(salary) min_sal 
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 10;



