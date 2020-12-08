--부서명이 Marketing인 부서에 속한 사원들의
--사번, 성명, 부서코드, 업무코드 조회

SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id
                                            FROM departments
                                            WHERE department_name = 'Marketing');
                                            SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id
                                            FROM departments
                                            WHERE department_name = 'Marketing');

--------------------------------------------------------------------------------------------
--다중 컬럼

--부서별로 가장 많은 급여를 받는 사원의 부서코드, 최대급여를 조회
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
ORDER BY 1;     --12개 조회

--부서별로 가장 많은 급여를 받는 사원의 부서코드, 최대급여, 이름을 조회
SELECT department_id, first_name, MAX(salary) max_sal
FROM employees
GROUP BY department_id, first_name 
ORDER BY 1;     --101개
--12개 값에 first_name만 추가해야 함

--해결 방법 1. 인라인 뷰 사용 : 테이블
SELECT e.department_id, e.first_name, e.salary
FROM employees e, (SELECT department_id, MAX(salary) max_sal
                                    FROM employees
                                    GROUP BY department_id) m
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

--해결 방법 2. 다중 컬럼 서브쿼리 사용 : 서브 쿼리의 결과값이 여러행(12개)이므로 =는 사용불가
--그래서 IN 연산자로 대체
SELECT e.department_id, e.salary, e.first_name
FROM employees e
WHERE e.department_id IN (SELECT department_id
                                               FROM employees
                                               GROUP BY department_id)
--WHERE e.department_id = 다른 테이블 department_id
AND e.salary IN (SELECT MAX(salary) max_sal
                             FROM employees
                             GROUP BY department_id);   --23개행 조회(올바르지 않은 방법)
--AND e.salary = 다른 테이블 max_sal

SELECT e.department_id, e.salary, e.first_name
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN (SELECT NVL(department_id,0), MAX(salary) max_sal
                                                                            FROM employees
                                                                            GROUP BY department_id);
--12개 행 조회, 그룹별로 조회됨

--부서별로 가장 많은 급여를 받는 사원의 사번, 성명, 부서코드, 급여 업무 코드 조회

--인라인 뷰
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                e.department_id, e.salary, e.job_id
FROM employees e, (SELECT department_id, MAX(salary) max_sal
                                    FROM employees
                                    GROUP BY department_id) m
WHERE  NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

-- 다중 칼럼
SELECT employee_id, salary, first_name || ' ' || last_name name,
                department_id, salary, job_id
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN (SELECT NVL(department_id,0), MAX(salary) max_sal
                                                                            FROM employees
                                                                            GROUP BY department_id);
                                                                            
--부서별로 가장 최근에 입사한 사원의
--사번, 성명, 부서코드, 입사일자 조회
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

--인라인 뷰
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
                e.department_id, e.hire_date
FROM employees e, (SELECT DISTINCT(department_id), MAX(hire_date) max_hire
                                    FROM employees
                                    GROUP BY department_id) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.hire_date = m.max_hire;

-- 다중 칼럼
SELECT DISTINCT(department_id), employee_id, 
                first_name || ' ' || last_name name,
                hire_date
FROM employees e
WHERE (NVL(e.department_id,0), hire_date) IN (SELECT NVL(department_id,0), MAX(hire_date)
                                                                              FROM employees
                                                                              GROUP BY department_id);
                                                                              
--매니저가 없는 사원(즉, 사장 employee_id가 100)이 매니저로 있는 부서코드 부서명을 조회
SELECT employee_id
FROM employees
WHERE manager_id IS NULL;

SELECT DISTINCT(e.department_id), d.department_name
FROM  departments d, employees e
WHERE d.department_id(+) = e.department_id
AND e.manager_id IN (SELECT employee_id
                                      FROM employees
                                      WHERE manager_id IS NULL);
                                      
------------------------------------------------------------------------------------
--스칼라 서브 쿼리(조인을 대체)

--각 사원의 급여 수준을 파악하고자 한다.
--모든 사원의 사번, 성, 급여, 회사평균급여, 회사최대급여 조회

SELECT e.employee_id, e.last_name, e.salary, 
               (SELECT ROUND(AVG(salary)) avg_sal
                FROM employees) avg_sal,
                (SELECT MAX(salary) max_sal
                FROM employees) max_sal
FROM employees e
GROUP BY e.employee_id, e.last_name, e.salary;

--모든 사원의 사번, 성, 부서코드, 부서명 조회
SELECT e.employee_id, e.last_name, e.department_id,  (SELECT department_name
                                                                                            FROM departments
                                                                                            WHERE department_id = e.department_id) department_name
FROM employees e
ORDER BY 1;
                                                        

--모든 사원의 사번, 성, 부서코드, 업무코드, 업무 제목 조회
SELECT e.employee_id, e.last_name, e.department_id, e.job_id, 
                (SELECT job_title
                 FROM jobs
                 WHERE job_id = e.job_id) job_title
FROM employees e
ORDER BY 1;




