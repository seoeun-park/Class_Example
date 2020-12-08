3.2 문자함수
1. 대/소문자 변환 함수 : UPPER/LOWER(문자)

SELECT *
FROM employees;

01. 문자/날짜 데이터 표현 : ''
성이 King 인 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE last_name = 'King';
--WHERE UPPER(last_name) = 'KING';
--WHERE LOWER(last_Name) = 'king';

02. 성에 대소문자 무관하게 z 가 있는 사원들의 사번, 성, 명 조회
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%';
--WHERE last_name LIKE '%z%' OR last_name LIKE '%Z%' ; 
--성에 대소문자 무관하게 z 가 있는

2. 단어 단위로 첫문자는 대문자, 나머지는 소문자화 하는 함수: INITCAP(대상)
    : 이니셜만 대문자로 변환
--SELECT INITCAP('we are studing oracle') title     /* We Are Studying Oracle */
SELECT INITCAP('WE ARE STDUYING ORACLE') title      /* We Are Studying Oracle */   
--SELECT INITCAP('wE aRE sTDUYing oRACLE') title    /* We Are Studying Oracle */
FROM dual;

SELECT email, INITCAP(email) INITCAP,
       first_name, UPPER(first_name) UPPER, LOWER(first_name) LOWER
FROM employees;

3. 문자 데이터(char1)에 특정 문자(char2)를 채워서 반환하는 함수 
    : LPAD/RPAD(char1, n [, char2])
    : LPAD/RPAD(대상, 전체크기, 충전문자), pad : 채워 넣는것
    : 세번째 파라미터인 충전문자 생략 가능 : default 공백문자

SELECT LPAD('abc', 5,'?')   p1,  /*??abc*/
       RPAD('abc', 5, '#')  p2,  /*abc##*/
       '['||LPAD('abc', 5)  p3,  /*[__abc*/
       RPAD('abc', 5)||']'  p4   /*abc__]*/
FROM dual;

SELECT LPAD('abc', 10, '@') p1  /*@@@@@@@abc*/
FROM dual;

SELECT employee_id, LPAD(last_name , 20, ' ') last_name
--SELECT employee_id, LPAD(last_name , 20) last_name ☜ 생략시 공백문자
FROM employees;

4. 문자데이터에서 특정문자를 제거하고 반환하는 함수
   : 제거할 문자는 ★한 개만 지정 가능★  ☞ TRIM
   : 입력상자에서 사용자 실수로 공백을 입력시
   : request.getParameter('UserId').TRIM();

TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
★ TRIM(제거할위치 제거문자한개 FROM 대상문자) ★
TRIM(LEADING/TRAILING/BOTH 제거문자(★한글자만 지정) FROM 대상문자)
  제거할 위치 - 왼쪽:LEADING, 오른쪽:TRAILING, 양쪽:BOTH
  제거할 위치 생략 가능 - default:BOTH
  제거문자 생략 가능 - default 공백문자
  
SELECT TRIM('a' FROM 'abcdcbaaaaa')          t1, /*bcdcb*/
       TRIM(LEADING 'a' FROM 'abcdcba')      t2, /*bcdcba*/
       TRIM(TRAILING 'a' FROM 'abcdcbaaaaa') t3, /*abcdcb*/
       TRIM(BOTH 'a' FROM 'abcdcbaaaaa')     t4, /*bcdcb*/
       '  abcdcba '                          t5, /*__abcdcba_*/
       TRIM('  abcdcba ')                    t6  /*abcdcba*/
FROM dual;

5. 문자데이터에 특정문자를 제거하고 반환하는 함수
    : 제거할 문자를 ★여러 개 지정 가능 ☜ TRIM함수와 차이점
    : LTRIM/RTRIM(char1 [,char2])
    : LTRIM/RTRIM(대상문자, 제거할문자의나열)
    : 두 번째 파라미터 생략 가능 - default 공백문자
    
