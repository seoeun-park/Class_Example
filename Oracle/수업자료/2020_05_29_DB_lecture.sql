8. ������ ���� ���� ������ ǥ�� : NULL - �񱳺Ұ�, �������Ұ�
�׷���, �÷�ǥ�� IS NULL/IS NOT NULL �� �Ǵ� �� NULL ���� �ƴ��� �ľ�

SELECT *    --23����
FROM locations;

SELECT *    --17����
FROM locations
WHERE state_province LIKE '%';

--�Ʒ��� ����
SELECT *    --17����
FROM locations
WHERE state_province IS NOT NULL;

01. �μ���ġ ���� ����(��, �μ��ڵ尡 NULL ��) ������� 
���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;--�μ��ڵ尡 NULL;
--WHERE department_id IS NOT NULL;--�μ��ڵ尡 NULL �� �ƴ�;

SELECT commission_pct
FROM employees;

02. Ŀ�̼��� �޴� ������� 
���, ��, �μ��ڵ�, Ŀ�̼ǿ��� ��ȸ
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL; --Ŀ�̼��� �޴�

2.4 �������� ���� - ORDER BY �� : �������� ���� �������� ��ġ
ORDER BY ���ı���ǥ�� + ��������(default) ASC /�������� DESC
***���ı���ǥ�� : �÷�ǥ�� �״��, ALIAS�� ����, SELECT ��Ͽ����� ��ġ(�÷���ȣ)
SELECT �� 
FROM ��
WHERE ��
ORDER BY ��;

���α׷��󿡼��� ���� �� ����(��, DB������ �����ؼ� ���α׷����� �ѱ�)

01. 80�� �μ��� ���, ��, �޿�, �μ��ڵ庸�� ���� ���� ��������/������������ �����Ѵ�.
SELECT employee_id, last_name, salary, department_id dept_id
FROM employees 
WHERE department_id = 80
ORDER BY last_name ASC;
--ORDER BY last_name DESC;

ORDER BY ���� ALIAS�� ����Ͽ� ������ �� �ִ�.

02. 60�� �μ��� ���, ��, ��޿�(����)�� ���� ��޿�(����)�� �������� ������������ �����Ѵ�.
������ annual_salary�� ALIAS�Ѵ�.
SELECT employee_id, last_name, salary*12 annual_salary 
FROM employees 
WHERE department_id = 60 
ORDER BY annual_salary; --ALIAS ����

ORDER BY ���� �÷��� ��ġ(��, ���� ��ȣ)�� ����Ͽ� ������ �� �ִ�.

03. ������̺��� ���, ��, �޿�, �μ��ڵ带 ��ȸ�ϴµ� 
�μ��� ��������, ���޿��� �������� �����Ͽ� ��������� ��ȸ�Ѵ�.
department_id�� dept_id�� ALIAS
SELECT employee_id, last_name, salary, department_id dept_id
FROM  employees 
ORDER BY dept_id, 3 DESC;

04. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, �� ������������ �����Ѵ�.
SELECT employee_id, last_name name, department_id, salary, hire_date
FROM employees
ORDER BY 2 DESC;
--ORDER BY last_name DESC;
--ORDER BY name DESC;

05. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ, 
�μ� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id ASC;

06. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�Ի����� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY 5;
--ORDER BY hire_date;

07. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�޿� ������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY salary;

�� ORDER BY ���ı���1 ����/����, ���ı���2 ����/����, ...

08. ���, ��, �μ��ڵ�, �޿�, �Ի����� ��ȸ
�μ��ڵ� ��, �޿� ������������ �����Ѵ�.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id, 4 DESC;

NULL �� �������������� ������ ������ ����, ���������� ���� �켱������ ���� 
���������� ���� ���� �տ� ��ġ�ϰ� �Ϸ��� ASC  NULLS FIRST �ɼ��� ����
���������� ���� �������� ��ġ�ϰ� �Ϸ���  DESC NULLS LAST  �ɼ��� ����

SELECT *
FROM locations
ORDER BY state_province;
--ORDER BY state_province DESC;
--ORDER BY state_province NULLS FIRST;
--ORDER BY state_province DESC NULLS LAST;

-----------------------------------------------------------------------------------------------
�ǽ�
01. �μ��ڵ� 30, 40, 60�� �μ��� ���� �������
���, ����, �μ��ڵ�, �޿��� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary
FROM employees        
WHERE department_id IN (30,40,60)  --�μ��ڵ� 30,40,60�� �μ��� ����
ORDER BY 2; 
--ORDER BY name;
--ORDER BY first_name || ' ' || last_name;

02. Ŀ�̼��� �޴� ������� ���, ����, �޿�, Ŀ�̼ǿ����� ��ȸ�Ͽ�
Ŀ�̼ǿ����� ���� ������� ���� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, 
       salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL --Ŀ�̼��� �޴� �����
ORDER BY 4 DESC;
--ORDER BY commission_pct DESC;

03. ���� ��/�ҹ��� �����ϰ� z �� �ִ� �������
���, ���� �� ��ȸ�Ͽ� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name|| ' ' ||first_name LIKE '%z%'
ORDER BY name; --���� ��/�ҹ��� �����ϰ� z �� �ִ�

-----------------------------------------------------------------------------------------------
[�������� 2-1]
01. ����� 200�� ����� ����� �μ��ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT first_name || ' ' || last_name name, department_id
FROM employees
WHERE employee_id = 200;

02. �޿��� 3000���� 15000 ���̿� ���Ե��� �ʴ� ����� 
���, ����, �޿� ������ ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���ļ� ��ȸ�Ѵ�. 
���� ��� �̸��� John �̰� ���� Seo �̸�  John Seo �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name || ' ' || last_name name, salary
FROM employees
--WHERE salary NOT BETWEEN 3000 AND 15000;
WHERE salary <3000 OR salary>15000;

03. �μ��ڵ� 30�� 60 �� �Ҽӵ� ����� 
���, ����, �μ��ڵ�, �޿��� ��ȸ�ϴµ�, 
������ ���ĺ������� �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
--WHERE department_id in (30,60)
WHERE department_id = 30 OR department_id = 60
ORDER BY name;

04. �޿��� 3000���� 15000 ���� �̸鼭, �μ��ڵ� 30 �Ǵ� 60�� �Ҽӵ� ����� 
���, ����, �޿��� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
(��, ��ȸ�Ǵ� �÷����� �̸��� ���� �̸��� ���鹮�ڸ� �ξ� ���� name ����,
�޿��� Monthly Salary �� ��ȸ�ǵ��� �Ѵ�.)
SELECT employee_id, first_name || ' ' || last_name name, salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 3000 AND 15000 AND department_id IN (30, 60);

05. �Ҽӵ� �μ��ڵ尡 ���� ����� 
���, ����, �����ڵ带 ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, job_id
FROM employees
WHERE department_id IS NULL;

06. Ŀ�̼��� �޴� ����� ���, ����, �޿�, Ŀ�̼��� ��ȸ�ϴµ�, 
Ŀ�̼��� ���� ������� ���� ��� ������ �����Ͽ� ��ȸ�ϴ� �������� �ۼ��Ѵ�. 
SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM employees 
WHERE commission_pct IS NOT NULL
--WHERE NOT commission_pct IS NULL
ORDER BY commission_pct DESC;

07. ���� ��ҹ��� ���о��� ���� z �Ǵ� Z �� ���Ե� ����� 
����� ����(name)�� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || ' ' || last_name LIKE '%z%' 
OR first_name || ' ' || last_name LIKE '%Z%';

-----------------------------------------------------------------------------------------------