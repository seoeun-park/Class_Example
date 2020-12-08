6.1 서브 쿼리(Sub Query) :
SQL 문장 안에 존재하는 또 다른 SQL 문장을 서브 쿼리라 한다.
서브 쿼리는 괄호로 묶어 사용하고 서브 쿼리가 포함된 쿼리문을 메인쿼리라 한다.
            ※※※※※※※※※※※※※※※※※※※※
===============================================================================================
※ 서브 쿼리의 위치에 따른 명칭 
- SELECT 문에 있는 서브 쿼리 : 스칼라 서브 쿼리, SQL에서 단일값을 스칼라 값이라 함.
  Scalar : (크기)하나, Vector : 크기와 방향
  SELECT 문에 서브 쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적(표현 용도)
  조인(JOIN)의 대체 표현식으로도 자주 사용



- FROM 절에 있는 서브 쿼리 : 인라인 뷰
  SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용(테이블 대체 용도)
  인라인 뷰 서브 쿼리에 ORDER BY 절은 올 수 없음.
  (☞ 출력 용도가 아닌 테이블처럼 사용 용도이므로 굳이 정렬할 필요가 없음.)
  인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!
  alias 지정함으로써 하나의 컬럼으로 사용함



- WHERE 절에 있는 서브 쿼리 : 일반 서브 쿼리
   ★ SELECT 절의 결과를 하나의 변수(상수)처럼 사용 
   (조건절은 서브 쿼리의 결과에 따라 달라짐) ☜ 단일(결과)행인지, 다중(결과)행인지, 다중컬럼인지에 따라 달라짐
   ※ 조건절에서 서브쿼리 만들때 메인쿼리에서는 조인을 하지 않음

○ 일반 서브 쿼리 - 메인 쿼리문안에 있는 또 다른 쿼리문 (WHERE/HAVING 조건절 안에서 사용), 
 ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※ 
  보통, 함수로 구한값과 비교할때, 다른 곳에서 구한값과 비교할때
 ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※ 
1. 단일(결과)행 서브 쿼리 - 조건절에 사용하는 서브 쿼리의 결과행이 단일행인 경우
2. 다중(결과)행 서브 쿼리 - 조건절에 사용하는 서브 쿼리의 결과행이 여러행인 경우
3. 다중 컬럼 서브 쿼리 - 조건절에 사용하는 서브 쿼리의 결과컬럼이 여러컬럼인 경우

4. Scalar 서브 쿼리 - SELECT 절에 사용하는 서브 쿼리
5. 상호 연관 서브 쿼리 - 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 경우(스칼라 서브 쿼리에서 다룸)

6. 인라인 뷰 서브 쿼리 - FROM 절에 사용하는 서브 쿼리
===============================================================================================

1. 조건절(WHERE, HAVING)에 사용하는 단일(결과)행 서브 쿼리 
단일(결과)행 서브 쿼리 연산자: =, !=, <>, <, >, <=, >= 

01. 급여가 우리회사 평균급여보다 더 적은 급여를 받는 사원의 
사번, 이름, 성, 급여 정보를 조회

가. 우리회사 평균 급여
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

나. 위에서 확인한 평균 급여를 기준으로 쿼리 작성
SELECT employee_id, first_name, last_name, salary --결과행이 여러개, 56개
FROM employees
WHERE salary < 6461.831775700934579439252336448598130841; 

다. 평균 급여를 상수 대신 대입해 봄 ☞ 에러남
SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < AVG(salary); --xxx 에러, WHERE 절에서는 그룹함수 사용 못 함!

라. 우리 회사 급여가 변동이 되면 상수를 입력할 수 없으므로 변경이 될때마다 수정해야 하므로
WHERE 절에 상수를 사용하지 않고, 
상수대신 무언가의 결과를 재사용하고 싶을때 서브 쿼리를 사용함.
******************************************

마. 상수 대신 평균 급여를 조회하는 쿼리문을 넣어줌  
SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < ( SELECT AVG(salary) 
                 FROM employees ); --서브 쿼리 사용
--WHERE salary < 회사평균급여;--우리회사 급여의 평균보다 더 적게 받는


02. 급여가 우리회사 급여의 평균보다 더 적게 받는 사원들의 
사번, 성, 업무코드, 급여 조회

우리회사 급여의 평균
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

SELECT employee_id, last_name, job_id, salary --56개
FROM employees
WHERE salary < 6461.831775700934579439252336448598130841;
                 
SELECT employee_id, last_name, job_id, salary  --56개
FROM employees
WHERE salary < ( SELECT AVG(salary) 
                 FROM employees );
--WHERE salary < 회사평균급여;--우리회사 급여의 평균보다 더 적게 받는


03. 우리회사에서 가장 많은 급여를 받는 사원의 
사번, 성, 명, 급여 조회

우리회사에서 가장 많은 급여
SELECT MAX(salary) --24000
FROM employees; 

SELECT employee_id, last_name, first_name, salary
FROM employees
WHERE salary = 24000; 

SELECT employee_id, last_name, first_name, salary
FROM employees
WHERE salary = ( SELECT MAX(salary) 
                 FROM employees ); 
--WHERE salary IN ( SELECT MAX(salary) --우리회사에서 가장 많은 급여를 받는 
--                  FROM employees ); 

04. 사번 150번 사원보다 더 많은 급여를 받는 사원들의 
사번, 성, 부서코드, 업무코드, 급여 조회

사번 150번 사원의 급여
SELECT salary  --10000
FROM employees 
WHERE employee_id = 150;

SELECT  employee_id, last_name, department_id, --15개
        job_id, salary
FROM employees
WHERE salary > 10000;

SELECT  employee_id, last_name, department_id, --15개
        job_id, salary
FROM employees
WHERE salary > ( SELECT salary 
                 FROM employees 
                 WHERE employee_id = 150 );
--WHERE salary > 사번 150번 사원의 급여;

05. 월급여가 가장 많은 사원의 
사번, 이름, 성, 업무제목 정보를 조회

우리회사 최고 급여
SELECT MAX(salary) --24000
FROM employees;

SELECT e.employee_id, e.first_name, e.last_name, j.job_title 
FROM  employees e, jobs j 
WHERE  e.job_id = j.job_id
AND e.salary = 24000;

SELECT e.employee_id, e.first_name, e.last_name, j.job_title 
FROM  employees e, jobs j 
WHERE  e.job_id = j.job_id
AND e.salary = ( SELECT MAX(e.salary) 
                 FROM employees e );
 
06. 사원들의 급여가 우리회사 평균 급여 이상 최고 급여 이하에 해당하는
사원들의 사번, 성, 급여 조회

우리 회사 평균 급여
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

우리 회사 최고 급여
SELECT MAX(salary) --24000
FROM employees;

SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 6461 AND 24000;
                 
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN ( SELECT AVG(salary) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );

-----------------------------------------------------------------------------------------------
[연습문제 6-1]
01. 우리회사에서 가장 적은 급여를 받는 사원의 
사번, 성, 업무코드, 부서코드, 부서명, 급여 조회

우리 회사 최소 급여
SELECT MIN(salary) --2100
FROM employees;

SELECT  e.employee_id, e.last_name, e.job_id, 
        e.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.salary = 2100;

SELECT  e.employee_id, e.last_name, e.job_id, 
        e.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.salary = ( SELECT MIN(e.salary) 
                 FROM employees e );
--WHERE e.salary = 우리회사에서 가장 적은 급여;

02. 부서명이 Marketing 인 부서에 속한 사원들의 
사번, 성명, 부서코드, 업무코드 조회

부서명이 Marketing인 부서코드
SELECT department_id --20
FROM departments
WHERE LOWER(department_name) = 'marketing';

일반 쿼리
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(d.department_name) = 'marketing';

