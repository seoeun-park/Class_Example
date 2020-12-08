-----------------------------------------------------------------------------------------------
--실습
--01. 모든 사원의 사번, 성, 부서명 조회 --LEFT JOIN, RIHGT JOIN 2개씩
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id);

--02. 모든 사원의 사번, 성, 부서명, 업무명 조회
오라클조인
SELECT e.employee_id, e.last_name, d.department_name, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name, e.job_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name, e.job_id
FROM employees e LEFT JOIN departments d
USING (department_id);

--03. 모든 사원의 사번, 성, 부서명, 도시명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id);

--04. 관리자사번이 149번인 모든 사원의 사번, 성, 부서명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;

--05. 커미션을 받는 모든 사원들의 사번, 성, 부서명, 도시명 조회
오라클 조인
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE commission_pct IS NOT NULL;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id)WHERE commission_pct IS NOT NULL;

--06. 모든 부서에 대해 부서코드, 부서명, 도시명, 국가명, 대륙명 조회
오라클 조인 1
SELECT  d.department_id, d.department_name, 
        l.city, c.country_id, r.region_name
FROM departments d, locations l, countries c, regions r
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id;

오라클 조인 2
SELECT  d.department_id, d.department_name, 
        l.city, c.country_id, r.region_name
FROM departments d, locations l, countries c, regions r
WHERE d.location_id = l.location_id(+)
AND l.country_id = c.country_id(+)
AND c.region_id = r.region_id(+);

JOIN ON 1
SELECT  d.department_id, d.department_name, 
        l.city, c.country_id, r.region_name
FROM departments d (LEFT) JOIN locations l
ON d.location_id = l.location_id
(LEFT) JOIN countries c 
ON l.country_id = c.country_id
(LEFT) JOIN regions r
ON c.region_id = r.region_id;

JOIN ON 2
SELECT  d.department_id, d.department_name, 
        l.city, c.country_id, r.region_name
FROM departments d LEFT JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN countries c 
ON l.country_id = c.country_id
LEFT JOIN regions r
ON c.region_id = r.region_id;

JOIN USING 1
SELECT  d.department_id, d.department_name, 
        l.city, country_id, r.region_name
FROM departments d JOIN locations l
USING (location_id)
JOIN countries c 
USING (country_id)
JOIN regions r
USING (region_id);

JOIN USING 2
SELECT  d.department_id, d.department_name, 
        l.city, country_id, r.region_name
FROM departments d LEFT JOIN locations l
USING (location_id)
LEFT JOIN countries c 
USING (country_id)
LEFT JOIN regions r
USING (region_id);

--07. 사원들이 근무하는 부서와 그 부서에 사원이 몇 명이나 있나 파악하고자 한다.
--    부서코드, 부서명, 사원수 조회
오라클 조인
SELECT d.department_id, d.department_name, COUNT(*) cnt
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
GROUP BY d.department_id, d.department_name
ORDER BY 1;

JOIN ON
SELECT d.department_id, d.department_name, COUNT(*) cnt
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY 1;

JOIN USING
SELECT department_id, d.department_name, COUNT(*) cnt
FROM employees e LEFT JOIN departments d
USING (department_id)
GROUP BY department_id, d.department_name
ORDER BY 1;
    
--[연습문제 5-2]
--01. 사번이 110, 130, 150 인 사원들의
--    사번, 이름, 부서명 조회하는 오라클 조인 및 ANSI조인형식
오라클 조인
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.employee_id IN (110, 130, 150);

JOIN ON
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id IN (110, 130, 150);

JOIN USING
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.employee_id IN (110, 130, 150);

--02. 모든사원의 사번, 성, 부서코드, 업무코드, 업무제목 조회, 
--사번순으로 정렬    
-----------------------------------------------------------------------------------------------
오라클 조인
SELECT  e.employee_id, e.last_name, e.department_id, 
        j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1;

JOIN ON
SELECT  e.employee_id, e.last_name, e.department_id, 
        j.job_id, j.job_title
FROM employees e LEFT JOIN jobs j
ON e.job_id = j.job_id
ORDER BY 1;

JOIN USING
SELECT  e.employee_id, e.last_name, e.department_id, 
        job_id, j.job_title
FROM employees e LEFT JOIN jobs j
USING (job_id)
ORDER BY 1;





