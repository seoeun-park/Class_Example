★ 문자 데이터표현 : ''(홑따옴표로 묶어 사용)
문자데이터와 날짜데이터는 홑따옴표('')로 묶어서 표현해야 한다.
★ 문자데이터는 대소문자를 구분한다.

07. 성이 King 인 사원들의
사번, 이름, 성 부서코드 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name = 'King'; --성이 King;

--기본 날짜 데이터 포맷 조회
시스템의 현재 날짜를 반환하는 함수 - SYSDATE
다른 함수와는 달리 파라미터가 없어 ()를 사용하지 않음.

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT';

--오늘 날짜 조회, dual : 가라 데이터, 가짜 데이터
SELECT SYSDATE 
FROM dual;

--날짜 포맷을 사용하여 사용자가 원하는 형태의 문자로 바꿔 반환
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH/DD')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') 
FROM dual;

--기본 데이터 포맷 변경
ALTER SESSION SET NLS_DATE_FORMAT = [변경할 포맷];
ALTER SESSION 
SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';
※ 오라클 기본 데이터 포맷 설정 ☜ 현재 세션에만 적용

SELECT SYSDATE 
FROM dual; --20/10/06

ALTER SESSION 
SET NLS_DATE_FORMAT = 'RR/MM/DD';

SELECT SYSDATE 
FROM dual;

08. 2003년 이전에 입사한 사원의 
사원코드, 성, 입사일자를 조회
SELECT employee_id, last_name, hire_date 
FROM employees
WHERE hire_date <= '2003-12-31';
--WHERE hire_date < '2004-01-01';
--WHERE hire_date < '2004/01/01';
--WHERE hire_date < '04-01-01';
--WHERE TO_CHAR(hire_date,'YYYY') < 2004;

4. 논리연산자 : 
4.1 AND 연산자 : 조건이 모두 TRUE 일 때만 TRUE 를 반환한다.

01. 30번 부서 사원 중 급여가 10000 이하인 사원의 
사원코드, 성명, 급여, 부서코드를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id 
FROM employees
WHERE department_id = 30 
AND salary <= 10000;

02. 30번 부서에서 급여가 10000 이하이면서 2005년 이전(2004년까지)에 입사한 사원의 
사원번호, 성명, 급여, 부서코드, 입사일자를 조회한다.
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다.
SELECT employee_id, first_name || ' ' || last_name name, salary, department_id, hire_date  
FROM employees
WHERE department_id = 30 
AND salary <= 10000
--AND hire_date < '05-01-01';
--AND hire_date <= '05-12-31';
AND TO_CHAR(hire_date,'YYYY') <= 2004;

03. 부서코드가 10 이상 30 이하인 사원들의
사번, 성명, 부서코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
WHERE department_id >=10 
AND  department_id <= 30 ;--부서코드가 10 이상 30 이하;

04. 급여가 10000 이상 15000 이하인 사원들의
사번, 성명, 급여, 업무코드 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name, salary, job_id
FROM employees
WHERE salary>=10000 
AND salary<=15000; --급여가 10000 이상 15000 이하

05. 부서가 60인 부서에서 급여가 5000 이상인 사원들의
사번, 성명, 부서코드, 급여 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
WHERE department_id = 60 
AND salary >= 5000;--부서가 60인 부서 급여가 5000 이상

문자/날짜 데이터표현: ''
06. 부서코드가 60 이하이면서 2003년 6월 17일 이전에 입사한 사원들의 
사번, 성명, 입사일자 조회
성명은 이름과 성을 합해서 사용하고 'name'으로 별명한다
SELECT employee_id, first_name || ' ' || last_name name, hire_date
FROM employees
WHERE hire_date <= '2003-06-17'  -- 2003년 6월 17일 이전에 입사한;
AND department_id <= 60; --부서코드가 60 이하

4.2 OR 연산자는 조건 중 하나만 TRUE 이면 TRUE 를 반환한다.

07. 30번 부서나 60번 부서에 속한 사원의 
성명, 급여, 부서코드를 조회한다
SELECT first_name || ' ' || last_name name, salary, department_id dept_id 
FROM employees
WHERE department_id = 30
OR department_id = 60;

08. 부서코드가 10, 20, 30인 부서에 속한 사원들의
사번, 성명, 부서코드, 업무코드 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id, job_id
FROM employees
WHERE department_id = 10 
OR department_id = 20
OR department_id = 30; --부서코드가 10,20,30;

09. 사번이 150, 170, 190 인 사원들의
사번, 성명, 부서코드, 업무코드, 입사일자 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id, job_id, hire_date
FROM employees
WHERE employee_id = 150 
OR employee_id = 170 
OR employee_id = 190 ; --사번이 150, 170, 190 ;  

4.3 AND 연산자와 OR 연산자를 혼합하여 문장을 작성한다.

10. 30번 부서의 급여가 10000미만인 사원과 60번 부서의 급여가 5000이상인 사원의
성명, 급여, 부서코드 정보를 조회한다.
SELECT first_name ||' ' ||last_name name, salary, department_id dept_id 
FROM employees
WHERE department_id = 30 AND salary < 10000 
OR department_id = 60 AND salary >= 5000;

다음과 같이 AND와 OR 조건이 혼합되어 사용되는 경우 가독성을 위해 괄호를 붙여주는 것이 좋다.
SELECT first_name || ' ' || last_name name, salary, department_id dept_id 
FROM employees
WHERE ( department_id = 30 AND salary < 10000 ) 
OR ( department_id = 60 AND salary >= 5000 );

11. 부서코드가 30인 부서의 급여 10000 미만인 사원들과
부서코드가 60인 부서의 급여 5000 이상인 
사원들의 사번, 성명, 부서코드, 급여 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id, salary
FROM employees
WHERE (department_id=30 AND salary<10000) 
OR (department_id=60 AND salary>=5000);
--department_id=30 AND salary<10000 --부서코드가 30인 부서의 급여 10000 미만
--OR department_id=60 AND salary>=5000; --부서코드가 60인 부서의 급여 5000 이상

연산자에는 우선순위가 있다
산술연산의 경우: *,/ -> +,-
논리연산의 경우: AND : 논리곱 -> OR : 논리합
7+(7/7)+(7*7)-7

5. 범위 조건 연산자  BETWEEN
BETWEEN 시작값 AND 마지막값 은 시작값 이상 마지막값 이하 와 같다.
★ BETWEEN 이나 관계연산자로 비교할 수 있는 값은 숫자데이터, 문자데이터, 날짜데이터
A이상 B이하: 컬럼명 BETWEEN A AND B
A미만 B초과: 컬럼명 NOT BETWEEN A AND B
             NOT 컬럼명 BETWEEN A AND B
NOT 연산자는 BETWEEN 연산자 바로 앞이나 컬럼명 앞에 붙여 사용할 수 있으며, 두 경우 모두 같은 결과가 조회된다.
            
01. 사번 110번 부터 120번 까지의 
사번 110번 이상 120번 이하의 
사원번호, 성명, 급여, 부서코드를 조회한다.
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id >= 110 AND employee_id <= 120;
--WHERE employee_id BETWEEN 110 AND 120;

02. 사번이 110번 미만 120번 초과인 사원의 
사원번호, 성명, 급여, 부서코드를 조회한다.
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id < 110 OR employee_id > 120;
--WHERE NOT employee_id BETWEEN 110 AND 120;

03. 논리연산자를 사용해
부서코드가 10 미만 40 초과인 사원들의 
사번, 성명, 부서코드 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
WHERE department_id < 10 OR department_id > 40;
--WHERE NOT department_id BETWEEN 10 AND 40;
--WHERE department_id NOT BETWEEN 10 AND 40;
--WHERE NOT (department_id>=10 AND department_id<=40); --부서코드가 10 미만 40 초과

04. 사번이 110에서 120인 사원 중 급여가 5000에서 10000사이의 
사원번호, 성명, 급여, 부서코드를 조회한다.
SELECT employee_id emp_id, first_name || ' ' || last_name name, 
       salary, department_id dept_id 
