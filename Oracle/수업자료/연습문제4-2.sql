-----------------------------------------------------------------------------------------------
--�ǽ�
--01. ���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--���� ��ҹ��� �����ϰ� z�� ���Ե� ���� ���� ������� ���� ��ȸ�Ͻÿ�.

SELECT COUNT(*) cnt
FROM employees
WHERE LOWER(last_name) LIKE '%z%';

--02. �츮ȸ�� ����� �ְ�޿��� �����޿� �� �޿����� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �ְ�޿��� �����޿��� �޿����� ��ȸ�Ͻÿ�.

SELECT MAX(salary)-MIN(salary) diff
FROM employees;

--03. �츮ȸ�翡 �Ŵ����� �ִ� ������� ���� �ľ��ϰ��� �Ѵ�.
--�츮ȸ�� �Ŵ����� ������� ���� ��ȸ�Ͻÿ�.

SELECT COUNT(DISTINCT(manager_id)) cnt
FROM employees;

--04. �츮ȸ�� account ������ �ϴ� ������� �޿���ո� ��ȸ�Ͻÿ�.
--�Ҽ����� 2�ڸ����� ���Ͻÿ�.

SELECT ROUND(AVG(salary),2) avg_sal
--SELECT TO_CHAR(AVG(salary),'999,999.99') avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

-----------------------------------------------------------------------------------------------
--[�������� 4-2]
--01. �츮ȸ�� ����� �� Ŀ�̼��� �޴� ������� ��� ������� �ľ��ϰ��� �Ѵ�.
--Ŀ�̼��� �޴� ����� ���� ��ȸ

SELECT COUNT(*) cnt
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT COUNT(commission_pct) cnt
FROM employees;

--02. �츮ȸ�� ����� �� ���� ����/���߿� �Ի��� ����� �Ի����� ��ȸ

SELECT MIN(hire_date) min_hire_date, MAX(hire_date) max_hire_date
FROM employees;




--03. �츮ȸ�� �μ��ڵ� 90���� �μ��� ���� ������� �޿���� ��ȸ

SELECT ROUND(AVG(salary),2) avg_sal
FROM employees
WHERE department_id = 90;

-----------------------------------------------------------------------------------------------
--01. �츮ȸ�� ������� ���, ��, �μ��ڵ�, �޿� ��ȸ�Ͽ� �μ��ڵ� ������ �����Ѵ�.

SELECT employee_id, last_name, department_id dept_id, salary 
FROM employees
ORDER BY dept_id;


--02. �μ��ڵ� 50�� �μ��� �޿���ո� ��ȸ
SELECT ROUND(AVG(salary),2) avg_sal 
FROM employees
WHERE department_id = 50;

----------------------------------------------------------------------------------------------