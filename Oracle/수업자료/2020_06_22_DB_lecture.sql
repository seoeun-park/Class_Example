-----------------------------------------------------------------------------------------------
04. ���������� �������� ����
emp ���̺��� �μ���ġ ���� ���� ������� �μ��ڵ带 
employees ���̺��� �����ڵ尡 'AD_PRES' �� ����� �μ��ڵ�� �����Ѵ�.

employees ���̺��� �����ڵ尡 'AD_PRES' �� ����� �μ��ڵ� ��ȸ
SELECT department_id    --90
FROM employees
WHERE job_id ='AD_PRES';

emp ���̺��� �μ���ġ ���� ���� ������� ���� ��ȸ
SELECT *
FROM emp
WHERE dept_id IS NULL;

���� ��������
UPDATE emp
SET dept_id = ( SELECT department_id 
                FROM employees 
                WHERE job_id ='AD_PRES' )
WHERE dept_id IS NULL;

��ȸ
SELECT * 
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 PU_CLERK           90

COMMIT;

05. employees ���̺���
301�� ����� �޿��� 4000����, �̸��� ��ġ, ���� �� ���� �����Ѵ�.

301�� ����� �޿�, �̸�, �� Ȯ��
SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

301�� ����� �޿�, �̸�, �� ����
UPDATE employees
SET salary = 4000, first_name = '��ġ', last_name = '��'
WHERE employee_id = 301;

301�� ����� �޿�, �̸�, �� ��ȸ
SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

06. employees ���̺���
300�� �μ��� ���� ������� �޿��� 5000 ���� ���� ���� ����

300�� �μ��� ���� ������� ���, �μ��ڵ�, �޿� ��ȸ
SELECT employee_id, department_id, salary
FROM employees
WHERE department_id = 300;

300�� �μ��� ���� ������� ���, �μ��ڵ�, �޿� ����
UPDATE employees
SET salary = 5000
WHERE department_id = 300;

07. employees ���̺� ���ο� ��������� ������������.
300������ ����� �����ϰ� �޿��� 60�� �μ��� ��ձ޿��� ��������.
( ��, employee_id, first_name, last_name, email, hire_date, job_id, salary
300, �浿, ȫ, hong@naver.com, ���ó�¥, IT_PROG, 60�� �μ��� ��� �޿� )

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

SELECT *
FROM employees;

60�� �μ��� ��� �޿�
SELECT ROUND(AVG(salary)) avg_sal --5760
FROM employees 
WHERE department_id = 60;

INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300, '�浿','ȫ','hong@naver.com', SYSDATE, 'IT_PROG', ( SELECT ROUND(AVG(salary)) 
                                                                 FROM employees 
                                                                 WHERE department_id = 60 ) );
         
COMMIT;

300�� ����� �޿��� �츮ȸ�� �ְ�޿���, ��ȭ��ȣ�� 062.1234.5678 �� ������������

SELECT *
FROM employees;

DESC employees;

300�� ����� �޿��� ��ȭ��ȣ
SELECT salary, phone_number --5760 null
FROM employees
WHERE employee_id = 300;

    SALARY PHONE_NUMBER        
---------- --------------------
      5760 (null)                    

�츮ȸ�� �ְ�޿�
SELECT MAX(salary) 
FROM employees;

UPDATE employees
SET salary = ( SELECT MAX(salary) FROM employees ), 
    phone_number = '062.1234.5678'
WHERE employee_id = 300;

SELECT salary, phone_number
FROM employees
WHERE employee_id = 300;

    SALARY PHONE_NUMBER        
---------- --------------------
     24000 062.1234.5678       
     
COMMIT;

-----------------------------------------------------------------------------------------------
�ǽ�
01.emp ���̺��� 202�� ����� �Ի����ڸ� 
���÷κ��� 6������ ��¥�� �����Ѵ�.

SELECT * 
FROM emp;

UPDATE emp
SET hire_date = ADD_MONTHS(SYSDATE,-6)
WHERE id = 202;

SELECT * 
FROM emp;

COMMIT;

02. emp ���̺��� 200�� ����� ���� 
employees ���̺��� 60�� �μ����� �� �ֱ� �Ի��� ����� �Ի����ڷ� �����Ѵ�.

employees ���̺��� 60�� �μ����� �� �ֱ� �Ի��� ����� �Ի�����
SELECT MAX(hire_date) max_hire_date --07/05/21
FROM employees 
WHERE department_id = 60

UPDATE emp
SET hire_date = ( SELECT MAX(hire_date) --07/05/21
                  FROM employees 
                  WHERE department_id = 60 ) 
WHERE id = 200; 

SELECT * 
FROM emp;

COMMIT;
-----------------------------------------------------------------------------------------------

3. �������� ���� : DELETE - �������� �������� �ʵ��� �����Ѵ�.

DELETE FROM ���̺��
WHERE ������;

01. employees ���̺��� 300�� ����ڵ带 ��������

SELECT * 
FROM employees;   

DELETE FROM employees
WHERE employee_id = 300;

COMMIT;

SELECT * 
FROM employees; 

02. departments ���̺��� 300�� �μ��� ��������

SELECT * 
FROM departments; 

DELETE FROM departments
WHERE department_id = 300;   
    --integrity constraint violated - child record found
    --���Ἲ ���� ���� ���� 
    
SELECT *
FROM employees
ORDER BY department_id DESC;
    

�׷���, ������̺��� 300�� �μ��� ��������
DELETE FROM employees
WHERE department_id = 300;

�׸��� ����, �μ����̺��� 300�� �μ��� ��������
DELETE FROM departments
WHERE department_id = 300; 

COMMIT;

SELECT * 
FROM departments; 

SELECT * 
FROM employees; 


03. emp ���̺��� 20�� �μ������� ������ �����Ѵ�.
SELECT * 
FROM emp;

DELETE FROM emp
WHERE dept_id = 20;

SELECT * 
FROM emp;

COMMIT;

����
===============================================================================================
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
     
2. �������� - UPDATE : �������� �������� �ʵ��� �����Ѵ�.
UPDATE ���̺��
SET �÷���1 = �����Ͱ�1, �÷���2 = �����Ͱ�2,  ...
WHERE ������;

3. �������� ���� : DELETE - �������� �������� �ʵ��� �����Ѵ�.
DELETE FROM ���̺��
WHERE ������;
===============================================================================================

* DDL(Data Definition Language) - �� AUTO COMMIT;
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
  
* ������Ÿ�� : ����, ����, ��¥
- ���� : CHAR, VARCHAR2
    CHAR(n)  - �������� : ������ �����ŭ �޸𸮸� Ȯ���Ѵ�.
    CHAR(10) - ����� abcd ���ڸ� ���� -> abcd______ 
             �� �޸𸮸� 10����Ʈ Ȯ���� �� �����Ѵ�.
    VARCHAR2(n)  - �������� �� �����͸� �����Ҷ� �޸𸮸� Ȯ���Ѵ�. 
                         �ִ� 4000 ����Ʈ
    VARCHAR2(30) - ����� abcd ���ڸ� ���� -> abcd

������ ����� �������� : �ֹι�ȣ�� ���� ��� CHAR
    CLOB : ����� ū ���� ������ ������� Ÿ��
    BLOB : �̹����� ���� ���̳ʸ� ������ ������� Ÿ��
    
- ���� : NUMBER
    NUMBER(n)   - ����������
    NUMBER(8)   - 99999999����
    NUMBER(n,p) - �ε��Ҽ���������
    NUMBER(8,2) - 999999.99
      
- ��¥ : DATE
-----------------------------------------------------------------------------------------------
1. ���̺� ���� - CREATE
CREATE TABLE ���̺�� (
�÷���1 ������Ÿ��,
�÷���2 ������Ÿ��,
...
);
-----------------------------------------------------------------------------------------------
CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