FROM employees
WHERE employee_id BETWEEN 110 AND 120
AND salary BETWEEN 5000 AND 10000;

05. 2005년 1월 1일 이후부터 2007년 12월 31일 사이에 입사한 사원의
사번, 성명, 급여, 입사일자 정보를 조회한다.
SELECT employee_id, first_name || ' ' || last_name name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('2005-01-01') AND TO_DATE('2007-12-31');






SELECT employee_id emp_id, first_name || ' ' || last_name name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN '05-01-01' AND '07-12-31';

DATE 타입의 HIRE_DATE 의 값을 문자값으로 비교했음에도 
오류없이 결과가 나오는 이유는 오라클 SQL 엔진이 자동으로 묵시적 형변환을 했기 때문이다.
하지만 가급적 명시적으로 형변환하는 것이 바람직하다.
명시적 형변환 함수는 TO_DATE() 이다.

SELECT employee_id emp_id, first_name || ' ' || last_name name, salary, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('05-01-01') AND TO_DATE('07-12-31');

06. 입사일자가 2003년 8월 1일 부터 2005년 7월 31일 에 해당하는 사원들의
사번, 성명, 입사일자 조회



SELECT employee_id, first_name || ' ' || last_name name, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('03-08-01') AND TO_DATE('05-07-31');
--입사일자가 2003년 8월 1일 부터 2005년 7월 31일;

07. 부서코드가 20,30,40,60,100,110 인 부서에 속한 사원들의 
사번, 성명, 부서코드 조회
SELECT employee_id, first_name || ' ' || last_name name, department_id
FROM employees
--WHERE department_id=20 
--OR department_id=30 
--OR department_id=40 
--OR department_id=60 
--OR department_id=100 
--OR department_id=110; --부서코드가 20,30,40,60,100 
WHERE deparment_id IN (20,30,40,60,100);
6. IN 조건 연산자
여러 개의 값 중에 일치하는 값이 있는지 비교할 때는 IN (값1, 값2, 값3 ...) 의 형태로
비교하는 값의 목록을 나열한다.
동일한 컬럼표현에 대해 동등 비교한 형태의 조건식을 OR 로 나열한 형태
       컬럼표현 IN (동등 비교할 데이터값 목록)
 <-> 컬럼표현 NOT IN (동등 비교할 데이터값 목록)
     NOT 컬럼표현 IN (동등 비교할 데이터값 목록)

IN 연산자는 OR 연산자와 동일한 기능을 수행
비교할 값들이 많을 때 OR 연산자를 사용하면 SQL 문장이 길고 복잡해지는데 
IN 연산자를 사용하면 문장이 깔끔해지고 가독성이 높아진다.
IN 연산자 바로 앞이나 컬럼명 앞에 NOT 연산자를 두어 반대되는 조건을 만든다.

01. 30번 부서원 또는 60번 부서원 또는 90번 부서원의 
사번, 성명, 급여, 부서코드를 조회한다
SELECT employee_id emp_id, first_name ||' ' ||last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id = 30 
OR department_id = 60 
OR department_id = 90;

SELECT employee_id emp_id, first_name ||' ' || last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id IN (30, 60, 90);
--department_id NOT IN (30, 60, 90);
--NOT department_id IN (30, 60, 90);

02. 30번 부서, 60번 부서, 90번 부서 이외의 부서에 속한 사원들의 
사번, 성명, 급여, 부서코드정보를 조회한다.
SELECT employee_id emp_id, first_name || ' ' || last_name name, 
       salary, department_id dept_id
FROM employees
WHERE department_id NOT IN (30, 60, 90);

7. 검색에 해당하는 연산자 : 필드명 LIKE 조건 연산자(포함하는)
                          : 필드명 NOT LIKE 조건 연산자(포함하지 않는) 
컬럼값들 중에 특정 패턴에 속하는 값을 조회하고자 할 때 LIKE 연산자를 사용한다.
% : 여러 개의 문자열, 어떤문자가 몇개가 오던지 무관한
_ : 하나의 문자, 하나의 문자가 어떤문자가 오던지 무관한

