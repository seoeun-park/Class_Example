
3. 다중컬럼 서브 쿼리 - 서브 쿼리의 결과 컬럼이 여러 컬럼인 경우
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
GROUP BY department_id;

SELECT department_id, MAX(salary) max_sal, first_name --101개 나옴, 결과가 틀림
FROM employees
GROUP BY department_id, first_name;

해결방법 1. 인라인뷰 사용 : 부서별 최대 급여를 구한 결과를 테이블로 사용

부서별 최대 급여
SELECT department_id, MAX(salary) max_sal --12개
FROM employees
GROUP BY department_id;

인라인 뷰 사용
SELECT e.department_id, e.salary, e.first_name --11개
                      --*********
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal;

SELECT e.department_id, e.salary, e.first_name --12개
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

해결방법 2. 다중컬럼 서브쿼리 사용 : 서브쿼리의 결과값이 여러행(12개)이므로 '='(equal)은 사용 불가
그래서, IN 연산자로 대체

다중컬럼 서브쿼리 사용
SELECT e.department_id, e.salary, e.first_name --23개가 출력, 그룹별로 조회가 안된 상황
FROM employees e
WHERE e.department_id IN ( SELECT department_id         --생략가능(항상 참의 조건)
                           FROM employees               --생략가능(항상 참의 조건)
                           GROUP BY department_id )     --생략가능(항상 참의 조건)
AND e.salary IN ( SELECT MAX(salary) max_sal
                  FROM employees
                  GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --11개가 출력, 그룹별로 조회됨
FROM employees e
WHERE (e.department_id, e.salary) IN ( SELECT department_id, MAX(salary) max_sal
                                       FROM employees
                                       GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --12개가 출력, 그룹별로 조회됨
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
부서별로 가장 많은 급여를 받는 사원의 
--서브 쿼리의 결과값이 부서, 최대급여이므로 다중컬럼서브 쿼리
--그래서, IN 연산자 사용
사번, 성명, 부서코드, 급여, 업무코드 조회  


다중컬럼 서브 쿼리 xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --결과가 이상함, 
       department_id, salary, job_id                     --부서별로 최대값이 조회되어 12개가
FROM employees                                           --조회되어야 하는데 23개의 결과 나타남.
WHERE department_id IN ( SELECT department_id
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
※ 부서별로 가장 많은 급여를 받는 사원의 
사번, 성명, 부서코드, 급여, 업무코드 조회 

인라인 뷰 서브 쿼리1 ☞ 그룹함수 반드시 alias  --부서별 최대급여를 테이블처럼 사용
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE m.department_id = e.department_id ----null 제외한 11개 조회 
AND e.salary = m.max_sal --☜ max_sal : alias한것
ORDER BY 3;

인라인 뷰 서브 쿼리2 NVL 함수 사용 ☞ 그룹함수 반드시 alias  --부서별 최대급여를 테이블처럼 사용
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(m.department_id,0) = NVL(e.department_id, 0) --null 포함한 12개 조회
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

02. 각 부서별 최근에 입사한 사원들의 --서브 쿼리의 결과값이 부서별, 최근 입사
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
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.hire_date = m.max_hire_date
ORDER BY 3;

다중컬럼 서브쿼리
SELECT employee_id, last_name, department_id, hire_date --14개(중복이 2개여서)
FROM employees
WHERE (NVL(department_id,0), hire_date) IN ( SELECT NVL(department_id,0), MAX(hire_date) 
                                             FROM employees 
                                             GROUP BY department_id )
ORDER BY 3;

03. 매니저가 없는 부서의
부서코드, 사번을 조회
SELECT department_id, employee_id
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
SELECT d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

다중(결과)행 서브 쿼리
SELECT department_id, department_name 
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
다중컬럼 서브 쿼리
SELECT department_id, department_name 
FROM departments
WHERE ( department_id, manager_id ) --★  
IN ( SELECT department_id, employee_id --★ 서브 쿼리의 결과값이 부서코드, 사번
     FROM employees
     WHERE manager_id IS NULL );

-----------------------------------------------------------------------------------------------        