-- SET
--UNION : ���տ��� �����տ� �ش��ϴ� �����ڷ� �ߺ��� ������ ���� ����� ��ȯ�Ѵ�.

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
UNION
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;                  --2�� �ุ ���

--����[7-2] �����ǰ� �ִ� �μ�, �����ǰ� �ִ� ���� ������ ��ȸ�Ѵ�.
SELECT department_id code, department_name name
FROM departments
UNION
SELECT location_id, city
FROM locations;

--���� ����
DESC locations;
DESC countries;

--�����ǰ� �ִ� ����, �����ǰ� �ִ� ���� ������ ��ȸ�Ѵ�.
SELECT TO_CHAR(location_id) code, city name
FROM locations
UNION
SELECT country_id, country_name
               --country_id�� CHAR(2 BYTE)
FROM countries;

--UNION ALL
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
UNION ALL
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;      --3�� �� ���

--INSERT
--���տ����� �����տ� �ش��ϴ� �����ڷ� ����� ���� ����� ��ȯ
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
INTERSECT
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;


SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
INTERSECT
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
INTERSECT
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;      --�ƹ� �͵� ��µ��� ����

--80�� �μ��� 50�� �μ��� �������� �ִ� ����� �̸��� ��ȸ
SELECT first_name       --���������� ��ȸ�ϸ� 34�� ��ȸ(David, Peter 2��)
FROM employees
WHERE department_id = 80
INTERSECT
SELECT first_name       --���������� ��ȸ�ϸ� 45�� ��ȸ(James, Julia, Kevin, Randall�� 2��)
FROM employees
WHERE department_id = 50;

----------------------------------------------------------------------------
--MINUS : ���տ����� �����տ� �ش�

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
MINUS
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;

--80�� �μ����� �̸����� 50�� �μ��� �������� �����ϴ� �̸��� ����
SELECT first_name
FROM employees
WHERE department_id = 80
MINUS
SELECT first_name
FROM employees
WHERE department_id = 50;       --34 - 4(Jonh 1�� Peter 2��, ���� ���̺� David 2���̹Ƿ� 1���� ���� )

--150�� ���� �μ����� �̸����� �����ڵ尡 ST_CLERK�� �μ����� �̸��� ����
SELECT employee_id, first_name, job_id
FROM employees
WHERE employee_id <= 150
MINUS
SELECT employee_id, first_name, job_id
FROM employees
WHERE job_id = 'ST_CLERK';

--���(EMP), �̸�(NAME), �μ���(DEPT), �Ŵ�������(MANAGER), �޿�(SALARY)
--�Ŵ��� ���δ� �Ŵ����� �ش��ϴ� ����� Manager�� ǥ���ϰ�
--�Ŵ����� �ƴ� ����� Null�� ǥ�õǰ� �Ѵ�.
SELECT e.employee_id emp, e.first_name || ' ' || e.last_name name,
               d.department_name dept, NVL2(e.manager_id, 'Manager', '') manager,
               e.salary salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-------------------------------------------------------------------------------------------------------------
--DML : INSERT, UPDATE, DELETE
-- + TCL : COMMIT(�۾� Ȯ��), ROLLBACK(�۾� ���)

DESC departments;

--�μ� ���̺� ���ο� �μ��� ����Ѵ�
--�μ� �ڵ� : 300, �μ��� : ������, �μ����� : NULL, ��ġ�ڵ� : NULL
INSERT INTO departments
VALUES (300, '������', NULL, NULL);

SELECT *
FROM departments
ORDER BY 1 DESC;

COMMIT;

INSERT INTO departments
VALUES (310, '���ߺ�', '', '');

SELECT *
FROM departments
ORDER BY 1 DESC;

--��� �������� �⺻ ��(DEFAULT)�� NULL�̴�.
INSERT INTO departments
VALUES (320, '������', DEFAULT, DEFAULT);

ROLLBACK;
--COMMIT �ϱ� ������ ���� ���

