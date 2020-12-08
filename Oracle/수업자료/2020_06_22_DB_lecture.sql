-----------------------------------------------------------------------------------------------
04. 서브쿼리로 데이터행 변경
emp 테이블의 부서배치 받지 않은 사원들의 부서코드를 
employees 테이블의 업무코드가 'AD_PRES' 인 사원의 부서코드로 변경한다.

employees 테이블의 업무코드가 'AD_PRES' 인 사원의 부서코드 조회
SELECT department_id    --90
FROM employees
WHERE job_id ='AD_PRES';

emp 테이블의 부서배치 받지 않은 사원들의 정보 조회
SELECT *
FROM emp
WHERE dept_id IS NULL;

변경 저장하자
UPDATE emp
SET dept_id = ( SELECT department_id 
                FROM employees 
                WHERE job_id ='AD_PRES' )
WHERE dept_id IS NULL;

조회
SELECT * 
FROM emp;

        ID LAST_NAME                 FIRST_NAME           HIRE_DAT JOB_ID        DEPT_ID
---------- ------------------------- -------------------- -------- ---------- ----------
       200 Whalen                    Jennifer             03/09/17 AD_ASST            10
       201 Hartstein                 Michael              04/02/17 MK_MAN             20
       202 Fay                       Pat                  05/08/17 PU_CLERK           90

COMMIT;

05. employees 테이블의
301번 사원의 급여를 4000으로, 이름을 우치, 성을 전 으로 변경한다.

301번 사원의 급여, 이름, 성 확인
SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

301번 사원의 급여, 이름, 성 변경
UPDATE employees
SET salary = 4000, first_name = '우치', last_name = '전'
WHERE employee_id = 301;

301번 사원의 급여, 이름, 성 조회
SELECT salary, first_name, last_name
FROM employees
WHERE employee_id = 301;

06. employees 테이블의
300번 부서에 속한 사원들의 급여를 5000 으로 변경 저장 하자

300번 부서에 속한 사원들의 사번, 부서코드, 급여 조회
SELECT employee_id, department_id, salary
FROM employees
WHERE department_id = 300;

300번 부서에 속한 사원들의 사번, 부서코드, 급여 변경
UPDATE employees
SET salary = 5000
WHERE department_id = 300;

07. employees 테이블에 새로운 사원정보를 삽입저장하자.
300번으로 사번을 지정하고 급여는 60번 부서의 평균급여로 저장하자.
( 즉, employee_id, first_name, last_name, email, hire_date, job_id, salary
300, 길동, 홍, hong@naver.com, 오늘날짜, IT_PROG, 60번 부서의 평균 급여 )

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

SELECT *
FROM employees;

60번 부서의 평균 급여
SELECT ROUND(AVG(salary)) avg_sal --5760
FROM employees 
WHERE department_id = 60;

INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300, '길동','홍','hong@naver.com', SYSDATE, 'IT_PROG', ( SELECT ROUND(AVG(salary)) 
                                                                 FROM employees 
                                                                 WHERE department_id = 60 ) );
         
COMMIT;

300번 사원의 급여를 우리회사 최고급여로, 전화번호는 062.1234.5678 로 변경저장하자

SELECT *
FROM employees;

DESC employees;

300번 사원의 급여와 전화번호
SELECT salary, phone_number --5760 null
FROM employees
WHERE employee_id = 300;

    SALARY PHONE_NUMBER        
---------- --------------------
      5760 (null)                    

우리회사 최고급여
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
실습
01.emp 테이블의 202번 사원의 입사일자를 
오늘로부터 6개월전 날짜로 변경한다.

SELECT * 
FROM emp;

UPDATE emp
SET hire_date = ADD_MONTHS(SYSDATE,-6)
WHERE id = 202;

SELECT * 
FROM emp;

COMMIT;

02. emp 테이블의 200번 사원에 대해 
employees 테이블의 60번 부서원들 중 최근 입사한 사원의 입사일자로 변경한다.

employees 테이블의 60번 부서원들 중 최근 입사한 사원의 입사일자
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

3. 데이터행 삭제 : DELETE - 조건절이 누락되지 않도록 주의한다.

DELETE FROM 테이블명
WHERE 조건절;

01. employees 테이블에서 300번 사원코드를 삭제하자

SELECT * 
FROM employees;   

DELETE FROM employees
WHERE employee_id = 300;

COMMIT;

SELECT * 
FROM employees; 

02. departments 테이블에서 300번 부서를 삭제하자

SELECT * 
FROM departments; 

DELETE FROM departments
WHERE department_id = 300;   
    --integrity constraint violated - child record found
    --무결성 제약 사항 위반 
    
SELECT *
FROM employees
ORDER BY department_id DESC;
    

그래서, 사원테이블에서 300번 부서를 삭제하자
DELETE FROM employees
WHERE department_id = 300;

그리고 나서, 부서테이블에서 300번 부서를 삭제하자
DELETE FROM departments
WHERE department_id = 300; 

COMMIT;

SELECT * 
FROM departments; 

