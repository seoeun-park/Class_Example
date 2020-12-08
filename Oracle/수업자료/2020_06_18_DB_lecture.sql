3. 다중컬럼 서브 쿼리 - 서브 쿼리의 결과 컬럼이 여러 컬럼인 경우, 조건의 결과값을 기준으로 컬럼이 여러개
- 다중컬럼을 pair 의 형태로 비교한다.
https://data-make.tistory.com/25

-----------------------------------------------------------------------------------------------
01. 부서별로 가장 많은 급여를 받는 사원의 
부서코드, 최대급여를 조회.
SELECT department_id, MAX(salary) max_sal --12개 조회됨
FROM employees
GROUP BY department_id --GROUP BY : null값까지 조회
ORDER BY 1;
-----------------------------------------------------------------------------------------------
02. 부서별로 가장 많은 급여를 받는 사원의 
부서코드, 최대급여, 이름을 조회.
SELECT department_id, MAX(salary) max_sal, first_name --문법상 오류 발생
FROM employees
GROUP BY department_id; --문법상 오류 발생

SELECT department_id, MAX(salary) max_sal, first_name --101개 나옴, 결과가 이상함
FROM employees
GROUP BY department_id, first_name; --문법상 맞지만 이상 결과 발생

해결방법 1. 인라인뷰 사용 : 부서별 최대 급여를 구한 결과를 테이블로 사용(부서와 부서별 최대급여를 부서와 급여로 받아서 처리)

부서별 최대 급여
SELECT department_id, MAX(salary) max_sal --12개
FROM employees
GROUP BY department_id;

인라인 뷰 사용
SELECT e.department_id, e.salary, e.first_name --11개, null값이 조회 안됨
                      --********* ☜ MAX(salary) 아님!!!
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal;

SELECT e.department_id, e.salary, e.first_name --12개, null값까지 조회됨
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0) --부서별로
AND e.salary = m.max_sal; --최대급여를 급여로 받아서 처리

해결방법 2. 다중컬럼 서브쿼리 사용 : 서브쿼리의 결과값이 여러행(12개)이므로 '='(equal)은 사용 불가
그래서, IN 연산자로 대체

다중컬럼 서브쿼리 사용
SELECT e.department_id, e.salary, e.first_name --23개가 출력, 그룹별로 조회가 안된 상황
                      --********* ☜ MAX(salary) 아님!!!
FROM employees e
WHERE e.department_id IN ( SELECT department_id         --생략가능(항상 참의 조건)
                           FROM employees               --생략가능(항상 참의 조건)
                           GROUP BY department_id )     --생략가능(항상 참의 조건)
