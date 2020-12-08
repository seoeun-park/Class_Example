
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') d1,
                TO_CHAR(SYSDATE, 'RRRR MON DD') d2,
                TO_CHAR(SYSDATE, 'YY-MM-DD') d3,
                TO_CHAR(SYSDATE, 'RR-MM-DD') d4, 
                TO_CHAR(SYSDATE, 'RR-MM-DD HH:MI:SS') d5,
                TO_CHAR(SYSDATE, 'RR-MM-DD HH24:MI:SS') d6,
                TO_CHAR(SYSDATE, 'YY-MM-DD DAY') d7,
                TO_CHAR(SYSDATE, 'YY-MM-DD DY') d8
FROM dual;

-- TO_DATE와 TO_CHAR의 차이점
-- TO_CHAR는 내가 원하는 날짜 출력 방식을 그대로 출력할 수 있지만
-- TO_DATE는 날짜 출력 방식을 지정하더라도 RR/MM/DD 형식으로 출력
-- 그리고 TO_CHAR은 TO_CHAR('2020-04-20', 'RR/MM/DD')는 오류
-- TO_CHAR은 임의대로 작성한 날짜는 변환이 안되고, SYSDATE만 변환이 가능하다.

-- 사원 테이블에서 30번 부서의 사번, 성명, 급여, 근무개월수, 근무년수를 조회
--단, 근무 개월 수는 오늘 날짜를 기준으로 날짜 함수를 사용
SELECT employee_id, first_name || ' ' || last_name name, salary, 
                FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
                FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees;

--급여가 12000 이상인 사원들의 사번, 성명, 급여를 조회하여 급여순으로 정렬한다.
--급여는 공백없이 천단위의 기호를 사용하여 표현한다.
SELECT employee_id, first_name || ' ' || last_name name,
                TRIM(TO_CHAR(salary, '999,999,999')) salary
                --TRIM(문자열) -> 양 옆의 공백을 자름
FROM employees
WHERE salary >= 12000
ORDER BY salary;

--2005년 전(2004년까지)에 입사한 사원들의 사번, 성명, 입사일자, 입사일의 요일을 조회하여
-- 최근에 입사한 사원순으로 정렬한다.
SELECT employee_id, first_name || ' ' || last_name name, hire_date,
               TO_CHAR(hire_date, 'DY') hire_day 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') < 2005
ORDER BY hire_date DESC;

-- 커미션 금액이 1000 미만인 사원의 사번, 이름 급여, 커미션 요율, 커미션 금액을 조회
-- 커미션 금액 = 커미션 요율 * 급여
SELECT employee_id, first_name, salary, commission_pct,
               salary * commission_pct
               -- 커미션 요율이 NULL값인 경우는 제외(NULL은 연산이 안되기 때문에)
FROM employees
WHERE salary * commission_pct < 1000;

-- 조회된 NULL값을 치환하는 함수 : NVL(Null VaLue)함수, DECODE 함수
-- NVL(컬럼, 0) : 값이 NULL이면 0으로 치환
-- 첫번째 인수와 두번째 인수는 데이터 타입이 같아야 함
--DECODE(컬럼, A, 1, B, 2, 3) : 컬럼값이 A이면 1, B이면 2, 그것도 아니면 3으로 치환
SELECT employee_id, first_name, salary, commission_pct,
               salary * NVL(commission_pct, 0)
FROM employees
WHERE salary * NVL(commission_pct, 0) < 1000;

--사번, 성, 급여, 커미션 요율, 총급여 조회
--총급여 = 급여 + 커미션 금액
SELECT employee_id, last_name, salary, commission_pct,
                salary + salary * NVL(commission_pct, 0) total_salary1,
                salary * (1+  NVL(commission_pct, 0)) total_salary2                
FROM employees;

-- NVL2(대상, NULL이 아닌 경우 반환값, NULL인 경우 반환값)
--  두번째 인수와 세번째 인수만 데이터 타입이 같으면 된다.
-- 커미션 요율이 NULL인 경우 총 급여는 급여 + 커미션 금액을 반환
-- 커미션 요율이 NULL이 아닌 경우 총 급여는 급여만 반환

SELECT employee_id, last_name, salary, commission_pct,
               NVL(commission_pct, 0) type1,
               NVL(TO_CHAR(commission_pct, '0.00'), '커미션 없음') type2,
               NVL2(commission_pct, 'salary+commission', 'salary') type3,
               NVL(commission_pct, salary(1 + commission_pct), salary) type4
FROM employees;

--급여, 커미션 요율, NVL 사용 총급여, NVL2 사용 총급여
SELECT employee_id, last_name, salary, commission_pct,
               salary * (1 +  NVL(commission_pct, 0)) "NVL 사용 총급여",
               NVL2(commission_pct, salary * (1 +  commission_pct), salary) "NVL2 사용 총급여"               
FROM employees;

--COALESCE(대상표현, 대체표현1, 대체표현2, 대체표현3)
SELECT name, COALESCE(휴대폰, 집, 사무실) 연락처
FROM dual;

--사번, 성, 부서코드, 업무코드, 입사일자, 매니저코드, 매니저존재여부 조회
--NVL은 manager_id와 관리자가 없으면 '없음'으로 표시,
--NVL2는 사원의 관리자(매니저)가 있으면 '있음'으로, 없으면 '없음'으로 조회
SELECT employee_id, last_name, department_id, job_id, hire_date, 
                NVL(TO_CHAR(manager_id), '없음') manager_id,
                NVL2(manager_id, '있음', '없음') "NVL2"
FROM employees;


--DECODE 로 구현
SELECT employee_id, last_name, department_id, salary,
                DECODE(department_id, 10, salary * 0.1,
                                                          20, salary * 0.2,
                                                          30, salary * 0.3, salary * 0.05 ) bonus
FROM employees;

-- CASE WHEN THEN ELSE로 구현 (1)
SELECT employee_id, last_name, department_id, salary,
                CASE department_id WHEN 10 THEN salary * 0.1
                                                   WHEN 20 THEN salary * 0.2
                                                   WHEN 30 THEN salary * 0.3
                                                   ELSE salary * 0.05 
                END bonus
FROM employees;

-- CASE WHEN THEN ELSE로 구현 (2)
SELECT employee_id, last_name, department_id, salary,
                CASE WHEN department_id = 10 THEN salary * 0.1
                           WHEN department_id = 20 THEN salary * 0.2
                           WHEN department_id = 30 THEN salary * 0.3
                           ELSE salary * 0.05 
                END bonus
FROM employees;


-- 사원들의 사번, 이름, 업무코드, 업무등급 조회
-- 업무등급은 업무코드에 따라 분류한다
--DECODE 와 CASE~END 사용하여 조회

--업무코드    업무등급
--AD_PRES      A
--ST_MAN       B
--IT_PROG      C
--SA_REP       D
--ST_CLERK     E
--그 외        X

SELECT employee_id, first_name, job_id, 
               DECODE(job_id, 'AD_PRES', 'A',
                                            'ST_MAN', 'B',
                                            'IT_PROG', 'C',
                                            'SA_REP ', 'D',
                                            'ST_CLERK', 'E', 'X') "업무등급"
FROM employees;

SELECT employee_id, first_name, job_id,
               CASE WHEN job_id =  'AD_PRES' THEN 'A'
                          WHEN job_id =  'ST_MAN' THEN 'B'
                          WHEN job_id =  'IT_PROG' THEN 'C'
                          WHEN job_id =  'SA_REP' THEN 'D'
                          WHEN job_id =  'ST_CLERK' THEN 'E'
                          ELSE 'X'
               END "업무등급"           
FROM employees;





