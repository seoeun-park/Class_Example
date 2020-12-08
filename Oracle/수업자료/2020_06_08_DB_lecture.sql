PK : 테이블의 레코드를 구분할 수 있는 최소의 컬럼(UNIQUE, NOT NULL)
FK : 다른 테이블의 PK를 참조하는 컬럼. 
PK 부.  FK 자 .    부모와 자식관계로 볼 수 있습니다.

PK는 주로 학번, 주민번호, 사원번호 등 유일한 값을 가지는 컬럼이 주로 PK 의 대상이 됩니다.

예)
학생 테이블 
학번(PK)   이름     주소             학과번호(FK)
1111       홍길동   옛날옛날         a11
1112       강감찬   먼옛날           a11
1113       대장군   전장터           a12
1114       김철수   뒷동네           a12

학과 테이블
학과번호(PK) 학과명
a11          수학과
a12          영문과

위와 같이 두개의 테이블이 있습니다.  
학생 테이블에서 학생 개개인을 유일하게 구분할 수 있는 컬럼으로 학번이 적절하기에 PK가 되며 
학과번호 컬럼은 중복이 되기에 구분이 가능한 키가 아니지만

학과 테이블의 학과번호(PK)와 연결될 수 있기에 FK가 됩니다. 
이러한 관계를 통해 두 테이블은 조합하여 데이터를 추출할 수 있게 됩니다.  

예를 들어 학생 테이블의 모든 학생의  학번, 이름, 학과명을 출력하고자 하면

SELECT 학번, 이름, 학과테이블.학과명
FROM 학생테이블, 학과테이블
WHERE 학생테이블.학과번호 = 학과테이블.학과번호 ;

라고 조인을 걸어서 해결할 수 있습니다. 이렇게 PK 와 FK 를 나누게 된 이유는 
데이터의 중복을 최소화 하기 위한 정규화에 의해 테이블이 나뉘어졌기 때문입니다. 

예를 들어 학생, 학과 테이블로 나눠지지 않고 처음부터 합쳐져 있었다면

합쳐진 테이블

학번    이름       주소         학과번호  학과명
1111    홍길동     옛날옛날     a11       수학과
1112    강감찬     먼옛날       a11       수학과
1113    대장군     전장터       a12       영문과
1114    김철수     뒷동네       a12       영문과

으로 되있겠으나 학과명이 중복됩니다. 
현재 예제는 컬럼의 양이 적어서 크게 느껴지지 않겠지만
컬럼이 10개 20개 30개만 되도 엄청난 데이터의 낭비가 발생함을 알 수 있습니다. 
이렇게 중복되는 데이터를 최소화 하고자  정규화가 생겨났습니다.

결론 - PK와 FK는 관계형 데이터베이스 RDBMS 에서 반드시 필요하다.

PK는 데이터를 구분할 수 있는 컬럼이며 
FK는 PK와 대응되거나 NULL 값을 갖는다.


5. 조인(JOIN)
하나의 테이블로부터 데이터를 조회할 수 없는 경우
여러개의 테이블로부터 데이터를 조회하여
합쳐진 테이블의 데이터을 조회하기 위해하는 사용하는 방법을 JOIN이라고 한다.
*****************************

부서정보를 가지고  있는 테이블: departments
SELECT * --27개
FROM departments; 

사원정보를 가지고 있는 테이블: employees
SELECT * --107개
FROM employees;  

업무정보를 가지고 있는 테이블 : jobs
SELECT * --19개
FROM jobs;  
------------------------------------------------------------------
1. CARTESIAN PRODUCT
★ WHERE 절에 JOIN 조건을 기술하지 않아 잘못된 데이터행의 결과를 갖게 되는 현상: 
cartesian product, cross join, SQL에서 쓰이는 경우가 없음

사번, 성, 부서명 조회
SELECT employee_id, last_name, department_name
FROM employees, departments;

employees: 107 *departments : 27 = 2889
107 * 27 = 2889 => cartesian product

업무코드, 업무명, 부서코드, 부서명
SELECT job_id, job_title, department_id, department_name
FROM jobs, departments;

jobs: 19 *  departments : 27 = 513
19 * 27 = 513 => cartesian product

------------------------------------------------------------------
2. EQUI JOIN(ANSI에서는 INNER JOIN)
: WHERE 절에 동등 연산자 (=)를 사용하는 JOIN 형식이다.
★★★★★즉, 테이블들 간에 공통으로 만족되는 값을 가진 경우의 결과를 반환

※ JOIN 조건 ☞ 컬럼의 값이 같은 컬럼에 대해 조인조건식 설정(★테이블명.컬럼명 = 테이블명.컬럼명 을 사용)

Table = Entity
테이블간의 관계도: Entity Relationship Diagram(ERD)

정확성, 정합성, 무결성 문제

사원테이블                  부서테이블
성명        부서번호        부서번호   부서명
홍길동      10              10         영업부
심청        20              20         개발부
전우치      10                    


※ 테이블조인 순서
1. FROM 절에 테이블 목록을 나열하며, 테이블명에 ALIAS 를 지정한다.
   (코드 라인을 줄이고 가독성을 높이기 위해)
2. 조인조건을 WHERE 절에 작성한다.

-----------------------------------------------------------------------------------
※ 쿼리문 작성순서

1. 조회할 데이터를 파악한 후 SELECT 절을 작성한다. 
   SELECT 컬럼명1, ...