AND e.salary IN ( SELECT MAX(salary) max_sal
                  FROM employees
                  GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --11개가 출력, 그룹별로 조회됨, null값은 조회 안됨
FROM employees e
WHERE (e.department_id, e.salary) IN ( SELECT department_id, MAX(salary) max_sal
                      --********              부서별로 최대급여를 급여로 전달
                                       FROM employees
                                       GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --12개가 출력, 그룹별로 조회됨, null값까지 조회 됨
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN ( SELECT NVL(department_id,0), MAX(salary) max_sal
                                              FROM employees
                                              GROUP BY department_id );

-----------------------------------------------------------------------------------------------
03. 부서별로 가장 많은 급여를 받는 사원의 
사번, 성명, 부서코드, 최대급여, 업무코드 조회  

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, MAX(salary) max_sal, job_id --107개 모두 조회됨 xxx, 부서별로 조회되어야 함.
FROM employees
--WHERE
GROUP BY employee_id, first_name, last_name, department_id, job_id --xxxx
--HAVING
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
03-01. 부서별로 가장 많은 급여를 받는 사원의 
--서브 쿼리의 결과값이 부서, 최대급여이므로 다중컬럼서브 쿼리, --부서별로 최대급여를 급여로 전달
--그래서, IN 연산자 사용
사번, 성명, 부서코드, 급여, 업무코드 조회  
다중컬럼 서브쿼리

다중컬럼 서브 쿼리 xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --결과가 이상함, 
       department_id, salary, job_id                     --부서따로, 최대급여 따로 전달해서
FROM employees                                           --부서별로 최대값이 조회되어 12개가
WHERE department_id IN ( SELECT department_id            --조회되어야 하는데 23개의 결과 나타남.
                         FROM employees
                         GROUP BY department_id )
AND salary IN ( SELECT MAX(salary)
                FROM employees
                GROUP BY department_id )
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

다중컬럼 서브 쿼리 ○○○○○○
○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id --null 제외한 11개 조회 
FROM employees
WHERE ( department_id, salary ) IN ( SELECT department_id, MAX(salary) max_sal --다중컬럼 서브 쿼리
                                     FROM employees 
                                     GROUP BY department_id )
ORDER BY 3;

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id --null 포함한 12개 조회
FROM employees
WHERE ( NVL(department_id,0), salary ) IN ( SELECT NVL(department_id, 0), MAX(salary) max_sal --다중컬럼 서브 쿼리
                                            FROM employees 
                                            GROUP BY department_id )
ORDER BY 3;

○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-----------------------------------------------------------------------------------------------
03-02. 부서별로 가장 많은 급여를 받는 사원의 
사번, 성명, 부서코드, 급여, 업무코드 조회 
인라인뷰 서브쿼리
인라인뷰 서브 쿼리1 ☞ 그룹함수 반드시 alias  --부서별 최대급여를 테이블처럼 사용
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id ----null 제외한 11개 조회 
AND e.salary = m.max_sal --☜ max_sal : alias한것
ORDER BY 3;

인라인뷰 서브 쿼리2 NVL 함수 사용 ☞ 그룹함수 반드시 alias  --부서별 최대급여를 테이블처럼 사용
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id, 0) --null 포함한 12개 조회
AND e.salary = m.max_sal --☜ max_sal ☞ MAX(salary)를 alias한것
ORDER BY 3;

-----------------------------------------------------------------------------------------------
EMPLOYEE_ID NAME                                           DEPARTMENT_ID     SALARY JOB_ID    
----------- ---------------------------------------------- ------------- ---------- ----------
        200 Jennifer Whalen                                           10       4400 AD_ASST   
        201 Michael Hartstein                                         20      13000 MK_MAN    
        114 Den Raphaely                                              30      11000 PU_MAN    
        203 Susan Mavris                                              40       6500 HR_REP    
        121 Adam Fripp                                                50       8200 ST_MAN    
        103 Alexander Hunold                                          60       9000 IT_PROG   
        204 Hermann Baer                                              70      10000 PR_REP    
        145 John Russell                                              80      14000 SA_MAN    
        100 Steven King                                               90      24000 AD_PRES   
        108 Nancy Greenberg                                          100      12008 FI_MGR    
        205 Shelley Higgins                                          110      12008 AC_MGR    
        178 Kimberely Grant                                       (null)       7000 SA_REP    

12개 행이 선택되었습니다.
-----------------------------------------------------------------------------------------------

04. 각 부서별 최근에 입사한 사원들의 --서브 쿼리의 결과값이 부서별, 최근 입사
사번, 성, 부서코드, 입사일자 조회

부서별 최근입사일자
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

인라인뷰 서브쿼리
SELECT e.employee_id, e.last_name, e.department_id, e.hire_date --14개(중복이 2개여서)
FROM employees e, ( SELECT department_id, MAX(hire_date) max_hire_date
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0) --부서별로 
AND e.hire_date = m.max_hire_date --최근 입사일자를 입사일자로 받음
ORDER BY 3;

다중컬럼 서브쿼리
SELECT employee_id, last_name, department_id, hire_date --14개(중복이 2개여서)
FROM employees
WHERE (NVL(department_id,0), hire_date) IN ( SELECT NVL(department_id,0), MAX(hire_date) --부서별로 최근 입사일자를 입사일자로 받음 
                                             FROM employees 
                                             GROUP BY department_id )
ORDER BY 3;

-----------------------------------------------------------------------------------------------

05. 매니저가 없는 부서의
부서코드, 사번을 조회
SELECT department_id, employee_id --1개   90   100
FROM employees
WHERE manager_id IS NULL; 

DEPARTMENT_ID EMPLOYEE_ID
------------- -----------
           90         100

04. 매니저가 없는 부서의
부서코드, 부서명을 조회

DEPARTMENT_ID DEPARTMENT_NAME               
------------- ------------------------------
           90 Executive        

일반 쿼리
SELECT d.department_id, d.department_name --1개, 90	Executive
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

다중(결과)행 서브 쿼리
SELECT department_id, department_name --1개
FROM departments
WHERE department_id IN ( 90 );

SELECT department_id, department_name --1개
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
다중컬럼 서브 쿼리
SELECT department_id, department_name --1개 
FROM departments
WHERE ( department_id, manager_id ) --★  
IN ( SELECT department_id, employee_id --★ 서브 쿼리의 결과값이 부서코드, 사번
     FROM employees
     WHERE manager_id IS NULL );

-----------------------------------------------------------------------------------------------        
4. 상호연관 서브 쿼리 : 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 형태
- 메인쿼리의 값을 서브 쿼리에 주고, 서브 쿼리의 결과 값을 받아서 메인쿼리로 반환해서 
  수행하는 쿼리
- 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되어 메인쿼리에 독립적이지 않은 형식
- 메인 테이블과 서브 쿼리 테이블 간의 JOIN 조건이 사용됨.
- 메인 쿼리와 서브 쿼리가 계속 정보를 주고 받는다는 의미

★ 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 
  상호연관 서브 쿼리의 형태로 사용된다.(WHERE 절에서 사용)
- 스칼라 서브 쿼리에서 다룰 예정
                          
5. 스칼라 서브 쿼리 : SELECT 문에 사용 , 단일(결과)행, 단일컬럼만 조회가능, 
   Scalar : (크기)하나, Vector : 크기와 방향
- 단순한 그룹함수의 결과를  SELECT 절에서 조회하고자 할때
- SELECT 문에 서브 쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적(표현 용도)
- 조인(Join)의 대체 표현식으로도 자주 사용  
- 코드성 데이터를 조회하고자 할때  
- 조인 조건식이 필요할때는 스칼라 서브쿼리 안에서 WHERE 조건식 사용


1) 단순한 그룹함수의 결과값을 SELECT 절에 조회하고자 할때

