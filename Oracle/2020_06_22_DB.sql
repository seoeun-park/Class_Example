--employees ���̺� ���ο� ��������� ���� ��������
--300�� �μ����� �޿��� employees ���̺��� 60�� �μ��� ��ձ޿��� ��������
SELECT ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 60;

INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300, '�浿', 'ȫ', 'hong@naver.com', SYSDATE, 'IT_PROG', (SELECT ROUND(AVG(salary)) avg_sal
                                                                                                        FROM employees
                                                                                                        WHERE department_id = 60));
                                                                                                        
COMMIT; 



--emp ���̺��� 202�� ����� �Ի����ڸ�
--���÷κ��� 6���� �� ��¥�� �����Ѵ�
SELECT *
FROM emp;

--emp ���̺��� 202�� ����� �Ի����ڸ�
--���÷κ��� 6���� �� ��¥�� �����Ѵ�.
UPDATE emp
SET hire_date = ADD_MONTHS(SYSDATE,-6)
WHERE id = 202;

SELECT *
FROM emp;

COMMIT;

--emp ���̺��� 200�� ����� ����
--employees ���̺��� 60�� �μ����� �� �ֱ� �Ի��� ����� �Ի����ڷ� �����Ѵ�
SELECT MAX(hire_date) max_hire
FROM employees
WHERE department_id = 60;

UPDATE emp
SET hire_date = (SELECT MAX(hire_date)
                            FROM employees
                            WHERE department_id = 60)
WHERE id = 200;

SELECT *
FROM emp;

COMMIT;

---------------------------------------------------------------------------------------
--DELETE FROM ���̺��
--WHERE ������;

SELECT *
FROM employees;

DELETE FROM employees
WHERE employee_id = 300;

COMMIT;

SELECT *
FROM departments;
--f5Ű : �������� ���


--departments ���̺��� 300�� �μ��� ��������
DELETE FROM departments
WHERE department_id = 300;
--���Ἲ ���� ���� ����(����)

-- employees ���̺��� ���� ������ �� departments ���̺��� �ٽ� �����ؾ��Ѵ�.
DELETE FROM employees
WHERE department_id = 300;
DELETE FROM departments
WHERE department_id = 300;

COMMIT;

--emp ���̺��� 20�� �μ������� ������ �����Ѵ�,
DELETE FROM emp
WHERE dept_id = 20;

SELECT *
FROM emp;

-----------------------------------------------------------------------------------------------------
--select update insert delete : dcl > �ݵ�� tcl(commit, rollback)�� �Բ� ���
--create, alter, drop, truncate, rename : ddl(autocommit�� �ȴ�.)

--���� : char, varchar2

CREATE TABLE temp(
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

--temp ���̺� ������ ���� ����
INSERT INTO temp
VALUES(100, 'ȫ�浿');

--id�� 101, name�� '�̼���'���� ���� ����
INSERT INTO temp
VALUES(101, '�̼���');

COMMIT;

--temp ���̺��� �ڵ尡 101���� �̸��� ȫ���� �����Ѵ�.
UPDATE temp
SET name = 'ȫ��'
WHERE id = 101;

COMMIT;

SELECT *
FROM temp;

------------------------------------------------------------------------------------------------------------
--CTAS(Create Table As Select)

--employees ���̺��� 60�� �μ��� ���, ��, �̸�, �޿�, �Ի����ڸ� �����ؼ� emp60 ���̺� �����ϱ�
CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

SELECT *
FROM emp60;

--������ ����
CREATE TABLE emp40 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE 1 = 2;

SELECT *
FROM emp40;

----------------------------------------------------------------------------------------
--���̺� ���� ���� : ALTER
--ALTER TABLE ���̺��
--ADD (�÷���1 ������Ÿ��, �÷���2, ������Ÿ��);

DESC temp;

ALTER TABLE temp
ADD (salary NUMBER(8) );

DESC temp;

SELECT *
FROM temp;

--101�� �ڵ��� �޿��� 3000���� �����Ѵ�.
UPDATE temp
SET salary = 3000
WHERE id = 101;

SELECT *
FROM temp;

------------------------------------------------------------------------------------------
--������ Ÿ�� ũ�⺯��(MODIFY)
-- UPDATE�� �÷� ���� ������ ���� ����
-- MODIFY�� �÷��ȿ� ����ִ� �������� Ÿ���� ����
-- �� MODIFY�� ADD�� �ڿ� ()�� ����.
--ALTER TABLE ���̺��
--MODIFY (�÷��� ������Ÿ��(������ ũ��));

ALTER TABLE temp
MODIFY (salary NUMBER(10));

DESC temp;

-----------------------------------------------------------------------------------------
--�÷� ���� : DROP COLUMN
--ALTER TABLE ���̺��
--DROP COLUMN �÷���;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

-----------------------------------------------------------------------------------------
--�÷��� ���� : RENAME COLUMN
--ALTER TABLE temp
--RENAME COLUMN �����÷��� TO ���÷���;

--temp ���̺��� id �÷����� temp_id�� �����Ѵ�.
ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

-------------------------------------------------------------------------------------------
--�������� ���� : TRUNCATE - ������ ��� �Ұ�

--TRUNCATE TABLE ���̺��;          --��, ������ ����� �������� ��� ����

SELECT *
FROM temp;

DELETE FROM temp;

SELECT *
FROM temp;

ROLLBACK;

SELECT *
FROM temp;

TRUNCATE TABLE temp;    --������ ����� �������� ��� ����

SELECT *
FROM temp;
--TRUNCATE�� ROLLBACK�� �Ұ�

--------------------------------------------------------------------------------------
--���̺� ���� : DROP

DROP TABLE temp;

-----------------------------------------------------------------------------------------
--DROP vs TRUNCATE vs DELETE
--DELETE : �뷮�� �״��(rollback�� �Ǿ��ϱ� ����)
--TRUNCATE : ���̺� ������
--DROP : ���� ����

FLASHBACK TABLE temp TO BEFORE DROP;
-- drop �ߴ� ���̺��� �ٽ� �츲

--������
SELECT *
FROM RECYCLEBIN;

--------------------------------------------------------------------------------
--���̺�� ���� : RENAME
--RENAME �������̺�� TO �����̺��

--temp ���̺��� �̸��� test�� �����϶�
RENAME temp TO test;



