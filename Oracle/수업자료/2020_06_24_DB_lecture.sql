***�������Ǹ�(CONSTRAINT_NAME)�� gender�� salary �� ����
-----------------------------------------------------------------------------------------------
DROP TABLE test;

CREATE TABLE test (
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(10) NOT NULL CHECK ( gender IN ('����','����') ),
  salary number(8),
  dept_id number(4),
  CONSTRAINT test_salary_ck CHECK ( salary > 2000 )   
);

test ���̺���
�������Ǹ�, �÷���, ������������(constraint_type) ��ȸ
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('test'); 
-----------------------------------------------------------------------------------------------

�� ���̺� ���� �� CHECK ����
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� CHECK ( �÷��� ���ǽ� );

-----------------------------------------------------------------------------------------------
�޿��� ���� 3000 �̻� 5000 ���ϸ� ������ �� �ֵ��� CHECK ���������� �����Ѵ�.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 );
-----------------------------------------------------------------------------------------------

user_cons_columns ���̺��� EMP ���̺���
�������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

SELECT * 
FROM emp;

UPDATE emp
SET salary = 5500   -- ������Ʈ �Ұ� (salary BETWEEN 3000 AND 5000�̹Ƿ�)
WHERE name = 'ȫ�浿'; 

CHECK CONSTRAINT (HR.EMP_GENDER_CK) violated

-----------------------------------------------------------------------------------------------
�� CHECK �������� ���� --CHECK ���������� ���� �Ұ���. �߰��ϰų� ������ ����!!
ALTER TABLE ���̺��
DROP CONSTRAINT �������Ǹ�;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP'; 

ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 6000 );
-----------------------------------------------------------------------------------------------
�� �������� �̸� ����
ALTER TABLE ���̺��
RENAME CONSTRAINT �����������Ǹ� TO �ٲ��������Ǹ�;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
-----------------------------------------------------------------------------------------------

3. UNIQUE - �����Ͱ� �ߺ����� �ʵ��� ���ϼ��� �����ϴ� ���� , 
NULL �� �ߺ��Է� ���� , NOT NULL �� �Բ� ��뵵 ����
�÷� ����, ���̺� �������� �����ϰ� ����Ű ������ �� �ִ�.
�������� �÷��� ���� �ϳ��� ���������� ������ �� �ִ� : ����Ű

-----------------------------------------------------------------------------------------------
�� ���̺� ������ UNIQUE ����
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- �÷� ���� ����
�÷��� ������Ÿ�� UNIQUE
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� UNIQUE

- ���̺� ���� ����
CONSTRAINT �������Ǹ� UNIQUE (�÷���)

CREATE TABLE emp (
  id NUMBER(4) NOT NULL,
  name VARCHAR2(30) NOT NULL,
  salary NUMBER(8),
  gender VARCHAR2(3),
  email VARCHAR2(50), /* CONSTRAINT emp_email_uk2 UNIQUE  */
                      /* employees ���̺��� email �÷���
                         emp_email_uk �������Ǹ��� �̹� �����ؼ� �ߺ� �Ұ� */
  CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
  CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') ),
  CONSTRAINT emp_email2_uk UNIQUE( email ),
  CONSTRAINT emp_email3_uk UNIQUE( name, email ) --����Ű
);

-----------------------------------------------------------------------------------------------
-- �������Ǹ��� emp_email_uk �� ���̺� ã��

SELECT table_name, constraint_name, constraint_type
FROM user_constraints
WHERE constraint_name = UPPER('emp_email_uk'); --employees ���̺� ������
-----------------------------------------------------------------------------------------------
DESC user_constraints;


SELECT *
FROM user_constraints
WHERE table_name = UPPER('emp'); 

�������� �÷��� ���� �ϳ��� ���������� ������ �� �ִ� : ����Ű
å ���� : 83������

-----------------------------------------------------------------------------------------------
�� ���̺� ���� �� UNIQUE �������� ����
ALTER TABLE ���̺�� 
ADD CONSTRAINT �������Ǹ� UNIQUE( �÷��� );
-----------------------------------------------------------------------------------------------
�� UNIQUE �������� ����
ALTER TABLE ���̺�� 
DROP CONSTRAINT �������Ǹ�;
-----------------------------------------------------------------------------------------------

4. PRIMARY KEY : ������ ���� ��ǥ�ϵ��� �����ϰ� �ĺ��ϱ� ���� ���� ����, �������� ���Ἲ ����
- NOT NULL + UNIQUE �� ����
- PK , ��Ű, �⺻Ű, �ĺ��� - ���̺�� �� ���� ���� ����
- �ֹι�ȣ, ���, �й�,...
- �÷� ����, ���̺� �������� �����ϰ� ����Ű�� ������ �� �ִ�.
- ���̺� �� 1���� �⺻Ű�� ��������, 
- �ϳ��� �÷����θ� �⺻Ű ���� ����(�÷� �������� ���� ���Ǹ��� �������� ���� ���)
- ���� ���� �÷��� ���� �ϳ��� �⺻Ű�� ���� ����(�ִ� 32�� ����) 
-----------------------------------------------------------------------------------------------
�� ���̺� ������ UNIQUE ����
-----------------------------------------------------------------------------------------------
- �÷� ���� ����
�÷��� ������Ÿ�� PRIMARY KEY
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� PRIMARY KEY

- ���̺� ���� ����
CONSTRAINT �������Ǹ� PRIMARY KEY ( �÷���, �÷���, �÷���... ) �� ����Ű ���� ����
CONSTRAINT �������Ǹ� UNIQUE ( �÷���, �÷���, �÷���... ) �� ����Ű ���� ����
-----------------------------------------------------------------------------------------------
DROP TABLE emp;

CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email2_uk UNIQUE */ 
                      /* CONSTRAINT emp_email_uk UNIQUE 
                      employees ���̺��� email �÷���
                      emp_email_uk �̹� �����ؼ� �ߺ� �Ұ�*/, 
CONSTRAINT emp_id_pk     PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --����Ű
);

DESC emp;

emp ���̺��� �������Ǹ�, �÷���, ��������Ÿ�� ��ȸ
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

-----------------------------------------------------------------------------------------------
�� ���̺� ���� �� PRIMARY KEY �������� ���� �� �߰��� ���̺� ������ ����
ALTER TABLE ���̺�� 
ADD CONSTRAINT �������Ǹ� PRIMARY KEY ( �÷���, �÷���, �÷���... )

ALTER TABLE emp 
ADD CONSTRAINT emp_id_pk PRIMARY KEY ( id );
-----------------------------------------------------------------------------------------------
�� PRIMARY KEY �������� ����
ALTER TABLE ���̺�� 
DROP CONSTRAINT �������Ǹ�;

ALTER TABLE emp 
DROP CONSTRAINT emp_id_pk;
-----------------------------------------------------------------------------------------------

5. FOREIGN KEY : �θ����̺��� �÷��� �����ϴ� �ڽ����̺��� �÷�, NULL ���
- ���� ������ ���Ἲ ���� 
- ���� ������ ���Ἲ ������ ����, ���� ���谡 �ִ� ���̺��� ������ �߰�, ����, ������ ������ �� �ִ�. 

- '����'�� ���� ���������� ����
�� �����ϴ� ���̺��� ���� �����Ǿ� �־�� ��.
�� �ܷ�Ű�� �����ϴ� �÷��� �����ϴ� ���̺��� �⺻Ű(PRIMARY KEY)�̾�� ��.
�� ���� �÷��� �ܷ�Ű�� �� ���, �����ϴ� ���̺��� �⺻Ű�� �÷� ���� �� ������ ���ƾ� ��.
�� �⺻Ű�� ����������, �ִ� 32�� �÷����� ����.

- FK, �ܷ�Ű, ����Ű
�÷� ����, ���̺� �������� �����ϰ� ����Ű�� ������ �� �ִ�.