01. temp ���̺� ������ ���� ���� 

id�� 100, name�� 'ȫ�浿'���� ���� ����
INSERT INTO temp
VALUES (100, 'ȫ�浿');

SELECT * 
FROM temp;

id�� 101, name�� '�̼���'���� ���� ����
INSERT INTO temp
VALUES (101, '�̼���');

COMMIT;

SELECT * 
FROM temp;

02. temp ���̺��� �ڵ尡 101 ���� �̸��� 'ȫ��'�� �����Ѵ�.
UPDATE temp 
SET name = 'ȫ��'
WHERE id = 101;

COMMIT;

SELECT * 
FROM temp;

  ID NAME                          
---------- -------
 100 ȫ�浿                        
 101 ȫ�� 

-----------------------------------------------------------------------------------------------
�� �ٸ� ���̺��� ������ �����ؼ� ���̺� ���� �� CTAS( Create Table As Select )
 : ****NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.
-----------------------------------------------------------------------------------------------

CREATE TABLE ���̺�� AS ��ȸ������(SELECT ��)
employees ���̺��� 60�� �μ��� ���, ��, �̸�, �޿�, �Ի����ڸ� �����ؼ� emp60 ���̺� �����ϱ�

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

DESC emp60;

SELECT * 
FROM emp60;

�� ������ �����ϰ� ���������� �����ؿ��� ���� ���·� ���̺� �����ϱ�(������ ����)
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
--WHERE 'a' = 'b';  --���� ��ġ�� �� ���� ����,  ���͸� ����
WHERE 1 = 2;

DESC emp40;

SELECT * 
FROM emp40; --������ �����Ͽ� �����ʹ� �������� ����
-----------------------------------------------------------------------------------------------
2. ���̺� ���� ���� - ALTER

1) �÷� �߰�  --ADD
ALTER TABLE ���̺�� 
ADD ( �÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ... );
***
-----------------------------------------------------------------------------------------------
temp ���̺� ���� 8�ڸ��� ���� salary �÷��� �߰�����
DESC temp;

ALTER TABLE temp
ADD ( salary NUMBER(8) ); --Default�� null
***

DESC temp;

SELECT * 
FROM temp;

101�� �ڵ��� �޿��� 3000 ���� �����Ѵ�.
UPDATE temp 
SET salary = 3000 
WHERE id = 101;

SELECT * 
FROM temp;
-----------------------------------------------------------------------------------------------
2) ������Ÿ�� ũ�� ����  --MODIFY
ALTER TABLE ���̺�� 
MODIFY ( �÷��� ������Ÿ��(������ũ��) );
******
-----------------------------------------------------------------------------------------------
temp ���̺��� salary �÷��� ����� ���� 10 ���� �����Ѵ�.
DESC temp;

ALTER TABLE temp
MODIFY ( salary NUMBER(10) );

DESC temp;
-----------------------------------------------------------------------------------------------
3) �÷� ����  --DROP COLUMN
ALTER TABLE ���̺��
DROP COLUMN �÷���;
***********
-----------------------------------------------------------------------------------------------
temp ���̺��� salary �÷� �����Ѵ�.

DESC temp;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;
-----------------------------------------------------------------------------------------------
4) �÷��� ���� --RENAME COLUMN
ALTER TABLE ���̺�� 
RENAME COLUMN �����÷��� TO ���÷���;
*************
-----------------------------------------------------------------------------------------------
temp ���̺��� id �÷����� temp_id �� �����Ѵ�.

DESC temp;

ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;
-----------------------------------------------------------------------------------------------
3. �������� ���� - TRUNCATE - ������ ��� �Ұ�

TRUNCATE TABLE ���̺��; --��, ������ ����� �������� ��� ����
-----------------------------------------------------------------------------------------------
SELECT * 
FROM temp;

DELETE FROM temp;

