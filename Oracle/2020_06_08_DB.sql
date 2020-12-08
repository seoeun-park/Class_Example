--PK(Primary Key) : ���̺��� ���ڵ带 ������ �� �ִ� �ּ��� �÷�(UNIQUE, NOT NULL)
                                 --ex) �ֹι�ȣ, �й�, �����ȣ �� ������ ���� ������ �÷�
--FK(Foriegn Key) : �ٸ� ���̺��� PK�� �����ϴ� �÷�
--PK�� �θ�, FK�� �ڽİ���� �� �� �ִ�.

--JOIN
--�ϳ��� ���̺�κ��� �����͸� ��ȸ�� �� ���� ���
--���� ���� ���̺�κ��� �����͸� ��ȸ�ϴ� ����� JOIN�̶�� �Ѵ�.

--�μ� ������ ������ �ִ� ���̺� : departments
SELECT *
FROM departments;       --27��

--��� ������ ������ �ִ� ���̺� : employees
SELECT *
FROM employees;         --107��

--���� ������ ������ �ִ� ���̺� : jobs
SELECT *
FROM jobs;                   --19��

--CARTESIAN PRODUCT
--WHERE ���� JOIN ������ �������

--���, ��, �μ���(depatment_name�� departments�� ����) ��ȸ
SELECT employee_id, last_name, department_name
FROM employees, departments;            
--2889�� -> employees(107) * departments(27) : cartesian product
--���⼭ ,�� JOIN�� �ǹ���

--EQUI JOIN(ANSI������ INNER JOIN)
--WHERE ���� ���� ������(=)�� ����ϴ� JOIN �����̴�
--��, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

--JOIN ���� > �÷��� ���� ���� Į���� ���� �������ǽ� ����('���̺��.�÷��� = ���̺��,�÷���'�� ���)
--Table = Entity
--���̺��� ���赵 : Entit Relationship Diagram(ERD)

--���̺� ���� ����
--1. FROM ���� ���̺� ����� �����ϸ�, ���̺�� ALIAS�� �����Ѵ�.
--2. ���������� WHERE���� �ۼ��Ѵ�.
--      WHERE �������ǽ�(���̺��.�÷��� = ���̺��,�÷���)
--      AND �Ϲ����ǽ�
--      ������ ���x

--01. ���, ��, �μ���(depatment_name�� departments�� ����) ��ȸ : JOIN ���ǽ��� �̿��Ͽ� ��ȸ�Ͻÿ�.
--SELECT e.employee_id, e.last_name, d.department_name
SELECT employee_id, last_name, department_name
FROM employees e, departments d     --ALIAS
WHERE e.department_id = d.department_id;      --106��
-- ���� ���ǽ� : ���̺��.�÷��� = ���̺��.�÷���
--deparment_id -> departments, employees

-- �÷����� �����ϸ� ALIAS�� ���� �ʾƵ� ������ �÷����� �ߺ��� ���,
--�ش� �÷��� ���ԵǾ��ִ� ���̺��� ALIAS�� �ٿ��־���Ѵ�.
SELECT employee_id, last_name, department_name, e.department_id
FROM employees e, departments d     --ALIAS
WHERE e.department_id = d.department_id;

--02. employees, departments ���̺��� ����Ͽ�
--������� ���, �� �μ��ڵ�, �μ� �� ������ ��ȸ
SELECT employee_id, last_name, d.department_id, department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--03. employees, jobs ���̺��� ����Ͽ�
--���, ��, �����ڵ�, ���� ���� ��ȸ
SELECT employee_id, last_name, e.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--04. employees, department, jobs ���̺��� ����Ͽ�
--���, ��, �μ���, ���� ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;
--employees�� ���̺� ������ 107�� /departments�� ���̺� ������ 27�� / jobs�� ���̺� ������ 19��
--106���� ������ ������? null���� �����ϱ� ������ 107 - 1�� �ȴ�.

--05. employees, departments, jobs ���̺��� ����Ͽ�
--���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT e.employee_id, e.last_name, e.department_id, d.department_name, j.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

--06. employees, departments, jobs ���̺��� ����Ͽ�
--����� 101���� ����� ���, �̸�, �μ���, �������� ������ ��ȸ
SELECT e.employee_id, e.first_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id = j.job_id
AND e.department_id = d.department_id
AND e.employee_id = 101;

--07. employees, departments ���̺��� ����Ͽ�
--����� 100, 120, 130, 140 �������
--���, �� �μ��ڵ� �μ����� ��ȸ�Ͻÿ�
SELECT e.employee_id, e.last_name, d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN(100,120,130,140);

--08. �Ŵ����� ���� ����� ���, �̸�, ���������� ��ȸ�Ѵ�.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;

----------------------------------------------------------------------------------------------
--�ǽ�

--01. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� ������� 
--���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';


--02. Ŀ�̼��� �޴� ������� 
--���, ��, �޿�, Ŀ�̼ǿ���, �������� ��ȸ
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.commission_pct IS NOT NULL;


--03. Ŀ�̼��� �޴� ������� 
--���, ��, �޿�, Ŀ�̼Ǳݾ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, e.salary, 
               (NVL(e.commission_pct, 0) * e.salary) com,
               d.department_name
FROM employees e, departments d
WHERE e.commission_pct IS NOT NULL;


--04. �� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
--�� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM locations l, departments d
WHERE d.location_id = l.location_id;


--05. ���, ��, �μ��ڵ�, �μ���, �ٹ������ø�, �ּ� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
                l.city, l.street_address
FROM employees e, departments d, locations l;


--06. ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ  --���������� table���� -1 ��ŭ �ʿ�!!
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               j.job_id, j.job_title 
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;


--07. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, ������, ����� ��ȸ 
SELECT d.department_id, d.department_name, 
                l.location_id, l.city, l.country_id, 
                c.country_name, r.region_name
FROM locations l, departments d, countries c, regions r
WHERE d.location_id = l.location_id
AND c.country_id = l.country_id
AND c.region_id = r.region_id;



