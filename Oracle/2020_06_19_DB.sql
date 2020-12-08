-- SET
--UNION : 집합에서 합집합에 해당하는 연산자로 중복을 제거한 행의 결과를 반환한다.

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
UNION
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;                  --2개 행만 출력

--예제[7-2] 관리되고 있는 부서, 관리되고 있는 도시 정보를 조회한다.
SELECT department_id code, department_name name
FROM departments
UNION
SELECT location_id, city
FROM locations;

--구조 보기
DESC locations;
DESC countries;

--관리되고 있는 도시, 관리되고 있는 국가 정보를 조회한다.
SELECT TO_CHAR(location_id) code, city name
FROM locations
UNION
SELECT country_id, country_name
               --country_id는 CHAR(2 BYTE)
FROM countries;

--UNION ALL
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
UNION ALL
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;      --3개 행 출력

--INSERT
--집합에서의 교집합에 해당하는 연산자로 공통된 행의 결과를 반환
SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
INTERSECT
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;


SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
INTERSECT
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
INTERSECT
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;      --아무 것도 출력되지 않음

--80번 부서와 50번 부서에 공통으로 있는 사원의 이름을 조회
SELECT first_name       --개별적으로 조회하면 34개 조회(David, Peter 2명씩)
FROM employees
WHERE department_id = 80
INTERSECT
SELECT first_name       --개별적으로 조회하면 45개 조회(James, Julia, Kevin, Randall이 2명씩)
FROM employees
WHERE department_id = 50;

----------------------------------------------------------------------------
--MINUS : 집합에서의 차집합에 해당

SELECT 1, 3, 4, 5, 7, 8, 'A' first
FROM dual
UNION
SELECT 2, 4, 5, 6, 8, NULL, 'B' second
FROM dual
MINUS
SELECT 1, 3, 4, 5, 7, 8,  'A' third
FROM dual;

--80번 부서원의 이름에서 50번 부서에 공통으로 존재하는 이름을 제거
SELECT first_name
FROM employees
WHERE department_id = 80
MINUS
SELECT first_name
FROM employees
WHERE department_id = 50;       --34 - 4(Jonh 1명 Peter 2명, 같은 테이블에 David 2명이므로 1명을 제외 )

--150번 이하 부서원의 이름에서 업무코드가 ST_CLERK인 부서원의 이름을 제외
SELECT employee_id, first_name, job_id
FROM employees
WHERE employee_id <= 150
MINUS
SELECT employee_id, first_name, job_id
FROM employees
WHERE job_id = 'ST_CLERK';

--사번(EMP), 이름(NAME), 부서명(DEPT), 매니저여부(MANAGER), 급여(SALARY)
--매니저 여부는 매니저에 해당하는 사람은 Manager라 표기하고
--매니저가 아닌 사람은 Null로 표시되게 한다.
SELECT e.employee_id emp, e.first_name || ' ' || e.last_name name,
               d.department_name dept, NVL2(e.manager_id, 'Manager', '') manager,
               e.salary salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-------------------------------------------------------------------------------------------------------------
--DML : INSERT, UPDATE, DELETE
-- + TCL : COMMIT(작업 확정), ROLLBACK(작업 취소)

DESC departments;

--부서 테이블에 새로운 부서를 등록한다
--부서 코드 : 300, 부서명 : 영업부, 부서장사번 : NULL, 위치코드 : NULL
INSERT INTO departments
VALUES (300, '영업부', NULL, NULL);

SELECT *
FROM departments
ORDER BY 1 DESC;

COMMIT;

INSERT INTO departments
VALUES (310, '개발부', '', '');

SELECT *
FROM departments
ORDER BY 1 DESC;

--모든 데이터의 기본 값(DEFAULT)은 NULL이다.
INSERT INTO departments
VALUES (320, '영업부', DEFAULT, DEFAULT);

ROLLBACK;
--COMMIT 하기 전까지 실행 취소

SELECT *
FROM departments
ORDER BY 1 DESC;