SELECT * 
FROM employees; 


03. emp 테이블의 20번 부서원들의 정보를 삭제한다.
SELECT * 
FROM emp;

DELETE FROM emp
WHERE dept_id = 20;

SELECT * 
FROM emp;

COMMIT;

정리
===============================================================================================
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
     
2. 변경저장 - UPDATE : 조건절이 누락되지 않도록 주의한다.
UPDATE 테이블명
SET 컬럼명1 = 데이터값1, 컬럼명2 = 데이터값2,  ...
WHERE 조건절;

3. 데이터행 삭제 : DELETE - 조건절이 누락되지 않도록 주의한다.
DELETE FROM 테이블명
WHERE 조건절;
===============================================================================================

* DDL(Data Definition Language) - ★ AUTO COMMIT;
  - CREATE, ALTER, DROP, TRUNCATE, RENAME
  
* 데이터타입 : 문자, 숫자, 날짜
- 문자 : CHAR, VARCHAR2
    CHAR(n)  - 고정문자 : 지정된 사이즈만큼 메모리를 확보한다.
    CHAR(10) - 저장시 abcd 문자를 저장 -> abcd______ 
             ☞ 메모리를 10바이트 확보한 후 저장한다.
    VARCHAR2(n)  - 가변문자 ☞ 데이터를 저장할때 메모리를 확보한다. 
                         최대 4000 바이트
    VARCHAR2(30) - 저장시 abcd 문자를 저장 -> abcd

데이터 사이즈가 고정적인 : 주민번호와 같은 경우 CHAR
    CLOB : 사이즈가 큰 문자 데이터 저장시의 타입
    BLOB : 이미지와 같은 바이너리 데이터 저장시의 타입
    
- 숫자 : NUMBER
    NUMBER(n)   - 정수데이터
    NUMBER(8)   - 99999999까지
    NUMBER(n,p) - 부동소수점데이터
    NUMBER(8,2) - 999999.99
      
- 날짜 : DATE
-----------------------------------------------------------------------------------------------
1. 테이블 생성 - CREATE
CREATE TABLE 테이블명 (
컬럼명1 데이터타입,
컬럼명2 데이터타입,
...
);
-----------------------------------------------------------------------------------------------
CREATE TABLE temp (
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

01. temp 테이블에 데이터 삽입 저장 

id가 100, name이 '홍길동'으로 삽입 저장
INSERT INTO temp
VALUES (100, '홍길동');

SELECT * 
FROM temp;

id가 101, name이 '이순신'으로 삽입 저장
INSERT INTO temp
VALUES (101, '이순신');

COMMIT;

SELECT * 
FROM temp;

02. temp 테이블에서 코드가 101 번인 이름을 '홍명보'로 변경한다.
UPDATE temp 
SET name = '홍명보'
WHERE id = 101;

COMMIT;

SELECT * 
FROM temp;

  ID NAME                          
---------- -------
 100 홍길동                        
 101 홍명보 

-----------------------------------------------------------------------------------------------
★ 다른 테이블의 구조를 복사해서 테이블 생성 ☞ CTAS( Create Table As Select )
 : ****NOT NULL 이외의 제약조건(Primary 키 등)은 복사되지 않는다.
-----------------------------------------------------------------------------------------------

CREATE TABLE 테이블명 AS 조회쿼리문(SELECT 문)
employees 테이블의 60번 부서의 사번, 성, 이름, 급여, 입사일자를 복사해서 emp60 테이블 생성하기

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

DESC emp60;

SELECT * 
FROM emp60;

★ 구조만 복사하고 데이터행을 복사해오지 않은 상태로 테이블 생성하기(구조만 복사)
CREATE TABLE emp40 AS
SELECT employee_id emp_id, last_name, first_name, salary, hire_date
FROM employees
--WHERE 'a' = 'b';  --절대 일치할 수 없는 형태,  엉터리 조건
WHERE 1 = 2;

DESC emp40;

SELECT * 
FROM emp40; --구조만 복사하여 데이터는 존재하지 않음
-----------------------------------------------------------------------------------------------
2. 테이블 구조 변경 - ALTER

1) 컬럼 추가  --ADD
ALTER TABLE 테이블명 
ADD ( 컬럼명1 데이터타입, 컬럼명2 데이터타입, ... );
***
-----------------------------------------------------------------------------------------------
temp 테이블에 숫자 8자리를 담을 salary 컬럼을 추가하자
DESC temp;

ALTER TABLE temp
ADD ( salary NUMBER(8) ); --Default값 null
***

DESC temp;

SELECT * 
FROM temp;

101번 코드의 급여를 3000 으로 변경한다.
UPDATE temp 
SET salary = 3000 
WHERE id = 101;

SELECT * 
FROM temp;
-----------------------------------------------------------------------------------------------
2) 데이터타입 크기 변경  --MODIFY
ALTER TABLE 테이블명 
MODIFY ( 컬럼명 데이터타입(변경할크기) );
******
-----------------------------------------------------------------------------------------------
temp 테이블의 salary 컬럼의 사이즈를 숫자 10 으로 변경한다.
DESC temp;

