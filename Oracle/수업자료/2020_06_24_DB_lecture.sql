***제약조건명(CONSTRAINT_NAME)을 gender와 salary 비교 참조
-----------------------------------------------------------------------------------------------
DROP TABLE test;

CREATE TABLE test (
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(10) NOT NULL CHECK ( gender IN ('남성','여성') ),
  salary number(8),
  dept_id number(4),
  CONSTRAINT test_salary_ck CHECK ( salary > 2000 )   
);

test 테이블의
제약조건명, 컬럼명, 제약조건유형(constraint_type) 조회
SELECT constraint_name, column_name, ( SELECT constraint_type 
                                       FROM user_constraints
                                       WHERE constraint_name = c.constraint_name ) constraint_type
FROM user_cons_columns c
WHERE table_name = UPPER('test'); 
-----------------------------------------------------------------------------------------------

○ 테이블 생성 후 CHECK 지정
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 CHECK ( 컬럼명 조건식 );

-----------------------------------------------------------------------------------------------
급여에 대해 3000 이상 5000 이하만 저장할 수 있도록 CHECK 제약조건을 지정한다.
ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 );
-----------------------------------------------------------------------------------------------

user_cons_columns 테이블에서 EMP 테이블의
제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

SELECT * 
FROM emp;

UPDATE emp
SET salary = 5500   -- 업데이트 불가 (salary BETWEEN 3000 AND 5000이므로)
WHERE name = '홍길동'; 

CHECK CONSTRAINT (HR.EMP_GENDER_CK) violated

-----------------------------------------------------------------------------------------------
○ CHECK 제약조건 삭제 --CHECK 제약조건은 변경 불가함. 추가하거나 삭제만 가능!!
ALTER TABLE 테이블명
DROP CONSTRAINT 제약조건명;

ALTER TABLE emp
DROP CONSTRAINT emp_salary_ck;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP'; 

ALTER TABLE emp
ADD CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 6000 );
-----------------------------------------------------------------------------------------------
○ 제약조건 이름 변경
ALTER TABLE 테이블명
RENAME CONSTRAINT 기존제약조건명 TO 바꿀제약조건명;

ALTER TABLE emp
RENAME CONSTRAINT EMP_GENDER_CK TO EMP_GENDER_CK2;
-----------------------------------------------------------------------------------------------

3. UNIQUE - 데이터가 중복되지 않도록 유일성을 보장하는 조건 , 
NULL 값 중복입력 가능 , NOT NULL 과 함꼐 사용도 가능
컬럼 레벨, 테이블 레벨에서 정의하고 복합키 생성할 수 있다.
여러개의 컬럼에 대해 하나의 제약조건을 지정할 수 있다 : 복합키

-----------------------------------------------------------------------------------------------
○ 테이블 생성시 UNIQUE 지정
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- 컬럼 레벨 정의
컬럼명 데이터타입 UNIQUE
컬럼명 데이터타입 CONSTRAINT 제약조건명 UNIQUE

- 테이블 레벨 정의
CONSTRAINT 제약조건명 UNIQUE (컬럼명)

CREATE TABLE emp (
  id NUMBER(4) NOT NULL,
  name VARCHAR2(30) NOT NULL,
  salary NUMBER(8),
  gender VARCHAR2(3),
  email VARCHAR2(50), /* CONSTRAINT emp_email_uk2 UNIQUE  */
                      /* employees 테이블의 email 컬럼에
                         emp_email_uk 제약조건명을 이미 지정해서 중복 불가 */
  CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
  CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') ),
  CONSTRAINT emp_email2_uk UNIQUE( email ),
  CONSTRAINT emp_email3_uk UNIQUE( name, email ) --복합키
);

-----------------------------------------------------------------------------------------------
-- 제약조건명이 emp_email_uk 인 테이블 찾기

SELECT table_name, constraint_name, constraint_type
FROM user_constraints
WHERE constraint_name = UPPER('emp_email_uk'); --employees 테이블에 존재함
-----------------------------------------------------------------------------------------------
DESC user_constraints;


SELECT *
FROM user_constraints
WHERE table_name = UPPER('emp'); 

여러개의 컬럼에 대해 하나의 제약조건을 지정할 수 있다 : 복합키
책 참조 : 83페이지

