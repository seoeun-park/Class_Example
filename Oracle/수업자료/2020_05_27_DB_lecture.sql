--tblPanme ���̺�
CREATE TABLE tblpanme(
    code VARCHAR2(10),
    part VARCHAR2(20),
    price NUMBER
);

--���ڵ� �Է�
INSERT INTO tblPanme (code, part, price) VALUES ('001', 'A������', 3000);
INSERT INTO tblPanme VALUES ('002', 'B������', 6000);
INSERT INTO tblPanme VALUES ('003', 'A������', 2000);
INSERT INTO tblPanme VALUES ('004', 'B������', 5000);
INSERT INTO tblPanme VALUES ('005', 'C������', 1000);
INSERT INTO tblPanme VALUES ('006', 'D������', 4000);

--��ü ���ڵ� �˻�
SELECT * 
FROM tblPanme;

--����Ϸ�
COMMIT;

--�� �μ���(GROUP BY)�� �Ǹűݾ�(PRICE)�� ����(SUM)�� ���Ͽ� ���
SELECT part, SUM(price) total
FROM tblPanme 
GROUP BY part;

--�� �μ���(GROUP BY)�� �Ǹűݾ�(PRICE)�� ����(SUM)�� ���Ͽ� 
--�μ��� ������������ ���
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

--�� �μ����� �Ǹűݾ��� ������ ���Ͽ� �μ��� ������������ �����Ͽ� ���
--��, �μ��� 2�� �̻� �ִ� �μ��� ������� �Ͻÿ� �� A������, B������
SELECT part, SUM(price) total
FROM tblpanme
--WHERE COUNT(part)>=2
GROUP BY part
HAVING COUNT(part)>=2
ORDER BY part;

�� ����Ŭ 11g SQL*PLUS�� �α��� �ϱ�
����â���� Sql*Plus�� �����ϱ� ���ؼ� HANUL �������� �����ϱ�
���� > ���� > CMD

C:\Users\����>SQLPLUS HANUL/0000
--���ӵ� ���� Ȯ���ϱ�
SQL> SHOW USER

--HANUL �������� ������ ���¿��� HR �������� �����ϴ� ���
--connect HR/[����Ŭ ��ġ �� �Է��ߴ� ��ȣ]
SQL>CONNECT HR/0000

--HR �������� ������ �Ǿ����� Ȯ���ϱ�
SQL> SHOW USER

����Ŭ ���� ������
SQL>EXIT

Oracle�� �������� �ʰ� OS ����� ������ �� �ֵ��� OS ȯ������ ��� ������ ��ɾ�
SQL>HOST

C:\Users\hoho0829>EXIT --�ٽ� ����Ŭ ȯ���� sqlplus�� ���ƿ�
����������Ʈ�� ������ ��ɾ� exit�� ����ϸ� sqlplus�� ���ƿ��� �ȴ�.

--HR ������ ������ table Ȯ��
SELECT table_name FROM user_tables;
SELECT * FROM user_tables;
SELECT * FROM TAB; 
-- TAB�� TABLE�� ���ڷ� HR����ڰ� �����ϰ� �ִ� 
-- ���̺��� ������ �˷��ִ� �����͵�ŷ���(Data Dictionary)�̴�.
-- �����͵�ŷ���(Data Dictionary) : �����ͺ��̽��� ���õ� ��� ������ �����Ѵ�.

TABLE_NAME 
-----------------------------------------------------------------------------------------------
REGIONS     : �������
LOCATIONS   : ��ġ����
DEPARTMENTS : �μ�����
JOBS        : ��������
EMPLOYEES   : �������
JOB_HISTORY : �����̷�����
COUNTRIES   : ��������
-----------------------------------------------------------------------------------------------

2.1. ������ ��ȸ 

�� DESC �� SQL*PLUS ��ɾ�, 
���̺��� �÷� �̸�, ��������, ����, NULL ��� ���� �� Ư�� ���̺��� ������ ����
DESCRIBE ���̺�� ==  DESC ���̺��
DESC employees; /* employees ���̺� ���� �ľ� */