컬럼표현 LIKE 검색문자 + %
% : 어떤문자가 몇개가 오던지 무관한
성명 LIKE '홍%'  ☞ 홍으로 시작하는 성명 : 홍길동, 홍명보, 홍시, 홍, 홍수완무...
성명 LIKE '%홍'  ☞ 홍으로 끝 나 는 성명 : 황선홍, 분홍, 다홍, 홍, 김수완무...홍
성명 LIKE '%홍%' ☞ 홍을   포함하는 성명 : 홍길동, 홍명보, 홍시, 홍, 홍수완무, 
                   황선홍, 분홍, 다홍, 홍, 김수완무...홍, 김홍도, ...

01. 이름이 K로 시작되는 사원들의 
사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'K%';

02. 이름이 s로 끝나는 이름을 가진 사원들의 
사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '%s';

03. 성에 소문자 z 가 포함된 성을 가진 사원들의
사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%'; --성에 z 가 포함된

04. 성에 대소문자 무관하게 z 가 포함된 성을 가진 사원들의 
사번, 이름, 성 조회
SELECT employee_id, first_name, last_name
FROM employees
WHERE last_name LIKE '%z%' 
OR last_name LIKE '%Z%'; 
--성에 대소문자 무관하게 z 가 포함된

05. 성명에 대소문자 무관하게 z가 포함된 성명을 가진 사원들의 
사번, 성명 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name||first_name LIKE '%z%' 
OR last_name||first_name LIKE '%Z%';
--성명에 대소문자 무관하게 z가 포함된

06. 성에 소문자 z가 2번째에 위치해 있는 성을 가진 사원들의 
사번, 성명 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '_z%'; --성에 소문자 z가 2번째에 위치해 있는

07. 성에 소문자 z가 5번째에 위치해 있는 성을 가진 사원들의 
사번, 성명 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '____z%'; --성에 소문자 z가 5번째에 위치해 있는

08. 성에 소문자 z가 뒤에서부터 5번째에 위치해 있는 성을 가진 사원들의 
사번, 성명 조회
SELECT employee_id, first_name || ' ' || last_name name
FROM employees
WHERE last_name LIKE '%z____'; 

☞ LIKE 역시 BETWEEN 이나 IN 과 같이 NOT 연산자와 함께 사용할 수 있다.

09. 전화번호가 6으로 시작되지 않는 사원의 
사번, 성명, 급여, 휴대전화 정보를 조회
SELECT employee_id emp_id, first_name || ' ' || last_name name,
       salary, phone_number phone
FROM employees
WHERE phone_number NOT LIKE '6%';

10. ● 입사일자가 12월에 입사한 사원들의 
사번, 성, 입사일자 조회
SELECT employee_id, last_name, hire_date
FROM employees
--WHERE TO_CHAR(hire_date, 'MM') = 12;
--WHERE hire_date LIKE '___12___';
WHERE hire_date LIKE '__%12%__';
WHERE hire_date LIKE '%12%'; --XXX
-----------------------------------------------------------------------------------------------
LIKE 연산자와 함께 사용된 %, _ 를 문자 자체로 인지되게 하려면
%, _ 앞에 기호문자를 붙이고 escape 옵션을 지정한다.
컬럼표현 LIKE 특수문자 '\_' escape '\'
특수문자 ☞ ~, !, @, #, $, ^, &, *, -, ?, \
-----------------------------------------------------------------------------------------------
사원들의 업무형태(업무코드)를 파악하고자 한다.
업무코드가 _A 인 사원들의 사번, 성, 업무코드를 조회
: 예를 들어, FI_ACCOUNT, AD_ASST, AC_ACCOUNT
SELECT employee_id, last_name, job_id
FROM employees
--WHERE job_id LIKE '%_A%'; --A앞에 한글자 있는 모든것
WHERE job_id LIKE '%@_A%' escape '@'; --업무코드가 _A 인

--WHERE job_id LIKE '%@__A%' escape '@'; --_를 포함하고 A앞에 한글자가 있는 
-----------------------------------------------------------------------------------------------