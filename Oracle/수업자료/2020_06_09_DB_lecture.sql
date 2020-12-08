-----------------------------------------------------------------------------------------------
3. NON-EQUI JOIN
: 비교연산자(<=, >=, <, >), 범위연산자(BETWEEN), IN 연산자 등의 
동등 연산자 (=) 이외의 연산자를 사용하는 JOIN 형식이다.
JOIN 하는 컬럼이 일치하지 않게 사용하는 JOIN 조건으로 거의 사용하지 않는다.

01. employees, jobs 테이블을 이용하여 --JOBS테이블 확인
급여가 최고최저 급여 범위 내에 있는 10번 부서원의 
사번, 이름, 급여, 업무제목을 조회한다.

SELECT  e.employee_id, e.last_name, 
        e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

-----------------------------------------------------------------------------------------------
4. OUTER JOIN : NULL 값이 생략되는 정보도 포함해서 표시하기 위한 조인 
EQUI JOIN은 조인조건에 동등비교연산자로 비교한 형태, 
즉, 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

하지만 OUTER JOIN 쿼리문은 만족되는 값이 없는 경우의 결과까지 반환한다.
만족되는 값이 없는 테이블 컬럼에 (+) 기호를 표시한다.
즉, 데이터행의 누락이 발생하지 않도록 하기 위한 조인기법
:★  조인조건식에서 (+)기호를 데이터행이 부족한 조인조건쪽에 붙여준다.

사원테이블에는 부서배치 받지 않은 사원 데이터행(NULL)이 있고
부서테이블에서 부서코드가 NULL 인것에 대한 데이터행이 없으므로
(데이터가 없을 수도 있는 쪽 JOIN 컬럼에 (+)를 추가)
부서테이블의 부서코드 쪽에 OUTER 기호를 붙인다.

LEFT  OUTER JOIN : 왼  쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 오른쪽에 (+)가 붙음)
RIGHT OUTER JOIN : 오른쪽 테이블 기준으로 NULL 포함하여 모두 출력(등호의 왼  쪽에 (+)가 붙음) 

-----------------------------------------------------------------------------------------------
사원테이블(employees) 부서테이블(departments(+))       위치테이블(locations(+))
사번 부서코드         부서코드   부서명    위치코드    위치코드 부서위치
100  10               10         영업부    1600        1600     Seattle
101  20               20         총무부    1700        1700     Paris
178  NULL             NULL       NULL      NULL        NULL     NULL     
-----------------------------------------------------------------------------------------------

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1; 

SELECT COUNT(job_id)
FROM jobs; --19

SELECT COUNT(DISTINCT job_id)
FROM employees; --19

02. 모든 사원의 사번, 성, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1; 

03. 모든 사원의 사번, 성, 부서명, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        d.department_name, 
        j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1; 

04. 모든 사원의 사번, 성, 부서코드, 부서명, 위치코드, 도시 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;

05. 모든 사원의 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        e.job_id, e.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1;
-----------------------------------------------------------------------------------------------
실습
01. 관리자 사번이 149인 사원들의 
사번, 성, 부서코드, 부서명을 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

02. 성에 대소문자 무관하게 a 가 있는 성을 가진 사원들의 
사번, 성, 부서명 조회
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(last_name) LIKE '%a%';

03. 커미션을 받는 사원들의 사번, 성, 부서명, 도시명 조회
SELECT  e.employee_id, e.last_name, 
        d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL;

-----------------------------------------------------------------------------------------------
SELECT 절에 사용한 ALIAS 명이나 SELECT 절에서의 위치는 
ORDER BY 절에서만 사용 할 수 있다.
: WHERE 절, GROUP BY 절, HAVING 절에서는 
  SELECT 목록의 컬럼 ALIAS 나 컬럼의 위치를 사용할 수 없다.
-----------------------------------------------------------------------------------------------

04. 부서별 사원들의 정보를 파악하고자 한다.
부서코드가 60 번 이하인 부서에 대해 부서의 평균급여가 5000 이상인 부서만 
부서코드, 사원 수, 급여합계, 급여평균, 최대급여, 최저급여, 
최근입사일자, 최초입사일자 조회
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal, 
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING AVG(salary) >= 5000 --HAVING department_id <= 60 AND AVG(salary) >= 5000
ORDER BY 1;

05. 업무형태별로 사원들의 정보를 파악하고자 한다.
업무형태별로 사원 수가 10명이상인 업무형태에 대해
업무코드, 업무별사원수, 업무별평균급여, 업무별최대급여, 업무별최소급여, 
업무별최근입사일자, 업무별최초입사일자 조회

SELECT job_id, COUNT(*) cnt, AVG(salary) avg_sal, 
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire 
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 10;
-----------------------------------------------------------------------------------------------
