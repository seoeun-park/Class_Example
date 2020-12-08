
--01. employees, jobs 테이블을 이용하여
--급여가 최고, 최저 급여 범위 내에 있는 10번 부서원의
--사번, 이름, 급여, 업무 제목을 조회한다.
SELECT e.employee_id, e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
--AND e.salary BETWEEN MIN(salary) AND MAX(salary)      
--오류 : where 조건문 안에는 min/max를 쓸 수 없음
AND e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

--OUTER JOIN : NULL 값이 생략되는 정보도 포함해서 표시하기 위한 조인
--만족되는 값이 없는 경우의 결과까지 반환한다. 즉, NULL값까지 반환
--그래서 데이터행의 누락이 발생하지 않도록 데이터 행이 부족한 조인조건쪽에 + 기호를 붙인다.

--01. 모든 사원의 사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);        --106개 행 조회(NULL값 제외)
--employees 테이블에 사원번호가 178번인 사원의 부서코드가 null이므로
--조인 조건 중 department에 + 기호를 붙인다.

--02.모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;          --null값이 없으므로 outer join할 필요 x

--03.모든 사원의 사번, 성, 부서명, 업무제목 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1;

--04.모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name, 
               l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND  l.location_id(+) = d.location_id                 
--둘 다 null값이 없으므로 outer join할 필요가 없지만 이미 departments 테이블 쪽에 +가 붙었으므로
--다른 조인조건식에 departments 테이블이 포함되었다면
--departments의 다른 행의 상대행에도  +를 붙여야 한다.
ORDER BY 1;

--05. 모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT e.department_id, e.last_name, d.department_id, 
                d.department_name,
                j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;

---------------------------------------------------------------------------------------------------
--실습

--01. 관리자 사번이 149인 사원들의 
--사번, 성, 부서코드, 부서명을 조회
SELECT e.manager_id, e.last_name,
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;


--02. 성에 대소문자 무관하게 a 가 있는 성을 가진 사원들의 
--사번, 성, 부서명 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%a%';



--03. 커미션을 받는 사원들의 사번, 성, 부서명, 도시명 조회
SELECT e.employee_id, e.last_name,
                d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND l.location_id(+) = d.location_id
AND e.commission_pct IS NOT NULL;


-----------------------------------------------------------------------------------------------
--SELECT 절에 사용한 ALIAS 명이나 SELECT 절에서의 위치는 
--ORDER BY 절에서만 사용 할 수 있다.
--: WHERE 절, GROUP BY 절, HAVING 절에서는 
--  SELECT 목록의 컬럼 ALIAS 나 컬럼의 위치를 사용할 수 없다.
-----------------------------------------------------------------------------------------------

--04. 부서별 사원들의 정보를 파악하고자 한다.
--부서코드가 60 번 이하인 부서에 대해 부서의 평균급여가 5000 이상인 부서만 
--부서코드, 사원 수, 급여합계, 급여평균, 최대급여, 최저급여, 
--최근입사일자, 최초입사일자 조회
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal,
               ROUND(AVG(salary), 2) avg_sal,
               MAX(salary) max_sal, MIN(salary) min_sal,
               MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING ROUND(AVG(salary), 2) >= 5000
ORDER BY 1;


--05. 업무형태별로 사원들의 정보를 파악하고자 한다.
--업무형태별로 사원 수가 10명이상인 업무형태에 대해
--업무코드, 업무별사원수, 업무별평균급여, 업무별최대급여, 업무별최소급여, 
--업무별최근입사일자, 업무별최초입사일자 조회
SELECT j.job_id, COUNT(j.job_id), ROUND(AVG(e.salary), 2) avg_sal,
               j.max_salary, j.min_salary,  
               jh.end_date, jh.start_date
FROM employees e, jobs j, job_history jh
WHERE e.job_id = j.job_id
AND  j.job_id =  jh.job_id
GROUP BY j.job_id, j.max_salary, j.min_salary,jh.end_date, jh.start_date
HAVING COUNT(j.job_id) >= 10
ORDER BY 1;

----------------------------------------------------------------------------------------------------------

--SELF JOIN


-- employees의manager_id 와 employees의 employee_id를 매칭시켜 employees의 firstname을 가져와
-- manager_name으로 새로운 행으로 각각 데이터를 삽입


--01. 모든 사원의 사번, 이름, 매니저사번, 매니저 이름 정보를 조회
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
-- employees 테이블의 manager_id에 null이 있으므로 outer join을 해야 함
ORDER BY 1;

