--PK(Primary Key) : 테이블의 레코드를 구분할 수 있는 최소의 컬럼(UNIQUE, NOT NULL)
                                 --ex) 주민번호, 학번, 사원번호 등 유일한 값을 가지는 컬럼
--FK(Foriegn Key) : 다른 테이블의 PK를 참조하는 컬럼
--PK는 부모, FK는 자식관계로 볼 수 있다.

--JOIN
--하나의 테이블로부터 데이터를 조회할 수 없는 경우
--여러 개의 테이블로부터 데이터를 조회하는 방법을 JOIN이라고 한다.

--부서 정보를 가지고 있는 테이블 : departments
SELECT *
FROM departments;       --27개

--사원 정보를 가지고 있는 테이블 : employees
SELECT *
FROM employees;         --107개

--업무 정보를 가지고 있는 테이블 : jobs
SELECT *
FROM jobs;                   --19개

--CARTESIAN PRODUCT
--WHERE 절에 JOIN 조건을 기술하지

--사번, 성, 부서명(depatment_name은 departments에 있음) 조회
SELECT employee_id, last_name, department_name
FROM employees, departments;            
--2889개 -> employees(107) * departments(27) : cartesian product
--여기서 ,는 JOIN을 의미함

--EQUI JOIN(ANSI에서는 INNER JOIN)
--WHERE 절에 동등 연산자(=)를 사용하는 JOIN 형식이다
--즉, 태이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

--JOIN 조건 > 컬럼의 값이 같은 칼럼에 대해 조인조건식 설정('테이블명.컬럼명 = 테이블명,컬럼명'을 사용)
--Table = Entity
--테이블간의 관계도 : Entit Relationship Diagram(ERD)

--테이블 조인 순서
--1. FROM 절에 테이블 목록을 나열하며, 테이블명에 ALIAS를 지정한다.
--2. 조인조건을 WHERE절에 작성한다.
--      WHERE 조인조건식(테이블명.컬럼명 = 테이블명,컬럼명)
--      AND 일반조건식
--      순서는 상관x

--01. 사번, 성, 부서명(depatment_name은 departments에 있음) 조회 : JOIN 조건식을 이용하여 조회하시오.
--SELECT e.employee_id, e.last_name, d.department_name
SELECT employee_id, last_name, department_name
FROM employees e, departments d     --ALIAS
WHERE e.department_id = d.department_id;      --106개
-- 조인 조건식 : 테이블명.컬럼명 = 테이블명.컬럼명
--deparment_id -> departments, employees

-- 컬럼명이 유일하면 ALIAS를 하지 않아도 되지만 컬럼명이 중복될 경우,
--해당 컬럼이 포함되어있는 테이블의 ALIAS를 붙여주어야한다.
SELECT employee_id, last_name, department_name, e.department_id
FROM employees e, departments d     --ALIAS
WHERE e.department_id = d.department_id;

--02. employees, departments 테이블을 사용하여
--사원들의 사번, 성 부서코드, 부서 명 정보를 조회
SELECT employee_id, last_name, d.department_id, department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--03. employees, jobs 테이블을 사용하여
--사번, 성, 업무코드, 업무 제목 조회
SELECT employee_id, last_name, e.job_id, job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

--04. employees, department, jobs 테이블을 사용하여
--사번, 성, 부서명, 업무 제목을 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;
--employees의 테이블 갯수는 107개 /departments의 테이블 갯수는 27개 / jobs의 테이블 갯수는 19개
--106개가 나오는 이유는? null값을 제외하기 때문에 107 - 1이 된다.

--05. employees, departments, jobs 테이블을 사용하여
--사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT e.employee_id, e.last_name, e.department_id, d.department_name, j.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

--06. employees, departments, jobs 테이블을 사용하여
--사번이 101번인 사원의 사번, 이름, 부서명, 업무제목 정보를 조회
SELECT e.employee_id, e.first_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id = j.job_id
AND e.department_id = d.department_id
AND e.employee_id = 101;

--07. employees, departments 테이블을 사용하여
--사번이 100, 120, 130, 140 사원들의
--사번, 성 부서코드 부서명을 조회하시오
SELECT e.employee_id, e.last_name, d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN(100,120,130,140);

--08. 매니저가 없는 사원의 사번, 이름, 업무제목을 조회한다.
SELECT e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;

----------------------------------------------------------------------------------------------
--실습

--01. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의 
--사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%z%';


--02. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션요율, 업무제목 조회
SELECT e.employee_id, e.last_name, e.salary, e.commission_pct, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.commission_pct IS NOT NULL;


--03. 커미션을 받는 사원들의 
--사번, 성, 급여, 커미션금액, 부서명 조회
SELECT e.employee_id, e.last_name, e.salary, 
               (NVL(e.commission_pct, 0) * e.salary) com,
               d.department_name
FROM employees e, departments d
WHERE e.commission_pct IS NOT NULL;


--04. 각 부서에 대한 정보를 파악하고자 한다.
--각 부서의 부서코드, 부서명, 위치코드, 도시를 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM locations l, departments d
WHERE d.location_id = l.location_id;


--05. 사번, 성, 부서코드, 부서명, 근무지도시명, 주소 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
                l.city, l.street_address
FROM employees e, departments d, locations l;


--06. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회  --조인조건은 table갯수 -1 만큼 필요!!
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               j.job_id, j.job_title 
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;


--07. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명, 대륙명 조회 
SELECT d.department_id, d.department_name, 
                l.location_id, l.city, l.country_id, 
                c.country_name, r.region_name
FROM locations l, departments d, countries c, regions r
WHERE d.location_id = l.location_id
AND c.country_id = l.country_id
AND c.region_id = r.region_id;



