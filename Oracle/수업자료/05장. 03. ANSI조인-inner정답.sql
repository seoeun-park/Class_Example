-----------------------------------------------------------------------------------------------
01. 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
오라클 조인
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

JOIN ON
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l  
ON d.location_id = l.location_id;

JOIN USING
SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        location_id, l.city
FROM  employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l  
USING (location_id);

02. 사번이 110, 130, 150 인 사원들의
사번, 성, 부서명 조회하는 ANSI조인형식
오라클 조인
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (110, 130, 150);

JOIN ON
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE employee_id IN (110, 130, 150);

JOIN USING
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE employee_id IN (110, 130, 150);

03. 사번, 성명, 관리자사번, 관리자성명, 관리자업무코드 조회하는 ANSI 형식
오라클 조인
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

JOIN ON만 가능, JOIN USING 사용 불가
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id;

04. 성이 king 인 사원의 
사번, 성명, 부서코드, 부서명 ANSI 형식
오라클 조인
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) = 'king';

JOIN ON
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) = 'king';

JOIN USING
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) = 'king';

05. 관리자 사번이 149 번인 사원의 
사번, 성, 부서코드, 부서명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id = 149;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

JOIN USING
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;

06. 위치코드 1400인 도시명, 부서명 조회
오라클 조인
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id
AND d.location_id = 1400;

JOIN ON
SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
ON d.location_id = l.location_id
WHERE d.location_id = 1400;

JOIN USING
SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
USING (location_id)
WHERE location_id = 1400;

07. 위치코드 1800에 근무하는 사원들의 
사번, 성, 업무코드, 부서명, 위치코드 조회
오라클 조인
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND location_id = 1800;

JOIN ON
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE location_id = 1800;

JOIN USING
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE location_id = 1800;

08. 성에 대소문자 무관하게 z가 있는 사원들의 
사번, 성, 부서명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%';

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) LIKE '%z%';

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) LIKE '%z%';

09. 관리자보다 먼저 입사한 사원의 
사번, 성, 입사일자, 관리자사번, 관리자성, 관리자입사일자 조회
오라클 조인
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

JOIN ON 만 사용 가능, JOIN USING 사용 불가
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

10. 업무코드가 clerk 종류의 업무형태인 사원들의
사번, 성, 부서명, 업무제목 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e INNER JOIN departments d
USING (department_id)--ON e.department_id=d.department_id
INNER JOIN jobs j 
USING (job_id)--ON j.job_id=e.job_id
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

--USING 절과 ON절 섞어서 써도 상관없음. 

ON 절에 사용한 동일한 이름에 컬럼에 대해서는 반드시 테이블명을 명시한다.
USING 절에 사용한 컬럼에 대해서는 절대로 테이블명을 명시하면 안된다.

11. toronto 에 근무하는
사번, 성, 부서코드, 부서명, 도시명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';
JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

JOIN USING
SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l
USING (location_id)
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

JOIN ON 과 JOIN USING 혼합 사용도 가능
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
USING (location_id)--d.location_id=l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';
-----------------------------------------------------------------------------------------------