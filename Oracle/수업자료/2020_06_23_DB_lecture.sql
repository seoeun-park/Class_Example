10. ���Ἲ ��������(INTEGRITY CONSTRAINT) - ��Ȯ��, ���ռ�, ���Ἲ�� �����ϱ� ���� ��.
- ���̺� �߸��� �������� �Է��� ���� ���� ������ ��Ģ�� �����ϴ� ��
- ���� ���Ǹ��� 30�ڱ��� ��������

- NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY, DEFAULT 6���� ����
- ���������� ���̺� �����ÿ� ������ �� �ְ�, ���̺� ���� �� �߰�/���� �� ���� ����.

�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
�� https://developer-java.tistory.com/14
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�

-----------------------------------------------------------------------------------------------
      ��������            | ��� 
 -----------------------------------------------------------------------------------------------
- NOT NULL                | NULL �� �Է� ����, �÷� ���� ���� ������θ� ����
- CHECK                   | �������� ������ ���� �Է� ��� �� CHECK(gender IN ('��','��'))
- UNIQUE(��ü���Ἲ)      | �ߺ��� �Է� ���� (NULL ���� �ߺ��Է� ����), NOT NULL �� �Բ� ��뵵 ����
                          | 2�� �̻��� �÷��� �̿��Ͽ� �⺻Ű ����(����Ű)
- PRIMARY KEY(��ü���Ἲ) | NOT NULL + UNIQUE, 2�� �̻��� �÷��� �̿��Ͽ� �⺻Ű ����(����Ű)
- FOREIGN KEY(�������Ἲ) | �ٸ� ���̺��� �÷��� ��ȸ�ؼ� ���Ἲ �˻�
- DEFAULT                 | ������ �Է�(����)�� �� �� �������� �⺻�� ����, �÷� ���� ���� ������θ� ����
                            �� gender CHAR(3) DEFAULT '��'
-----------------------------------------------------------------------------------------------
* �������ǿ� �̸� �����ϱ�(���� �������� ����)
�̸��� �������� ������ �ڵ����� �����Ǵµ� 
���߿� ���������� ��Ȱ��ȭ�ϰų� �����ϴ� ���� ������ ���ؼ��� 
�������ǿ� �̸��� �������ִ� ���� ����. 
-----------------------------------------------------------------------------------------------

1. NOT NULL : ������ ���� �ݵ�� ��� �־�߸� �ϴ� ����
NOT NULL : �÷� ���� ���� ������θ� ����
-----------------------------------------------------------------------------------------------
�� ���̺� ������ NOT NULL ���� �� �÷� ���� ���� ������θ� ����
-----------------------------------------------------------------------------------------------
- �÷� ���� ����
�÷��� ������Ÿ�� NOT NULL
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� NOT NULL

- ���̺� ���� ����
�� ���̺� �����δ� NOT NULL ���� �� �� ����
-----------------------------------------------------------------------------------------------
�� ���̺� ������ NOT NULL ����
-----------------------------------------------------------------------------------------------
ALTER TABLE ���̺�� 
MODIFY (�÷��� NOT NULL); --NOT NULL �̾�� (�����Ͱ� �����ؾ�) NOT NULL ���� ����

ALTER TABLE ���̺�� 
MODIFY (�÷��� ������Ÿ�� NOT NULL);

ALTER TABLE ���̺�� 
ADD CONSTRAINT �������Ǹ� CHECK( �÷��� IS NOT NULL );
-----------------------------------------------------------------------------------------------
�� NOT NULL ����
ALTER TABLE ���̺�� 
MODIFY (�÷��� NULL);

ALTER TABLE ���̺�� 
MODIFY (�÷��� ������Ÿ�� NULL);

ALTER TABLE ���̺�� 
DROP CONSTRAINT �������Ǹ�
-----------------------------------------------------------------------------------------------
ex)
ALTER TABLE emp
--MODIFY (name NULL, salary NOT NULL);
MODIFY (name VARCHAR2(30) NULL, salary NUMBER(30) NOT NULL);
-----------------------------------------------------------------------------------------------
DESC emp;

DROP TABLE emp purge;

emp ���̺��� ������.
CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

�̸�     ��?       ����           
------ -------- ------------ 
ID     NOT NULL NUMBER(4)    
NAME   NOT NULL VARCHAR2(30) 
SALARY          NUMBER(8)


emp ���̺� ���� ��������
INSERT INTO emp 
VALUES (100, 'ȫ�浿', NULL);

COMMIT;

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (101, '', NULL); --�� NOT NULL �� NULL �����ϹǷ� ����
------------------
cannot insert NULL

===============================================================================================
-----------------------------------------------------------------------------------------------
���̺� �ɷ��ִ� �������ǰ� �÷�Ȯ���ϱ�
�������� ���� Ȯ�� ���� ���̺� - user_constraints, user_cons_columns ���̺�
-----------------------------------------------------------------------------------------------
user�� ������ ��� �������� ��ȸ ���̺� : user_constraints ���̺�
�÷���(column_name)�� �Ҵ�� ���� ���� ��ȸ ���̺� : user_cons_columns ���̺�
�������Ǹ� : constraint_name, �÷��� : column_name, ��������Ÿ�� : constraint_type
-----------------------------------------------------------------------------------------------
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
***emp ���̺� �ɷ� �ִ� �������� �� �ش� �÷� ��ȸ : 
user_constraints, user_cons_columns ���̺��� ��ȸ
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�

===============================================================================================
�� user_constraints�� �˾ƺ���. �� user�� ������ ��� �������� Ȯ�� ���̺�

-----------------------------------------------------------------------------------------------
DESC user_constraints;                       |  DESC user_cons_columns;
-----------------------------------------------------------------------------------------------
�̸�                ��?       ����           |  �̸�              ��?       ����
----------------- -------- -------------     |  --------------- -------- --------------
OWNER                      VARCHAR2(120)     |  OWNER           NOT NULL VARCHAR2(30)  
CONSTRAINT_NAME   NOT NULL VARCHAR2(30)      |  CONSTRAINT_NAME NOT NULL VARCHAR2(30)  
CONSTRAINT_TYPE ��          VARCHAR2(1)       |  TABLE_NAME      NOT NULL VARCHAR2(30)
TABLE_NAME        NOT NULL VARCHAR2(30)      |  COLUMN_NAME ��            VARCHAR2(4000)
SEARCH_CONDITION           LONG              |  POSITION ��               NUMBER
R_OWNER                    VARCHAR2(120)     |  
R_CONSTRAINT_NAME          VARCHAR2(30)      |
DELETE_RULE                VARCHAR2(9)       |
STATUS                     VARCHAR2(8)       |
DEFERRABLE                 VARCHAR2(14)      |
DEFERRED                   VARCHAR2(9)       |
VALIDATED                  VARCHAR2(13)      |
GENERATED                  VARCHAR2(14)      |
BAD                        VARCHAR2(3)       |
RELY                       VARCHAR2(4)       |
LAST_CHANGE                DATE              |
INDEX_OWNER                VARCHAR2(30)      |
INDEX_NAME                 VARCHAR2(30)      |
INVALID                    VARCHAR2(7)       |
VIEW_RELATED               VARCHAR2(14)      |
-----------------------------------------------------------------------------------------------

SELECT *
FROM user_constraints
WHERE table_name = 'EMP'; --���̺���� �빮�ڸ� ����
--WHERE table_name IN ('EMP'); --���̺���� �빮�ڸ� ����
--WHERE table_name = UPPER('emp');
--WHERE table_name IN (UPPER('emp'));

OWNER   CONSTRAINT_NAME CONSTRAINT_TYPE         TABLE_NAME  SEARCH_CONDITION   R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD    RELY   LAST_CHANGE INDEX_OWNER  INDEX_NAME INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR	    SYS_C007560	    C(NOT NULL üũ�̹Ƿ�)	EMP	        "ID" IS NOT NULL   (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)       (null)     (null)  (null) 			
HR	    SYS_C007561	    C(NOT NULL üũ�̹Ƿ�)	EMP	        "NAME" IS NOT NULL (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)		  (null)	 (null)  (null)

===============================================================================================

�� user_cons_columns�� �˾ƺ���. �� ���� user�� ������ �ִ� column�� �Ҵ�� ���� ���� ���� Ȯ��

DESC user_cons_columns;

�̸�              ��?       ����             
--------------- -------- -------------- 
OWNER           NOT NULL VARCHAR2(30)   
CONSTRAINT_NAME NOT NULL VARCHAR2(30)   
TABLE_NAME      NOT NULL VARCHAR2(30)   
COLUMN_NAME              VARCHAR2(4000) 
POSITION                 NUMBER 

SELECT *
FROM user_cons_columns
WHERE table_name = UPPER('emp'); 

OWNER    CONSTRAINT_NAME    TABLE_NAME   COLUMN_NAME  POSITION
--------------------------------------------------------------
HR	     SYS_C007560	    EMP	         ID	           (nulll)
HR	     SYS_C007561	    EMP	         NAME	       (nulll)

===============================================================================================

����Ŭ CONSTRAINT_TYPE
    C  :  �˻�Ű   CHECK - Ư�� ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���, NOT NULL üũ, CHECK( ) üũ ��
    P  :  �⺻Ű
    R  :  �ܷ�Ű
    U  :  ����Ű

emp ���̺� �ɷ��ִ� ���������̸�, �÷��� ��ȸ (�÷����� user_cons_columns ���̺����� ��ȸ����)
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = UPPER('emp');

CONSTRAINT_NAME  COLUMN_NAME
-----------------------------
SYS_C007117	     ID
SYS_C007118	     NAME

===============================================================================================

user_cons_columns ���̺��� emp ���̺���
�������Ǹ�, �÷���, ������������(constraint_type) ��ȸ
===============================================================================================
*** ���� ���� �� �÷� Ȯ��
-----------------------------------------------------------------------------------------------
SELECT c1.constraint_name, c2.column_name, c1.constraint_type
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = UPPER('emp');
-----------------------------------------------------------------------------------------------
SELECT c2.column_name, c1.constraint_type, c1.constraint_name 
FROM user_constraints c1 JOIN user_cons_columns c2
ON c1.constraint_name = c2.constraint_name
WHERE c1.table_name = UPPER('emp');
-----------------------------------------------------------------------------------------------
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp'); 
-----------------------------------------------------------------------------------------------
SELECT constraint_name, constraint_type, ( SELECT column_name 
                                           FROM user_cons_columns 
                                           WHERE constraint_name = c.constraint_name) column_name
FROM user_constraints c
WHERE table_name = UPPER('emp');
-----------------------------------------------------------------------------------------------
CONSTRAINT_NAME COLUMN_NAME     CONSTRAINT_TYPE 
-----------------------------------------------
SYS_C007608	    ID	            C
SYS_C007609	    NAME	        C
===============================================================================================

DESC emp;

�̸�   ��?         ����           
------ -------- ------------ 
ID     NOT NULL     NUMBER(4)    
NAME   NOT NULL     VARCHAR2(30) 
SALARY              NUMBER(8)    

===============================================================================================

�� ���̺� ���� �� NOT NULL ����
***ALTER TABLE ��ɹ��� ����Ѵ�.
�÷��� NULL �����Ͱ� ���� ��� NOT NULL �� �߰��� �� �ִ�.
��, �����Ͱ� �־�� NOT NULL �߰�

NULL ���� �ִ� �÷��� UPDATE ������ NULL �� �����ְ� 
ALTER TABLE �� ����

salary �� NULL �� NOT NULL �� ����
name �� ������ NOT NULL �� NULL �� ����

SELECT * 
FROM emp;

ID  NAME     SALARY
---- --------- ----------
100 ȫ�浿	 (null)	              

UPDATE emp 
SET salary = 1000
WHERE ID = 100;

SELECT * 
FROM emp;

DESC emp;

salary NOT NULL, name NULL �� ����
-------------------------------------------------
ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
-------------------------------------------------
salary NOT NULL, name NULL �� ���� ��

DESC emp;

�̸�          ��?      ����           
------ -------- ------------ 
ID          NOT NULL    NUMBER(4)    
NAME                    VARCHAR2(30) 
SALARY      NOT NULL    NUMBER(8)    
-----------------------------------------------------------------------------------------------
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp');
-----------------------------------------------------------------------------------------------
SELECT constraint_name, constraint_type, ( SELECT column_name
                                           FROM user_cons_columns
                                           WHERE constraint_name = c.constraint_name ) column_name
FROM user_constraints c
WHERE table_name = UPPER('emp');
-----------------------------------------------------------------------------------------------
* �������ǿ� �̸� �����ϱ�(���� �������� ����)
�̸��� �������� ������ �ڵ����� �����Ǵµ� 
���߿� ���������� ��Ȱ��ȭ�ϰų� �����ϴ� ���� ������ ���ؼ��� 
�������ǿ� �̸��� �������ִ� ���� ����. 
-----------------------------------------------------------------------------------------------

�������Ǽ��� - COLUMN ����, TABLE ����
   ******** 
1. �÷������� �������� ��� ���
-----------------------------------------------------------------------------------------------
�� �÷��� ������Ÿ�� CONSTRAINT �������ǰ�(���̺��_�÷���_���) ��������

CREATE TABLE ���̺��
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ�(���̺��_�÷���_���) ��������,
....
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp000 PURGE;
DROP TABLE dept PURGE; 
-----------------------------------------------------------------------------------------------
CREATE TABLE dept AS --CTAS �� NOT NULL �̿��� ��������(Primary Ű ��)�� ������� �ʴ´�.
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

DESC dept;

--�������� �߰�
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

--�������� ����
ALTER TABLE dept
DROP CONSTRAINT dept_deptno_pk; --�������� ����

DESC dept;
-----------------------------------------------------------------------------------------------
dept ���̺� �������� ����
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('dept');
-----------------------------------------------------------------------------------------------
CREATE TABLE emp000 (
empno  NUMBER(4)    CONSTRAINT emp000_empno_pk   PRIMARY KEY,
ename  VARCHAR2(15) CONSTRAINT emp000_ename_nn   NOT NULL,
job    VARCHAR2(15) CONSTRAINT emp000_job_un     UNIQUE,
deptno NUMBER(2)    CONSTRAINT emp000_deptno_fk  REFERENCES dept(deptno), --REFERENCES �θ����̺� ( �����Ǵ��÷��� )
gender VARCHAR2(1)  CONSTRAINT emp000_gender_ck  CHECK( gender IN('M','F') ) 
);
-----------------------------------------------------------------------------------------------
emp000 ���̺� �������� ����
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp000');
-----------------------------------------------------------------------------------------------

   ***********
2. ���̺� ������ �������� ������
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
***����Ű ������ �� ���� �ݵ�� ���̺� ������ ���������� �����ؾ� �Ѵ�.
***���������� �߰��� ���� ���̺� ������ ���������� �����ؾ� �Ѵ�.
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
CONSTRAINT �������ǰ�(���̺��_�÷���_���) ��������

CREATE TABLE ���̺��
�÷��� ������Ÿ��,
....
CONSTRAINT �������Ǹ�(���̺��_�÷���_���) ��������,
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp000 PURGE;
DROP TABLE dept PURGE; 
-----------------------------------------------------------------------------------------------
CREATE TABLE dept AS
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

DESC dept;
-----------------------------------------------------------------------------------------------
dept ���̺� �������� ����
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('dept');
-----------------------------------------------------------------------------------------------
CREATE TABLE emp000 (
empno  NUMBER(4),
ename  VARCHAR2(15) CONSTRAINT emp000_ename_nn NOT NULL,
job    VARCHAR2(15),
deptno NUMBER(2),
gender VARCHAR2(1) DEFAULT 'M', --���̺� ������ DEFAULT ���� �� �÷� ���� ���� ������θ� ����, CONSTRAINT �������Ǹ� ��� �Ұ�
CONSTRAINT emp000_empno_pk  PRIMARY KEY(empno),
CONSTRAINT emp000_job_un    UNIQUE(job),
CONSTRAINT emp000_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno), --REFERENCES �θ����̺� ( �����Ǵ��÷��� )
CONSTRAINT emp000_gender_ck CHECK( gender IN('M','F') )
); 
-----------------------------------------------------------------------------------------------
emp000 ���̺� �������� ����
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp000');
-----------------------------------------------------------------------------------------------
2. CHECK - �÷��� �̸� ������ ���ǿ� �´� ���� �����ϴ� ���� ���� - NULL ���
-----------------------------------------------------------------------------------------------
�� ���̺� ������ CHECK ����
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- �÷� ���� ���� �� CHECK( gender IN ('��','��') )
�÷��� ������Ÿ�� CHECK (�÷��� ���ǽ�)
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� CHECK (�÷��� ���ǽ�)

- ���̺� ���� ����
CONSTRAINT �������Ǹ� CHECK (�÷��� ���ǽ�)

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3), /* CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') ) */
CONSTRAINT emp_gender_ck CHECK( gender IN ('��','��') )
);
-----------------------------------------------------------------------------------------------

DESC emp;

emp ���̺���
�������Ǹ�, �÷���, ������������(constraint_type) ��ȸ
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp'); 

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES(100, 'ȫ�浿', 5000, '��');

INSERT INTO emp 
VALUES(101, 'ȫ���', 5000, '��'); -- ����Ұ�
--check constraint (HR.EMP_GENDER_CK) violated �� �����ϴ�, ����

SELECT * 
FROM emp;