�̸�                   ��?            ����           
--------------         --------      ------------ 
EMPLOYEE_ID(���)      NOT NULL      NUMBER(6)    
FIRST_NAME(�̸�)                     VARCHAR2(20) 
LAST_NAME(��)          NOT NULL      VARCHAR2(25) 
EMAIL(�̸���)          NOT NULL      VARCHAR2(25) 
PHONE_NUMBER(�޴���ȭ)               VARCHAR2(20) 
HIRE_DATE(�Ի���)      NOT NULL      DATE         
JOB_ID(�����ڵ�)       NOT NULL      VARCHAR2(10) 
SALARY(�޿�)                         NUMBER(8,2)  
COMMISSION_PCT(����)               NUMBER(2,2)  
MANAGER_ID(�Ŵ������̵�)             NUMBER(6)    
DEPARTMENT_ID(�μ��ڵ�)              NUMBER(4) 

�� SELECT �� ���̺� ����� �����͸� ��ȸ�ϱ� ���� ��ɾ�, SQL�� �߿� ���� ���� ���. 
           SELECT ������ FROM Ű���尡 �ݵ�� ����;� ��.
�� WHERE  �� SELECT ������ �������� �� �� �ִµ� ���ϴ� ���ڵ常 �˻��ϰ��� �� �� ���.
           �������� ������ �÷�, ������, �񱳴���� �� �� �ִ�.
           
������̺��� ��� �÷� ��ȸ
��� �÷� : * (��, ã���� �ϴ� ���̺��� ��� ������ �˻�)
Ư�� �÷� : �÷���

SELECT * 
FROM ���̺��;

SELECT �÷���1, �÷���2, ...
FROM ���̺��;

SELECT * 
FROM employees;

--������̺��� ���, �̸�, �� ��ȸ
SELECT employee_id, first_name, last_name
FROM employees;

--����鿡 ���� ���, �̸�, ��, �μ��ڵ�, �Ի�����, �����ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, department_id,
       hire_date, job_id, salary
FROM employees;  

2.2. WHERE ������ : Ư�� ���ǿ� �´� ���������� ��ȸ�ϰ��� �Ҷ�, 
                    �� WHERE ������ aliasing ��� �Ұ�!
SELECT ��
FROM ��
WHERE ��;