SELECT *
FROM departments
ORDER BY 1 DESC;

---------------------------------------------------------------------------------------------
-- NOT NULL�� ���� ������ ���� �־��־�� �Ѵ�.

-- �μ� ���̺��� ���ο� �μ��� ��������
DELETE FROM departments
WHERE department_id = 300;

INSERT INTO departments (department_id, department_name)
VALUES (300, '���ߺ�');

--��� ���̺��� ���ο� ����� ��������

DESC employees;         --NOT NULL Ȯ��

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date,
                                            job_id, salary, department_id)
VALUES (301, '�浿', 'ȫ', 'gildong', '10/10/10', 'MK_REP', 3000, 300);

COMMIT;

SELECT *
FROM employees
ORDER BY 1 DESC;

-----------------------------------------------------------------------------------
DESC departments;
--NOT NULL�� ��(department_id, department_name)


-------------------------------------------------------------------------------------
--ITAS
--���� ���� �ѹ��� ���� ���� : �׽�Ʈ�� ������
SELECT *
FROM departments;

INSERT INTO departments
SELECT department_id + 1, department_name, manager_id, location_id
FROM departments;

SELECT *
FROM departments;

ROLLBACK;

SELECT *
FROM departments;

-------------------------------------------------------------------------------------------------------
--CTAS(Create Table As Select) : NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE department_id = 60;

SELECT *
FROM emp60;

DROP TABLE emp60;   --���������� �̵�

SELECT *
FROM RECYCLEBIN;        --������ ��ȸ

FLASHBACK TABLE emp60 TO BEFORE DROP;

DROP TABLE emp60;

PURGE RECYCLEBIN;       --������ ����

--������ ���� : �׻� ������ ���ǽ� �ۼ�
CREATE TABLE emp AS
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE 1 = 2;

DESC emp;       --������ ����

--emp ���̺� ������ ���� �����Ѵ�
--employees ���̺��� 10��, 20�� �μ������� ������ �����Ͽ�
--emp ���̺� ���� �����Ѵ�.
INSERT INTO emp
SELECT employee_id, last_name, first_name, hire_date,
               job_id, department_id
FROM employees
WHERE department_id IN (10, 20);

SELECT *
FROM emp;

---------------------------------------------------------------------------------------
--UPDATE : �������� �������� �ʵ��� �����Ѵ�.

SELECT *
FROM emp;

--emp ���̺��� id�� 202�� ����� �μ��ڵ带 30����, �����ڵ带 programmer�� �����Ѵ�.
UPDATE emp
SET job_id = 'programmer', dept_id = 30
WHERE employee_id = 202;

SELECT *
FROM emp;

--emp ���̺��� id�� 202�� ����� �����ڵ带 PU_CLERK�� �����Ѵ�
UPDATE emp
SET job_id = 'PU_CLERK'
WHERE employee_id = 202;

SELECT *
FROM emp;

--emp ���̺��� id�� 202�� ����� �μ��ڵ带 null�� �����Ѵ�
UPDATE emp
SET dept_id = ''
WHERE employee_id = 202;

SELECT *
FROM emp;

-------------------------------------------------------------------------------------------------
--���������� �������� ����

--emp ���̺��� �μ���ġ ���� ���� �������
--�μ��ڵ带 employees ���̺��� ���� �ڵ尡 'AD_PRES'�� ����� �μ��ڵ�� �����Ѵ�.
UPDATE emp
SET dept_id = (SELECT department_id
                           FROM employees
                           WHERE job_id = 'AD_PRES')
WHERE dept_id IS NULL;

SELECT *
FROM emp;

COMMIT;

--employees ���̺��� 301�� ����� �޿��� 4000���� �̸��� ��ġ, ���� ������ �����Ѵ�
UPDATE employees
SET salary = 4000, last_name = '��', first_name = '��ġ' 
WHERE employee_id = 301;

SELECT *
FROM employees
ORDER BY 1 DESC;

--partition by