-----------------------------------------------------------------------------------------------
�� ���̺� ������ FOREIGN KEY ����
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- �÷� ���� ����
�÷��� ������Ÿ�� REFERENCES �θ����̺� ( �����Ǵ� �÷��� )
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� REFERENCES �θ����̺� ( �����Ǵ� �÷��� )

- ���̺� ���� ����
CONSTRAINT �������Ǹ� FOREIGN KEY( �����ϴ� �÷��� ) 
                      REFERENCES �θ����̺� ( �����Ǵ� �÷��� )
-----------------------------------------------------------------------------------------------
CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3) ,
email VARCHAR2(50) /* CONSTRAINT emp_email_uk UNIQUE */ , 
dept_id NUMBER(4) /* CONSTRAINT emp_dept_id_fk 
                     REFERENCES departments(department_id) */ ,
CONSTRAINT emp_id_pk      PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck  CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck  CHECK( gender IN ('��','��') ),
CONSTRAINT emp_email2_uk  UNIQUE( email ),
CONSTRAINT emp_email3_uk  UNIQUE( name, email ), --����Ű
CONSTRAINT emp_dept_id_fk FOREIGN KEY( dept_id )
                          REFERENCES departments( department_id )
);
FK �� ����  ���̺� �θ� - �ڽ� ���谡 �����ȴ�
FK �� �����ϴ� ���̺��� �ڽ� ���̺��̰�
FK �� ���� �����Ǵ� ���̺��� �θ� ���̺�
employees(�ڽ�) - departments(�θ�)
���� �Ǿ��� �θ����̺��� �÷��� �ݵ�� PK �� ������ �� �ִ�.

DESC emp;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP'; 

* user_cons_columns ���̺��� EMPLOYEES ���̺�� DEPARTMENTS ���̺���
���̺��, �������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
-----------------------------------------------------------------------------------------------
SELECT table_name, CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                                   FROM user_constraints
                                                   WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE LOWER(table_name) IN ('employees', 'departments');

SELECT *
FROM user_constraints
WHERE LOWER(table_name) IN ('employees', 'departments');
-----------------------------------------------------------------------------------------------
�� ���̺� ���� �� FOREIGN KEY ���� ���� ����
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� FOREIGN KEY( �����ϴ� �÷��� ) 
                          REFERENCES �θ����̺� ( �����Ǵ� �÷��� )
ALTER TABLE emp
ADD CONSTRAINT emp_dept_id_fk FOREIGN KEY(dept_id)
                              REFERENCES departments(department_id);
-----------------------------------------------------------------------------------------------
�� FOREIGN KEY �������� ����
ALTER TABLE ���̺�� 
DROP CONSTRAINT �������Ǹ�;

ALTER TABLE emp
DROP CONSTRAINT emp_dept_id_fk;
-----------------------------------------------------------------------------------------------
�������Ǹ�, �÷���, ������������(CONSTRAINT_TYPE) ��ȸ
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

SELECT * 
FROM emp;

INSERT INTO emp
VALUES (100, 'ȫ�浿', 3000,  '��', '', '');

UPDATE emp 
SET dept_id = 15 
WHERE id = 100; 
--integrity constraint (HR.EMP_DEPT_ID_PK) violated - parent key not found

SELECT * 
FROM emp;

-----------------------------------------------------------------------------------------------
DDL
1. ���� CREATE
CREATE TABLE ���̺��(
�÷���1 ������Ÿ�� CONSTRAINT �������Ǹ� NOT NULL,
�÷���2 ������Ÿ�� CONSTRAINT �������Ǹ� CHECK (�÷���2 ���ǽ�),
�÷���3 ������Ÿ�� CONSTRAINT �������Ǹ� UNIQUE,
�÷���4 ������Ÿ�� CONSTRAINT �������Ǹ� PRIMARY KEY,
�÷���5 ������Ÿ�� CONSTRAINT �������Ǹ� REFERENCES �θ����̺�(PK���÷�),
CONSTRAINT �������Ǹ� CHECK (�÷���2 ���ǽ�),
CONSTRAINT �������Ǹ� UNIQUE (�÷���3),
CONSTRAINT �������Ǹ� PRIMARY KEY (�÷���4),
CONSTRAINT �������Ǹ� FOREIGN KEY (�÷���5) REFERENCES �θ����̺�(PK���÷�)
);

