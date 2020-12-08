--06. 부서코드 10,20,40,60인 부서에 속한 사원들의
--사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회

SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name,
               j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
AND d.department_id IN(10, 20, 40, 60);

--JOIN ON
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name,
               j.job_id, j.job_title
FROM employees e JOIN departments d
ON e.department_id = d.department_id(+)
JOIN jobs j
ON e.job_id = j.job_id
WHERE d.department_id IN(10, 20, 40, 60);

--JOIN USING 
SELECT e.employee_id, e.last_name, 
               department_id, d.department_name,
               job_id, j.job_title
FROM employees e JOIN departments d
USING (department_id)
JOIN jobs j
USING (job_id)
WHERE department_id IN(10, 20, 40, 60);

-----------------------------------------------------------------------------------------------
--실습 ANSI JOIN 까지 --INNER 조인만
--01. 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               l.location_id, l.city 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

-- 오라클 JOIN에서 (+)의 기능은 ANSI JOIN에서는 LEFT JOIN/RIGHT JOIN로 대체한다.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               l.location_id, l.city 
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

SELECT e.employee_id, e.last_name, department_id, d.department_name,
               location_id, l.city 
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id);


--02. 사번이 110, 130, 150 인 사원들의 사번, 성, 부서명 조회하는 ANSI조인형식
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.employee_id IN(110, 130, 150);

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
WHERE e.employee_id IN(110, 130, 150);

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.employee_id IN(110, 130, 150);


--03. 사번, 성명, 관리자사번, 관리자 성명, 관리자업무코드 조회하는 ANSI 형식
SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
               m.employee_id, m.first_name || ' ' || m.last_name m_name,
               m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
               m.employee_id, m.first_name || ' ' || m.last_name m_name,
               m.job_id
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id(+);



--04. 성이 king 인 사원의 사번, 성명, 부서코드, 부서명 ANSI 형식
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.last_name = 'King';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name = 'King';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                department_id, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.last_name = 'King';


--05. 관리자 사번이 149 번인 사원의 사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) 
AND e.manager_id = 149;

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;


--06. 위치코드 1400인 도시명, 부서명 조회
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE l.location_id = d.location_id
AND l.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
ON l.location_id = d.location_id
WHERE l.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE location_id = 1400;


--07. 위치코드 1800에 근무하는 사원들의 사번, 성, 업무코드, 부서명, 위치코드 조회
SELECT e.employee_id, e.last_name, d.department_name, l.location_id
FROM locations l, departments d, employees e
WHERE e.department_id = d.department_id(+)
AND  l.location_id(+) = d.location_id
AND l.location_id = 1800;

SELECT e.employee_id, e.last_name, d.department_name, l.location_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
LEFT JOIN locations l
ON  l.location_id(+) = d.location_id
WHERE l.location_id = 1800;

SELECT e.employee_id, e.last_name, d.department_name, location_id
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING  (location_id)
WHERE location_id = 1800;


--08. 성에 대소문자 무관하게 z가 있는 사원들의 사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
WHERE LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE LOWER(e.last_name) LIKE '%z%';



--09. 관리자보다 먼저 입사한 사원의 사번, 성, 입사일자, 
--    관리자사번, 관리자성, 관리자입사일자 조회
SELECT e.employee_id, e.last_name, e.hire_date,
                m.employee_id, m.last_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.employee_id, e.last_name, e.hire_date,
                m.employee_id, m.last_name, m.hire_date
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id;


--10. 업무코드가 clerk종류의 업무형태인 사원들의 사번, 성, 부서명, 업무제목 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
LEFT JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%';


--11. toronto 에 근무하는 사번, 성, 부서코드, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND LOWER(l,city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(l.city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id)
WHERE LOWER(l.city) LIKE '%toronto%';


-----------------------------------------------------------------------------------------------
--실습
--01. 모든 사원의 사번, 성, 부서명 조회 --LEFT JOIN, RIHGT JOIN 2개씩
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, d.department_name
FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id;


--02. 모든 사원의 사번, 성, 부서명, 업무명 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;


--03. 모든 사원의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;


SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM departments d RIGHT JOIN employees e 
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;


--04. 관리자사번이 149번인 모든 사원의 사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;


--05. 커미션을 받는 모든 사원들의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM departments d RIGHT JOIN employees e 
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;


--06. 모든 부서에 대해 부서코드, 부서명, 도시명, 국가명, 대륙명 조회
SELECT d.department_id, d.department_name, l.city, c.country_name, r.region_name
FROM departments d JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
JOIN regions r
ON c.region_id = r.region_id;


--07. 사원들이 근무하는 부서와 그 부서에 사원이 몇 명이나 있나 파악하고자 한다.
--    부서코드, 부서명, 사원수 조회
SELECT d.department_id, d.department_name, COUNT(*) cnt
FROM departments d
GROUP BY d.department_id, d.department_name;

    
--[연습문제 5-2]
--01. 사번이 110, 130, 150 인 사원들의
--    사번, 이름, 부서명 조회하는 오라클 조인 및 ANSI조인형식
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+);

--02. 모든사원의 사번, 성, 부서코드, 업무코드, 업무제목 조회, 사번순으로 정렬    
SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
ORDER BY 1;


-----------------------------------------------------------------------------------------------