WHERE �������� �����ϴ� �׸��� �з�(WHERE ���ȿ� ��� ������ ������)
- �÷�, ����, ����, ��¥(����, ��¥�� '(Ȭ����ǥ)�� ����)
- ���������(+, -, *, /), �񱳿�����(=, !=, <>, ^=(���� �ʴ�), >=, <=, <, >), 
- �� ���Ῥ����(||)
- AND, OR, NOT
- LIKE, IN, BETWEEN, EXISTS, NOT
- IS NULL, IS NOT NULL
- ANY, SOME, ALL
- �Լ�

�� �������� ����ϴ� ������
1. ��������� : +, -, *, /  : SELECT���� �������ȿ� ����� �� ����
2. ���ڿ��Ῥ����: || : SELECT���� �������� ��밡��
3. �񱳿����� : =, !=, <>, ^= (�����ʴ�), >, <, >=, <= 
               DB���� ���ٴ� ��==���� �ƴϰ�, ��=�� �ϳ��� �����
               ����, ��¥�� �ݵ�� Ȭ����ǥ('') �ȿ� ǥ���ؾ� ��.
4. �����ǿ����� : AND, OR, NOT
5. �������ǿ����� : BETWEEN ~ AND
6. IN���ǿ����� : OR �����ڿ� ������ ����� ����
7. LIKE���ǿ����� : �÷����� �߿� Ư�� ���Ͽ� ���ϴ� ���� ��ȸ
8. NULL����ó�� : �����Ͱ��� ���� ������ ǥ�� �� NULL - �񱳺Ұ�, �������Ұ�

2.3. ������
1. ��������� : +, -, *, /  : SELECT ���� �������ȿ� ����� �� ����
01. 80�� �μ��� ����� ���, ��, �޿�, �� �� ���� ���� �޿�(����) ��ȸ
SELECT employee_id, last_name, salary, salary*12
FROM  employees
WHERE department_id = 80;

SELECT ���ȿ� ������ ������ ALIAS(��Ī, ����, ��Ī)�� ���������� �����ϱ�
1. �÷�ǥ���� ������/�Լ��� ���� ���
2. �÷�ǥ���� ����ġ�� �� ���

�� �÷�ǥ���� ���� �ٸ� �̸� : �÷��� ��Ī�� �ٿ� ����� �� �ִ�. ALIAS �÷� ��Ī(column ALIAS)
ALIAS ��� ���
- ������ �ΰ� ����Ѵ�.  �� �÷�ǥ�� ALIAS��
- Ű���� AS�� ����Ѵ�.  �� �÷�ǥ�� AS ALIAS��
- ALIAS�� ������ ������ �ֵ���ǥ(")�� ����ϰ� ���� ������ �ֵ���ǥ(") ����������.

02. ������ 150000 �̻��� �������
���, �̸�, ��, �����ڵ�, �޿�, ���� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary, 
       salary*12 annual_salary --ALIAS : ����
FROM employees
WHERE salary*12 >= 150000;  --������ 150000 �̻�; �� WHERE������ ALIAS �Ұ��� 

2. ���� ���� ������: || : SELECT ���� �������� ��밡��(SELECT ������ ���� ���)
SELECT * 
FROM employees;

01. ����� 101���� ����� ���, ��, ���� ��ȸ
������ �̸��� ���� ���ؼ� ����Ѵ�.
SELECT employee_id, first_name || last_name 
FROM employees
WHERE employee_id = 101;

02. ������ StevenKing �� ����� 
���, ����, �����ڵ�, �޿�, �μ��ڵ� ��ȸ
������ �̸��� ���� ���ؼ� ����Ѵ�.
SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE first_name || last_name = 'StevenKing'; --������ StevenKing;
--WHERE first_name || ' ' ||  last_name = 'Steven King'; --������ Steven King;

03. ������ StevenKing �� ����� 
���, ����, �����ڵ�, �޿�, �μ��ڵ�(dept_id�� ALIAS) ��ȸ
������ �̸��� ���� ���ؼ� ���(name���� ALIAS)�Ѵ�.
SELECT employee_id, first_name || ' ' || last_name as name, job_id, 
       salary, department_id dept_id
FROM employees
WHERE first_name || last_name = 'StevenKing'; --������ StevenKing;

���鹮��: ' '(Ȭ����ǥ �ȿ� ���� ��ĭ ����)
ȫ �浿

04. ����� 101���� ����� ���, ������ ��ȸ�Ѵ�.
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE employee_id = 101;

05. ����� 101���� ����� ����� �� �� ���� ���� �޿��� ��ȸ�Ѵ�.
������ �̸��� ���� ���ؼ� ����ϰ� 'name'���� �����Ѵ�
������ 'annual salary'�� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name AS name, salary*12 "annual salary"
FROM employees
WHERE employee_id = 101;

3. �񱳿����� : =, !=, <>, ^=, >, <, >=, <=
01. �޿��� 3000 ������ ����� 
���, ��, �޿�, �μ��ڵ�, �����ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000 ;

02. �μ��ڵ尡 80 �ʰ��� ����� 
���, ��, �޿�, �μ��ڵ带 ��ȸ�Ѵ�.
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE department_id > 80;

03. �μ��ڵ尡 90�� �μ��� ���� �������
���, �̸�, ��, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id = 90;  /*�μ��ڵ尡 90�� �μ��� ����;*/
--WHERE department_id IN (90);  /*�μ��ڵ尡 90�� �μ��� ����;*/

04. �޿��� 17000 �� �������
���, �̸�, ��, �μ��ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary = 17000; --�޿��� 17000;

05. �޿��� 3000 ������ ������� 
���, �̸�, ��, �����ڵ�, �޿�, �Ի����� ��ȸ
SELECT employee_id, first_name, last_name job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;        

06. �޿��� 15000 �̻��� �������
���, �̸�, ��, �����ڵ�, �޿� ��ȸ
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000; --�޿��� 15000 �̻�;