-----------------------------------------------------------------------------------------------
○ 테이블 생성 후 UNIQUE 제약조건 지정
ALTER TABLE 테이블명 
ADD CONSTRAINT 제약조건명 UNIQUE( 컬럼명 );
-----------------------------------------------------------------------------------------------
○ UNIQUE 제약조건 삭제
ALTER TABLE 테이블명 
DROP CONSTRAINT 제약조건명;
-----------------------------------------------------------------------------------------------

4. PRIMARY KEY : 데이터 행을 대표하도록 유일하게 식별하기 위한 제약 조건, 데이터의 무결성 유지
- NOT NULL + UNIQUE 의 형태
- PK , 주키, 기본키, 식별자 - 테이블당 한 개만 지정 가능
- 주민번호, 사번, 학번,...
- 컬럼 레벨, 테이블 레벨에서 정의하고 복합키를 생성할 수 있다.
- 테이블 당 1개의 기본키만 생성가능, 
- 하나의 컬럼으로만 기본키 지정 가능(컬럼 레벨에서 제약 조건명을 지정하지 않은 경우)
- 물론 여러 컬럼을 묶어 하나의 기본키로 지정 가능(최대 32개 까지) 
-----------------------------------------------------------------------------------------------
○ 테이블 생성시 UNIQUE 지정
-----------------------------------------------------------------------------------------------
- 컬럼 레벨 정의
컬럼명 데이터타입 PRIMARY KEY
컬럼명 데이터타입 CONSTRAINT 제약조건명 PRIMARY KEY

- 테이블 레벨 정의
CONSTRAINT 제약조건명 PRIMARY KEY ( 컬럼명, 컬럼명, 컬럼명... ) ☜ 복합키 지정 가능
CONSTRAINT 제약조건명 UNIQUE ( 컬럼명, 컬럼명, 컬럼명... ) ☜ 복합키 지정 가능
-----------------------------------------------------------------------------------------------
DROP TABLE emp;

CREATE TABLE emp (
id NUMBER(4) /* CONSTRAINT emp_id_pk PRIMARY KEY */,
name VARCHAR2(30) NOT NULL UNIQUE,
salary NUMBER(8),
gender VARCHAR2(3),
email VARCHAR2(50) /* CONSTRAINT emp_email2_uk UNIQUE */ 
                      /* CONSTRAINT emp_email_uk UNIQUE 
                      employees 테이블의 email 컬럼에
                      emp_email_uk 이미 지정해서 중복 불가*/, 
CONSTRAINT emp_id_pk     PRIMARY KEY( id ),
CONSTRAINT emp_salary_ck CHECK( salary BETWEEN 3000 AND 5000 ),
CONSTRAINT emp_gender_ck CHECK( gender IN ('남','여') ),
CONSTRAINT emp_email2_uk UNIQUE( email ),
CONSTRAINT emp_email3_uk UNIQUE( name, email ) --복합키
);

DESC emp;

emp 테이블의 제약조건명, 컬럼명, 제약조건타입 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

-----------------------------------------------------------------------------------------------
○ 테이블 생성 후 PRIMARY KEY 제약조건 지정 ☜ 추가시 테이블 레벨로 정의
ALTER TABLE 테이블명 
ADD CONSTRAINT 제약조건명 PRIMARY KEY ( 컬럼명, 컬럼명, 컬럼명... )

ALTER TABLE emp 
ADD CONSTRAINT emp_id_pk PRIMARY KEY ( id );
-----------------------------------------------------------------------------------------------
○ PRIMARY KEY 제약조건 삭제
ALTER TABLE 테이블명 
DROP CONSTRAINT 제약조건명;

ALTER TABLE emp 
DROP CONSTRAINT emp_id_pk;
-----------------------------------------------------------------------------------------------

5. FOREIGN KEY : 부모테이블의 컬럼을 참조하는 자식테이블의 컬럼, NULL 허용
- 참조 데이터 무결성 보장 
- 참조 데이터 무결성 보장을 통해, 참조 관계가 있는 테이블의 데이터 추가, 삭제, 수정을 통제할 수 있다. 

