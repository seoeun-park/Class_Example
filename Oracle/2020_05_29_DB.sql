SELECT *
FROM locations;

SELECT *
FROM locations
-- ���� �� null���� �ƴ� �ʵ带 ��ȸ
--WHERE state_province LIKE '%';
WHERE state_province IS NOT NULL;

--�μ� ��ġ�� ���� ����(�μ��ڵ尡 NULL��) �������
--���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;

--Ŀ�̼� ���� ��ȸ
SELECT commission_pct
FROM employees;

--Ŀ�̼��� �޴� ������� ���, ��, �μ��ڵ�, Ŀ�̼ǿ��� ��ȸ
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
--WHERE commission_pct <> NULL;

--80�� �μ��� ���, ��, �޿�, �μ��ڵ忡 ���� ���� ��������/������������ �����Ѵ�.
SELECT employee_id, last_name aa, salary, department_id
FROM employees
WHERE department_id = 80
--ORDER BY last_name ASC;
--ORDER BY last_name DESC;
--ORDER BY last_name;
--ORDER BY aa;
ORDER BY aa DESC;

--60�� �μ��� ���, ��, ������ ���� ������ ������������ �����Ѵ�.
--������ annual_salary�� ALIAS�Ѵ�.
SELECT employee_id, last_name, salary*12 annual_salary, department_id
FROM employees
WHERE department_id = 60
--ORDER BY annual_salary;
ORDER BY 3;


SELECT employee_id, last_name, salary*12 annual_salary, department_id
FROM employees
WHERE department_id = 60
ORDER BY 2, 3 DESC;

--������̺��� ���, ��, �޿�, �μ��ڵ带 ��ȸ�ϴµ�
--�μ��� ��������, ���޿��� �������� �����Ͽ� ��������� ��ȸ�Ѵ�
--department_id�� dept_id�� ALIAS
SELECT employee_id, last_name, salary, department_id dept_id
FROM employees
--ORDER BY 4, 3 DESC;
ORDER BY dept_id, salary DESC;
-- �μ��� ������������ ������ ����, ���� �μ��ڵ带 ���� ������� �޿��� ������������ ����

--���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
--�μ��ڵ� ��(��������), �޿� ������������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id DESC, salary DESC;
--null���� ������������ �����ϸ� �� �ڿ� ��ġ, ������������ �����ϸ� �� �տ� ��ġ

--���������� ���� ���� ��ġ�ϰ� �Ϸ��� NULLS FIRST �ɼ��� ����
--���������� ���� �������� ��ġ�ϰ� �Ϸ��� DESC NULLS LAST �ɼ��� ����
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id NULLS FIRST, salary DESC;

SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id DESC NULLS LAST, salary DESC;

---------------------------------------------------------------------------------------

--�������� 3-1
--��� ���̺��� �μ��ڵ尡 100, 110�� �μ��� ���� �������
--���, ����, �޿�, �μ��ڵ�, 15%�λ�� �޿� ��ȸ - �λ�� �޿��� ������ ǥ��
SELECT employee_id, first_name || ' ' || last_name name,  department_id,
                --ROUND(salary*1.15) "Increased Salary"
                --TRUNC(salary*1.15) "Increased Salary"
                --CEIL(salary*1.15) "Increased Salary"
                FLOOR(salary*1.15) "Increased Salary"   
FROM employees
WHERE department_id IN(100, 110);



