--SELF JOIN : 동일한 테이블을 여러 개 준비하여 테이블 조인을 하는 SELF JOIN

--01. 모든 사원의 사번, 이름, 매니저 사번, 매니저 이름 정보를 조회
SELECT e.employee_id, 
               e.first_name, 
               e.manager_id manager_1,
               NVL(e.manager_id, 0) manager_2,
               NVL(TO_CHAR(e.manager_id), '매니저 없음') manager_3,
               NVL2(e.manager_id, TO_CHAR(e.manager_id), '매니저 없음') manager_4,                    
               m.first_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

-----------------------------------------------------------------------------------------------
--[ 연습문제 5-1 ]                                                                             
--01. 이름에 소문자 v가 포함된 모든 사원의 사번, 이름, 부서명을 조회하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.first_name LIKE '%v%'
AND e.department_id = d.department_id(+);


--02. 커미션을 받는 사원의 사번, 이름, 급여, 커미션 금액, 부서명을 조회하는 쿼리문을 작성한다.
--단, 커미션 금액은 월급여에 대한 커미션 금액을 나타낸다.
SELECT e.employee_id, e.first_name, e.salary,
               e.salary * NVL(e.commission_pct, 0) com,
               d.department_name
FROM employees e, departments d
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id(+);



--03. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명을 조회하는 쿼리문을 작성한다.
SELECT d.department_id, d.department_name,
                l.location_id, l.city, l.country_id,
                c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.coutry_id = c.country_id;


--04. 사원의 사번, 이름, 업무코드, 매니저의 사번, 매니저의 이름, 매니저의 업무코드를 조회하여 
--사원의 사번 순서로 정렬하는 쿼리문을 작성한다.
SELECT e.manager_id, e.first_name, e.job_id,
               e.employee_id, m.first_name, m.job_id 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;




--05. 모든 사원의 사번, 이름, 부서명, 도시, 주소 정보를 조회하여 사번 순으로 정렬하는 쿼리문을 작성한다.
SELECT e.employee_id, e.first_name, 
               d.department_name,
               l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


-----------------------------------------------------------------------------------------------
--실습
--01. 모든 사원의 사번, 성명, 업무코드, 매니저사번, 매니저성명, 매니저의 업무코드 조회하여
--사번 순으로 정렬 --SELF JOIN
SELECT e.employee_id,  e.first_name || ' ' || e.last_name e_name, 
                e.job_id, e.manager_id,
                m.first_name || ' ' || m.last_name m_name,
                m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;


--02. 성이 King인 사원들의 사번, 성명, 부서코드, 부서명 조회
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.last_name = 'King'
AND e.department_id = d.department_id(+);


--03. 위치코드가 1400 인 도시에는 어느 부서가 있나 파악하고자 한다.
--위치코드가 1400 인 도시명, 부서명 조회
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id
AND l.location_id = 1400;


--04. 위치코드 1800 인 곳에 근무하는 사원들의
--사번, 성명, 업무코드, 급여, 부서명, 위치코드 조회
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
               e.job_id, e.salary,
               d.department_name, d.location_id
FROM employees e, locations l, departments d
WHERE  l.location_id = 1800
AND e.department_id = d.department_id(+);


--05. 자신의 매니저보다 먼저 입사한 사원들의 
--사번, 성명, 입사일자, 매니저성명, 매니저 입사일자 조회 --SELF JOIN
SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
                e.hire_date,
                m.first_name || ' ' || m.last_name m_name,
                m.hire_date
FROM employees e, employees m
WHERE e.hire_date < m.hire_date
AND e.manager_id = m.employee_id(+);


--06. toronto 에 근무하는 사원들의
--사번, 성, 업무코드, 부서코드, 부서명, 도시 조회
SELECT e.employee_id, e.last_name, e.job_id,
               d.department_id, d.department_name,
               l.city
FROM employees e, departments d, locations l
WHERE LOWER(l.city) LIKE 'toronto'
AND e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


--07. 커미션을 받는 모든 사원들의 성, 부서명, 위치코드, 도시 조회
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


-----------------------------------------------------------------------------------------------

--ANSI JOIN : 국제 표준 JOIN 형식
--SELECT 컬럼명1, 컬럼명2...
--FROM 테이블명1 INNER JOIN 테이블명 2
--ON 조인조건식 WHERE 일반조건       또는
--USING (조인컬럼명) WHERE 일반조건

--01. 부서코드가 60번인 사번, 성, 부서코드, 부서명 조회

--오라클 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.department_id = 60
ORDER BY 1;

--ANSI 조인 : JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
--FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id = 60
ORDER BY 1;

--ANSI 조인 : JOIN USING
-- USING 에 들어가는 컬럼명은 SELECT, WHERE절에도 테이블명을 명시해서는 안된다.
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e JOIN departments d
USING (department_id)
WHERE department_id = 60
ORDER BY 1;

--02. 사번, 성, 업무코드, 업무제목 조회(ANSI 조인으로 작성하라)
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id);

--03. 업무 코드가 clerk 종류 업무 형태를 가지고 있는 사원의 사번, 성, 업무코드, 업무제목 조회
--ANSI 조인으로 작성하라
SELECT e.employee_id, e.last_name, 
               j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, 
               job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%';

--04. 우리 회사 부서 정보를 파악하고자 한다.
--부서코드, 부서명, 위치코드, 도시 조회
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d JOIN locations l
USING (location_id);

