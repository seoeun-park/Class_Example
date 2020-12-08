--employees 테이블에 새로운 사원정보를 삽입 저장하자
--300번 부서원의 급여를 employees 테이블의 60번 부서의 평균급여로 저장하자
SELECT ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 60;

INSERT INTO employees(employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (300, '길동', '홍', 'hong@naver.com', SYSDATE, 'IT_PROG', (SELECT ROUND(AVG(salary)) avg_sal
                                                                                                        FROM employees
                                                                                                        WHERE department_id = 60));
                                                                                                        
COMMIT; 



--emp 테이블의 202번 사원의 입사일자를
--오늘로부터 6개월 전 날짜로 변경한다
SELECT *
FROM emp;

--emp 테이블의 202번 사원의 입사일자를
--오늘로부터 6개월 전 날짜로 변경한다.
UPDATE emp
SET hire_date = ADD_MONTHS(SYSDATE,-6)
WHERE id = 202;

SELECT *
FROM emp;

COMMIT;

--emp 테이블의 200번 사원에 대해
--employees 테이블의 60번 부서원들 중 최근 입사한 사원의 입사일자로 변경한다
SELECT MAX(hire_date) max_hire
FROM employees
WHERE department_id = 60;

UPDATE emp
SET hire_date = (SELECT MAX(hire_date)
                            FROM employees
                            WHERE department_id = 60)
WHERE id = 200;

SELECT *
FROM emp;

COMMIT;

---------------------------------------------------------------------------------------
--DELETE FROM 테이블명
--WHERE 조건절;

SELECT *
FROM employees;

DELETE FROM employees
WHERE employee_id = 300;

COMMIT;

SELECT *
FROM departments;
--f5키 : 역순으로 출력


--departments 테이블에서 300번 부서를 삭제하자
DELETE FROM departments
WHERE department_id = 300;
--무결성 제약 사항 위반(오류)

-- employees 테이블에서 먼저 삭제한 후 departments 테이블에서 다시 삭제해야한다.
DELETE FROM employees
WHERE department_id = 300;
DELETE FROM departments
WHERE department_id = 300;

COMMIT;

--emp 테이블의 20번 부서원들의 정보를 삭제한다,
DELETE FROM emp
WHERE dept_id = 20;

SELECT *
FROM emp;

-----------------------------------------------------------------------------------------------------
--select update insert delete : dcl > 반드시 tcl(commit, rollback)과 함께 사용
--create, alter, drop, truncate, rename : ddl(autocommit이 된다.)

--문자 : char, varchar2

CREATE TABLE temp(
id NUMBER(4),
name VARCHAR2(30)
);

DESC temp;

--temp 테이블에 데이터 삽입 저장
INSERT INTO temp
VALUES(100, '홍길동');

--id가 101, name이 '이순신'으로 삽입 저장
INSERT INTO temp
VALUES(101, '이순신');

COMMIT;

--temp 테이블에서 코드가 101번인 이름을 홍명보로 변경한다.
UPDATE temp
SET name = '홍명보'
WHERE id = 101;

COMMIT;

SELECT *
FROM temp;

------------------------------------------------------------------------------------------------------------
--CTAS(Create Table As Select)

--employees 테이블의 60번 부서의 사번, 성, 이름, 급여, 입사일자를 복사해서 emp60 테이블 생성하기
CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE department_id = 60;

SELECT *
FROM emp60;

--구조만 복사
CREATE TABLE emp40 AS
SELECT employee_id, last_name, first_name, salary, hire_date
FROM employees
WHERE 1 = 2;

SELECT *
FROM emp40;

----------------------------------------------------------------------------------------
--테이블 구조 변경 : ALTER
--ALTER TABLE 테이블명
--ADD (컬럼명1 데이터타입, 컬럼명2, 데이터타입);

DESC temp;

ALTER TABLE temp
ADD (salary NUMBER(8) );

DESC temp;

SELECT *
FROM temp;

--101번 코드의 급여를 3000으로 변경한다.
UPDATE temp
SET salary = 3000
WHERE id = 101;

SELECT *
FROM temp;

------------------------------------------------------------------------------------------
--데이터 타입 크기변경(MODIFY)
-- UPDATE는 컬럼 안의 데이터 값을 변경
-- MODIFY는 컬럼안에 들어있는 데이터의 타입을 변경
-- ※ MODIFY와 ADD는 뒤에 ()가 들어간다.
--ALTER TABLE 테이블명
--MODIFY (컬럼명 데이터타입(변경할 크기));

ALTER TABLE temp
MODIFY (salary NUMBER(10));

DESC temp;

-----------------------------------------------------------------------------------------
--컬럼 삭제 : DROP COLUMN
--ALTER TABLE 테이블명
--DROP COLUMN 컬럼명;

ALTER TABLE temp
DROP COLUMN salary;

DESC temp;

-----------------------------------------------------------------------------------------
--컬럼명 변경 : RENAME COLUMN
--ALTER TABLE temp
--RENAME COLUMN 원래컬럼명 TO 새컬럼명;

--temp 테이블의 id 컬럼명을 temp_id로 변경한다.
ALTER TABLE temp
RENAME COLUMN id TO temp_id;

DESC temp;

-------------------------------------------------------------------------------------------
--데이터행 삭제 : TRUNCATE - 조건절 사용 불가

--TRUNCATE TABLE 테이블명;          --즉, 구조만 남기고 데이터행 모두 삭제

SELECT *
FROM temp;

DELETE FROM temp;

SELECT *
FROM temp;

ROLLBACK;

SELECT *
FROM temp;

TRUNCATE TABLE temp;    --구조만 남기고 데이터행 모두 삭제

SELECT *
FROM temp;
--TRUNCATE는 ROLLBACK이 불가

--------------------------------------------------------------------------------------
--테이블 삭제 : DROP

DROP TABLE temp;

-----------------------------------------------------------------------------------------
--DROP vs TRUNCATE vs DELETE
--DELETE : 용량은 그대로(rollback이 되야하기 때문)
--TRUNCATE : 테이블 구조만
--DROP : 완전 삭제

FLASHBACK TABLE temp TO BEFORE DROP;
-- drop 했던 테이블을 다시 살림

--휴지통
SELECT *
FROM RECYCLEBIN;

--------------------------------------------------------------------------------
--테이블명 변경 : RENAME
--RENAME 원래테이블명 TO 새테이블명

--temp 테이블의 이름을 test로 변경하라
RENAME temp TO test;



