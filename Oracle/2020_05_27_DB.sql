--tblPanme ���̺�
CREATE TABLE tblpanme(
    code VARCHAR2(10),
    part VARCHAR2(20),
    price NUMBER
);

--���̺� �� ����
SELECT table_name
FROM user_tables;

--���ڵ� �Է�
INSERT INTO tblpanme(code, part, price)
VALUES ('001', 'A������', 3000);

INSERT INTO tblpanme
VALUES('002', 'B������', 6000);

INSERT INTO tblpanme
VALUES('003', 'C������', 2000);

INSERT INTO tblpanme
VALUES('004', 'D������', 5000);

INSERT INTO tblpanme
VALUES('005', 'C������', 1000);

INSERT INTO tblpanme
VALUES('002', 'D������', 4000);

SELECT
    *
FROM tblpanme;

--Ȯ��
COMMIT;

--�� �μ�(part)��(�׷캰�� ���, GROUP BY)�� �Ǹ� �ݾ�(price)�� �հ�(SUM(price))�� ���Ͽ� ��ȸ(���)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part;

--�� �μ�(part)��(�׷캰�� ���, GROUP BY)�� �Ǹ� �ݾ�(price)�� �հ�(SUM(price))�� ���Ͽ� ������������ ��ȸ(���)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
ORDER BY part;

--�� �μ�(part)��(�׷캰�� ���, GROUP BY)�� �Ǹ� �ݾ�(price)�� �հ�(SUM(price))�� ���Ͽ� ������������ ��ȸ(���)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
ORDER BY part DESC;

--�μ��� ������ ����� �˾ƺ���
SELECT COUNT(part)
FROM tblpanme;

--�μ��� ������ ����� �˾ƺ���(�ߺ��� �μ� ����)
SELECT COUNT(DISTINCT part)
FROM tblpanme;

UPDATE tblpanme
SET part='A������'
WHERE code=3;

UPDATE tblpanme
SET part='B������'
WHERE code=4;

--�� �μ����� �Ǹ� �ݾ��� ������ ���Ͽ� �μ��� ������������ �����Ͽ� ���
--��, �μ��� 2�� �̻� �ִ� �μ��� ������� �Ͻÿ� >  A������, B������
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
-- GROUP BY������ WHERE ���ǹ��� ���� X, ��� HAVING COUNT�� ����.
HAVING COUNT(part)>=2
ORDER BY part;

------------------------------------------------------------------------------hr�� ��ȯ

SELECT *
FROM employees;

--F5Ű : ������ ����� ���
--ctrl + enter : ���������� ����� ���

--employee_id(���)
SELECT employee_id
FROM employees;

--������̺��� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees;

--����鿡 ���� ���, �̸� ��, �μ����� �Ի�����, �����ڵ�, �޿� ��ȸ(�ۼ��� ������� ��ȸ)
SELECT employee_id,  first_name, last_name, department_id, job_id, salary
FROM employees;

--where ������ : Ư�� ���ǿ� �´� ���������� ��ȸ�ϰ��� �� ��
--where������ ALIASING(����) ��� x

--80�� �μ� ����� �� �� ���ȹ��� ������ ��ȸ
SELECT employee_id, last_name, salary*12
FROM employees
WHERE department_id=80;

--ALIAS�� ������ ���� ��� ������ �ֵ���ǥ(")�� ��ü�Ѵ�. ������ ������ �ֵ���ǥ ������ �����ϴ�.

SELECT employee_id, first_name, last_name, job_id, salary, salary*12 annual_salary
FROM employees
WHERE salary*12 >= 120000; --WHERE�������� ALIAS �Ұ���

--���ڿ� ���� ������ : || : SELECT ���� �������� ��밡��(SELECT������ ���� ���)

--����� 101���� ����� ���, ��, ���� ��ȸ
--������ �̸��� ���� ���ؼ� ����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE employee_id=101;

--������ StevenKing�� ����� ���, ����, �����ڵ�, �޿�, �μ��ڵ� ��ȸ
--������ �̸��� ���� ���ؼ� ����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, job_id, salary, department_id
FROM employees
--WHERE name = ' StevenKing';
WHERE  first_name || last_name = 'StevenKing';

SELECT employee_id, first_name || last_name name, department_id dept_id
FROM employees
--WHERE name = ' StevenKing';
WHERE  first_name || ' ' || last_name = 'Steven King';

--����� 101���� ����� ���, ������ ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�.
SELECT employee_id, first_name || last_name name
FROM employees
--WHERE name = 'StevenKing';
WHERE  first_name || ' ' || last_name = 'Steven King';


--����� 101���� ����� ����� �� �� ���� ���� �޿��� ��ȸ�Ѵ�.
--������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
--������ 'annual salary'�� �����Ѵ�.
SELECT first_name || ' ' || last_name name, salary*12 "annual salary"
FROM employees
WHERE employee_id=101;

--�޿��� 3000 ������ ����� ���, ��, �޿�, �μ��ڵ�, �����ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000;

--�μ��ڵ尡 80 �ʰ��� ����� ���, ��, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, lst_name, salary, department_id
FROM employees
WHERE department_id > 80;

--�μ��ڵ尡 90�� �μ��� ���� ������� ���, �̸�, ��, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id IN(90, 100);
--���ϴ� ����� �������� ��� IN���� ���� ���� ����

--�޿��� 17000�� ������� ���, �̸�, ��, �μ��ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary=17000;

--�޿��� 3000������ ������� ���, �̸�, ��, �����ڵ�, �޿�, �Ի糯¥ ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;

--�޿��� 15000�̻��� ������� ���, �̸�, ��, �����ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000;

--����, ��¥�� Ȭ����ǥ �ȿ��� ��� ǥ���ؾ� �Ѵ�.