2. SELECT 절에 나열된 컬럼명들이 어떤 테이블에 있는지 파악한 후 FROM 절을 작성한다.
   FROM 테이블명
 - 여러 개의 테이블로부터 데이터를 조회해야 한다면 FROM 절에 컴마(,)로 나열
   FROM 테이블명1, 테이블명2
3. 특정조건에 맞는 데이터행을 조회해야하는 경우 WHERE 절을 작성한다.
   WHERE 조건식
 - FROM 절에 테이블이 여러 개인 경우 테이블조인조건을 작성한다.
   WHERE 조인조건식 --★테이블명.컬럼명 = 테이블명.컬럼명
 - 일반적인 조건식과 테이블조인 조건식이 모두 필요한 경우 
   WHERE 조인조건식 
   AND 일반조건식
4. SELECT 절에 그룹함수(COUNT, SUM, AVG, MAX, MIN) 를 사용한 컬럼표현이 있는데 
   그룹함수를 사용하지 않은 컬럼표현도 함께 있다면 GROUP BY 절을 작성한다.
 - 그룹함수를 사용하지 않은 컬럼표현에 대해 모두 GROUP BY 기준으로 명시
   GROUP BY 그룹지을기준표현
 GROUP BY 절을 사용한 경우 GROUP BY 를 통한 여러 결과데이터행에 대해 
 - 특정조건에 맞는 데이터행을 조회해야하는 경우
   HAVING 조건식 - 조건식: 기본적인 조건식, 그룹함수표현  
   --★WHERE 조건절에서는 그룹함수표현 사용 못 함! 
6. 조회한 결과데이터행에 대해 정렬해야하는 경우 ORDER BY 절을 작성한다.
   ORDER BY 정렬기준표현 오름/내림차순

※ 내부 해석 순서
5. SELECT
1. FROM 
2. WHERE
3. GROUP BY
4. HAVING 
6. ORDER BY;

-----------------------------------------------------------------------------------------------
01. employees, departments 테이블을 사용하여 
사번, 성, 부서명 정보를 조회
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  -- 사원테이블의 부서코드 = 부서테이블의 부서코드;
ORDER BY 3;

02. employees, departments 테이블을 사용하여 
사원들의 사번, 성, 부서코드, 부서명 정보를 조회     
SELECT e.employee_id, e.last_name,
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  --사원테이블의 부서코드 = 부서테이블의 부서코드;
ORDER BY 1;

03. employees, jobs 테이블을 사용하여 
사번, 성, 업무코드, 업무제목 정보를 조회
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id --사원테이블의 업무코드 = 업무테이블의 업무코드
ORDER BY 1;

JOIN 하는 대상 테이블이 추가되면 JOIN 조건을 추가
WHERE 절에 JOIN 조건과 일반 조건을 함께 사용

WHERE 조인조건식에서 
일반적인 조건식과 테이블조인조건식이 모두 필요한 경우 
☞ WHERE 조인조건식 AND 일반 조건식

04. employees, departments, jobs 테이블을 사용하여 
사번, 성, 부서명, 업무제목을 조회    --조인조건은 table갯수 -1 만큼 필요!!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

05. employees, departments, jobs 테이블을 사용하여 
사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, department_name, 
        e.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;

06. employees, departments, jobs 테이블을 사용하여 
사번이 101번인 사원의 사번, 이름, 부서명, 업무제목 정보를 조회
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

07. employees, departments 테이블을 사용하여 
사번이 100, 120, 130, 140인 사원들의
사번, 성, 부서코드, 부서명
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (100, 120, 130, 140);

08. 매니저가 없는 사원의 사번, 이름, 업무제목을 조회한다.
SELECT  e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;


-----------------------------------------------------------------------------------------------
실습

01. 성에 대소문자 무관하게 z가 있는 성을 가진 사원들의 
사번, 성, 부서코드, 부서명 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%'; --성에 대소문자 무관하게 z가 있는 성;
     
02. 커미션을 받는 사원들의 
사번, 성, 급여, 커미션요율, 업무제목 조회
SELECT  e.employee_id, e.last_name, e.salary, 
        e.commission_pct com, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND commission_pct IS NOT NULL; --커미션을 받는 사원들

03. 커미션을 받는 사원들의 
사번, 성, 급여, 커미션금액, 부서명 조회
SELECT  e.employee_id, e.last_name, e.salary, 
        e.salary*e.commission_pct com, d.department_name 
FROM employees e, departments d
WHERE e.department_id =  d.department_id 
AND commission_pct IS NOT NULL;

04. 각 부서에 대한 정보를 파악하고자 한다.
각 부서의 부서코드, 부서명, 위치코드, 도시를 조회
SELECT  d.department_id, d.department_name, 
        l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

05. 사번, 성, 부서코드, 부서명, 근무지도시명, 주소 조회
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id;

06. 사번, 성, 부서코드, 부서명, 업무코드, 업무제목 조회  --조인조건은 table갯수 -1 만큼 필요!!
SELECT e.employee_id, e.last_name, 
       d.department_id, d.department_name, 
       j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id 
ORDER BY 1;

07. 각 부서의 부서코드, 부서명, 위치코드, 도시명, 국가코드, 국가명, 대륙명 조회 
-- 각 부서에 대해라고 했으므로 employees 테이블 필요없음
SELECT  d.department_id, d.department_name, 
        l.location_id, l.city, 
        l.country_id, c.country_name, 
        r.region_name
FROM departments d, locations l, countries c, regions r 
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;