01. 각 사원의 급여 수준을 파악하고자 한다.
모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대급여 조회

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, last_name, salary, --107개 나오지만 결과 이상
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary; --xxxx, 결과에서 SALARY, AVG_SAL, MAX_SAL 비교해보기
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT ROUND(AVG(salary)) avg_sal --6462
FROM employees; 

○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
SELECT employee_id, last_name, salary, --107개
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal,
       ( SELECT MAX(salary) FROM employees ) max_sal
FROM employees;
○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

SELECT 절에 그룹함수를 쓰게 되면 나머지 그룹함수 이외의 컬럼은 
GROUP BY 절을 사용하거나 그룹함수만 들어갈 수 있다.

2) 코드성 테이블에서 코드명(즉, 데이터 컬럼명)를 SELECT 절에 조회하고자 할 때 : 상호연관 서브 쿼리, Outer Join 사용한것 처럼

01. 모든 사원의 사번, 성, 부서코드, 부서명 조회1

일반 쿼리
SELECT employee_id, last_name, e.department_id, d.department_name 107개
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1;

상호연관 서브 쿼리 : 메인쿼리의 컬럼이 서브 쿼리의 조건절에 사용되는 형태

모든 사원의 사번, 성, 부서코드, 부서명 조회2 ( 스칼라 서브 쿼리로 "부서명" 구하기 )
SELECT employee_id, last_name, department_id, --107개
       ( SELECT department_name 
         FROM departments d
         WHERE department_id = e.department_id ) department_name --e.department_id 사용
