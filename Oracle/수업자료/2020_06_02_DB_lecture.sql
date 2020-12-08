부서코드가 60,80,100 인 부서에 속한 사원들의 
사번, 성, 전화번호, 지역번호, 개인번호 조회
-----------------------------------------------------------------------------------------------
                             지역번호     개인번호  
박문수  515.124.4567         515           4567
임꺽정  011.44.1344.467268   011           467268 
홍길동  02.1234.5678         02            5678
전우치  062.9874.5422        062           5422
심청    0652.4523.6221       0652          6221
-----------------------------------------------------------------------------------------------

SELECT *
FROM employees ;

SELECT employee_id, last_name, phone_number ,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.')-1 )     지역번호,
       SUBSTR(phone_number, INSTR(phone_number, '.', -1)+1 )    개인번호1,
       SUBSTR(phone_number, INSTR(phone_number, '.', -1)+1, 
                LENGTH(phone_number)-INSTR(phone_number, '.', -1) ) 개인번호2
FROM employees
WHERE department_id IN (60,80,100);

8) 문자열에서 특정문자열을 찾아 다른 문자열로 바꿔 반환하는 함수
    : REPLACE(string, search_string [, replace_string])
    : REPLACE(대상문자열, 찾는문자열, 대체될문자열)
    : 세번째 매개변수(파라미터) 대체될 문자열 생략 가능 : default - null
    You -> We

SELECT REPLACE('You are not alone', 'You', 'We') REP1,   /* We are not alone */
       REPLACE('You are not alone', 'not') REP2,         /* You are__alone */
       REPLACE('You are not alone', 'not', null) REP3    /* You are__alone */
FROM dual;

9) 문자열에 있는 특정 문자 ★ 전체를 다른 특정 문자로 ★ 하나씩 1:1로 대응해서 바꿔 반환하는 함수
    : TRANSLATE(string, from_string, to_string)
    : TRANSLATE(대상문자열, 찾는문자의나열, 대체될문자의나열)
    : 찾는문자, 대체될 문자 - 문자의 나열

SELECT TRANSLATE('You are not alone', 'You', 'We') s1
                                      --Y -> W, o -> e, u -> null
                /*We are net alene */
FROM dual;

                  너는 나를 모르는데 나는 너를 알겠느냐 를
REPLACE 사용해    나는 나를 모르는데 나는 나를 알겠느냐 로 수정하기

SELECT REPLACE(REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너는', '나는'), '너를','나를') r1,
       REPLACE('너는 나를 모르는데 나는 너를 알겠느냐', '너', '나' ) r2
             /* 나는 나를 모르는데 나는 나를 알겠느냐 */
FROM dual;

                   너는 나를 모르는데 나는 너를 알겠느냐 를
TRANSLATE 사용해   나는 너를 모르는데 너는 나를 알겠느냐 로 수정하기
SELECT  TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐','나너', '너나') t1,
        TRANSLATE('너는 나를 모르는데 나는 너를 알겠느냐','너나', '나너') t2
                /* 나는 너를 모르는데 너는 나를 알겠느냐  */
FROM dual;
-----------------------------------------------------------------------------------------------
[ 연습문제 3-2 ]                            
SELECT *
FROM employees ;
01. 사원 테이블에서 이름(first_name)이 A로 시작하는 모든 사원의 이름과 이름의 길이를 조회하는 쿼리문 작성.
SELECT first_name name, 
       LENGTH(first_name) length
FROM employees
WHERE first_name LIKE 'A%';

02. 80번 부서원의 이름과 급여를 조회하는 쿼리문을 작성한다.
단, 급여는 15자 길이로 왼쪽에 $ 기호가 채워진 형태로 표시되도록 한다.
SELECT  first_name name, 
        LPAD(salary, 15, '$') lpad_salary
FROM employees
WHERE department_id = 80;

03. 60번 부서, 80번 부서, 100번 부서에 소속된 사원의 
사번, 성, 전화번호, 전화번호의 지역번호, 개인번호를 조회하는 쿼리문 작성
 단, 지역번호의 컬럼은 local number 라고 표시하고, 
 지역번호는 515.124.4169 에서 515, 
 
            590.423.4568 에서 590, 
            011.44.1344.498718 에서 011 이 지역번호라 한다.
 개인번호는 515.124.4169 에서 4169, 
            590.423.4568 에서 4568, 
      011.44.1344.498718 에서 498718 이 개인번호라 한다.
                    
부서코드가 60,80,100 인 부서에 속한 사원들의 
사번, 이름, 전화번호, 지역번호, 개인번호 조회하는 쿼리문 작성
SELECT employee_id, first_name, phone_number,
       SUBSTR(phone_number, 1, INSTR(phone_number, '.')-1 ) local_number,
       SUBSTR(phone_number, INSTR(phone_number, '.', -1)+1 ) private_number
FROM employees
WHERE department_id IN (60,80,100);

                             지역번호  개인번호  
박문수  515.124.4567         515       4567
임꺽정  011.44.1344.467268   011       467268 
홍길동  02.1234.5678         02        5678
전우치  062.9874.5422        062       5422
심청    0652.4523.6221       0652      6221

-----------------------------------------------------------------------------------------------

3.3 날짜함수 : 송금, 출결, 회원가입날짜, 결제시간
1) 시스템의 현재 날짜를 반환하는 함수 - SYSDATE
다른 함수와는 달리 파라미터가 없어 ()를 사용하지 않음.

SELECT SYSDATE
FROM dual;

날짜 +/- 숫자   -> 날짜
날짜 - 날짜     -> 숫자

오늘날짜 + 1 -> 내일날짜
오늘날짜 - 1 -> 어제날짜

SELECT  SYSDATE+1 tomorrow, 
        SYSDATE-1 yesterday
FROM dual;

오늘날짜 - 그제날짜 -> 일수차이(즉, 숫자)
오늘날짜 로부터 30일 후: 
SELECT SYSDATE+30 after1M
FROM dual;

SELECT SYSTIMESTAMP --(시스타임스탬프) 밀리초까지
FROM dual;

2) 특정날짜로부터 몇 개월 후/전 의 날짜 반환하는 함수
    : ADD_MONTHS(날짜, 개월수)
오늘로부터 6개월 후의 날짜 조회, 오늘로부터 3개월 전의 날짜 조회
SELECT ADD_MONTHS(SYSDATE, 6) after6M, 
       ADD_MONTHS(SYSDATE, -3) before3M
FROM dual;

오늘날짜 - 이전날짜 -> 개월수의 차이 ☞ MONTHS_BETWEEN
3) 두 날짜 사이의 개월수의 차이를 반환하는 함수
    : MONTHS_BETWEEN(날짜1, 날짜2) ☞ 날짜1 > 날짜2

소수 첫째자리까지 표현
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/06/29'),1) diff
FROM dual;

교육 시작일부터 오늘까지의 개월 수와 수료할 날까지의 남은 개월 수를 알아보자.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/06/29'),1) PASSED, 
       TRUNC(MONTHS_BETWEEN('20/12/31', SYSDATE),1) REMAINED 
FROM dual;

우리회사 사번 100번인 사원 의 
사번, 성, 입사일자, 근무개월수, 근무년수 조회
- 근무개월수, 근무년수는 오늘을 기준으로 계산하여 정수로 표현 
예를 들어 오늘은 2019/08/07 이고, 2019/05/27 일에 입사했다면  2개월 근무한 것
SELECT employee_id, last_name, hire_date, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE employee_id = 100;

4) 해당 날짜가 포함된 달의 마지막 일자를 반환하는 함수
    : LAST_DAY(날짜)
    
SELECT LAST_DAY(SYSDATE) l1, 
       LAST_DAY(ADD_MONTHS(SYSDATE, -3)) l2,
       --오늘로부터 3개월전인 달의 마지막 날짜
       LAST_DAY(ADD_MONTHS(SYSDATE, 3)) l3
       --오늘로부터 3개월 후인 달의 마지막 날짜
FROM dual;

5) 해당날짜 이후의 날짜 중에서 char로 명시된 요일에 해당하는 첫번째 날짜를 반환 
    : NEXT_DAY(날짜, char)
    char : 요일문자 ☞ 일요일, 월요일~~, 일, 월~~, 숫자도 가능(1:일요일, 2:월요일)

SELECT NEXT_DAY(SYSDATE, '월요일') NEXT1,
       NEXT_DAY(SYSDATE, '금요일') NEXT2,
       NEXT_DAY(SYSDATE, '일') NEXT3, 
       NEXT_DAY(SYSDATE, 4) NEXT4 /* 4 : 수 */
FROM dual;   

* 형변환함수

1. 숫자화함수 : TO_NUMBER ☞ 문자 -> 숫자
byte    <   short  <    int    <    long
int i = 10;     /* int   : 4바이트 */
short s = 5;    /* short : 2바이트 */
s = (short)i; 안담김 int   -> short
i = (int)s;          short -> int : 명시적 형변환
i = s; 암묵적 형변환

암묵적 형변환 발생 
SELECT 10 + 20   d1,  /* 30 */
       10 +'20' d2   /* 30 */
from dual;

알파벳, 기호, 한글 이런 문자등은 숫자화 불가
'가나다', 'abc', '19/02/05' -> 숫자로 변환 불가
''(홑따옴표)로 묶여 문자로 표현되었지만 
안에 담겨진 데이터값 자체는 숫자인 경우만 숫자화 함수를 사용할 수 있다.

명시적 형변환
SELECT TO_NUMBER('1245') s1, /* 1245 */
       1245              s2  /* 1245 */
FROM dual;
-----------------------------------------------------------------------------------------------
   TO_CHAR           TO_DATE
         ->             ->
숫자           문자          날짜
Number       Character       Date 
         <-             <-  
   TO_NUMBER         TO_CHAR 
-----------------------------------------------------------------------------------------------

문자화함수 : TO_CHAR
숫자화함수 : TO_NUMBER
날짜화함수 : TO_DATE

2. 문자화함수 : TO_CHAR(숫자나 날짜를 문자로 변환)
1) 숫자->문자 : TO_CHAR(대상, 포맷형식)
   포맷형식: 
   9: 한자리 숫자, 무효 숫자는 공백으로 채워짐(정수일때), 소수이하일때는 0으로 채워짐, 
      자릿수가 부족할때 자리수만큼 #표시
   0: 한자리 숫자, 무효 숫자는 0으로 채워짐, 자릿수가 부족할때 자리수만큼 #표시
   ,: 천단위표시
   L: 통화기호

SELECT 123456                         n1,  /*123456*/ /*숫자 자체는 그냥 숫자 자리만큼 꽉 차지함*/
       TO_CHAR(123456, '999999')      c1,  /*_123456*/ /*9가 6개*/ /*문자화 했을때 공백 유격이 하나씩 생김*/
       TO_CHAR(123456, '999999999')   c2,  /*____123456*/ /*9가 9개*/
       TO_CHAR(123456, '9999')        c3,  /*#####*/ /*자릿수가 부족할때 자리수+1 만큼 #표시*/
       TO_CHAR(123456, '999,999,999') c4   /*_____123,456*/
FROM DUAL;

SELECT TO_CHAR(123456, '9,999,999')     c1,  /*___123,456*/
       TO_CHAR(123456, '0,999,999')     c2,  /*_0,123,456*/
       TO_CHAR(123456, '$0,999,999')    c3,  /*_$0,123,456*/
       TO_CHAR(1234.56, '$999,999.999') c4,  /*___$1,234.560*/ /*소숫점 9가 소수이하일때는 0으로 채워짐*/
       TO_CHAR(1234.56, '$999,999,999') c5,  /*_______$1,235*/
       TO_CHAR(1234.56, 'L999,999,999') c6,  /*______________￦1,235*/ /*천단위*/ /*9:12개, 공백:14개*/
       TO_CHAR(1234.56, 'L999,999.999') c7   /*__________￦1,234.560*/ /*소숫점*/ /*9:8개, 공백:10개*/
FROM dual;

SELECT 123456                                   n1, /*123456*/
       TO_CHAR(123456)                          n2, /*123456*/
       TO_CHAR(123456, 'L9,999,999,999')        n3, /*______________￦123,456*/ /*9:14개, 공백:14개*/
       TRIM(TO_CHAR(123456, 'L9,999,999,999'))  n4, /*￦123,456*/
       TO_CHAR(123456, 'L00,000,000,000')       n5, /*________￦00,000,123,456*/ /*0:15개, 공백:8개*/
       TRIM(TO_CHAR(123456, 'L00,000,000,000')) n6  /*￦00,000,123,456*/
from dual;

SELECT 12345          n1,           /*12345*/
       1500000        백오십만,     /*1500000*/
       TO_CHAR(123456),             /*123456*/
       TO_CHAR(1500000, 'L9,999,999,999')                    s20,   /*____________￦1,500,000*/ /*9:14개, 공백:12개*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'), ' ' ) s21,   /*[￦1,500,000*/
       '['|| LTRIM(TO_CHAR(1500000, 'L9,999,999,999'))       s22,   /*[￦1,500,000*/
       '['|| TRIM(LEADING ' ' FROM TO_CHAR(1500000, 'L9,999,999,999')) s23,    /*[￦1,500,000*/
       '['|| TRIM(' ' FROM TO_CHAR(1500000, 'L9,999,999,999') )        s24,    /*[￦1,500,000*/
       '['|| TRIM(TO_CHAR(1500000, 'L9,999,999,999') )                 s25,    /*[￦1,500,000*/
       
       TO_CHAR(1500000,'0,000,000,000') s3  /*_0,001,500,000*/
FROM dual;

SELECT 	employee_id, 
		TO_CHAR(salary,'9999')          SAL1,    /*#####*/
		TO_CHAR(salary,'999999')        SAL2,    /*__24000*/
		TO_CHAR(salary,'999,999')       SAL3,    /*__24,000*/
		TO_CHAR(salary,'999,999,999')   SAL4,    /*______24,000*/
		TO_CHAR(salary,'000,999,999')   SAL5,    /*_000,024,000*/
		TO_CHAR(salary,'099,999,999')   SAL6,    /*_000,024,000*/
		TO_CHAR(salary,'000,000')       "0SAL",  /*_024,000*/
		TO_CHAR(salary,'000,000,000')   "00SAL", /*_000,024,000*/
		TO_CHAR(salary,'$999,999')      "$9SAL", /*__$24,000*/
		TO_CHAR(salary,'$999,999,999')  "$99SAL",/*______$24,000*/
		TO_CHAR(salary,'$000,000')      "$0SAL", /*_$024,000*/
		TO_CHAR(salary,'$000,000,000')  "$00SAL",/*_$000,024,000*/
        
		TO_CHAR(salary,'L999,999')      L9SAL,   /*_________￦24,000*/ /*공백1개+8개*/
		TO_CHAR(salary,'L999,999,999')  L99SAL,  /*_____________￦24,000*/ /*공백1개+12개*/
        
		TO_CHAR(salary,'L000,000')      L0SAL,   /*________￦024,000*/ /*8개*/
		TO_CHAR(salary,'L000,000,000')  L00SAL,  /*________￦000,024,000*/ /*8개*/
        
        TRIM(TO_CHAR(salary,'L999,999'))      TRIML9SAL,   /*￦24,000*/
		TRIM(TO_CHAR(salary,'L999,999,999'))  TRIML99SAL,  /*￦24,000*/
        
		TRIM(TO_CHAR(salary,'L000,000'))      TRIML0SAL,   /*￦024,000*/
		TRIM(TO_CHAR(salary,'L000,000,000'))  TRIML00SAL,  /*￦000,024,000*/
        
		salary SAL
FROM EMPLOYEES e;