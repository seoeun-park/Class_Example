SELECT *
FROM locations;

SELECT *
FROM locations
-- 값이 이 null값이 아닌 필드를 조회
--WHERE state_province LIKE '%';
WHERE state_province IS NOT NULL;

--부서 배치를 받지 않은(부서코드가 NULL인) 사원들의
--사번, 성, 부서코드, 업무코드, 급여 조회
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;

--커미션 요율 조회
SELECT commission_pct
FROM employees;

--커미션을 받는 사원들의 사번, 성, 부서코드, 커미션요율 조회
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
--WHERE commission_pct <> NULL;

--80번 부서의 사번, 성, 급여, 부서코드에 대해 성을 오름차순/내림차순으로 정렬한다.
SELECT employee_id, last_name aa, salary, department_id
FROM employees
WHERE department_id = 80
--ORDER BY last_name ASC;
--ORDER BY last_name DESC;
--ORDER BY last_name;
--ORDER BY aa;
ORDER BY aa DESC;

--60번 부서의 사번, 성, 연봉에 대해 연봉을 오름차순으로 정렬한다.
--연봉을 annual_salary로 ALIAS한다.
SELECT employee_id, last_name, salary*12 annual_salary, department_id
FROM employees
WHERE department_id = 60
--ORDER BY annual_salary;
ORDER BY 3;


SELECT employee_id, last_name, salary*12 annual_salary, department_id
FROM employees
WHERE department_id = 60
ORDER BY 2, 3 DESC;

--사원테이블에서 사번, 성, 급여, 부서코드를 조회하는데
--부서는 오름차순, 월급여는 내림차순 정렬하여 사원정보를 조회한다
--department_id를 dept_id로 ALIAS
SELECT employee_id, last_name, salary, department_id dept_id
FROM employees
--ORDER BY 4, 3 DESC;
ORDER BY dept_id, salary DESC;
-- 부서를 오름차순으로 정렬한 다음, 같은 부서코드를 가진 사원들의 급여를 내림차순으로 정렬

--사번, 성, 부서코드, 급여, 입사일자 조회
--부서코드 순(오름차순), 급여 내림차순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id DESC, salary DESC;
--null값은 오름차순으로 정렬하면 맨 뒤에 위치, 내림차순으로 정렬하면 맨 앞에 위치

--오름차순에 대해 먼저 위치하게 하려면 NULLS FIRST 옵션을 지정
--내림차순에 대해 마지막에 위치하게 하려면 DESC NULLS LAST 옵션을 지정
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id NULLS FIRST, salary DESC;

SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id DESC NULLS LAST, salary DESC;

---------------------------------------------------------------------------------------

--연습문제 3-1
--사원 테이블에서 부서코드가 100, 110인 부서에 속한 사원들의
--사번, 성명, 급여, 부서코드, 15%인상된 급여 조회 - 인상된 급여는 정수로 표현
SELECT employee_id, first_name || ' ' || last_name name,  department_id,
                --ROUND(salary*1.15) "Increased Salary"
                --TRUNC(salary*1.15) "Increased Salary"
                --CEIL(salary*1.15) "Increased Salary"
                FLOOR(salary*1.15) "Increased Salary"   
FROM employees
WHERE department_id IN(100, 110);