FROM employees e;

02. 모든 사원의 사번, 성, 부서코드, 업무코드, 업무제목 조회 ( 스칼라 서브 쿼리로 "업무제목" 구하기 )

일반 쿼리
SELECT employee_id, last_name, department_id, j.job_id, j.job_title --107개
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

스칼라 서브 쿼리
SELECT employee_id, last_name, department_id, job_id, --107개
       ( SELECT job_title 
         FROM jobs 
         WHERE job_id = e.job_id ) job_title
FROM employees e;

03. 각 부서에 대해 부서코드, 부서명, 도시를 조회 ( 스칼라 서브 쿼리로 "도시" 구하기 )

일반 쿼리
SELECT department_id, department_name, l.city --27개
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

스칼라 서브 쿼리
SELECT department_id, department_name,  --27개
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

04. 모든 사원들의 사번, 성, 급여, 부서코드, 부서명, 업무코드 조회

일반 쿼리
SELECT employee_id, last_name, salary, e.department_id, --107개
       department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

스칼라 서브 쿼리 ( 스칼라 서브 쿼리로 "부서명" 구하기 )
SELECT employee_id, last_name, salary, department_id, --107개
       ( SELECT department_name 
         FROM departments 
         WHERE department_id = e.department_id ) department_name,
       job_id
FROM employees e;
 
05. 각 부서에 대해 부서코드, 부서명, 위치코드, 도시명 조회

일반 쿼리
SELECT d.department_id, d.department_name, d.location_id, l.city --27개
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

스칼라 서브 쿼리( 스칼라 서브 쿼리로 "도시" 구하기 )
SELECT department_id, department_name, location_id, --27개
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

06. 각 부서별 부서코드, 부서평균급여 조회

일반 쿼리
SELECT department_id, ROUND(AVG(salary)) avg_sal --12개
FROM employees
GROUP BY department_id;

상호연관서브 쿼리( 스칼라 서브 쿼리로 "평균급여" 구하기 )
SELECT department_id, --12개
       ( SELECT ROUND(AVG(salary)) 
         FROM employees
         WHERE department_id = e.department_id ) avg_sal
FROM employees e
GROUP BY department_id;

07. 각 사원에 대해 사원이 소속된 부서의 급여정보 대비 사원의 급여를 파악하고자 한다.
사번, 성, 부서코드, 급여, 각 사원이 속한 부서의 평균급여 조회
                          ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                         
SELECT employee_id, last_name, department_id, salary, ROUND(AVG(salary)) avg_sal --xxxx 107개 나오지만 결과가 이상함
FROM employees
GROUP BY employee_id, last_name, department_id, salary;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

상호연관서브 쿼리( 스칼라 서브 쿼리로 "평균급여" 구하기 )
SELECT employee_id, last_name, department_id, salary, --107개
       ( SELECT ROUND(AVG(m.salary)) 
         FROM employees m
         WHERE m.department_id = e.department_id ) dept_avg_sal
FROM employees e;


-----------------------------------------------------------------------------------------------
6. FROM절에 사용하는 인라인뷰 서브 쿼리
SELECT 절의 결과를 FROM 절에서 하나의 테이블처럼 사용(테이블 대체 용도)
--FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!

01. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
우리 회사 최대급여, 최소급여, 평균급여를 조회
SELECT  MAX(salary) max_sal, --1개
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal
FROM employees;

MAX_SAL    MIN_SAL    AVG_SAL
---------- ---------- ----------
24000      2100       6462
     
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

02. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
사번, 성, 급여, 최대급여, 최소급여, 평균급여를 조회
SELECT employee_id, last_name, salary,  --107개 나오지만 결과가 이상
       MAX(salary) max_sal, 
       MIN(salary) min_sal, 
       ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, salary
ORDER BY 1;

EMPLOYEE_ID LAST_NAME  SALARY   MAX(SALARY) MIN(SALARY) ROUND(AVG(SALARY))
--------------------------------------------------------------------------
100         King       24000    24000       24000       24000  --개인의 salary가 max, min, avg xxx
101         Kochhar    17000    17000       17000       17000
102         De Haan    17000    17000       17000       17000
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

스칼라 서브 쿼리  --SELECT 절에 서브쿼리를 사용하여 하나의 컬럼처럼 사용하기 위한 목적
SELECT employee_id, last_name, salary,  --107개
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal       
FROM employees;

인라인뷰 서브 쿼리 --SELECT 절의 결과를 FROM절에서 하나의 테이블처럼 사용하고 싶을때
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal --107개
FROM employees, ( SELECT MAX(salary) max_sal, --회사의 최대급여, 최소급여, 평균급여를 테이블처럼 사용
                  MIN(salary) min_sal, 
                  ROUND(AVG(salary)) avg_sal
                  FROM employees );
--FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!
 
EMPLOYEE_ID  LAST_NAME  SALARY    MAX_SAL    MIN_SAL  AVG_SAL
-------------------------------------------------------------
100          King       24000     24000      2100     6462
:            :          :         :          :        :
 
03. 사원이 받는 급여가 회사평균급여 이상 최대급여 이하에 해당하는 사원들의
사번, 성, 급여, 우리회사최대급여, 우리회사최소급여, 우리회사평균급여

스칼라 서브 쿼리
SELECT employee_id, last_name, salary, --51개
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal
FROM employees
WHERE salary BETWEEN ( SELECT ROUND(AVG(salary)) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );       

인라인 뷰 서브 쿼리
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal --51개
FROM employees, ( SELECT MAX(salary) max_sal, 
                         MIN(salary) min_sal,
                         ROUND(AVG(salary)) avg_sal 
                  FROM employees )
                --FROM 절에 사용하는 인라인 뷰 서브 쿼리에서 그룹함수는 반.드.시 alias 지정해야 함!!!!
                --부서별 최대급여, 최소급여, 평균급여를 테이블처럼 사용
WHERE salary BETWEEN avg_sal AND max_sal;
                -- 그 후 평균급여와 최대급여 사이를 쿼리함. 

04. 각 부서별로 가장 많은 급여를 받는 사원들의
사번, 성, 부서코드, 급여 조회

각 부서별로 가장 많은 급여
SELECT department_id, MAX(salary) max_sal
FROM employees 
GROUP BY department_id;

다중컬럼 서브 쿼리
SELECT employee_id, last_name, department_id, salary --12개
FROM employees
WHERE (NVL(department_id, 0), salary) IN ( SELECT NVL(department_id, 0), MAX(salary) 
                                           FROM employees 
                                           GROUP BY department_id )
ORDER BY 3;

인라인 뷰 서브 쿼리
SELECT employee_id, last_name, e.department_id, salary --12개
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0)
AND e.salary = m.max_sal
ORDER BY 3;

05. 우리회사 사원들의 급여정보를 관리한 테이블이 있다.
사번, 성, 부서코드, 급여, 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회
인라인뷰로 조회

부서별 부서원수, 부서최대급여, 부서최소급여, 부서평균급여 조회
SELECT  COUNT(*) cnt, --12개
        MAX(salary) max_sal, 
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal,
        department_id
FROM employees
GROUP BY department_id;

인라인 뷰 서브 쿼리
SELECT e.employee_id, e.last_name, e.department_id, e.salary, --107개
       m.cnt, m.max_sal, m.min_sal, m.avg_sal