SELECT LTRIM( 'abcdcba' , 'a' )  t1, /* bcdcba */
       LTRIM( 'abcdcba' , 'ba' ) t2, /* cdcba */
       RTRIM( 'abcdcba' , 'acb') t3, /* abcd */
       RTRIM( 'abcdcba' , 'adb') t4, /* abcdc */
       RTRIM( 'abcdcba' , 'bc')  t5, /* abcdcba */
       RTRIM( '   abcdcba   ')   t6  /* ___abcdcba */
FROM dual;
   
6) 문자열에서 문자열의 일부를 반환(★ 몇번째부터 몇글자)하는 함수
    : SUBSTR(string, position [, LENGTH])
    : SUBSTR(대상문자, 시작위치, 몇글자)
    두번째 파라미터(position : 시작위치), 음수 지정 가능 ☞ 오른쪽에서부터
    세번째 파라미터(LENGTH : 몇글자) 생략시 ☞ ★ 문자열의 끝까지 반환
               1   5   9   13
SELECT SUBSTR('You are not alone', 5, 3)  s1, /* are */
       SUBSTR('You are not alone', 5)     s2, /* are not alone */
       SUBSTR('You are not alone', -5, 3) s3, /* alo */
       SUBSTR('You are not alone', -5)    s4  /* alone */
FROM dual;

7) 문자열에서 특정문자열이 위치한 ★시작위치를 반환하는 함수
    : INSTR(char, search_string [, position] [ , _th])
    : INSTR(대상문자, 찾는문자열, 문자열찾는시작위치, 몇번째거)
    두번째 파라미터 ☞ 찾는문자열
    세번째 파라미터 ☞ 문자열 찾는 시작 위치, 
       음수 지정 가능 ☞ 오른쪽에서부터 왼쪽방향으로 ★ 쭊쭊쭊쭉 계속 진행
    네번째 파라미터 ☞ 몇번째거, 생략 가능 - default 1

              1     7   11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1, 
       /* 1번위치부터 찾기 시작해서 2번째로 존재하는 'la' 시작 위치 : 14 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, /* 17 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, /* 0 */
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6  /* 11 */
                     /*-11-8 -5 -2*/            
FROM dual;

-----------------------------------------------------------------------------------------------
email                 @위치  id(1번째부터 @위치 앞까지)   서비스제공자(@위치 뒤부터 끝까지)
-----------------------------------------------------------------------------------------------
honggildong@naver.com  12    honggildong         1,11     naver.com      13,22
admin@google.com        6    admin               1, 5     google.com      7,16  
hoho0829@hanmail.net    9    hoho0829            1, 8     daum.net       10,20
-----------------------------------------------------------------------------------------------

본인의 이메일에서 아이디와 서비스제공자를 조회
SELECT 'hoho0829@hanmail.net' email,   
        SUBSTR('hoho0829@hanmail.net', 1, INSTR('hoho0829@hanmail.net', '@')-1) id,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1) servicer1,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1,
        	LENGTH('hoho0829@hanmail.net')-INSTR('hoho0829@hanmail.net', '@')) servicer2
FROM dual;

--JOBS 테이블에서 업무코드, 업무제목, 직무, 직책 조회
--직무, 직책은 업무코드에서 '_'기준으로 조회(직무_직책)
SELECT job_id, job_title
FROM jobs;

[실습]
JOB_ID   JOB_TITLE   '_'위치   문자열갯수   _문자 이후 갯수     직무      직책        
-----------------------------------------------------------------------------------------------
AD_PRES  President        3            7            4            AD       PRES 
:
:

SELECT job_id,
       job_title,
       INSTR(job_id,'_') "_위치",
       LENGTH(job_id) "문자열갯수",
       LENGTH(job_id)-INSTR(job_id,'_') "_문자 이후 갯수", 
       SUBSTR(job_id,1,INSTR(job_id,'_')-1) "직무",   /* _이전까지 추출 */
       SUBSTR(job_id,INSTR(job_id,'_')+1) "직책1",     /* _이후부터 추출 */
       SUBSTR(job_id,INSTR(job_id,'_')+1,LENGTH(job_id)-INSTR(job_id,'_')) "직책2"
FROM jobs;