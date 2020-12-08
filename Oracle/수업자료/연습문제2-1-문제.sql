-----------------------------------------------------------------------------------------------
--�ǽ�
--01. �μ��ڵ� 30, 40, 60�� �μ��� ���� �������
--���, ����, �μ��ڵ�, �޿��� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
WHERE department_id IN(30, 40, 60)
ORDER BY name;


--02. Ŀ�̼��� �޴� ������� ���, ����, �޿�, Ŀ�̼ǿ����� ��ȸ�Ͽ�
--Ŀ�̼ǿ����� ���� ������� ���� ��������� �����Ѵ�.
SELECT employee_id,first_name || ' ' || last_name name, salary, commission_pct
FROM employees
ORDER BY commission_pct DESC NULLS LAST;

--03. ���� ��/�ҹ��� �����ϰ� z �� �ִ� �������
--���, ���� �� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || ' ' || last_name LIKE '%z%'
OR first_name || ' ' || last_name LIKE '%Z%';

-----------------------------------------------------------------------------------------------
--[�������� 2-1]
--01. ����� 200�� ����� ����� �μ��ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
WHERE employee_id = 200;


--02. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� ���, ����, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. 
--���� ��� �̸��� John �̰� ���� Seo �̸�  John Seo �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name || ' ' || last_name name, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 15000;



--03. �μ��ڵ� 30�� 60 �� �Ҽӵ� ����� ���, ����, �μ��ڵ�, �޿��� ��ȸ�ϴµ�, 
--������ ���ĺ������� �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
ORDER BY name;


--04. �޿��� 3000���� 15000 ���� �̸鼭, �μ��ڵ� 30 �Ǵ� 60�� �Ҽӵ� ����� 
--���, ����, �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--(��, ��ȸ�Ǵ� �÷����� �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���� name ����,
--�޿��� Monthly Salary �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 15000
--NULL ���� �����ϴ� ���ǽ��� �����ϸ� �տ��� �ۼ��ϴ� ���� ����
AND department_id IS NOT NULL
OR department_id = 30
OR department_id = 60;



--05. �Ҽӵ� �μ��ڵ尡 ���� ����� ���, ����, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, job_id, department_id
FROM employees
WHERE department_id IS NULL;


--06. Ŀ�̼��� �޴� ����� ���, ����, �޿�, Ŀ�̼��� ��ȸ�ϴµ�, 
--Ŀ�̼��� ���� ������� ���� ��� ������ �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY commission_pct DESC;

--07. ���� ��ҹ��� ���о��� ���� z �Ǵ� Z �� ���Ե� ����� ����� ����(name)�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || ' ' || last_name LIKE '%z%'
OR first_name || ' ' || last_name LIKE '%Z%';

-----------------------------------------------------------------------------------------------