- '관계'에 관한 제약조건이 복잡
▶ 참조하는 테이블이 먼저 생성되어 있어야 함.
▶ 외래키가 참조하는 컬럼은 참조하는 테이블의 기본키(PRIMARY KEY)이어야 함.
▶ 여러 컬럼을 외래키로 할 경우, 참조하는 테이블의 기본키와 컬럼 개수 및 순서가 같아야 함.
▶ 기본키와 마찬가지로, 최대 32개 컬럼까지 가능.

- FK, 외래키, 참조키
컬럼 레벨, 테이블 레벨에서 정의하고 복합키를 생성할 수 있다.

-----------------------------------------------------------------------------------------------
○ 테이블 생성시 FOREIGN KEY 지정
-----------------------------------------------------------------------------------------------
DROP TABLE emp purge;

- 컬럼 레벨 정의
컬럼명 데이터타입 REFERENCES 부모테이블 ( 참조되는 컬럼명 )
컬럼명 데이터타입 CONSTRAINT 제약조건명 REFERENCES 부모테이블 ( 참조되는 컬럼명 )

- 테이블 레벨 정의
CONSTRAINT 제약조건명 FOREIGN KEY( 참조하는 컬럼명 ) 
                      REFERENCES 부모테이블 ( 참조되는 컬럼명 )
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
CONSTRAINT emp_gender_ck  CHECK( gender IN ('남','여') ),
CONSTRAINT emp_email2_uk  UNIQUE( email ),
CONSTRAINT emp_email3_uk  UNIQUE( name, email ), --복합키
CONSTRAINT emp_dept_id_fk FOREIGN KEY( dept_id )
                          REFERENCES departments( department_id )
);
FK 에 의해  테이블간 부모 - 자식 관계가 형성된다
FK 를 지정하는 테이블이 자식 테이블이고
FK 에 의해 참조되는 테이블이 부모 테이블
employees(자식) - departments(부모)
참조 되어질 부모테이블의 컬럼은 반드시 PK 만 참조될 수 있다.

DESC emp;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP'; 

* user_cons_columns 테이블에서 EMPLOYEES 테이블과 DEPARTMENTS 테이블의
테이블명, 제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
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
○ 테이블 생성 후 FOREIGN KEY 제약 조건 지정
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 FOREIGN KEY( 참조하는 컬럼명 ) 
                          REFERENCES 부모테이블 ( 참조되는 컬럼명 )
ALTER TABLE emp
ADD CONSTRAINT emp_dept_id_fk FOREIGN KEY(dept_id)
                              REFERENCES departments(department_id);
-----------------------------------------------------------------------------------------------
○ FOREIGN KEY 제약조건 삭제
ALTER TABLE 테이블명 
DROP CONSTRAINT 제약조건명;

ALTER TABLE emp
DROP CONSTRAINT emp_dept_id_fk;
-----------------------------------------------------------------------------------------------
제약조건명, 컬럼명, 제약조건유형(CONSTRAINT_TYPE) 조회
SELECT CONSTRAINT_NAME, COLUMN_NAME, ( SELECT CONSTRAINT_TYPE 
                                       FROM user_constraints
                                       WHERE CONSTRAINT_NAME = c.CONSTRAINT_NAME ) CONSTRAINT_TYPE
FROM user_cons_columns c
WHERE table_name = UPPER('emp');

SELECT * 
FROM emp;

INSERT INTO emp
VALUES (100, '홍길동', 3000,  '남', '', '');

UPDATE emp 
SET dept_id = 15 
WHERE id = 100; 
--integrity constraint (HR.EMP_DEPT_ID_PK) violated - parent key not found

SELECT * 
FROM emp;

-----------------------------------------------------------------------------------------------
DDL
1. 생성 CREATE
CREATE TABLE 테이블명(
컬럼명1 데이터타입 CONSTRAINT 제약조건명 NOT NULL,
컬럼명2 데이터타입 CONSTRAINT 제약조건명 CHECK (컬럼명2 조건식),
컬럼명3 데이터타입 CONSTRAINT 제약조건명 UNIQUE,
컬럼명4 데이터타입 CONSTRAINT 제약조건명 PRIMARY KEY,
컬럼명5 데이터타입 CONSTRAINT 제약조건명 REFERENCES 부모테이블(PK인컬럼),
CONSTRAINT 제약조건명 CHECK (컬럼명2 조건식),
CONSTRAINT 제약조건명 UNIQUE (컬럼명3),
CONSTRAINT 제약조건명 PRIMARY KEY (컬럼명4),
CONSTRAINT 제약조건명 FOREIGN KEY (컬럼명5) REFERENCES 부모테이블(PK인컬럼)
);