---------------------------------------------------------------------------------------------
-- NOT NULL인 행은 무조건 값을 넣어주어야 한다.

-- 부서 테이블에서 새로운 부서를 저장하자
DELETE FROM departments
WHERE department_id = 300;

INSERT INTO departments (department_id, department_name)
VALUES (300, '개발부');

--사원 테이블에서 새로운 사원을 저장하자

DESC employees;         --NOT NULL 확인

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date,
                                            job_id, salary, department_id)
VALUES (301, '길동', '홍', 'gildong', '10/10/10', 'MK_REP', 3000, 300);

COMMIT;

SELECT *
FROM employees
ORDER BY 1 DESC;

-----------------------------------------------------------------------------------
DESC departments;
--NOT NULL인 행(department_id, department_name)


-------------------------------------------------------------------------------------
--ITAS
--여러 행은 한번에 삽입 저장 : 테스트용 데이터
SELECT *
FROM departments;

INSERT INTO departments
SELECT department_id + 1, department_name, manager_id, location_id
FROM departments;

SELECT *
FROM departments;

ROLLBACK;

SELECT *
FROM departments;

-------------------------------------------------------------------------------------------------------
--CTAS(Create Table As Select) : NOT NULL 이외의 제약조건(Primary 키 등)은 복사되지 않는다.

CREATE TABLE emp60 AS
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE department_id = 60;

SELECT *
FROM emp60;

DROP TABLE emp60;   --휴지통으로 이동

SELECT *
FROM RECYCLEBIN;        --휴지통 조회

FLASHBACK TABLE emp60 TO BEFORE DROP;

DROP TABLE emp60;

PURGE RECYCLEBIN;       --휴지통 비우기

--구조만 복사 : 항상 거짓인 조건식 작성
CREATE TABLE emp AS
SELECT employee_id, last_name, first_name, hire_date, job_id, department_id dept_id
FROM employees
WHERE 1 = 2;

DESC emp;       --구조만 복사

--emp 테이블에 데이터 행을 삽입한다
--employees 테이블의 10번, 20번 부서원들의 정보를 복사하여
--emp 테이블에 삽입 저장한다.
INSERT INTO emp
SELECT employee_id, last_name, first_name, hire_date,
               job_id, department_id
FROM employees
WHERE department_id IN (10, 20);

SELECT *
FROM emp;

---------------------------------------------------------------------------------------
--UPDATE : 조건절이 누락되지 않도록 주의한다.

SELECT *
FROM emp;

--emp 테이블에서 id가 202인 사원의 부서코드를 30으로, 업무코드를 programmer로 변경한다.
UPDATE emp
SET job_id = 'programmer', dept_id = 30
WHERE employee_id = 202;

SELECT *
FROM emp;

--emp 테이블에서 id가 202인 사원의 업무코드를 PU_CLERK로 변경한다
UPDATE emp
SET job_id = 'PU_CLERK'
WHERE employee_id = 202;

SELECT *
FROM emp;

--emp 테이블에서 id가 202인 사원의 부서코드를 null로 변경한다
UPDATE emp
SET dept_id = ''
WHERE employee_id = 202;

SELECT *
FROM emp;

-------------------------------------------------------------------------------------------------
--서브쿼리로 데이터행 변경

--emp 테이블의 부서배치 받지 않은 사원들의
--부서코드를 employees 데이블의 업무 코드가 'AD_PRES'인 사원의 부서코드로 변경한다.
UPDATE emp
SET dept_id = (SELECT department_id
                           FROM employees
                           WHERE job_id = 'AD_PRES')
WHERE dept_id IS NULL;

SELECT *
FROM emp;

COMMIT;

--employees 테이블의 301번 사원의 급여를 4000으로 이름을 우치, 성을 전으로 변경한다
UPDATE employees
SET salary = 4000, last_name = '전', first_name = '우치' 
WHERE employee_id = 301;

SELECT *
FROM employees
ORDER BY 1 DESC;

--partition by
