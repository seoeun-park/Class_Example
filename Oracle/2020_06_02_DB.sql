--부서코드가 60, 80, 100인 부서에 속한 사원들의
--사번, 성, 전화번호, 지역번호, 개인번호 조회
SELECT employee_id, department_id, last_name, phone_number, 
               SUBSTR(phone_number, 1, INSTR(phone_number, '.') - 1) "지역번호",
               --(1 ~ 앞에서부터 첫번째 .이 있는 위치보다 한 자리수 앞) 까지 출력
               SUBSTR(phone_number, INSTR(phone_number, '.', -1) + 1) "개인번호"
               -- 뒤에서부터 첫번째 .이 있는 위치보다 한 자리수 뒤까지 모든 문자를 출력
FROM employees
WHERE department_id IN(60, 80, 100);

--문자열에서 특정 문자열을 찾아 다른 문자열로 바꿔 반환하는 함수 : REPLACE
SELECT REPLACE('You are not alone', 'You', 'We')    REP1,
               REPLACE('You are not alone', 'not')              REP2,
               REPLACE('You are not alone', 'not', null)     REP3
FROM dual;

SELECT TRANSLATE('You are not alone', 'You', 'We')    S1    --We are net alene
FROM dual;

--너는 나를 모르는데 나는 너를 알겠느냐를 나는 나를 모르는데 나는 나를 알겠냐로 수정하기
SELECT REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나') "TRANSLATE 연습문제"
FROM dual;

SELECT TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나') "TRANSLATE 연습문제"
FROM dual;

--날짜 함수
--날짜 +/- 숫자     -> 날짜
--날짜 - 날짜        -> 숫자
SELECT SYSDATE+1 tommorrow,
               SYSDATE-1  yesterday 
FROM dual;

SELECT SYSTIMESTAMP     --밀리 초까지
FROM dual;

--특정 날짜로부터 몇 개월 후/전의 날짜를 반환하는 함수
SELECT ADD_MONTHS(SYSDATE, 6)       after6M,
               ADD_MONTHS(SYSDATE, -3)      before3M
FROM dual;

--오늘 날짜 - 이전날짜 : 개월 수의 차이
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/04/20'), 1) diff
FROM dual;

--교육 시작일부터 오늘까지의 개월 수와 수료할 날까지의 남은 개월 수를 알아보자
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/04/20'), 1) PASSED,
                TRUNC(MONTHS_BETWEEN('20/10/08', SYSDATE), 1) REMAINED
FROM dual;

--사번이 100번인 사원의 사번, 성, 입사일자, 근무개월수, 근무년수 조회
-- 근무 개월 수, 근무 년수는 오늘을 기주능로 계산하여 정수로 표현
SELECT employee_id, last_name, hire_date,
               TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "근무 개월 수 : TRUNC",
               FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) "근무 개월 수 : FLOOR",
               TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) "근무 년 수 : TRUNC",
               FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) "근무 년 수 : FLOOR"
FROM employees
WHERE department_id = 100;

--9의 마지막날을 출력
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 3)) "last day"
FROM dual;

--해당 날짜 이후의 날짜 중에서 char로 명시된 요일에 해당하는 첫번째 날짜를 반환
SELECT NEXT_DAY(SYSDATE, '월요일') NEXT1,
               NEXT_DAY(SYSDATE, '금요일') NEXT2, 
               NEXT_DAY(SYSDATE, '일')        NEXT3,
               NEXT_DAY(SYSDATE, 4)           NEXT4     --4는 수요일
FROM dual;

SELECT 123456                                                   N,
                TO_CHAR(123456, '999999')               N1,
                TO_CHAR(123456, '999999999')         N2,
                TO_CHAR(123456, '9999')                   N3,
                TO_CHAR(123456, '999,999,999')       N4,
                TO_CHAR(123456, '099,999,999')       N5
FROM dual;






