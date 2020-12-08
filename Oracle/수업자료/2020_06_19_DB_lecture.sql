Query LANGUAGE : DML + TCL
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE 
+ TCL(Transaction Control Language)�� �Բ� ��� :  COMMIT(�۾�Ȯ��) / ROLLBACK(�۾����)

1. �������� : INSERT 
1.1. INSERT INTO ���̺�� 
     VALUES ( ���̺� ���� ������ �´� �����Ͱ� ��� );
1.2. INSERT INTO ���̺��(�÷����� ����)   
     VALUES ( ������ �÷� ������ �´� �����Ͱ� ��� );
1.3. INSERT INTO ���̺�� 
     ��ȸ������( SELECT �� ); 
     �� ITAS : VALUE �� ���� SELECT �� ����� ���������� ���̺�κ��� ���� ������ ���� ���� ����
     INSERT ���� ������ �÷� ��ϰ� SELECT ���� �÷� ��� ������ ���ƾ� ��.
    
�������� ���� �÷����� �ڵ����� NULL �� ����
��¥ �����ʹ� ��¥ ���� ������ ����ؼ� ������ �� ����.

NULL�� ǥ�� : NULL, ''

DESC departments;

�̸�            ��?      ����           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  

1.1.  
INSERT INTO ���̺�� 
VALUES ( ���̺� ���� ������ �´� �����Ͱ� ��� );

01. �μ����̺� ���ο� �μ��� ����Ѵ�.
�μ��ڵ� : 300, �μ��� : ������, �μ����� : NULL, ��ġ�ڵ� : NULL

INSERT INTO departments
VALUES (300, '������', NULL, NULL);

SELECT * 
FROM departments 
ORDER BY 1 DESC;

02. �μ����̺� ���ο� �μ��� ����Ѵ�.
INSERT INTO departments
VALUES (310, '���ߺ�', NULL, '' );

03. ��� �������� �⺻ ��(DEFAULT)�� NULL�̴�.
INSERT INTO departments
VALUES (320,'�ѹ���', DEFAULT, DEFAULT);

04. �۾�����Ѵ�.
ROLLBACK;

05. departments�μ��� ������ ��ȸ�Ѵ�.
SELECT * 
FROM departments
ORDER BY 1 DESC;

1.2. 
INSERT INTO ���̺�� ( �÷���1, �÷���2, ... )
VALUES ( ������ �÷��� ��Ī�� �����Ͱ��� ��� );

INSERT INTO ���̺�� ( �����̺������� NOT NULL �� �÷� + �߰��÷���� )
VALUES ( ��õ� �÷��� ������� ��Ī�� �����͸�� );

DESC departments;

01. �μ����̺� ���ο� �μ��� ����Ѵ�.
INSERT INTO departments(department_id, department_name)
VALUES (300, '���ߺ�');

SELECT * 
FROM departments 
ORDER BY 1 DESC;

02. ������̺� ���ο� ����� ��������.

DESC employees; --NOT NULL Ȯ��

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, 
                     --************             ********** *****  **********
                       job_id, salary, department_id)
                     --******
VALUES (301,'�浿','ȫ','GILDONG','10/10/10','MK_REP',3000,300);

COMMIT;

SELECT * 
FROM employees 
ORDER BY 1 DESC;

03. ��� �������� �⺻�� DEFAULT �� NULL �̴�.
���̺� ���������� NOT NULL �÷����� �ݵ�� ���� ��ƾ� ������ ���� ����ȴ�.

DESC departments;

INSERT INTO departments (department_id)
VALUES (330);  --�� ����Ұ�
���� ���� -
ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")

1.3. �� ITAS
INSERT INTO ���̺�� 
��ȸ������( SELECT �� ); �� ITAS
�������� �ѹ��� ���� ���� : �׽�Ʈ�� ������

01. �μ����̺� ���ο� �μ�(�μ��ڵ忡 1 ���Ͽ�)�� �μ������� �����Ͽ� ���� ��������.
INSERT INTO departments
SELECT department_id+1, department_name, manager_id, location_id
FROM departments;

SELECT * 
FROM departments
ORDER BY 1 DESC;

ROLLBACK;

SELECT * 
FROM departments
ORDER BY 1 DESC;

�� CTAS( Create Table As Select ) --****NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.
CREATE TABLE ���̺�� AS ��ȸ������(SELECT ��);

CREATE TABLE emp AS 
SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE 1 = 2; --���͸� ���� �༭ ���̺� ������ ����

DROP TABLE emp;

-----------------------------------------------------------------------------------------------
�� ������ ���̺� �����뿡�� Ȯ��
10g : g �� �׸��� ��ǻ��, 
      ������ ���� ����. �׷���, purge����, 
      ���� ������ PURGE ��� �� DROP TABLE ���̺�� PURGE;
      10g �� �ѱ� 2����Ʈ
11g : 11g���� �ѱ� 3����Ʈ

SELECT * 
FROM RECYCLEBIN;

�� ������ ���̺� ����
FLASHBACK TABLE ���̺�� TO BEFORE DROP;

FLASHBACK TABLE emp TO BEFORE DROP;

�� ������ ����
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------
�� ������ emp ���̺��� �����غ���
FLASHBACK TABLE emp TO BEFORE DROP;

SELECT * 
FROM emp;

DESC employees;

�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)

DESC emp;

�̸�         ��?       ����           
---------- -------- ------------ 
ID                  NUMBER(6)    
LAST_NAME  NOT NULL VARCHAR2(25) 
FIRST_NAME          VARCHAR2(20) 
HIRE_DATE  NOT NULL DATE         
JOB_ID     NOT NULL VARCHAR2(10) 
DEPT_ID             NUMBER(4)

SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE department_id IN (10,20); --employees ���̺��� 10��, 20�� �μ����� ����

SELECT * 
FROM emp;

emp ���̺� ���������� ���������Ѵ�.
employees ���̺��� 10��, 20�� �μ������� ������ �����Ͽ� 
emp ���̺� ���������Ѵ�.

DESC emp;

INSERT INTO emp(id, last_name, first_name, hire_date, job_id, dept_id)
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id
FROM employees
WHERE department_id IN (10,20);

SELECT * 
FROM emp;

COMMIT;

2. �������� - UPDATE : �������� �������� �ʵ��� �����Ѵ�.

UPDATE ���̺��
SET �÷���1 = �����Ͱ�1, �÷���2 = �����Ͱ�2,  ...
WHERE ������;

SELECT employee_id, last_name, department_id, salary --108��
FROM employees;

SELECT * --3��
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 MK_REP             20
                                                                   *******            **

01. emp ���̺��� id�� 202�� ����� �μ��ڵ带 30����, �����ڵ带 'programmer'�� �����Ѵ�.
UPDATE emp
SET dept_id = 30, job_id = 'progammer'
WHERE id = 202;

SELECT * 
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 progammer          30 --�� *****

COMMIT;

02. emp ���̺��� id�� 202�� ����� �����ڵ带 'PU_CLERK' �� �����Ѵ�.

UPDATE emp
SET job_id = 'PU_CLERK' 
WHERE id = 202; 

COMMIT;

SELECT * 
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 PU_CLERK           30

03. emp ���̺��� id�� 202�� ����� �μ��ڵ带 null �� �����Ѵ�.
UPDATE emp
SET dept_id = '' --�μ��ڵ带 NULL ������ ����
WHERE id = 202;

SELECT * 
FROM emp;

COMMIT;