--tblPanme 테이블
CREATE TABLE tblpanme(
    code VARCHAR2(10),
    part VARCHAR2(20),
    price NUMBER
);

--테이블 명 보기
SELECT table_name
FROM user_tables;

--레코드 입력
INSERT INTO tblpanme(code, part, price)
VALUES ('001', 'A영업부', 3000);

INSERT INTO tblpanme
VALUES('002', 'B영업부', 6000);

INSERT INTO tblpanme
VALUES('003', 'C영업부', 2000);

INSERT INTO tblpanme
VALUES('004', 'D영업부', 5000);

INSERT INTO tblpanme
VALUES('005', 'C영업부', 1000);

INSERT INTO tblpanme
VALUES('002', 'D영업부', 4000);

SELECT
    *
FROM tblpanme;

--확정
COMMIT;

--각 부서(part)별(그룹별로 묶어서, GROUP BY)로 판매 금액(price)의 합계(SUM(price))를 구하여 조회(출력)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part;

--각 부서(part)별(그룹별로 묶어서, GROUP BY)로 판매 금액(price)의 합계(SUM(price))를 구하여 오름차순으로 조회(출력)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
ORDER BY part;

--각 부서(part)별(그룹별로 묶어서, GROUP BY)로 판매 금액(price)의 합계(SUM(price))를 구하여 내림차순으로 조회(출력)
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
ORDER BY part DESC;

--부서의 개수가 몇개인지 알아보기
SELECT COUNT(part)
FROM tblpanme;

--부서의 개수가 몇개인지 알아보기(중복된 부서 제외)
SELECT COUNT(DISTINCT part)
FROM tblpanme;

UPDATE tblpanme
SET part='A영업부'
WHERE code=3;

UPDATE tblpanme
SET part='B영업부'
WHERE code=4;

--각 부서별로 판매 금액의 총합을 구하여 부서의 오름차순으로 정렬하여 출력
--단, 부서가 2개 이상 있는 부서만 대상으로 하시오 >  A영업부, B영업부
SELECT part, SUM(price) total
FROM tblpanme
--WHERE
GROUP BY part
-- GROUP BY에서는 WHERE 조건문을 쓰지 X, 대신 HAVING COUNT를 쓴다.
HAVING COUNT(part)>=2
ORDER BY part;

------------------------------------------------------------------------------hr로 변환

SELECT *
FROM employees;

--F5키 : 마지막 결과만 출력
--ctrl + enter : 순차적으로 결과를 출력

--employee_id(사번)
SELECT employee_id
FROM employees;

--사원테이블에서 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees;

--사원들에 대한 사번, 이름 성, 부서콛즈 입사일자, 업무코드, 급여 조회(작성한 순서대로 조회)
SELECT employee_id,  first_name, last_name, department_id, job_id, salary
FROM employees;

--where 조건절 : 특정 조건에 맞는 데이터행을 조회하고자 할 때
--where절에는 ALIASING(별명) 사용 x

--80번 부서 사원의 한 해 동안받은 연봉을 조회
SELECT employee_id, last_name, salary*12
FROM employees
WHERE department_id=80;

--ALIAS명에 공백이 있을 경우 공백을 쌍따옴표(")로 대체한다. 공백이 없으면 쌍따옴표 생략이 가능하다.

SELECT employee_id, first_name, last_name, job_id, salary, salary*12 annual_salary
FROM employees
WHERE salary*12 >= 120000; --WHERE절에서는 ALIAS 불가능

--문자열 연결 연산자 : || : SELECT 절과 조건절에 사용가능(SELECT절에서 많이 사용)

--사번이 101번이 사원의 사번, 성, 명을 조회
--성명은 이름과 성을 합해서 사용한다.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE employee_id=101;

--성명이 StevenKing인 사원의 사번, 성명, 업무코드, 급여, 부서코드 조회
--성명은 이름과 성을 합해서 사용한다.
SELECT employee_id, first_name || ' ' || last_name name, job_id, salary, department_id
FROM employees
--WHERE name = ' StevenKing';
WHERE  first_name || last_name = 'StevenKing';

SELECT employee_id, first_name || last_name name, department_id dept_id
FROM employees
--WHERE name = ' StevenKing';
WHERE  first_name || ' ' || last_name = 'Steven King';

--사번이 101번인 사원의 사번, 성명을 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name || last_name name
FROM employees
--WHERE name = 'StevenKing';
WHERE  first_name || ' ' || last_name = 'Steven King';


--사번이 101번인 사원의 성명과 한 해 동안 받은 급여를 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
--연봉은 'annual salary'로 별명한다.
SELECT first_name || ' ' || last_name name, salary*12 "annual salary"
FROM employees
WHERE employee_id=101;

--급여가 3000 이하인 사원의 사번, 성, 급여, 부서코드, 업무코드를 조회한다.
SELECT employee_id, last_name, salary, department_id, job_id
FROM employees
WHERE salary <= 3000;

--부서코드가 80 초과인 사원의 사번, 성, 급여, 부서코드를 조회한다.
SELECT employee_id, lst_name, salary, department_id
FROM employees
WHERE department_id > 80;

--부서코드가 90인 부서에 속한 사원들의 사번, 이름, 성, 부서코드, 업무코드 조회
SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id = 90;

SELECT employee_id, first_name, last_name, department_id, job_id
FROM employees
WHERE department_id IN(90, 100);
--비교하는 대상이 여러개일 경우 IN으로 쓰는 것이 편함

--급여가 17000인 사원들의 사번, 이름, 성, 부서코드, 급여 조회
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary=17000;

--급여가 3000이하인 사원들의 사번, 이름, 성, 업무코드, 급여, 입사날짜 조회
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE salary <= 3000;

--급여가 15000이상인 사원들의 사번, 이름, 성, 업무코드, 급여 조회
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE salary >= 15000;

--문자, 날짜는 홑따옴표 안에서 묶어서 표현해야 한다.









