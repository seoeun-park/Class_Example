8. 데이터 값이 없는 형태의 표현 : NULL - 비교불가, 산술연산불가
그래서, 컬럼표현 IS NULL/IS NOT NULL 로 판단 ☞ NULL 인지 아닌지 파악

SELECT *    --23개행
FROM locations;

SELECT *    --17개행
FROM locations
WHERE state_province LIKE '%';

--아래와 동일
SELECT *    --17개행
FROM locations
WHERE state_province IS NOT NULL;

01. 부서배치 받지 않은(즉, 부서코드가 NULL 인) 사원들의 
사번, 성, 부서코드, 업무코드, 급여 조회
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE department_id IS NULL;--부서코드가 NULL;
--WHERE department_id IS NOT NULL;--부서코드가 NULL 이 아닌;

SELECT commission_pct
FROM employees;

02. 커미션을 받는 사원들의 
사번, 성, 부서코드, 커미션요율 조회
SELECT employee_id, last_name, department_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL; --커미션을 받는

2.4 데이터행 정렬 - ORDER BY 절 : 쿼리문의 가장 마지막에 위치
ORDER BY 정렬기준표현 + 오름차순(default) ASC /내림차순 DESC
***정렬기준표현 : 컬럼표현 그대로, ALIAS도 가능, SELECT 목록에서의 위치(컬럼번호)
SELECT 절 
FROM 절
WHERE 절
ORDER BY 절;

프로그램상에서는 정렬 잘 안함(즉, DB에서만 정렬해서 프로그램으로 넘김)

01. 80번 부서의 사번, 성, 급여, 부서코드보에 대해 성을 오름차순/내림차순으로 정렬한다.
SELECT employee_id, last_name, salary, department_id dept_id
FROM employees 
WHERE department_id = 80
ORDER BY last_name ASC;
--ORDER BY last_name DESC;

ORDER BY 절에 ALIAS를 사용하여 정렬할 수 있다.

02. 60번 부서의 사번, 성, 년급여(연봉)에 대해 년급여(연봉)를 기준으로 오름차순으로 정렬한다.
연봉을 annual_salary로 ALIAS한다.
SELECT employee_id, last_name, salary*12 annual_salary 
FROM employees 
WHERE department_id = 60 
ORDER BY annual_salary; --ALIAS 가능

ORDER BY 절에 컬럼의 위치(즉, 숫자 번호)를 사용하여 정렬할 수 있다.

03. 사원테이블에서 사번, 성, 급여, 부서코드를 조회하는데 
부서는 오름차순, 월급여는 내림차순 정렬하여 사원정보를 조회한다.
department_id를 dept_id로 ALIAS
SELECT employee_id, last_name, salary, department_id dept_id
FROM  employees 
ORDER BY dept_id, 3 DESC;

04. 사번, 성, 부서코드, 급여, 입사일자 조회, 성 내림차순으로 정렬한다.
SELECT employee_id, last_name name, department_id, salary, hire_date
FROM employees
ORDER BY 2 DESC;
--ORDER BY last_name DESC;
--ORDER BY name DESC;

05. 사번, 성, 부서코드, 급여, 입사일자 조회, 
부서 순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id ASC;

06. 사번, 성, 부서코드, 급여, 입사일자 조회
입사일자 순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY 5;
--ORDER BY hire_date;

07. 사번, 성, 부서코드, 급여, 입사일자 조회
급여 순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY salary;

★ ORDER BY 정렬기준1 오름/내림, 정렬기준2 오름/내림, ...

08. 사번, 성, 부서코드, 급여, 입사일자 조회
부서코드 순, 급여 내림차순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary, hire_date
FROM employees
ORDER BY department_id, 4 DESC;

NULL 은 오름차순에서는 마지막 순위를 가짐, 내림차순에 대해 우선순위를 가짐 
오름차순에 대해 가장 앞에 위치하게 하려면 ASC  NULLS FIRST 옵션을 지정
내림차순에 대해 마지막에 위치하게 하려면  DESC NULLS LAST  옵션을 지정