SELECT * 
FROM temp;
--------------
���õ� �� ����

ROLLBACK; --DML�� ROLLBACK ����

SELECT * 
FROM temp;

   TEMP_ID NAME                          
---------- ------------------------------
       100 ȫ�浿                        
       101 ȫ��
       
TRUNCATE TABLE temp; --������ ����� �������� ��� ����

SELECT * 
FROM temp;
���õ� �� ����

ROLLBACK; --DDL�� AUTO COMMIT�� ����ǹǷ� ROLLBACK �Ұ��� 

SELECT * 
FROM temp;
���õ� �� ����
-----------------------------------------------------------------------------------------------
4. ���̺� ���� - DROP
DROP TABLE ���̺��;
-----------------------------------------------------------------------------------------------
DROP TABLE temp;
-----------------------------------------------------------------------------------------------
�� DELETE, TRUNCATE, DROP ��ɾ��� ������

- DELETE ��ɾ�� �����ʹ� ���������� ���̺� �뷮�� �پ� ���� �ʴ´�. 
  ���ϴ� �����͸� ���� �� �ִ�. ���� �� �߸� ������ ���� �ǵ��� �� �ִ�.
- TRUNCATE ��ɾ�� �뷮�� �پ� ���, �ε��� � ��� ���� �ȴ�. 
  ���̺��� ���������� �ʰ�, �����͸� �����Ѵ�. 
  �Ѳ����� �� ������ �Ѵ�. ���� �� ���� �ǵ��� �� ����.
- DROP ��ɾ�� ���̺� ��ü�� ����, ����, ��ü�� �����Ѵ�. 
  ���� �� ���� �ǵ��� �� ����.
  
[�� ���̺�] [����]       [DELETE ��]             [TRUNCATE ��]             [DROP ��]
�̸�      �ּ�  ����ó     �̸�   �ּ�  ����ó     �̸�   �ּ�  ����ó       ������
ȫ�浿    ����  1111       |   |  |   | |    |
ȫ���    õ��  2222       |   |  |   | |    |
�̼���    �λ�  3333       |   |  |   | |    |
                           �����͸� ��������,      ���̺��� ���� �ȵǰ�,     ���̺� ��ü ����
                           �뷮�� �״��           �뷮�� �پ���,
                                                   �ε��� �� ��� ����
                                                   
-----------------------------------------------------------------------------------------------
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

FLASHBACK TABLE temp TO BEFORE DROP;

�� ������ ����
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
5. ���̺���� - RENAME
RENAME �������̺�� TO �����̺��;
-----------------------------------------------------------------------------------------------
temp ���̺���� test �� �����Ѵ�.

RENAME temp TO test;

DESC test;

����
===============================================================================================
01. ���̺� ���� -- CREATE
CREATE TABLE ���̺�� (
�÷���1 ������Ÿ��,
�÷���2 ������Ÿ��,
...
);

02. ���̺� ���� ���� -- ALTER
1) �÷� �߰� --ADD
ALTER TABLE ���̺�� 
ADD ( �÷���1 ������Ÿ��, �÷���2 ������Ÿ��, ... );
***

2) ������Ÿ�� ũ�� ���� --MODIFY
ALTER TABLE ���̺�� 
MODIFY ( �÷��� ������Ÿ��(������ũ��) );
******

3) �÷� ���� --DROP COLUMN
ALTER TABLE ���̺��
DROP COLUMN �÷���;
***********

4) �÷��� ���� --RENAME COLUMN
ALTER TABLE ���̺�� 
RENAME COLUMN �����÷��� TO ���÷���;
*************

03. �������� ���� - TRUNCATE - ������ ��� �Ұ�
TRUNCATE TABLE ���̺��; --��, ������ ����� �������� ��� ����

04. ���̺� ���� - DROP
DROP TABLE ���̺�� (purge);


5. ���̺���� - RENAME
RENAME �������̺�� TO �����̺��;
===============================================================================================







