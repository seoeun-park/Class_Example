Query LANGUAGE : DML + TCL
DML(Data Manipulation Language) - INSERT, UPDATE, DELETE 
+ TCL(Transaction Control Language)과 함꼐 사용 :  COMMIT(작업확정) / ROLLBACK(작업취소)

1. 삽입저장 : INSERT 
1.1. INSERT INTO 테이블명 
     VALUES ( 테이블 구조 순서에 맞는 데이터값 목록 );
1.2. INSERT INTO 테이블명(컬럼명의 나열)   
     VALUES ( 나열된 컬럼 순서에 맞는 데이터값 목록 );
1.3. INSERT INTO 테이블명 
     조회쿼리문( SELECT 문 ); 
     ☜ ITAS : VALUE 절 없이 SELECT 절 사용해 서브쿼리로 테이블로부터 여러 데이터 행을 복사 저장
     INSERT 절의 저장할 컬럼 목록과 SELECT 절의 컬럼 목록 개수가 같아야 함.
    
지정하지 않은 컬럼값은 자동으로 NULL 이 저장
날짜 데이터는 날짜 포맷 형식을 사용해서 저장할 수 있음.

NULL의 표현 : NULL, ''

DESC departments;

이름            널?      유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  

1.1.  
INSERT INTO 테이블명 
VALUES ( 테이블 구조 순서에 맞는 데이터값 목록 );

01. 부서테이블에 새로운 부서를 등록한다.
부서코드 : 300, 부서명 : 영업부, 부서장사번 : NULL, 위치코드 : NULL

INSERT INTO departments
VALUES (300, '영업부', NULL, NULL);

SELECT * 
FROM departments 
ORDER BY 1 DESC;

02. 부서테이블에 새로운 부서를 등록한다.
INSERT INTO departments
VALUES (310, '개발부', NULL, '' );

03. 모든 데이터의 기본 값(DEFAULT)은 NULL이다.
INSERT INTO departments
VALUES (320,'총무부', DEFAULT, DEFAULT);

04. 작업취소한다.
ROLLBACK;

05. departments부서의 내용을 조회한다.
SELECT * 
FROM departments
ORDER BY 1 DESC;

1.2. 
INSERT INTO 테이블명 ( 컬럼명1, 컬럼명2, ... )
VALUES ( 나열된 컬럼명에 매칭될 데이터값의 목록 );

INSERT INTO 테이블명 ( ★테이블구조에서 NOT NULL 인 컬럼 + 추가컬럼목록 )
VALUES ( 명시된 컬럼명에 순서대로 매칭될 데이터목록 );

DESC departments;

01. 부서테이블에 새로운 부서를 등록한다.
INSERT INTO departments(department_id, department_name)
VALUES (300, '개발부');

SELECT * 
FROM departments 
ORDER BY 1 DESC;

02. 사원테이블에 새로운 사원을 저장하자.

DESC employees; --NOT NULL 확인

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, 
                     --************             ********** *****  **********
                       job_id, salary, department_id)
                     --******
VALUES (301,'길동','홍','GILDONG','10/10/10','MK_REP',3000,300);

COMMIT;

SELECT * 
FROM employees 
ORDER BY 1 DESC;

03. 모든 데이터의 기본값 DEFAULT 는 NULL 이다.
테이블 구조에서의 NOT NULL 컬럼에는 반드시 값을 담아야 데이터 행이 저장된다.

DESC departments;

INSERT INTO departments (department_id)
VALUES (330);  --☜ 저장불가
오류 보고 -
ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")

1.3. ☞ ITAS
INSERT INTO 테이블명 
조회쿼리문( SELECT 문 ); ☜ ITAS
여러행을 한번에 삽입 저장 : 테스트용 데이터

01. 부서테이블에 새로운 부서(부서코드에 1 더하여)를 부서정보를 복사하여 삽입 저장하자.
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

★ CTAS( Create Table As Select ) --****NOT NULL 이외의 제약조건(Primary 키 등)은 복사되지 않는다.
CREATE TABLE 테이블명 AS 조회쿼리문(SELECT 문);

CREATE TABLE emp AS 
SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE 1 = 2; --엉터리 조건 줘서 테이블 구조만 생성

DROP TABLE emp;

-----------------------------------------------------------------------------------------------
★ 삭제된 테이블 휴지통에서 확인
10g : g ☞ 그리드 컴퓨팅, 
      휴지통 개념 생김. 그래서, purge생김, 
      완전 삭제시 PURGE 사용 ☞ DROP TABLE 테이블명 PURGE;
      10g ☞ 한글 2바이트
11g : 11g부터 한글 3바이트

SELECT * 
FROM RECYCLEBIN;

★ 삭제된 테이블 복구
FLASHBACK TABLE 테이블명 TO BEFORE DROP;

FLASHBACK TABLE emp TO BEFORE DROP;

★ 휴지통 비우기
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------
★ 삭제된 emp 테이블을 복구해보자
FLASHBACK TABLE emp TO BEFORE DROP;

SELECT * 
FROM emp;

DESC employees;

이름             널?       유형           
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

이름         널?       유형           
---------- -------- ------------ 
ID                  NUMBER(6)    
LAST_NAME  NOT NULL VARCHAR2(25) 
FIRST_NAME          VARCHAR2(20) 
HIRE_DATE  NOT NULL DATE         
JOB_ID     NOT NULL VARCHAR2(10) 
DEPT_ID             NUMBER(4)

SELECT employee_id id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE department_id IN (10,20); --employees 테이블의 10번, 20번 부서원들 복사

SELECT * 
FROM emp;

emp 테이블에 데이터행을 삽입저장한다.
employees 테이블의 10번, 20번 부서원들의 정보를 복사하여 
emp 테이블에 삽입저장한다.

DESC emp;

INSERT INTO emp(id, last_name, first_name, hire_date, job_id, dept_id)
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id
FROM employees
WHERE department_id IN (10,20);

SELECT * 
FROM emp;

COMMIT;

2. 변경저장 - UPDATE : 조건절이 누락되지 않도록 주의한다.

UPDATE 테이블명
SET 컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2,  ...
WHERE 조건절;

SELECT employee_id, last_name, department_id, salary --108개
FROM employees;

SELECT * --3개
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 MK_REP             20
                                                                   *******            **

01. emp 테이블에서 id가 202인 사원의 부서코드를 30으로, 업무코드를 'programmer'로 변경한다.
UPDATE emp
SET dept_id = 30, job_id = 'progammer'
WHERE id = 202;

SELECT * 
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 progammer          30 --☜ *****

COMMIT;

02. emp 테이블에서 id가 202인 사원의 업무코드를 'PU_CLERK' 로 변경한다.

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

03. emp 테이블에서 id가 202인 사원의 부서코드를 null 로 변경한다.
UPDATE emp
SET dept_id = '' --부서코드를 NULL 값으로 변경
WHERE id = 202;

SELECT * 
FROM emp;

COMMIT;