서브 쿼리
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e
WHERE e.department_id = 20;

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e    --※ 조건절에서 서브쿼리 만들때 메인쿼리에서는 조인을 하지 않음????? XXXX
WHERE e.department_id = ( SELECT d.department_id 
                          FROM departments d
                          WHERE LOWER(d.department_name) = 'marketing' );

03. 우리회사 사장님보다 먼저 입사한 사원들의 
사번, 성명, 입사일자 조회
사장은 그를 관리하는 매니저가 없는 사원을 말한다.

사장님 입사일자
SELECT e.hire_date --03/06/17
FROM employees e
WHERE e.manager_id IS NULL;

일반 쿼리 --SELF JOIN
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, e.hire_date  --10개
FROM employees e, employees m
WHERE e.hire_date < m.hire_date 
AND m.manager_id IS NULL;

서브 쿼리
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date  --10개
FROM employees e
WHERE e.hire_date < TO_DATE('03/06/17'); --사장님 입사일자


SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date  --10개
FROM employees e
WHERE e.hire_date < ( SELECT m.hire_date 
                      FROM employees m
                      WHERE m.manager_id IS NULL );
--WHERE hire_date < 사장님 입사일자;
-----------------------------------------------------------------------------------------------

===============================================================================================
참고. 조건절(WHERE, HAVING)에 사용하는 단일(결과)행 서브 쿼리
      ※※※※※※※※※※※※※※※※※※※※※※※※※※※※
단일(결과)행 서브 쿼리 연산자: =, !=, <>, <, >, <=, >=
===============================================================================================
참고. 조건절(WHERE, HAVING)에 사용하는 다중(결과)행 서브 쿼리
      ※※※※※※※※※※※※※※※※※※※※※※※※※※※※
단일(결과)행 서브 쿼리 연산자: IN, NOT IN
===============================================================================================

2. 다중(결과)행 서브 쿼리 - 조건절에 사용한 서브 쿼리의 결과행이 여러 행인 경우
- 연산자 : IN, NOT IN(즉, '='을 IN 으로 대체), 
  비교의 대상이 두 개 이상은 대소비교 불가, 그래서, IN 연산자 사용
  서브 쿼리의 결과가 여러 행일 경우 '=', '<', '>' 와 같은 대소비교가 불가
  WHERE 절에는 그룹함수(MIN, MAX 등) 사용 불가!
  WHERE 절이 아닌 서브 쿼리에는 그룹함수(MIN, MAX 등) 사용가능

- 컬럼표현 IN, NOT 컬럼표현 IN, 컬럼표현 NOT IN
-----------------------------------------------------------------------------------------------

01. 부서의 위치코드가 1700 인/ (1700이 아닌) 부서에 속한 사원들의
    ※※※※※※※※※※※※※※※※※※※※※※                   ※※※※※※※※※※※
사번, 성명, 부서코드, 업무코드조회

위치코드가 1700 인 부서
SELECT d.department_id, d.location_id --21개, 즉 여러행
FROM departments d 
WHERE d.location_id = 1700; 

일반 쿼리 
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id IN (1700);

서브 쿼리
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, --18개행
       e.department_id, e.job_id
FROM employees e 
WHERE e.department_id IN ( 10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270 );
--WHERE e.department_id = (위치코드가 1700 인 부서);

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, --18개행
       e.department_id, e.job_id
FROM employees e 
WHERE e.department_id IN ( SELECT department_id 
                      --NOT IN (SELECT department_id 
                           FROM departments
                           WHERE location_id = 1700 );
--WHERE e.department_id = (위치코드가 1700 인 부서);

                   
02. 우리회사에서 mgr 업무에 종사하는 사원들과 같은 부서에 속한 사원들의
사번, 성, 업무코드 조회 ---DDDDD, 셀프 조인 

mgr 업무에 종사하는 사원의 부서코드
SELECT department_id    --100, 110 2개
FROM employees
WHERE LOWER(job_id) LIKE '%mgr%';

일반 쿼리
SELECT e.employee_id, e.last_name, e.job_id  --8개
FROM employees e, employees m
WHERE e.department_id = m.department_id(+)
AND LOWER(m.job_id) LIKE '%mgr%'
ORDER BY 1;

서브 쿼리
SELECT e.employee_id, e.last_name, e.job_id --8개
FROM employees e
WHERE e.department_id IN ( 100, 110 ) 
ORDER BY 1;

SELECT employee_id, last_name, job_id  --8개
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(job_id) LIKE '%mgr%' ) 
ORDER BY 1;


