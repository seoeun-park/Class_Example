10. 무결성 제약조건(INTEGRITY CONSTRAINT) - 정확성, 정합성, 무결성을 보장하기 위해 둠.
- 테이블에 잘못된 데이터의 입력을 막기 위해 일정한 규칙을 지정하는 것
- 제약 조건명은 30자까지 지정가능

- NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY, DEFAULT 6가지 있음
- 제약조건은 테이블 생성시에 정의할 수 있고, 테이블 생성 후 추가/제거 할 수도 있음.

※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
※ https://developer-java.tistory.com/14
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※

-----------------------------------------------------------------------------------------------
      제약조건            | 기능 
 -----------------------------------------------------------------------------------------------
- NOT NULL                | NULL 값 입력 금지, 컬럼 레벨 정의 방식으로만 정의
- CHECK                   | 조건으로 설정된 값만 입력 허용 ☞ CHECK(gender IN ('남','여'))
- UNIQUE(개체무결성)      | 중복값 입력 금지 (NULL 값은 중복입력 가능), NOT NULL 과 함꼐 사용도 가능
                          | 2개 이상의 컬럼을 이용하여 기본키 지정(복합키)
- PRIMARY KEY(개체무결성) | NOT NULL + UNIQUE, 2개 이상의 컬럼을 이용하여 기본키 지정(복합키)
- FOREIGN KEY(참조무결성) | 다른 테이블의 컬럼을 조회해서 무결성 검사
- DEFAULT                 | 데이터 입력(수정)할 때 값 미지정시 기본값 지정, 컬럼 레벨 정의 방식으로만 정의
                            ☞ gender CHAR(3) DEFAULT '남'
-----------------------------------------------------------------------------------------------
* 제약조건에 이름 지정하기(관리 목적으로 생성)
이름을 지정하지 않으면 자동으로 생성되는데 
나중에 제약조건을 비활성화하거나 삭제하는 등의 관리를 위해서는 
제약조건에 이름을 지정해주는 것이 좋다. 
-----------------------------------------------------------------------------------------------

1. NOT NULL : 데이터 값이 반드시 들어 있어야만 하는 형태
NOT NULL : 컬럼 레벨 정의 방식으로만 정의
-----------------------------------------------------------------------------------------------
○ 테이블 생성시 NOT NULL 지정 ☞ 컬럼 레벨 정의 방식으로만 정의
-----------------------------------------------------------------------------------------------
- 컬럼 레벨 정의
컬럼명 데이터타입 NOT NULL
컬럼명 데이터타입 CONSTRAINT 제약조건명 NOT NULL

- 테이블 레벨 정의
☞ 테이블 레벨로는 NOT NULL 정의 할 수 없음
-----------------------------------------------------------------------------------------------
○ 테이블 생성후 NOT NULL 지정
-----------------------------------------------------------------------------------------------
ALTER TABLE 테이블명 
MODIFY (컬럼명 NOT NULL); --NOT NULL 이어야 (데이터가 존재해야) NOT NULL 지정 가능

ALTER TABLE 테이블명 
MODIFY (컬럼명 데이터타입 NOT NULL);

ALTER TABLE 테이블명 
ADD CONSTRAINT 제약조건명 CHECK( 컬럼명 IS NOT NULL );
-----------------------------------------------------------------------------------------------
○ NOT NULL 제거
ALTER TABLE 테이블명 
MODIFY (컬럼명 NULL);

ALTER TABLE 테이블명 
MODIFY (컬럼명 데이터타입 NULL);

ALTER TABLE 테이블명 
DROP CONSTRAINT 제약조건명
-----------------------------------------------------------------------------------------------
ex)
ALTER TABLE emp
--MODIFY (name NULL, salary NOT NULL);
MODIFY (name VARCHAR2(30) NULL, salary NUMBER(30) NOT NULL);
-----------------------------------------------------------------------------------------------
DESC emp;

DROP TABLE emp purge;

emp 테이블을 만들어보자.
CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8)
);

DESC emp;

이름     널?       유형           
------ -------- ------------ 
ID     NOT NULL NUMBER(4)    
NAME   NOT NULL VARCHAR2(30) 
SALARY          NUMBER(8)


emp 테이블에 삽입 저장하자
INSERT INTO emp 
VALUES (100, '홍길동', NULL);

COMMIT;

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES (101, '', NULL); --☜ NOT NULL 에 NULL 삽입하므로 에러
------------------
cannot insert NULL

===============================================================================================
-----------------------------------------------------------------------------------------------
테이블에 걸려있는 제약조건과 컬럼확인하기
제약조건 정보 확인 가능 테이블 - user_constraints, user_cons_columns 테이블
-----------------------------------------------------------------------------------------------
user가 소유한 모든 제약조건 조회 테이블 : user_constraints 테이블
컬럼명(column_name)에 할당된 제약 조건 조회 테이블 : user_cons_columns 테이블
제약조건명 : constraint_name, 컬럼명 : column_name, 제약조건타입 : constraint_type
-----------------------------------------------------------------------------------------------
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
***emp 테이블에 걸려 있는 제약조건 및 해당 컬럼 조회 : 
user_constraints, user_cons_columns 테이블에서 조회
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※

===============================================================================================
※ user_constraints를 알아보자. ☜ user가 소유한 모든 제약조건 확인 테이블

-----------------------------------------------------------------------------------------------
DESC user_constraints;                       |  DESC user_cons_columns;
-----------------------------------------------------------------------------------------------
이름                널?       유형           |  이름              널?       유형
----------------- -------- -------------     |  --------------- -------- --------------
OWNER                      VARCHAR2(120)     |  OWNER           NOT NULL VARCHAR2(30)  
CONSTRAINT_NAME   NOT NULL VARCHAR2(30)      |  CONSTRAINT_NAME NOT NULL VARCHAR2(30)  
CONSTRAINT_TYPE ○          VARCHAR2(1)       |  TABLE_NAME      NOT NULL VARCHAR2(30)
TABLE_NAME        NOT NULL VARCHAR2(30)      |  COLUMN_NAME ○            VARCHAR2(4000)
SEARCH_CONDITION           LONG              |  POSITION ○               NUMBER
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
WHERE table_name = 'EMP'; --테이블명이 대문자만 가능
--WHERE table_name IN ('EMP'); --테이블명이 대문자만 가능
--WHERE table_name = UPPER('emp');
--WHERE table_name IN (UPPER('emp'));

OWNER   CONSTRAINT_NAME CONSTRAINT_TYPE         TABLE_NAME  SEARCH_CONDITION   R_OWNER R_CONSTRAINT_NAME DELETE_RULE STATUS  DEFERRABLE     DEFERRED  VALIDATED GENERATED      BAD    RELY   LAST_CHANGE INDEX_OWNER  INDEX_NAME INVALID VIEW_RELATED  
------------------------------ ------------------------------ - ------------------------------ -------------------------------------------------------------------------------- ------------------------------ ------------------------------ --------- -------- -------------- --------- ------------- -------------- --- ---- -------- ------------------------------ ------------------------------ ------- --------------
HR	    SYS_C007560	    C(NOT NULL 체크이므로)	EMP	        "ID" IS NOT NULL   (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)       (null)     (null)  (null) 			
HR	    SYS_C007561	    C(NOT NULL 체크이므로)	EMP	        "NAME" IS NOT NULL (null)  (null) ENABLED	 (null)      (null)  NOT DEFERRABLE	IMMEDIATE VALIDATED	GENERATED NAME (null) (null) 20/05/19	 (null)		  (null)	 (null)  (null)

===============================================================================================

※ user_cons_columns를 알아보자. ☜ 현재 user가 가지고 있는 column에 할당된 제약 조건 정보 확인

DESC user_cons_columns;

이름              널?       유형             
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

오라클 CONSTRAINT_TYPE
    C  :  검사키   CHECK - 특정 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용, NOT NULL 체크, CHECK( ) 체크 등
    P  :  기본키
    R  :  외래키
    U  :  유일키

emp 테이블에 걸려있는 제약조건이름, 컬럼명 조회 (컬럼명은 user_cons_columns 테이블에서만 조회가능)
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = UPPER('emp');

CONSTRAINT_NAME  COLUMN_NAME
-----------------------------
SYS_C007117	     ID
SYS_C007118	     NAME

===============================================================================================

user_cons_columns 테이블에서 emp 테이블의
제약조건명, 컬럼명, 제약조건유형(constraint_type) 조회
===============================================================================================
*** 제약 조건 및 컬럼 확인
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

이름   널?         유형           
------ -------- ------------ 
ID     NOT NULL     NUMBER(4)    
NAME   NOT NULL     VARCHAR2(30) 
SALARY              NUMBER(8)    

===============================================================================================

○ 테이블 생성 후 NOT NULL 지정
***ALTER TABLE 명령문을 사용한다.
컬럼에 NULL 데이터가 없는 경우 NOT NULL 을 추가할 수 있다.
즉, 데이터가 있어야 NOT NULL 추가

NULL 값이 있는 컬럼에 UPDATE 문으로 NULL 값 없애주고 
ALTER TABLE 로 변경

salary 의 NULL ☞ NOT NULL 로 변경
name 에 지정된 NOT NULL ☞ NULL 로 변경

SELECT * 
FROM emp;

ID  NAME     SALARY
---- --------- ----------
100 홍길동	 (null)	              

UPDATE emp 
SET salary = 1000
WHERE ID = 100;

SELECT * 
FROM emp;

DESC emp;

salary NOT NULL, name NULL 로 변경
-------------------------------------------------
ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
-------------------------------------------------
salary NOT NULL, name NULL 로 변경 후

DESC emp;

이름          널?      유형           
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
* 제약조건에 이름 지정하기(관리 목적으로 생성)
이름을 지정하지 않으면 자동으로 생성되는데 
나중에 제약조건을 비활성화하거나 삭제하는 등의 관리를 위해서는 
제약조건에 이름을 지정해주는 것이 좋다. 
-----------------------------------------------------------------------------------------------

제약조건선언 - COLUMN 레벨, TABLE 레벨
   ******** 
1. 컬럼레벨의 제약조건 기술 방법
-----------------------------------------------------------------------------------------------
☞ 컬럼명 데이터타입 CONSTRAINT 제약조건경(테이블명_컬럼명_약어) 제약조건

CREATE TABLE 테이블명
컬럼명 데이터타입 CONSTRAINT 제약조건명(테이블명_컬럼명_약어) 제약조건,
....
....
);
-----------------------------------------------------------------------------------------------
DROP TABLE emp000 PURGE;
DROP TABLE dept PURGE; 
-----------------------------------------------------------------------------------------------
CREATE TABLE dept AS --CTAS ☞ NOT NULL 이외의 제약조건(Primary 키 등)은 복사되지 않는다.
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

DESC dept;

--제약조건 추가
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

--제약조건 제거
ALTER TABLE dept
DROP CONSTRAINT dept_deptno_pk; --제약조건 제거

DESC dept;
-----------------------------------------------------------------------------------------------
dept 테이블 제약조건 보기
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
deptno NUMBER(2)    CONSTRAINT emp000_deptno_fk  REFERENCES dept(deptno), --REFERENCES 부모테이블 ( 참조되는컬럼명 )
gender VARCHAR2(1)  CONSTRAINT emp000_gender_ck  CHECK( gender IN('M','F') ) 
);
-----------------------------------------------------------------------------------------------
emp000 테이블 제약조건 보기
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp000');
-----------------------------------------------------------------------------------------------

   ***********
2. 테이블 레벨의 제약조건 기술방법
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
***복합키 지정을 할 때는 반드시 테이블 레벨로 제약조건을 지정해야 한다.
***제약조건을 추가할 때도 테이블 레벨로 제약조건을 지정해야 한다.
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
CONSTRAINT 제약조건경(테이블명_컬럼명_약어) 제약조건

CREATE TABLE 테이블명
컬럼명 데이터타입,
....
CONSTRAINT 제약조건명(테이블명_컬럼명_약어) 제약조건,
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
dept 테이블 제약조건 보기
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
gender VARCHAR2(1) DEFAULT 'M', --테이블 생성시 DEFAULT 지정 ☞ 컬럼 레벨 정의 방식으로만 정의, CONSTRAINT 제약조건명 사용 불가
CONSTRAINT emp000_empno_pk  PRIMARY KEY(empno),
CONSTRAINT emp000_job_un    UNIQUE(job),
CONSTRAINT emp000_deptno_fk FOREIGN KEY(deptno) REFERENCES dept(deptno), --REFERENCES 부모테이블 ( 참조되는컬럼명 )
CONSTRAINT emp000_gender_ck CHECK( gender IN('M','F') )
); 
-----------------------------------------------------------------------------------------------
emp000 테이블 제약조건 보기
SELECT constraint_name, column_name, ( SELECT constraint_type
                                       FROM user_constraints 
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp000');
-----------------------------------------------------------------------------------------------
2. CHECK - 컬럼에 미리 지정된 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용
-----------------------------------------------------------------------------------------------
○ 테이블 생성시 CHECK 지정
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- 컬럼 레벨 정의 ☞ CHECK( gender IN ('남','여') )
컬럼명 데이터타입 CHECK (컬럼명 조건식)
컬럼명 데이터타입 CONSTRAINT 제약조건명 CHECK (컬럼명 조건식)

- 테이블 레벨 정의
CONSTRAINT 제약조건명 CHECK (컬럼명 조건식)

CREATE TABLE emp (
id NUMBER(4) NOT NULL,
name VARCHAR2(30) NOT NULL,
salary NUMBER(8),
gender VARCHAR2(3), /* CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') ) */
CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') )
);
-----------------------------------------------------------------------------------------------

DESC emp;

emp 테이블의
제약조건명, 컬럼명, 제약조건유형(constraint_type) 조회
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('emp'); 

SELECT * 
FROM emp;

INSERT INTO emp 
VALUES(100, '홍길동', 5000, '남');

INSERT INTO emp 
VALUES(101, '홍길명', 5000, '녀'); -- 저장불가
--check constraint (HR.EMP_GENDER_CK) violated ☞ 위반하다, 어기다

SELECT * 
FROM emp;