2. �������� ALTER
�� �������� �߰�
1. NOT NULL - ���� ���� �����͸� �������� �ʵ���
ALTER TABLE ���̺�� 
MODIFY ( �÷��� ������Ÿ�� NOT NULL);

2. CHECK �߰� - Ư�� ���ǿ� ���� �ʴ� �����͸� �������� �ʵ���, NULL ���
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� CHECK ( �÷��� ���ǽ� );

3. UNIQUE �߰� - ���ϼ��� ������� ���� �����ʹ� �������� �ʵ���, NULL ���
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� UNIQUE ( �÷��� );

4. PRIMARY KEY �߰� - �ĺ���, �⺻Ű, ��Ű, PK : NOT NULL + UNIQUE
ALTER TABLE ���̺�� 
ADD CONSTRAINT �������Ǹ� PRIMARY KEY ( �÷��� );

5. FOREIGN KEY �߰� - �ܷ�Ű, ����Ű, FK : NULL ���, �θ����̺��� PK �� �÷��� ����
ALTER TABLE ���̺��
ADD CONSTRAINT �������Ǹ� FOREIGN KEY ( �÷��� ) 
                          REFERENCES �θ����̺� ( PK���÷� );
                          
6. DEFAULT �߰� - �� �Է½� �⺻�� ����
ALTER TABLE ���̺��
MODIFY ( �÷��� ������Ÿ�� DEFAULT '��' );

�� �������� ����
ALTER TABLE ���̺��
DROP CONSTRAINT �������Ǹ�
-----------------------------------------------------------------------------------------------

DESC emp;
SELECT * FROM emp;

������ ��������
INSERT INTO emp(id, name, salary, gender, email, dept_id)
VALUES (101, '����ġ', 3000, '��', NULL, DEFAULT);
SELECT * FROM emp;

INSERT INTO emp(id, name, salary)
VALUES (102, '��û', 5000);

SELECT * 
FROM emp;

������ �����͸� �������� ������ �⺻������ '��' �� ����ǰ� �ϰ��� �Ѵ�.
�÷��� ���� DEFAULT ����

ALTER TABLE emp
MODIFY (gender DEFAULT '��');

INSERT INTO emp(id, name, salary)
VALUES (103, '�ڹ���', 4000);

SELECT * FROM emp;

�Ի����� �߰�
ALTER TABLE emp 
--ADD ( hire_date date DEFAULT SYSDATE NOT NULL );
ADD ( hire_date date DEFAULT SYSDATE );

INSERT INTO emp(id, name, salary)
VALUES (104, '�̸���', 5000);
SELECT * FROM emp;

-----------------------------------------------------------------------------------------------

�� VIEW (��)
- ������ �����Ͱ� �����ϴ� ��ü�� �ƴϴ�
- ���̺��� �����͸� �並 ���� �����Ѵ�.
  1. ���� - ���� ����
  2. ������ �������� �ܼ��� ���������� ����� �� �ִ�.
  
�並 ����ϸ� ���̺�ó�� ��밡���ϸ� SELECT �������� ���� ����.
INSERT, DELETE, UPDATE �� �Ұ��� �ϴ�.


�� �����
CREATE VIEW ��� AS �� CVAS
������;

60�� �μ��� ���� ��ȸ

SELECT * 
FROM vu_60; --���� �������� �ʾ� ���� �߻�

CREATE OR REPLACE VIEW vu_60 AS
  SELECT employee_id, first_name || ' '|| last_name name,
         department_id, job_id, hire_date, email 
  FROM employees 
  WHERE department_id = 60;

SELECT * FROM vu_60; --�� ���� �Ǿ� ���� ����

----------------------------------------------------------------
�� �����
DROP VIEW ���;
DROP VIEW vu_60;
----------------------------------------------------------------

SELECT * 
FROM vu_60; --���� �Ǿ� ���� �߻�













