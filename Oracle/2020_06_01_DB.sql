--LOWER() : 소문자로 변환
--UPPER() : 대문자로 변환

-- 성이 King인 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
--WHERE last_name = 'King';
--WHERE LOWER(last_name)='king';
WHERE UPPER(last_name)='KING';

-- 성에 대소문자 무관하게 z가 있는 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--LOWER(last_name) LIKE '%z%';

--WHERE last_name LIKE '%Z%'
--OR last_name LIKE '%z%';

--단어 단위로 첫문자는 대문자, 나머지는 소문자화 하는 함수 : INITCAP(대상)
--이니셜만 대문자로 변환
--SELECT INITCAP('we are studying oracle') title
--SELECT INITCAP('WE ARE STUDYING ORACLE') title
SELECT INITCAP('wE aRE sTUDYing oRACLE') title
FROM dual;

SELECT email, first_name, last_name
FROM employees;

SELECT email, INITCAP(email) INITCAP,
                first_name, UPPER(first_name) UPPER,
                last_name, LOWER(last_name) LOWER
FROM employees;

--문자 데이터(char1)에 특정 문자(char 2)를 채워서 반환하는 함수
-- 3번째 인수 자리에 넘겨주는 것이 없으면 공백으로 처리
SELECT LPAD('abc', 5, '?') p1,
            RPAD('abc', 5, '#') p2,
           '['|| LPAD('abc', 5) p3,
           RPAD('abc', 5)||']' p4
FROM dual;

SELECT LPAD('abc', 10, '@') p1
FROM dual;

SELECT employee_id, LPAD(last_name, 20) last_name
FROM employees;

--문자 데이터에서 특정문자를 제거하고 반환하는 함수( TRIM() )
--      : 제거할 문자는 한개만 지정 가능
--      : 입력상자에서 사용자 실수로 공백을 입력시
--      request.getParameter('UserId').TRIM();

-- 위치 생략 : 기본값 BOTH(양쪽)
SELECT TRIM('a' FROM 'abcdcbaaaaa')                      t1,
               TRIM(LEADING 'a' FROM 'abcdcba')             t2,
               TRIM(TRAILING 'a' FROM 'abcdcbaaaaa')    t3,
               TRIM(BOTH 'a' FROM 'abcdcbaaaaa')           t4,
               '   abcdcba'                                                      t5,
               --공백만 자름
               TRIM('   abcdcba')                                           t6
FROM dual;

--제거할 문자를 여러개로 지정 가능
--왼쪽/오른쪽부터 순차적으로 접근해서 하나라도 해당 문자에 속하지 않으면 더이상 자르지 않게 됨
SELECT LTRIM('abcdcba', 'a')          t1,
               LTRIM('abcdcba', 'ba')        t2,
               RTRIM('abcdcba', 'acb')      t3,
               RTRIM('abcdcba', 'adb')      t4,
               RTRIM('abcdcba', 'bc')        t5,        
               --t5 : 맨 오른쪽 글자 'a'가 'bc'에 속한 글자가 아니므로 아무것도 자르지 않고 그대로 반환
               RTRIM('    abcdcba    ')       t6
FROM dual;

--문자열에서 문자열의 일부를 반환 : SUBSTR()
-- 두번째 인수(position, 시작 위치) : 음수로 지정 가능, 음수로 할 경우 오른쪽부터
--세번째 인수(length, 몇 글자) : 생략 시 문자열의 끝까지 반환
SELECT SUBSTR('You are not alone', 5, 3)     s1,        -- are
               SUBSTR('You are not alone', 5)         s2,        -- are not alone
               SUBSTR('You are not alone', -5, 3)    s3,        -- alo
               SUBSTR('You are not alone', -5)        s4         -- alone
FROM dual;

--문자열에서 특정 문자열이 위치한 시작위치를 반환하는 함수 : INSTR()
--INSTR(대상문자, 찾는 문자열, 문자열 찾는 시작 위치, 몇 번째 거)
-- 세번째 인수 : 음수로 지정 가능 → 오른쪽에서 부터
--네번째 인수 : 생략가능 → default 값은 1
--                         1         7    11141719
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)           s1,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', 12, 2)         s2,     -- 17
               INSTR('Every sha-la-la-la-la', 'la', 12, 4)         s3,     -- 0
               INSTR('Every sha-la-la-la-la', 'la', 12)             s4,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', -3, 2)          s5,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', -10)            s6      -- 11
FROM dual;

--본인의 이메일을 ID와 SERVICER로 나누어 출력하시오
SELECT  'tjdms5322@naver.com' email,
                SUBSTR('tjdms5322@naver.com', 1, INSTR('tjdms5322@naver.com', '@') - 1) id,
                --시작 위치 1번째부터 9(10 - 1)번째까지의 문자열을 자름
                SUBSTR('tjdms5322@naver.com', INSTR('tjdms5322@naver.com', '@') + 1) servicer
                --시작위치 (10 + 1)번째부터 모든 문자열을 자름
FROM dual;

               

