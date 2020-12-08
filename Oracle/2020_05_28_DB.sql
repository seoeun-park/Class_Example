--���� ��¥ ��ȸ, dual : ��¥ ������
SELECT SYSDATE
FROM dual;

--��¥ ������ ����Ͽ� ����ڰ� ���ϴ� ������ ���ڷ� �ٲ� ��ȯ
--SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') today
--SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD') today
--SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS') today
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') today
FROM dual;

--�⺻ ��¥ ������ ���� ����
ALTER SESSION
SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT SYSDATE
FROM dual;

ALTER SESSION
SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT SYSDATE
FROM dual;

--�Ի����� 2004�� 1�� 1�� ����(2003�����)�� ����� ����ڵ�, ��, �Ի����ڸ� ��ȸ
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE hire_date <= '2003-12-31';
--WHERE hire_date < '2004-01-01';
--WHERE hire_date <= '2003/12/31';
WHERE hire_date <= '03/12/31';

--�Ի����� 2003�� ������ ����� ����ڵ�, ��, �Ի����ڸ� ��ȸ
SELECT employee_id, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') <= 2003;

--30�� �μ� ��� �� �޿��� 10000 ������ ����� ����ڵ�, ����, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE department_id =30
AND salary <= 10000;

--30�� �μ����� �޿��� 10000�����̸鼭 2005�� ����(2004�����)�� �Ի��� �����
--�����ȣ, ����, �޿�, �μ��ڵ�, �Ի����ڸ� ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id, hire_date
FROM employees
WHERE salary <= 10000
AND department_id = 30
AND TO_CHAR(hire_date, 'YYYY') < 2005;

--�μ��ڵ尡 10�̻� 30������ ������� ���, ����, �μ��ڵ� ��ȸ
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
WHERE department_id >= 10
AND department_id <= 30;

--�޿��� 10000�̻� 15000������ ������� ���, ����, �޿�, �����ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, salary, job_id
FROM employees
WHERE salary >= 10000
AND salary <= 15000;

--�μ��� 60�� �μ����� �޿��� 5000�̻��� ������� ���, ����, �μ��ڵ�, �޿� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
WHERE department_id = 60
AND salary >= 5000;

--�μ��ڵ尡 60�����̸鼭 2003�� 6�� 17�� ������ �Ի��� ������� ���, ����, �Ի����� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, department_id, hire_date
FROM employees
WHERE department_id <= 60
AND hire_date <= '2003/06/17';

--30�� �μ��� 60�� �μ��� ���� ������� ����, �޿�, �μ��ڵ� ��ȸ
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE department_id = 30
OR department_id = 60;

--10��, 20��, 30�� �μ��� ���� ������� ����, �޿�, �μ��ڵ� ��ȸ
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE department_id = 10
OR department_id = 20
OR department_id = 30;

--30�� �μ��� �޿��� 10000�̸��� ����� 60�� �μ��� �޿��� 5000�̻��� ����� ����, �޿�, �μ��ڵ� ������ ��ȸ�Ѵ�.
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE (department_id = 30 AND salary < 10000)
OR (department_id = 60 AND salary >= 5000);
-- ������ �켱���� AND > OR

--BETWEEN ������ > ���ڵ�����, ���ڵ�����, ��¥�����͸� ����

--�����  110���� 120������(110�� �̻� 120�� ����)�� �����ȣ, ����, �޿� �μ��ڵ带 ��ȸ
SELECT employee_id,  first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE employee_id BETWEEN 110 AND 120;

--�μ��ڵ尡 10�̸� 40�ʰ��� ������� ���, ����, �μ��ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, department_id dept_id
FROM employees
WHERE department_id NOT BETWEEN 10 AND 40;

--����� 110���� 120�� ��� �� �޿��� 5000���� 10000������ �����ȣ, ���� �޿�, �μ��ڵ带 ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE (employee_id BETWEEN 110 AND 120)
AND (salary BETWEEN 5000 AND 10000);

--2005�� 1�� 1�� ���ĺ��� 2007�� 12�� 31�� ���̿� �Ի��� ����� ���, ����, �޿� �Ի����� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, salary, hire_date
FROM employees
--WHERE hire_date BETWEEN TO_DATE( '2005/01/01') AND TO_DATE('2007/12/31'); --����� ����ȯ(���� > ��¥)
WHERE hire_date BETWEEN  '2005/01/01' AND '2007/12/31';  --������ ����ȯ

--�Ի����ڰ� 2003�� 8�� 1�Ϻ��� 2005�� 7�� 31�Ͽ� �ش��ϴ� ������� ���, ����, �Ի����� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name,  hire_date
FROM employees
WHERE hire_date BETWEEN '03/08/01' AND '05/07/31';

--�μ��ڵ尡 20, 30, 40, 60, 100�� ������� ���, ����, �μ��ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name,  department_id dept_id
FROM employees
WHERE department_id IN(20, 30, 40, 60, 100);

--30�� �μ��� �Ǵ� 60�� �μ��� �Ǵ� 90�� �μ��� �̿��� ���, ���� �޿�, �μ��ڵ带 ��ȸ
SELECT employee_id, first_name || ' ' || last_name name,  salary, department_id dept_id
FROM employees
WHERE department_id NOT IN(30, 60, 90);

-- % : ���� ���� ���ڿ�, � ���ڰ� ��� ���� �� ������
-- _ : �ϳ��� ����, �ϳ��� ���ڰ� � ���ڰ� ���� �� ������

--�̸��� K�� ���۵Ǵ� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'K%';

--�̸��� s�� ������ �̸��� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '%s';

--���� z�� ���Ե� ���� ���� ������� ���, �̸� �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%';

--��ҹ��ڰ� �����ϰ� ���� z�� ���Ե� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%'
OR last_name LIKE '%Z%';

--���� ��ҹ��� �����ϰ� Z�� ���Ե� ������ ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || last_name LIKE '%z%'
OR first_name || last_name LIKE '%Z%';

--���� �ҹ��� z�� �տ��� 2��°�� ��ġ�� �ִ� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '_z%';

--���� �ҹ��� z�� �տ��� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '____z%';

--���� �ҹ��� z�� �ڿ��� 5��°�� ��ġ�� �ִ� ���� ���� ������� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '%z____';

--������� ��������(�����ڵ�)�� �ľ��ϰ��� �Ѵ�.
--�����ڵ尡 _A�� ������� ���, ��, �����ڵ带 ��ȸ
-- ���� ���, FI_ACCOUNT, AD_ASST, AC_ACCOUNT
SELECT employee_id, last_name, job_id
From employees
WHERE job_id LIKE '%@_A%' escape '@';
-- _�� �����ڰ� �ƴ� ���ڷ� ����ϱ� ���ؼ��� escape �����ڸ� ����


