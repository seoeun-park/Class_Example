-- 중복을 제거하고 대표값만 조회하기 위한 키워드 : DISTINCT (NULL까지 포함)
SELECT DISTINCT department_id
FROM employees;

-- NULL 값을 제외한 대표값 조회
SELECT DISTINCT department_id
FROM employees
WHERE department_id IS NOT NULL;

-- 부서코드의 대표값을 오름차순으로 정렬(NULL 값이 맨 아래에 정렬)
SELECT DISTINCT department_id
FROM employees
ORDER BY 1;

-- 부서코드의 대표값을 오름차순으로 정렬
--단, NULL값을 맨 위에 정렬하도록 한다.
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 NULLS FIRST;

-- 부서 코드의 대표값을 내림차순으로 정렬
-- 단, NULL값을 맨 아래에 정렬하도록 한다.
SELECT DISTINCT department_id
FROM employees
ORDER BY 1 DESC NULLS LAST;

SELECT DISTINCT department_id, employee_id
FROM employees;

--[연습문제 4-1]
--우리회사에 매니저로 있는 사원들이 누군인지 파악하고자 한다.
--매니저인 사원들의 manager_id 를 조회
SELECT DISTINCT manager_id
FROM employees
WHERE manager_id IS NOT NULL;

--그룹함수
-- 데이터 행의 갯수를 세어 반환하는 함수 : COUNT(대상표현), COUNT(*)
SELECT COUNT(*) cnt1,                                           --회사 사원의 수
               COUNT(department_id) cnt2,                      --부서 배치를 받은 사원의 수(그룹 함수이므로 NULL 제외)
               COUNT(DISTINCT department_id) cnt3,
               --DISTINCT는 NULL까지 포함하고 그룹함수는 NULL을 제외
               COUNT(commission_pct) cnt4
FROM employees;

-- 회사 사원들 중 부서코드 60번 부서에 속한 사원들의 수를 파악하고자 한다.
SELECT COUNT(*) cnt
FROM employees
WHERE department_id = 60;

--우리 회사 사원들 중 clerk 종류의 업무를 하는 사원들의 수 조회
SELECT COUNT(*) cnt
FROM employees
--WHERE job_id LIKE '%CLERK%';
WHERE LOWER (job_id) LIKE '%clerk%';

--데이터 값을 합하여 반환하는 함수 : SUM(대상표현) - 숫자에만 사용 가능
-- 우리 회사 모든 사원들의 급여를 합한 결과를 조회
SELECT SUM(salary) sum_sal
FROM employees;

-- 우리 회사 부서 코드 60번 부서에 속한 사원들의 급여를 합한 결과를 조회
SELECT SUM(salary) sum_sal
FROM employees
WHERE department_id = 60;

-- 회사에서 account 업무를 하는 사원들의 급여를 합한 결과를 조회
--단, 결과의 데이터 타입이 숫자가 아닌 문자로 표현해야한다.
SELECT TO_CHAR(SUM(salary), '999,999') sum_sal
FROM employees
WHERE  LOWER(job_id) LIKE '%account%';

-- 데이터 값 중 가장 큰/작은 값을 반환하는 함수 : MAX/MIN(대상표현)

-- 회사에서 가장 높은/낮은 급여를 조회
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees;

--회사 사원들 중 가장 먼저/나중에 나오는 성을 조회
SELECT MIN(last_name) min_name, MAX(last_name) max_name
FROM employees;

-- 회사 사원들 중 가장 먼저/나중에 입사한 사원의 입사 일자 조회
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees;

-- 부서코드가 60번인 사원들 중 가장 높은/낮은 급여를 조회
SELECT MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
WHERE department_id = 60;

-- 회사 clerk 종류의 업무를 하는 사원들의 입사정보를 파악하고자 한다.
--clerk 종류의 업무를 하는 사원들 중 가장 먼저 입사한 입사 일자, 가장 최근 입사한 입사일자 조회
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%';

--AVG(대상표현) : 데이터 값의 평균을 반환 - 숫자만 가능

-- 회사 사원들의 급여 평균 조회
SELECT ROUND(SUM(salary) / COUNT(*), 2) avg_sal1,
               ROUND(AVG(salary), 2) avg_sal2
FROM employees;

-- 회사 부서코드 60인 부서에 속한 사원들의 급여 평균 조회
-- 급여 평균은 소수 둘째자리까지 반올림해서 표현
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 60;


-----------------------------------------------------------------------------------------------
--실습
--01. 성에 대소문자 무관하게 z가 포함된 성을 가진 사원들이 모두 몇명인지 파악하고자 한다.
--성에 대소문자 무관하게 z가 포함된 성을 가진 사원들의 수를 조회하시오.
SELECT COUNT(*) cnt
FROM employees
WHERE LOWER(last_name) LIKE '%z%';


--02. 우리회사 사원들 최고급여와 최저급여 간 급여차를 파악하고자 한다.
--우리회사 최고급여와 최저급여의 급여차를 조회하시오.
SELECT MAX(salary) - MIN(salary) result
FROM employees;

--03. 우리회사에 매니저로 있는 사원들의 수를 파악하고자 한다.
--우리회사 매니저인 사원들의 수를 조회하시오.
SELECT COUNT(DISTINCT manager_id) manager
FROM employees;

--04. 우리회사 account 업무를 하는 사원들의 급여평균를 조회하시오.
--소수이하 2자리까지 구하시오.
SELECT ROUND(AVG(salary), 2) avg_sal1
FROM employees
WHERE LOWER(job_id) LIKE '%account%';

-----------------------------------------------------------------------------------------------
--[연습문제 4-2]
--01. 우리회사 사원들 중 커미션을 받는 사원들이 모두 몇명인지 파악하고자 한다.
--커미션을 받는 사원의 수를 조회
SELECT COUNT(commission_pct) comm
FROM employees;




--02. 우리회사 사원들 중 가장 먼저/나중에 입사한 사원의 입사일자 조회
SELECT MIN(hire_date) min_date, MAX(hire_date) max_date
FROM employees;




--03. 우리회사 부서코드 90번인 부서에 속한 사원들의 급여평균 조회
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 90;


-----------------------------------------------------------------------------------------------
--01. 우리회사 사원들의 사번, 성, 부서코드, 급여 조회하여 부서코드 순으로 정렬한다.
SELECT employee_id, last_name, department_id, salary
FROM employees
ORDER BY department_id;

--02. 부서코드 50번 부서의 급여평균를 조회
SELECT ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id = 50;

---------------------------------------------------------------------------------------------

--특정 기준을 두어 기준으로 그룹을 짓고 그룹별로 하나의 결과를 조회할때 GRUOP BY를 사용
--GROUP BY - 특정 기준으로 그룹을 지을 때 
--HAVING - 그룹 함수 조건 지정

--SELECT 목록에 그룹 함수를 사용한 표현(COUNT, MAX, MIN, SUM, AVG, ...)과 
--그룹 함수를 사용하지 않은 표현(일반 칼럼)이 함께 있다면
--반.드.시 그룹함수를 사용하지 않은 표현에 대해서는
--GROUP BY 절의 기준으로 명시해야만 한다.
--그러나 GRUOP BY절에 명시된 컬럼은 SELECT 절에 사용되지 않아도 된다.

SELECT department_id, job_id, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id = 50
-- 그룹함수를 사용하지 않은 일반 칼럼들
GROUP BY department_id, job_id;

--회사 각 부서별 부서코드, 급여합계, 급여평균, 부서원수를 조회하시오
SELECT department_id, SUM(salary) sum_sal, ROUND(AVG(salary), 0) avg_sal, COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id;

--각 부서별, 업무별로 부서코드, 업무코드, 급여평균 조회
SELECT department_id, job_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id, job_id
-- 먼저 부서코드별로 오름차순 정렬한 후 그 다음 업무 코드별로 오름차순 정렬
ORDER BY 1;
--ORDER BY 절은 항상 마지막에 

-- 회사 부서코드가 10,20,30,40,60 번 부서에 속한 사원들의 정보를 파악
-- 해당 부서별로 부서코드, 부서원스, 부서급여평균
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE department_id IN(10,20,30,40,60)
GROUP BY department_id;

--회사 clerk 종류의 업무를 하는 사원들의 정보를 파악
-- 정보 : clerk 종류의 업무별로 업무코드, 사원수, 사원들 급여 평균 조회
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
WHERE LOWER(job_id) LIKE '%clerk%'
GROUP BY job_id;

-- ※ GRUOP BY로 정렬하면 중복된 값이 제거된다.

-- WHERE 절에서 사용하는 조건을 HAVING 절에 사용할 수도 있으나,
-- 그룹함수가 포함된 조건은 HAVING절에서만 사용할 수도 있다.
--WHERE : 일반조건만 가능
--HAVING : 일반조건, 그룹 함수 포함 조건 모두 가능
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
HAVING department_id IN(10,20,30,40,60);

--각 부서별로 소속된 사원의 수가 5명 이하인 부서와 그 수를 조회
SELECT department_id, COUNT(*) cnt
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) <= 5
--HAVING 또한 WHERE과 같이 엘리어싱 사용 X
ORDER BY 1;

--각 부서별 사원에 대한 정보 파악
-- 정보 : 사원 수가 10명 이상인 부서의 부서코드, 사원 수, 급여 평균, 최대급여, 최저급여 조회
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary), 2) avg_sal, 
               MAX(salary) max_sal, MIN(salary) min_sal 
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 10;



