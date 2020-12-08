--서브 쿼리(Sub Query)

--01. 급여가 우리 회사 평균 급여보다 더 적은 급여를 받는 사원의
--사번, 이름, 성, 급여 정보를 조회
SELECT AVG(salary)
FROM employees;
--결과 : 6461.831775700934579439252336448598130841

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary <= 6461.831775700934579439252336448598130841;

--SELECT employee_id, first_name, last_name, salary
--FROM employees
--HAVING salary <= AVG(salary) ;
-- 오류

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary <= (SELECT AVG(salary)
                                FROM employees);
                                
-- 일반 서브 쿼리
-- 메인 쿼리문안에 있는 또 다른 쿼리문(WHERE/HAVING절에서 사용)
-- 함수로 구한 값과 비교할 때 사용



--02. 우리 회사에서 가장 많은 급여를 받는 사원의
-- 사번, 성, 명, 급여 조회
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) 
                             FROM employees);
            
            
--03. 사번 150번 사원보다 더 많은 급여를 받는 사원들의
--사번, 성, 부서코드, 업무코드, 급여조회
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                             FROM employees
                             WHERE employee_id = 150);
                             
--04. 월급여가 가장 많은 사원의 사번, 이름, 성, 업무제목 정보를 조회
SELECT e.employee_id, e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND salary = (SELECT MAX(salary) FROM employees);

--05. 사원들의 급여가 우리 회사 평균급여 이상 최고 급여 이하에 해당하는 사원들의 사번, 성, 급여 조회
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN (SELECT AVG(salary) FROM employees) 
                         AND(SELECT MAX(salary) FROM employees);

--06. 우리 회사에서 가장 적은 급여를 받는 사원의
--사번, 성, 업무코드, 부서코드, 부서명, 급여 조회
SELECT e.employee_id, e.last_name, e.job_id, 
               d.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND salary = (SELECT MIN(salary) FROM employees);

--02. 부서명이 Marketing인 부서에 속한 사원들의
-- 사번, 성명, 부서코드, 업무코드 조회
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.department_name = 'Marketing';

-- 이 문제는 서브쿼리를 이용해 조회할 필요는 없지만 
-- 만약 다른 테이블에서 값을 가져올 경우에는 서브쿼리를 이용해서 구해야 한다.
SELECT employee_id, first_name || ' ' || last_name name,
               department_id, job_id
FROM employees e
WHERE department_id = (SELECT department_id 
                                              FROM departments 
                                              WHERE department_name =  'Marketing');
                                              
                                
--우리 회사 사장님보다 먼저 입사한 사원들의 사번, 성명, 입사일자 조회
--사장은 그를 관리하는 매니저가 없는 사원을 말한다.

--서브 쿼리
SELECT employee_id, first_name || ' ' || last_name name,
               hire_date
FROM employees
WHERE hire_date < (SELECT hire_date 
                                    FROM employees 
                                    WHERE manager_id IS NULL);

--INNER JOIN(같은 테이블인 경우 가능한 방법)
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                e.hire_date
FROM employees e, employees m
WHERE e.hire_date < m.hire_date
AND m.manager_id IS NULL;

--부서의 위치코드가 1700 인(1700이 아닌) 부서에 속한 사원들의
--사번, 성명, 부서코드, 업무코드 조회

--일반 쿼리
SELECT e.employee_id, e.first_name || ' ' ||  e.last_name name,
                e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id = 1700;

--서브 쿼리
SELECT employee_id, first_name || ' ' ||  last_name name,
                department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id 
                                            FROM departments 
                                            WHERE location_id = 1700);
                                                                                       
-- 우리 회사에서 mgr 업무에 종사하는 사원들과 같은 부서에 속한 사원들의 사번, 성, 업무코드 조회

--일반 쿼리
SELECT e.employee_id, e.last_name, e.job_id
FROM employees e, employees m
WHERE e.department_id = m.department_id(+)
AND LOWER(m.job_id) LIKE '%mgr%'
ORDER BY 1;

--서브 쿼리
SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id IN (SELECT department_id 
                                            FROM employees 
                                            WHERE LOWER(job_id) LIKE '%mgr%');

-- 각 부서의 최소 급여가 40번 부서의 최소급여보다 더 많은 부서 코드, 최소 급여 조회

SELECT department_id, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT  MIN(salary) 
                                        FROM  employees
                                        WHERE  department_id = 40);
                                        
--근무지의 국가코드가 UK(즉, country_id가 UK)인 곳에 있는 부서의
--부서 코드, 위치코드, 부서명 조회
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE l.country_id = 'UK'
AND d.location_id = l.location_id(+);


SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN (SELECT location_id FROM locations WHERE country_id = 'UK');

--성에 대소문자와 무관하게 z가 포함된 성을 가진 사원들과 같은 부서에 속한
--사원들의 사번, 성명, 부서코드, 업무코드 조회
SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                                            FROM employees
                                            WHERE LOWER(last_name) LIKE '%z%');

--60번 부서원들과 같은 급여를 받는 사원들의
--사원들의 사번, 성, 급여, 부서코드

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary  IN (SELECT salary
                            FROM employees
                            WHERE department_id = 60);

--60번 부서에 속하지 않으면서 60번 부서원들과 같은 급여를 받는 사원들의
--사원들의 사번, 성, 급여, 부서코드                            
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary  IN (SELECT salary
                            FROM employees
                            WHERE department_id = 60)
AND department_id NOT IN 60;
--AND department_id <> 60;     

--우리 회사 사원들 중 부서명이 Marketing 이거나 IT에 속한 사원들의
--사번, 성, 부서코드 조회

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id
                                            FROM departments
                                            WHERE department_name IN ('Marketing', 'IT'));