SELECT *
FROM locations
ORDER BY state_province;
--ORDER BY state_province DESC;
--ORDER BY state_province NULLS FIRST;
--ORDER BY state_province DESC NULLS LAST;

-----------------------------------------------------------------------------------------------
실습
01. 부서코드 30, 40, 60인 부서에 속한 사원들의
사번, 성명, 부서코드, 급여를 조회하여 성명순으로 정렬한다.
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary
FROM employees        
WHERE department_id IN (30,40,60)  --부서코드 30,40,60인 부서에 속한
ORDER BY 2; 
--ORDER BY name;
--ORDER BY first_name || ' ' || last_name;

02. 커미션을 받는 사원들의 사번, 성명, 급여, 커미션요율을 조회하여
커미션요율이 높은 사원부터 낮은 사원순으로 정렬한다.
SELECT employee_id, first_name || ' ' || last_name name, 
       salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL --커미션을 받는 사원들
ORDER BY 4 DESC;
--ORDER BY commission_pct DESC;

03. 성명에 대/소문자 무관하게 z 가 있는 사원들의
사번, 성명 을 조회하여 성명순으로 정렬한다.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name|| ' ' ||first_name LIKE '%z%'
ORDER BY name; --성명에 대/소문자 무관하게 z 가 있는

-----------------------------------------------------------------------------------------------
[연습문제 2-1]
01. 사번이 200인 사원의 성명과 부서코드를 조회하는 쿼리문을 작성한다.
SELECT first_name || ' ' || last_name name, department_id
FROM employees
WHERE employee_id = 200;

02. 급여가 3000에서 15000 사이에 포함되지 않는 사원의 
사번, 성명, 급여 정보를 조회하는 쿼리문을 작성한다.
(단, 이름은 성과 이름을 공백문자를 두어 합쳐서 조회한다. 
예를 들어 이름이 John 이고 성이 Seo 이면  John Seo 로 조회되도록 한다.)
SELECT employee_id, first_name || ' ' || last_name name, salary
FROM employees
--WHERE salary NOT BETWEEN 3000 AND 15000;
WHERE salary <3000 OR salary>15000;

03. 부서코드 30과 60 에 소속된 사원의 
사번, 성명, 부서코드, 급여를 조회하는데, 
성명을 알파벳순서로 정렬하여 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
--WHERE department_id in (30,60)
WHERE department_id = 30 OR department_id = 60
ORDER BY name;

04. 급여가 3000에서 15000 사이 이면서, 부서코드 30 또는 60에 소속된 사원의 
사번, 성명, 급여를 조회하는 쿼리문을 작성한다.
(단, 조회되는 컬럼명을 이름은 성과 이름을 공백문자를 두어 합쳐 name 으로,
급여는 Monthly Salary 로 조회되도록 한다.)
SELECT employee_id, first_name || ' ' || last_name name, salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 3000 AND 15000 AND department_id IN (30, 60);

05. 소속된 부서코드가 없는 사원의 
사번, 성명, 업무코드를 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name, job_id
FROM employees
WHERE department_id IS NULL;

06. 커미션을 받는 사원의 사번, 성명, 급여, 커미션을 조회하는데, 
커미션이 높은 사원부터 낮은 사원 순서로 정렬하여 조회하는 쿼리문을 작성한다. 
SELECT employee_id, first_name || ' ' || last_name name, salary, commission_pct
FROM employees 
WHERE commission_pct IS NOT NULL
--WHERE NOT commission_pct IS NULL
ORDER BY commission_pct DESC;

07. 성명에 대소문자 구분없이 문자 z 또는 Z 가 포함된 사원의 
사번과 성명(name)을 조회하는 쿼리문을 작성한다.
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || ' ' || last_name LIKE '%z%' 
OR first_name || ' ' || last_name LIKE '%Z%';

-----------------------------------------------------------------------------------------------