FROM employees e, ( SELECT  COUNT(*) cnt, 
                            MAX(salary) max_sal, 
                            MIN(salary) min_sal, 
                            ROUND(AVG(salary)) avg_sal,
                            department_id
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0);

-----------------------------------------------------------------------------------------------
7. 몇개의 데이터행만 조회해 보자.
데이터행을 조회해오는 순서 : ROWNUM - 테이블에 존재하지 않는 컬럼은 아니지만 
사용할 수 있는 가짜 컬럼(PSEUDO COLUMN), 
SELECT 절과 WHERE 절에서 사용,
★ 쿼리문의 결과로 나온 각 행에 대한 순서값
※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
★ 서브 쿼리에서 먼저 정렬(ORDER BY) 후 메인 쿼리에서 순번 매기기(ROWNUM)
-  ROWNUM과 인라인 뷰의 특성을 이용하여 페이징 처리 등의 작업을 수행

게시판에서 일반적으로 페이지 번호가 3 페이지 이상인 것을 거의 읽지 않음. 
즉, 페이지 번호가 낮은 것을 훨씬 더 많이 조회하고 있고, 
그 비율이 5 페이지 이하의 페이지 조회율이 95% 이상

우리회사 사원들의 
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees;

우리회사 사원들에 대해 급여를 많이 받는 순으로 정렬하여 
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
ORDER BY salary DESC;

우리회사 사원들 사번순으로 정렬하여 10번까지
사번, 성, 급여 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10;

SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10
ORDER BY salary DESC;

인라인 뷰 사용하여
급여 상위 10명의 대한 사번, 이름, 급여 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary DESC ) e
WHERE ROWNUM <= 10;

인라인 뷰 사용하여
급여 하위 10명의 사번, 이름, 급여 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary ) e
WHERE ROWNUM <= 10;

가장 먼저 입사한 사원 10명에 대한 사번, 성, 입사일자 조회
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date ) e
WHERE ROWNUM <= 10;
-----------------------------------------------------------------------------------------------
8. 순위를 결정하고자 한다면
RANK() OVER(순위결정기준) - 1,2,2,2,2,6
DENSE_RANK() OVER(순위결정기준) - 1,2,2,2,2,3 
    --DENSE : 밀집한, 빽빽한

★ ROWNUM : 쿼리문의 결과로 나온 각 행에 대한 순서값
입사일자를 오름차순 기준으로 10위까지(먼저 입사한 사원 10명)
사번, 성, 입사일자 조회
SELECT ROWNUM, e.*
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date) e
WHERE ROWNUM <= 10 ;

SELECT * 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY hire_date) rank, 
              employee_id, last_name, hire_date
       FROM employees )
WHERE rank <= 10;

데이터 조회 ☞ SELECT 
SELECT 컬럼명, ....
FROM 테이블명, ....
WHERE 조인조건
WHERE 일반조건
WHERE 조인조건 AND 일반조건
GROUP BY 기준
HAVING 일반조건(그룹함수)
ORDER BY 정렬기준;

-----------------------------------------------------------------------------------------------
[연습문제 6-4]
01. 급여가 적은 상위 5명 사원의 
순위, 사번, 이름, 급여를 조회하는 쿼리문을 
DENSE_RANK()를 사용한 인라인뷰 서브 쿼리를 사용하여 작성

급여 하위 5명의 순위, 사번, 이름, 급여 조회
SELECT e.* 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY salary) rank, 
              employee_id, first_name, salary
       FROM employees ) e
WHERE rank <= 5;

02. 부서별로 가장 급여를 많이 받는 사원의 
사번, 이름, 부서코드, 급여, 업무코드를 조회하는 쿼리문 
인라인 뷰 서브 쿼리를 사용하여 작성

SELECT employee_id, first_name, e.department_id, salary, job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal
ORDER BY e.department_id;
-----------------------------------------------------------------------------------------------



