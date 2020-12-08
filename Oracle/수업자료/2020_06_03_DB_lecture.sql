3. 날짜화함수: TO_DATE(대상, 표현형식)  
'19-08-04' -> 변환가능:날짜형식, 
'가나다', 'abc' -> 변환불가

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT'; /* RR/MM/DD */

SELECT '201006' d1,                        /* 201006 */
       TO_DATE('20-10-06') d2,             /* 20/10/06 */
       TO_DATE('201006') d3,               /* 20/10/06 */
       TO_DATE('201006','DDMMRR') d4,      /* 06/10/20 */   /* 날짜는 '/'로 구분 */
       TO_DATE('20-10-06', 'DD-MM-RR') d5, /* 06/10/20 */   /* 날짜는 '/'로 구분 */
       TO_DATE('20-10-06', 'RR-MM-DD') d6, /* 20/10/06 */   /* 날짜는 '/'로 구분 */
       TO_DATE('20-10-06', 'YY-MM-DD') d7  /* 20/10/06 */   /* 날짜는 '/'로 구분 */
FROM dual;

SELECT 10 + 20 n1,      /* 30 */
       '10' + '20' n2,  /* 30 */
       10 + '20' n3     /* 30 */
FROM dual;

SELECT  TO_DATE('2013-05-27') DATE1,    /* 13/05/27 */
        TO_DATE('2013-06-27 11:12:35', 'YYYY/MM/DD HH:MI:SS AM') DATE2 /* 13/06/27 */ /* 날짜는 '/'로 구분 */
FROM dual;

SELECT  TO_DATE('2013-05-27') DATE1,    /* 13/05/27 */
        TO_DATE('2013-06-27 11:12:35', 'RR/MM/DD HH:MI:SS') DATE2, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'RRRR/MM/DD HH:MI:SS') DATE3, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'YY/MM/DD HH:MI:SS') DATE4, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'YYYY/MM/DD HH:MI:SS') DATE5, /* 13/06/27 */
        TO_DATE(SYSDATE, 'YYYY/MM/DD HH:MI:SS') DATE6 /* 13/06/27 */  
FROM dual;

SELECT  TO_CHAR('2013-06-27 11:12:35 AM', 'RR/MM/DD HH:MI:SS') DATE1  
/* 입력된 날짜는 TO_CHAR로 변환 안됨 */
FROM dual;

SELECT  TO_CHAR(SYSDATE, 'RRRR/MM/DD HH:MI:SS') DATE1  
/* SYSDATE는 TO_CHAR로 변환 됨 */
FROM dual;

-----------------------------------------------------------------------------------------------
[연습문제 3-3]
01. 사원테이블에서 30번 부서의 사번, 성명, 급여, 근무개월수, 근무년수를 조회
단, 근무개월수는 오늘 날짜를 기준으로 날짜함수를 사용
SELECT employee_id, first_name || ' ' || last_name, salary, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE department_id = 30;

02. 급여가 12000 이상인 사원들의 사번, 성명, 급여를 조회하여
급여순으로 정렬한다.
급여는 공백없이 천단위 기호를 사용하여 표현한다.
SELECT employee_id, first_name ||' '|| last_name name, 
       TRIM(TO_CHAR(salary, '9,999,999,999')) salary
FROM employees
WHERE salary >= 12000 --급여가 12000 이상
ORDER BY salary ASC;

03. 2005년 전(2004년까지)에 입사한 사원들의 
사번, 성명, 입사일자, 입사일의 요일을 조회하여 
최근에 입사한 사원순으로 정렬한다.
SELECT employee_id, first_name || ' '|| last_name name,
       hire_date, TO_CHAR(hire_date, 'DY') hire_day
FROM employees 
WHERE TO_CHAR(hire_date, 'YYYY') <= 2004 
--WHERE hire_date <= '2004/12/31'; 
--WHERE hire_date < '2005/01/01';  --2005 년 전(2004년까지)에 입사한;      
ORDER BY hire_date DESC; --입사한 해 < 2005; 

-----------------------------------------------------------------------------------------------


※ 일반함수 : NULL 이 계산되었을 경우 값이 NULL 로 변경이 되어 버림

commission_pct 확인
SELECT employee_id, first_name, salary, commission_pct
FROM employees;

커미션금액이 1000 미만인 사원의 사번, 이름, 급여, 커미션요율, 커미션금액을 조회
SELECT employee_id, first_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

조회된 NULL 값을 치환하는 함수 : NVL(Null VaLue)함수, DECODE 함수
NVL(컬럼,0) : 값이 NULL 이면 0으로 치환, 아니면 컬럼의 값
DECODE(컬럼, A, 1, B, 2, 3) : 컬럼값이 A이면 1, B이면 2, 그것도 아니면 3

1. 데이터값이 NULL 인 경우 다른 값으로 대체하여 반환하는 함수
: NVL(대상, NULL 일때 반환 표현) ☞ NULL VALUE, 오라클에서만 사용
  NULL 일때 반환 표현의 데이터 타입은 대상의 데이터 타입과 같아야 한다.

