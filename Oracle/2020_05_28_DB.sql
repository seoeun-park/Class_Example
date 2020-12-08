--오늘 날짜 조회, dual : 가짜 데이터
SELECT SYSDATE
FROM dual;

--날짜 포맷을 사용하여 사용자가 원하는 형태의 문자로 바꿔 반환
--SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') today
--SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD') today
--SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS') today
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') today
FROM dual;

--기본 날짜 데이터 포맷 설정
ALTER SESSION
SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';

SELECT SYSDATE
FROM dual;

ALTER SESSION
SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT SYSDATE
FROM dual;

--입사일이 2004년 1월 1일 이전(2003년까지)인 사원의 사원코드, 성, 입사일자를 조회
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE hire_date <= '2003-12-31';
--WHERE hire_date < '2004-01-01';
--WHERE hire_date <= '2003/12/31';
WHERE hire_date <= '03/12/31';

--입사일이 2003년 이전인 사원의 사원코드, 성, 입사일자를 조회
SELECT employee_id, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') <= 2003;

--30번 부서 사원 중 급여가 10000 이하인 사원의 사원코드, 성명, 급여, 부서코드를 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE department_id =30
AND salary <= 10000;

--30번 부서에서 급여가 10000이하이면서 2005년 이전(2004년까지)에 입사한 사원의
--사원번호, 성명, 급여, 부서코드, 입사일자를 조회한다.
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id, hire_date
FROM employees
WHERE salary <= 10000
AND department_id = 30
AND TO_CHAR(hire_date, 'YYYY') < 2005;

--부서코드가 10이상 30이하인 사원들의 사번, 성명, 부서코드 조회
--성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
WHERE department_id >= 10
AND department_id <= 30;

--급여가 10000이상 15000이하인 사원들의 사번, 성명, 급여, 업무코드 조회
SELECT employee_id, first_name || ' ' || last_name name, salary, job_id
FROM employees
WHERE salary >= 10000
AND salary <= 15000;

--부서가 60인 부서에서 급여가 5000이상인 사원들의 사번, 성명, 부서코드, 급여 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
WHERE department_id = 60
AND salary >= 5000;

--부서코드가 60이하이면서 2003년 6월 17일 이전에 입사한 사원들의 사번, 성명, 입사일자 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id, hire_date
FROM employees
WHERE department_id <= 60
AND hire_date <= '2003/06/17';

--30번 부서나 60번 부서에 속한 사원들의 성명, 급여, 부서코드 조회
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE department_id = 30
OR department_id = 60;

--10번, 20번, 30번 부서에 속한 사원들의 성명, 급여, 부서코드 조회
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE department_id = 10
OR department_id = 20
OR department_id = 30;

--30번 부서의 급여가 10000미만인 사원과 60번 부서의 급여가 5000이상인 사원의 성명, 급여, 부서코드 정보를 조회한다.
SELECT first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE (department_id = 30 AND salary < 10000)
OR (department_id = 60 AND salary >= 5000);
-- 연산자 우선순위 AND > OR

--BETWEEN 연산자 > 숫자데이터, 문자데이터, 날짜데이터만 가능

--사번이  110부터 120번까지(110번 이상 120번 이하)의 사원번호, 성명, 급여 부서코드를 조회
SELECT employee_id,  first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE employee_id BETWEEN 110 AND 120;

--부서코드가 10미만 40초과인 사원들이 사번, 성명, 부서코드 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id dept_id
FROM employees
WHERE department_id NOT BETWEEN 10 AND 40;

--사번이 110에서 120인 사원 중 급여가 5000에서 10000사이의 사원번호, 성명 급여, 부서코드를 조회
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id dept_id
FROM employees
WHERE (employee_id BETWEEN 110 AND 120)
AND (salary BETWEEN 5000 AND 10000);

--2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원의 사번, 성명, 급여 입사일자 조회
SELECT employee_id, first_name || ' ' || last_name name, salary, hire_date
FROM employees
--WHERE hire_date BETWEEN TO_DATE( '2005/01/01') AND TO_DATE('2007/12/31'); --명시적 형변환(문자 > 날짜)
WHERE hire_date BETWEEN  '2005/01/01' AND '2007/12/31';  --묵시적 형변환

--입사일자가 2003년 8월 1일부터 2005년 7월 31일에 해당하는 사원들의 사번, 성명, 입사일자 조회
SELECT employee_id, first_name || ' ' || last_name name,  hire_date
FROM employees
WHERE hire_date BETWEEN '03/08/01' AND '05/07/31';

--부서코드가 20, 30, 40, 60, 100인 사원들의 사번, 성명, 부서코드 조회
SELECT employee_id, first_name || ' ' || last_name name,  department_id dept_id
FROM employees
WHERE department_id IN(20, 30, 40, 60, 100);

--30번 부서원 또는 60번 부서원 또는 90번 부서원 이외의 사번, 성명 급여, 부서코드를 조회
SELECT employee_id, first_name || ' ' || last_name name,  salary, department_id dept_id
FROM employees
WHERE department_id NOT IN(30, 60, 90);

-- % : 여러 개의 문자열, 어떤 문자가 몇개가 오던 지 무관함
-- _ : 하나의 문자, 하나의 문자가 어떤 문자가 오던 지 무관함

--이름이 K로 시작되는 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'K%';

--이름이 s로 끝나는 이름을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '%s';

--성에 z가 포함된 성을 가진 사원들의 사번, 이름 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%';

--대소문자가 무관하게 성에 z가 포함된 성을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%'
OR last_name LIKE '%Z%';

--성명에 대소문자 무관하게 Z가 포함된 성명을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE first_name || last_name LIKE '%z%'
OR first_name || last_name LIKE '%Z%';

--성에 소문자 z가 앞에서 2번째에 위치해 있는 성을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '_z%';

--성에 소문자 z가 앞에서 5번째에 위치해 있는 성을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '____z%';

--성에 소문자 z가 뒤에서 5번째에 위치해 있는 성을 가진 사원들의 사번, 이름, 성 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '%z____';

--사원들의 업무형태(업무코드)를 파악하고자 한다.
--업무코드가 _A인 사원들의 사번, 성, 업무코드를 조회
-- 예를 들어, FI_ACCOUNT, AD_ASST, AC_ACCOUNT
SELECT employee_id, last_name, job_id
From employees
WHERE job_id LIKE '%@_A%' escape '@';
-- _를 연산자가 아닌 문자로 취급하기 위해서는 escape 연산자를 쓴다


