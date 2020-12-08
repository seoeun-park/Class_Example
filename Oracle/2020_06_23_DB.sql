--무결성 제약조건 : 정확성, 정합성, 무결성을 보장하기 위해 둠
--NOT NULL, CHECK, UNIQUE, PRIMARY KEY, FOREIGN KEY, DEFAULT

--NOT NULL : NULL값 입력 금지
--CHECK : 조건으로 설정된 값만 입력 허용 → CHECK(gender IN('남', '여'))
--UNIQUE : 중복값 입력 금지 / 2개 이상의 컬럼을 이용하여 기본키 지정(복합키)
--PRIMARY KEY : NOT NULL + UNIQUE
--FOREIGN KEY : 다른 테이블의 컬럼조회해서 무결성 검사
--DEFAULT : 데이터 입력할 때 값 미지정시 기본값 지정 → gender CHAR(3) DEFAULT '남'

--1. 컬럼명 정의
--컬럼명 데이터타입 NOT NULL
--컬럼명 데이터타입 CONSTRAINT 제약조건명 NOT NULL

--2. 테이블 레벨 정의
--테이블 레벨로는 NOT NULL 정의할 수 X
--테이블 생성 후 NOT NULL 지정

--ALTER TABLE 테이블명
--MODIFY (컬럼명 데이터타입 NOT NULL)

DROP TABLE emp purge;

--emp 테이블을 만들어보자
CREATE TABLE emp(
    id NUMBER(4) NOT NULL,
    name VARCHAR2(30) NOT NULL,
    salary NUMBER(8)
);

DESC emp;

--emp 테이블에 삽입 저장하자
INSERT INTO emp
VALUES (100, '홍길동', NULL);

COMMIT;

SELECT *
FROM emp;

--INSERT INTO emp
--VALUES (101, '', NULL);       --오류

DESC user_constraints;
DESC user_cons_columns;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP';   --테이블명이 대문자만 가능

SELECT *
FROM user_cons_columns
WHERE table_name = UPPER('emp');

--CONSTRAINT_TYPE
--C : 검사키 (CHECK - 특정 조건에 맞는 값만 저장하는 제약 조건 - NULL 허용, NOT NULL 체크, CHECK() 체크)
--P : 기본키
--R : 외래키
--U : 유일키

SELECT c1.constraint_name, c1.constraint_type, c2.column_name
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = UPPER('emp');

ALTER TABLE emp
MODIFY (salary NOT NULL, name NULL);
--salary에 값이 없기 때문에 NOT NULL 불가능, 값을 넣어준 후 NOT NULL시켜야함
--name은 NULL값 허용

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

--제약조건선언 - COLUMN 레벨, TABLE 레벨

--CREATE TABLE 테이블명
--컬럼명 데이터타입 CONSTRAINT 제약조건명(테이블명_컬럼명_약어) 제약조건

CREATE TABLE dept AS      --NOT NULL 이외의 제약조건(Primary 키등)은 복사되지 않는다.
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

DESC dept;          --primary key 복사 x(DEPTNO가 NOT NULL이라고 표시 X)
DESC departments;

--제약 조건 추가(deptno에 department_id라는 primary key 추가)
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

-- primary key 제거하려면 
--ALTER TABLE dept
--DROP CONSTRAINT dept_deptno_pk;

DESC dept;

------------------------------------------------------------------------------------------------------
--컬럼 레벨 정의 방식
CREATE TABLE emp000(
empno   NUMBER(4)           CONSTRAINT emp000_empno_pk      PRIMARY KEY,
ename   VARCHAR2(15)    CONSTRAINT emp000_ename_nn       NOT NULL,
job         VARCHAR2(15)    CONSTRAINT emp000_job_un            UNIQUE,
deptno   NUMBER(2)          CONSTRAINT emp000_deptno_fk        REFERENCES dept(deptno), --dept 테이블에 deptno 참조
gender   VARCHAR2(1)     CONSTRAINT emp000_gender_ck        CHECK(gender IN('M', 'F') )
);

--emp000 테이블 제약조건 보기
SELECT c1.constraint_name, c1.constraint_type, c2.column_name
FROM user_constraints c1, user_cons_columns c2
WHERE c1.constraint_name = c2.constraint_name
AND c1.table_name = UPPER('emp000');

-------------------------------------------------------------------------------------------
--테이블 레벨 정의 방식(재정의)

--CREATE TABLE 테이블명
--컬럼명 데이터타입,
--.......
--CONTRAINT 제약조건명(테이블명_컬럼명_약어) 제약조건,
--........

DROP TABLE emp000 PURGE;
DROP TABLE dept PURGE;

CREATE TABLE dept AS
SELECT department_id deptno, department_name deptname, manager_id, location_id
FROM departments;

--primary key로 변경
ALTER TABLE dept
ADD CONSTRAINT dept_deptno_pk PRIMARY KEY (deptno);

DESC dept;

CREATE TABLE emp000(
empno   NUMBER(4),           
ename   VARCHAR2(15)    CONSTRAINT emp000_ename_nn       NOT NULL,      --NOT NULL 제약조건은 재정의 x
job         VARCHAR2(15),    
deptno   NUMBER(2),          
gender   VARCHAR2(1)      DEFAULT 'M',      --테이블 생성 시 DEFAULT 지정 : 컬럼 레벨 정의 방식으로만 정의
--재정의
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
CONSTRAINT emp_gender_ck CHECK( gender IN ('남', '여') )
);

--INSERT INTO emp
--VALUES(101, '홍길명', 5000, '녀');        --디폴트 값과 다르므로 오류