2. 구조변경 ALTER
○ 제약조건 추가
1. NOT NULL - 값이 없는 데이터를 관리하지 않도록
ALTER TABLE 테이블명 
MODIFY ( 컬럼명 데이터타입 NOT NULL);

2. CHECK 추가 - 특정 조건에 맞지 않는 데이터를 관리하지 않도록, NULL 허용
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 CHECK ( 컬럼명 조건식 );

3. UNIQUE 추가 - 유일성을 보장받지 못한 데이터는 관리하지 않도록, NULL 허용
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 UNIQUE ( 컬럼명 );

4. PRIMARY KEY 추가 - 식별자, 기본키, 주키, PK : NOT NULL + UNIQUE
ALTER TABLE 테이블명 
ADD CONSTRAINT 제약조건명 PRIMARY KEY ( 컬럼명 );

5. FOREIGN KEY 추가 - 외래키, 참조키, FK : NULL 허용, 부모테이블의 PK 인 컬럼을 참조
ALTER TABLE 테이블명
ADD CONSTRAINT 제약조건명 FOREIGN KEY ( 컬럼명 ) 
                          REFERENCES 부모테이블 ( PK인컬럼 );
                          
6. DEFAULT 추가 - 미 입력시 기본값 저장
ALTER TABLE 테이블명
MODIFY ( 컬럼명 데이터타입 DEFAULT '값' );

○ 제약조건 삭제
ALTER TABLE 테이블명
DROP CONSTRAINT 제약조건명
-----------------------------------------------------------------------------------------------

DESC emp;
SELECT * FROM emp;

데이터 삽입저장
INSERT INTO emp(id, name, salary, gender, email, dept_id)
VALUES (101, '전우치', 3000, '남', NULL, DEFAULT);
SELECT * FROM emp;

INSERT INTO emp(id, name, salary)
VALUES (102, '심청', 5000);

SELECT * 
FROM emp;

성별을 데이터를 저장하지 않으면 기본값으로 '남' 이 저장되게 하고자 한다.
컬럼에 대한 DEFAULT 지정

ALTER TABLE emp
MODIFY (gender DEFAULT '남');

INSERT INTO emp(id, name, salary)
VALUES (103, '박문수', 4000);

SELECT * FROM emp;

입사일자 추가
ALTER TABLE emp 
--ADD ( hire_date date DEFAULT SYSDATE NOT NULL );
ADD ( hire_date date DEFAULT SYSDATE );

INSERT INTO emp(id, name, salary)
VALUES (104, '이몽룡', 5000);
SELECT * FROM emp;

-----------------------------------------------------------------------------------------------

※ VIEW (뷰)
- 실제로 데이터가 존재하는 객체는 아니다
- 테이블의 데이터를 뷰를 통해 접근한다.
  1. 보안 - 접근 권한
  2. 복잡한 쿼리문을 단순한 쿼리문으로 사용할 수 있다.
  
뷰를 사용하면 테이블처럼 사용가능하며 SELECT 절에서만 쿼리 가능.
INSERT, DELETE, UPDATE 가 불가능 하다.


★ 뷰생성
CREATE VIEW 뷰명 AS ☜ CVAS
쿼리문;

60번 부서원 정보 조회

SELECT * 
FROM vu_60; --아직 존재하지 않아 오류 발생

CREATE OR REPLACE VIEW vu_60 AS
  SELECT employee_id, first_name || ' '|| last_name name,
         department_id, job_id, hire_date, email 
  FROM employees 
  WHERE department_id = 60;

SELECT * FROM vu_60; --뷰 생성 되어 쿼리 가능

----------------------------------------------------------------
★ 뷰삭제
DROP VIEW 뷰명;
DROP VIEW vu_60;
----------------------------------------------------------------

SELECT * 
FROM vu_60; --삭제 되어 오류 발생