desc employees;

커미션 금액이 1000 미만인
사번, 성, 급여, 커미션요율, 커미션금액 조회
커미션금액 = 급여 * 커미션요율
SELECT employee_id, last_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

NVL 사용
SELECT employee_id, last_name, salary, commission_pct, salary*NVL(commission_pct,0) comm
FROM employees
WHERE salary*NVL(commission_pct,0) < 1000;
     
사번, 성, 급여, 커미션요율, 총급여 조회
총급여 = 급여 + 커미션금액 
       = 급여 * (급여 * 커미션요율) 
       = 급여 * (1 + 커미션요율) ☜ 급여 * (1 + NVL(커미션요율,0))

SELECT employee_id, last_name, salary, commission_pct,
       salary * (salary * NVL(commission_pct, 0)) total_salary 
       --salary * (1+ NVL(commission_pct, 0)) total_salary
FROM employees;

2. 데이터 값이 NULL 인 경우 반환 표현과 
NULL 이 아닌 경우 반환 표현을 각각 지정할 수 있는 형태의 함수
: NVL2(대상, NULL이 아닌 경우 반환값, NULL 인 경우 반환값)
: NVL2(대상, 대상이 값이 있을 경우 반환값, 값이 없을 경우 반환값) ★★★★
  NULL 인 경우 반환표현은 NULL 아닌 경우 반환표현과 데이터 타입이 같아야 한다.
  NULL 인 경우 반환 타입 = NULL 아닌 경우 반환 타입

커미션을 받는 사원의 총급여 = 급여 + 커미션금액
         받지 않는 사원의 총급여 = 급여만

사번, 성, 급여, 커미션요율, 총급여 형태 조회
SELECT employee_id, last_name, salary, commission_pct,
     --NVL(commission_pct, '커미션금액없음') type1,
       NVL(TO_CHAR(commission_pct,'0.00'),'커미션금액없음') type2,
       
       NVL2(commission_pct, '급여+커미션금액', '급여') type3,
       NVL2(commission_pct, 'salary+commission', 'salary') type4,
       NVL2(commission_pct, salary*(1+commission_pct), salary) type5
FROM employees;

급여, 커미션요율, NVL 사용 총급여, NVL2 사용 총급여 조회.
SELECT salary, commission_pct, 
       salary + salary*NVL(commission_pct,0), --NVL사용
       NVL2(commission_pct, salary + salary * commission_pct, salary), --NVL2사용
       NVL2(commission_pct, salary * (1 + commission_pct), salary) --NVL2사용
FROM employees;


3. 데이터값이 NULL 인 경우 대체해서 반환 표현을 여러 개 지정할 수 있는 형태 함수
  : NULL 이 아닌 첫번째 데이터를 반환하는 함수
 COALESCE(대상표현, 대체표현1, 대체표현2, 대체표현3, ...) 
    ★ COALESCE : 합치다, 유착하다, 합체하다, 합동하다
 NULL 은 NULL 또는 ''로 표현
 
SELECT COALESCE('a', '', NULL, 'd') n1,     /* a */
       COALESCE(NULL, 'b', NULL, 'd') n2,   /* b */
       COALESCE(NULL, '', 'c', 'd') n3,     /* c */
       COALESCE(NULL, '', NULL, 'd') n4,    /* d */
       COALESCE(NULL, '', NULL, '') n5      /* (null) */
FROM dual;
-----------------------------------------------------------------------------------------------
name    휴대폰            집                사무실
홍길동  010-1234-5678
심청                      062-1234-5678
전우치                                      062-1234-5679
-----------------------------------------------------------------------------------------------
SELECT name, COALESCE(휴대폰, 집, 사무실)  연락처
FROM dual;
-----------------------------------------------------------------------------------------------
결과
NAME       연락처
홍길동     010-1234-4567
심청       062-1234-5678
전우치     062-1234-5679

-----------------------------------------------------------------------------------------------
[연습문제 3-4]
사번, 성, 부서코드, 업무코드, 입사일자, 매니저코드, 매니저존재여부(NVL, NVL2 각각 사용) 조회
매니저존재여부는 각 사원에 대해 

NVL은 관리자가 있으면 manager_id와 관리자가 없으면 '없음'으로 표시,
NVL2는
사원의 관리자(매니저)가 있으면 '있음' 으로
       관리자(매니저)가 없으면 '없음' 으로 조회되게 한다.
       
SELECT  employee_id, last_name, department_id, job_id, hire_date, manager_id,
        NVL(manager_id, 0) manager_id2,
        --NVL(manager_id,'없음') manager_id2, --에러, 데이터 타입이 NUMBER(6,0)
        NVL(TO_CHAR(manager_id),'없음') manager_id3,
        NVL2(manager_id, '있음', '없음')  manager_exist1,
        NVL2(manager_id, 'Manager', 'No Manager') manager_exist2,
        NVL2(manager_id, 'O', 'X') manager_exist3
FROM employees;
-----------------------------------------------------------------------------------------------
desc employees;
-----------------------------------------------------------------------------------------------

