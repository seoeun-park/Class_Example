--���Ἲ �������� : ��Ȯ��, ���ռ�, ���Ἲ�� �����ϱ� ���� ��
--NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY, DEFAULT

--NOT NULL : NULL�� �Է� ����
--CHECK : �������� ������ ���� �Է� ��� �� CHECK(gender IN('��', '��'))
--UNIQUE : �ߺ��� �Է� ���� / 2�� �̻��� �÷��� �̿��Ͽ� �⺻Ű ����(����Ű)
--PRIMARY KEY : NOT NULL + UNIQUE
--FOREIGN KEY : �ٸ� ���̺��� �÷���ȸ�ؼ� ���Ἲ �˻�
--DEFAULT : ������ �Է��� �� �� �������� �⺻�� ���� �� gender CHAR(3) DEFAULT '��'

--1. �÷��� ����
--�÷��� ������Ÿ�� NOT NULL
--�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� NOT NULL

--2. ���̺� ���� ����
--���̺� �����δ� NOT NULL ������ �� X
--���̺� ���� �� NOT NULL ����

--ALTER TABLE ���̺��
--MODIFY (�÷��� ������Ÿ�� NOT NULL)

DROP TABLE emp purge;

--emp ���̺��� ������
CREATE TABLE emp(
    id NUMBER(4) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    salary NUMBER(8)
);

DESC emp;

--emp ���̺� ���� ��������
INSERT INTO emp
VALUES (100, 'ȫ�浿', NULL);

COMMIT;

SELECT *
FROM emp;

--INSERT INTO emp
--VALUES (101, '', NULL);       --����

DESC user_constraints;
DESC user_cons_columns;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP';   --���̺���� �빮�ڸ� ����

SELECT *
FROM user_cons_columns
WHERE table_name = UPPER('emp');

--CONSTRAINT_TYPE
--C : �˻�Ű (CHECK - Ư�� ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���, NOT NULL üũ, CHECK() üũ)
--P : �⺻Ű
--R : �ܷ�Ű
--U : ����Ű

SELECT c1.constraint_name, c1.constraint_type, c2.column_name
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = UPPER('emp');

ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
--salary�� ���� ���� ������ NOT NULL �Ұ���, ���� �־��� �� NOT NULL���Ѿ���
--name�� NULL�� ���

UPDATE emp
SET salary = 1000
WHERE id = 100;

SELECT *
FROM emp;

DESC emp;

SELECT c1.constraint_name, c1.constraint_type, c2.column_name
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = 'EMP';

--�������Ǽ��� - COLUMN ����, TABLE ����

--CREATE TABLE ���̺��
--�÷��� ������Ÿ�� CONSTRAINT �������Ǹ�(���̺��_�÷���_���) ��������

CREATE TABLE dept AS      --NOT NULL �̿��� ��������(Primary Ű��)�� ������� �ʴ´�.
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

DESC dept;          --primary key ���� x(DEPTNO�� NOT NULL�̶�� ǥ�� X)
DESC departments;

--���� ���� �߰�(deptno�� department_id��� primary key �߰�)
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

-- primary key �����Ϸ��� 
--ALTER TABLE dept
--DROP CONSTRAINT dept_deptno_pk;

DESC dept;

------------------------------------------------------------------------------------------------------
--�÷� ���� ���� ���
CREATE TABLE emp000(
empno   NUMBER(4)           CONSTRAINT emp000_empno_pk      PRIMARY KEY,
ename   VARCHAR2(15)    CONSTRAINT emp000_ename_nn       NOT NULL,
job         VARCHAR2(15)    CONSTRAINT emp000_job_un            UNIQUE,
deptno   NUMBER(2)          CONSTRAINT emp000_deptno_fk        REFERENCES dept(deptno), --dept ���̺� deptno ����
gender   VARCHAR2(1)     CONSTRAINT emp000_gender_ck        CHECK(gender IN('M', 'F') )
);

--emp000 ���̺� �������� ����
SELECT c1.constraint_name, c1.constraint_type, c2.column_name
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = UPPER('emp000');

-------------------------------------------------------------------------------------------
--���̺� ���� ���� ���(������)

--CREATE TABLE ���̺��
--�÷��� ������Ÿ��,
--.......
--CONTRAINT �������Ǹ�(���̺��_�÷���_���) ��������,
--........

DROP TABLE emp000 PURGE;
DROP TABLE dept PURGE;

CREATE TABLE dept AS
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

--primary key�� ����
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

DESC dept;

CREATE TABLE emp000(
empno   NUMBER(4),           
ename   VARCHAR2(15)    CONSTRAINT emp000_ename_nn       NOT NULL,      --NOT NULL ���������� ������ x
job         VARCHAR2(15),    
deptno   NUMBER(2),          
gender   VARCHAR2(1)      DEFAULT 'M',      --���̺� ���� �� DEFAULT ���� : �÷� ���� ���� ������θ� ����
--������
CONSTRAINT emp000_empno_pk      PRIMARY KEY(empno),
CONSTRAINT emp000_job_un            UNIQUE(job),
CONSTRAINT emp000_deptno_fk       FOREIGN KEY(deptno) REFERENCES dept(deptno), 
CONSTRAINT emp000_gender_ck      CHECK( gender IN('M', 'F') )
);

DROP TABLE emp;

CREATE TABLE emp(
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3),
CONSTRAINT emp_gender_ck CHECK( gender IN ('��', '��') )
);

--INSERT INTO emp
--VALUES(101, 'ȫ���', 5000, '��');        --����Ʈ ���� �ٸ��Ƿ� ����









