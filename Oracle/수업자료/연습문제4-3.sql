-----------------------------------------------------------------------------------------------
--[�������� 4-3]
--01. ������̺��� �Ȱ��� �̸�(first_name)�� �� �̻� �ִ� �̸��� �� �̸��� ��� �� �������� 
--��ȸ�ϴ� �������� �ۼ��Ѵ�. 

SELECT first_name, COUNT(*) cnt
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2;

--02. �μ���ȣ, �� �μ��� �޿��Ѿװ� �޿���ո� ��ȸ�ϴ� �������� �ۼ��Ѵ�. 
--��, �μ� �޿������ 8000 �̻��� �μ��� ��ȸ�ǵ��� �Ѵ�.

SELECT department_id, SUM(salary) sum_sal, ROUND(AVG(salary),0) avg_sal
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary),0) >= 8000;

--03. �⵵���� �Ի��� ������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, �⵵�� 2014 �� ���·� ǥ��ǵ��� �Ѵ�.

SELECT TO_CHAR(hire_date,'YYYY') hire_date, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 1;

-----------------------------------------------------------------------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

--�ǽ�
--01. �츮ȸ�� ������� ��������(�����ڵ�)�� ��� ���� �ľ��ϰ��� �Ѵ�.
--��������(�����ڵ�), ����� ��ȸ

SELECT job_id, COUNT(*) cnt
FROM employees
GROUP BY job_id;

--02. �μ��� �޿� ������ �ľ��ϰ��� �Ѵ�.
--�μ��ڵ�, �޿���� ��ȸ- �޿������ ���� �μ����� �����ϰ�
--�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.

SELECT department_id, ROUND(AVG(salary),2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 2 DESC;

--03. �μ���, ������ �޿��հ踦 �ľ��ϰ��� �Ѵ�.
--�μ��ڵ�, �����ڵ�, �޿��հ� ��ȸ

SELECT department_id, job_id, SUM(salary) sum_sal
FROM employees
GROUP BY department_id, job_id;

--04. �μ��ڵ� 60�� �μ��� ���� ������� ��� ���� �ľ��ϰ��� �Ѵ�.
--60 �� �μ��� ���� ������� ��� ���� ��ȸ(HAVING �� ���)

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
ORDER BY 1;

--05. �μ��� �޿������ 10000 �̻��� �μ��� �ľ��ϰ��� �Ѵ�.
--�μ��� �޿������ 10000�̻��� �μ��ڵ�, �޿���ո� ��ȸ
--�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.

SELECT department_id, ROUND(AVG(salary),2) avg_sal
FROM employees
GROUP BY department_id 
HAVING ROUND(AVG(salary),2) >= 10000;


--06. �� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ

SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary),2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

--07. 100�� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
--100�� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ

SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary),0) avg_sal
FROM employees
GROUP BY department_id;
HAVING department_id = 100;

--08. �� �μ��� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ������� 15�� �̻��� �μ��� ���� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ

SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 15;

--09. �� �μ��� �μ��޿������ 8000 �̻��� �μ��� ����
--�μ��ڵ�, �μ�����, �μ��޿���� ��ȸ

SELECT deparment_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING ROUND(AVG(salary)) >= 8000;

--10. �� �μ��� �ִ�޿��� �ľ��ϰ��� �Ѵ�. 
-- �� �μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �ִ�޿��� ��ȸ. 

SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
HAVING MAX(salary) >= 10000;

--11. �� �� �̻� �ִ� ���� � �͵��� �ֳ� �ľ��ϰ��� �Ѵ�. 
--�� �� �̻� �ִ� ����, ���� ��ȸ

SELECT last_name, COUNT(*) cnt
FROM employees
GROUP BY last_name
HAVING COUNT(*) >= 2;

--12. �⵵��(��������)�� �Ի��� ��� ���� �ľ��ϰ��� �Ѵ�. 
--�⵵, ��� �� ��ȸ - �⵵�� 2020�� ���·� ǥ��

--2001	  1
--2002	  7
--2003	  6
--2004	 10
--2005	 29
--2006	 24
--2007	 19
--2008	 11

SELECT TO_CHAR(hire_date,'YYYY') hire_date, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY')
ORDER BY 1;

--13. �� �μ����� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ��ڵ�, �μ�����, �μ��޿����, �μ��ְ�޿�, �μ������޿� ��ȸ

SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY department_id;

--14. �� �������� ������ �ľ��ϰ��� �Ѵ�.
--�� ������ �����ڵ�, �����ϴ»����, �����޿����, �����ְ�޿�, ���������޿� ��ȸ

SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY job_id;

--15. �� �μ��� �μ��� �������� �μ��ڵ�, �����ڵ�, �����, �޿���� ��ȸ

SELECT department_id, job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id, job_id

-----------------------------------------------------------------------------------------------