03. 각 부서의 최소급여가 40번 부서의 최소급여보다 더 많은 
부서코드, 최소급여 조회

40번 부서의 최소급여
SELECT MIN(salary) --6500
FROM employees 
WHERE department_id = 40;

SELECT department_id, MIN(salary) min_sal --5개
FROM employees
--WHERE
GROUP BY department_id
HAVING MIN(salary) > 6500
ORDER BY 1;
--HAVING 부서최소급여 > 40번 부서최소급여;


SELECT department_id, MIN(salary) min_sal --5개
FROM employees
--WHERE
GROUP BY department_id
HAVING MIN(salary) > ( SELECT MIN(salary) 
                       FROM employees 
                       WHERE department_id = 40 )
ORDER BY 1;
--HAVING 부서최소급여 > 40번 부서최소급여;


04. 근무지의 국가코드가 UK(즉, country_id가 UK)인 곳에 있는 부서의 
부서코드, 위치코드, 부서명 조회

근무지의 국가코드가 UK 인 곳에 있는 부서
SELECT location_id --결과가 여러개 2400, 2500, 2600
FROM locations 
WHERE LOWER(country_id) = 'uk';  

일반조인
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE d.location_id =  l.location_id
AND LOWER(l.country_id)='uk';   

다중(결과)행 서브 쿼리
SELECT department_id, location_id, department_name --2개
FROM departments
WHERE location_id IN ( 2400, 2500, 2600 );
--WHERE location_id  = (근무지의 국가코드가 UK 인 곳에 있는 부서);

SELECT department_id, location_id, department_name --2개
FROM departments
WHERE location_id IN ( SELECT location_id
                       FROM locations 
                       WHERE LOWER(country_id) = 'uk' );
--WHERE location_id  = (근무지의 국가코드가 UK 인 곳에 있는 부서);


05. 성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들과 같은 부서에 속한 
사원들의 사번, 성명, 부서코드, 업무코드 조회

-----------------------------------------------------------------------------------------------
★★★★비교. 
성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의 
사번, 성명, 부서코드, 업무코드 조회
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE LOWER(last_name) LIKE '%z%'; --성에 대소문자 무관하게 z가 있는 성;
-----------------------------------------------------------------------------------------------

성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들과 같은 부서
SELECT department_id, last_name --부서가 60, 80, 110
FROM employees
WHERE LOWER(last_name) LIKE '%z%';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e
WHERE e.department_id IN (60, 80, 110);

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(last_name) LIKE '%z%' );
--WHERE department_id = --성에 대소문자 무관하게 z 가 포함된 사원과 같은 부서에 속한


06. 60번 부서원들과 같은 급여를 받는 사원들의 
사원들의 사번, 성, 급여, 부서코드 조회

60번 부서원 급여
SELECT salary --결과가 여러개 : 9000, 6000, 4800, 4200
FROM employees 
WHERE department_id = 60;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (4200, 4800, 6000, 9000);

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 );

07. 60번 부서에 속하지 않으면서
60번 부서원들과 같은 급여를 받는 사원들의 
사번, 성, 급여, 부서코드 조회
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 )
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN(60);

08. 우리회사 사원들 중 부서명이 Marketing이거나 IT에 속한 사원들의
사번, 성, 부서코드 조회

부서명이 Marketing이거나 IT인 사원의 부서코드
SELECT department_id --20, 60
FROM departments 
WHERE department_name IN ('Marketing', 'IT');

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( 20,60 );

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM departments 
                         WHERE department_name IN ('Marketing', 'IT') );
-----------------------------------------------------------------------------------------------