ALTER TABLE temp
MODIFY ( salary NUMBER(10) );

DESC temp;
-----------------------------------------------------------------------------------------------
3) 컬럼 삭제  --DROP COLUMN
ALTER TABLE 테이블명
DROP COLUMN 컬럼명;
***********
-----------------------------------------------------------------------------------------------
temp 테이블의 salary 컬럼 삭제한다.

DESC temp;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;
-----------------------------------------------------------------------------------------------
4) 컬럼명 변경 --RENAME COLUMN
ALTER TABLE 테이블명 
RENAME COLUMN 원래컬럼명 TO 새컬럼명;
*************
-----------------------------------------------------------------------------------------------
temp 테이블의 id 컬럼명을 temp_id 로 변경한다.

DESC temp;

ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;
-----------------------------------------------------------------------------------------------
3. 데이터행 삭제 - TRUNCATE - 조건절 사용 불가

TRUNCATE TABLE 테이블명; --즉, 구조만 남기고 데이터행 모두 삭제
-----------------------------------------------------------------------------------------------
SELECT * 
FROM temp;

DELETE FROM temp;

SELECT * 
FROM temp;
--------------
선택된 행 없음

ROLLBACK; --DML은 ROLLBACK 가능

SELECT * 
FROM temp;

   TEMP_ID NAME                          
---------- ------------------------------
       100 홍길동                        
       101 홍명보
       
TRUNCATE TABLE temp; --구조만 남기고 데이터행 모두 삭제

SELECT * 
FROM temp;
선택된 행 없음

ROLLBACK; --DDL은 AUTO COMMIT이 실행되므로 ROLLBACK 불가능 

SELECT * 
FROM temp;
선택된 행 없음
-----------------------------------------------------------------------------------------------
4. 테이블 삭제 - DROP
DROP TABLE 테이블명;
-----------------------------------------------------------------------------------------------
DROP TABLE temp;
-----------------------------------------------------------------------------------------------
※ DELETE, TRUNCATE, DROP 명령어의 차이점

- DELETE 명령어는 데이터는 지워지지만 테이블 용량은 줄어 들지 않는다. 
  원하는 데이터만 지울 수 있다. 삭제 후 잘못 삭제한 것을 되돌릴 수 있다.
- TRUNCATE 명령어는 용량이 줄어 들고, 인덱스 등도 모두 삭제 된다. 
  테이블은 삭제하지는 않고, 데이터만 삭제한다. 
  한꺼번에 다 지워야 한다. 삭제 후 절대 되돌릴 수 없다.
- DROP 명령어는 테이블 전체를 삭제, 공간, 객체를 삭제한다. 
  삭제 후 절대 되돌릴 수 없다.
  
[고객 테이블] [원본]       [DELETE 후]             [TRUNCATE 후]             [DROP 후]
이름      주소  연락처     이름   주소  연락처     이름   주소  연락처       삭제됨
홍길동    서울  1111       |   |  |   | |    |
홍길순    천안  2222       |   |  |   | |    |
이순신    부산  3333       |   |  |   | |    |
                           데이터만 지워지고,      데이블은 삭제 안되고,     테이블 전체 삭제
                           용량은 그대로           용량은 줄어들고,
                                                   인덱스 등 모두 삭제
                                                   
-----------------------------------------------------------------------------------------------
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

FLASHBACK TABLE temp TO BEFORE DROP;

★ 휴지통 비우기
PURGE RECYCLEBIN;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
5. 테이블명변경 - RENAME
RENAME 원래테이블명 TO 새테이블명;
-----------------------------------------------------------------------------------------------
temp 테이블명을 test 로 변경한다.

RENAME temp TO test;

DESC test;

정리
===============================================================================================
01. 테이블 생성 -- CREATE
CREATE TABLE 테이블명 (
컬럼명1 데이터타입,
컬럼명2 데이터타입,
...
);

02. 테이블 구조 변경 -- ALTER
1) 컬럼 추가 --ADD
ALTER TABLE 테이블명 
ADD ( 컬럼명1 데이터타입, 컬럼명2 데이터타입, ... );
***

2) 데이터타입 크기 변경 --MODIFY
ALTER TABLE 테이블명 
MODIFY ( 컬럼명 데이터타입(변경할크기) );
******

3) 컬럼 삭제 --DROP COLUMN
ALTER TABLE 테이블명
DROP COLUMN 컬럼명;
***********

4) 컬럼명 변경 --RENAME COLUMN
ALTER TABLE 테이블명 
RENAME COLUMN 원래컬럼명 TO 새컬럼명;
*************

03. 데이터행 삭제 - TRUNCATE - 조건절 사용 불가
TRUNCATE TABLE 테이블명; --즉, 구조만 남기고 데이터행 모두 삭제

04. 테이블 삭제 - DROP
DROP TABLE 테이블명 (purge);


5. 테이블명변경 - RENAME
RENAME 원래테이블명 TO 새테이블명;
===============================================================================================







