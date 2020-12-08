○ 데이터베이스(Database)
기존의 파일시스템에서는 중복된 정보를 효율적으로 처리하는 것이 관점 분야였다. 
이 중복을 피하여 정보를 일원화하여 처리를 효율적으로 수행하기 위해서 서로 관련성을 가지며 
중복이 없는 데이터의 집합을 유지하는 것 

- 유용한 데이터의 집합이다.
- 검색에 용이하게 데이터를 저장하도록 한 것이다.
- 검색뿐만 아니라 수정, 삭제까지도 용이하게 한것이다.

○ 데이터베이스의 파일시스템 문제점
1. 데이터의 종속성
   - 종속성이란 데이터의 구성이나 접근방법이 변경되면 관련된 응용프로그램들이 변경되는것을 의미한다.
2. 데이터의 중복성
   - 한 시스템 내의 데이터가 중복 저장, 관리되어 관련된 데이터의 불일치가 발생한다.

※ 데이터 중복으로 인해 발생하는 문제점
- 일관성 : 여러 개의 데이터가 모두 하나의 사실을 나타낸다면 논리적으로 그 내용이 모두 동일하나, 
           데이터 중복이 있으면, 그 동일성을 유지하기가 어렵다.
- 보안성 : 동일 수준의 보안이 유지되어야 하나, 데이터가 중복되어 있다면 
           모두 똑같은 수준의 보안을 유지한다는 것이 현실적으로 어렵다.
- 경제성 : 데이터를 중복해서 저장하려면 추가 저장되는 공간에 대한 비용이 더 들게 된다.
- 무결성 : 데이터가 만족해야 할 제약조건이 데이터 중복으로 인해 정확성을 유지하지 못하게 된다.

○ 데이터 베이스 정의
1. 통합 데이터(integrated data)
- 여러 부서에서 사용하는 데이터를 한 곳에 모아서 공동 관리하는 것이다.(기억장소 절약)
- 원칙적으로 동일한 데이터의 중복을 허용하지 않지만, 검색의 효율성을 위해서 최소한의 중복을 허용하여 통합한다.
2. 저장 데이터(stored data)
- 컴퓨터가 접근할 수 있는 디스크와 같은 저장 매체에 저장된 것이다.
3. 운영데이터(operational data)
- 조직의 운영에 기본적으로 반드시 필요한 데이터를 저장하는 것이다.
- 조직의 고유한 기능을 수행하는데 필수적인 데이터를 저장하는 것이다.
- 일시적으로 필요한 임시 데이터나 단순한 입출력 데이터는 운영데이터에 해당하지 않는다.
4. 공용 데이터(shared data)
- 한 조직의 여러 운용 프로그램이 공동으로 사용하는 것이다.
- 즉, 여러사용자가 서로 다른 목적으로 공유한다.

○ 데이터 베이스 특징
1. 실시간 접근성
- 수시적이고 비정형적인 질의(query)에 대하여 실시간 처리로 응답할 수 있어야 한다.
2. 계속적인 변화
- 새로운 데이터의 삽입, 기존 데이터의 삭제, 갱신으로 항상 그 내용이 변하고, 
  또 그 속에서 현재의 정확한 데이터를 유지해야 한다.
3. 동시 공유
- 같은 내용의 데이터를 여러 사람이 서로 다른 방법으로 동시에 공용할 수 있어야 한다.
4. 내용에 의한 참조
- 데이터베이스 내에 있는 데이터 레코드들은 주소나 위치에 의해서가 아니라 
  사용자가 요구하는 데이터의 내용에 따라 참조해야 한다.




○ 데이터베이스관리시스템(DBMS: Database Management System) : 데이터 베이스를 관리하는 시스템 
- 방대한 양의 데이터를 편리하게 저장하고 효율적으로 관리하고 검색할 수 있는 환경을 
  제공해 주는 시스템 소프트 웨어
- 응용프로그램과 데이터베이스의 중재자로서 모든 응용프로그램들이 
  데이터베이스를 공용할 수 있게끔 관리해 주는 소프트웨어 시스템
       
                        명령SQL                read/write
    Application     -------------->   DBMS   <-------------> DATA File
                    <--------------
                        result

○ 관계형 데이터베이스 관리 시스템(RDBMS : Relational Database Management System)의 종류
- 오라클(Oracle)
- 사이베이스(Sybase)
- 인포믹스(infomix)
- MYSQL
- MariaDB
- Access
- SQL Server


○ 관계형 데이터 베이스는 정보를 저장하기위한 구조를 위해 테이블을 사용한다.
    
    DEPTNO DNAME          LOC          
---------- -------------- -------------
        10 ACCOUNTING     NEW YORK     
        20 RESEARCH       DALLAS       
        30 SALES          CHICAGO      
        40 OPERATIONS     BOSTON

○ 데이터 베이스 사용자

    사용자 <-----> 데이터베이스관리시스템(DBMS) <-----> 데이터베이스

○ 사용자
- 데이터베이스 관리자(DBA) : 데이터베이스 설계와 정의, 관리 및 운영 등 
  데이터베이스 시스템을 관리하고 제어하는 사용자
- 응용프로그래머 : 데이터베이스를 실제적으로 설계하여 최종 사용자들의 요구에 맞는 
  인터페이스와 응용 프로그램을 개발
- 최종 사용자: 데이터베이스를 실질적으로 사용하는 사용자


○ SQL 명령어
- 데이터베이스에서 자료를 검색하고 수정하고 삭제하는 등을 위한 데이터베이스 언어이다.
- 관계형 데이터베이스를 처리하기 위해 고안된 언어이다.
- 독자적인 문법을 갖는 DB표준 언어이다.(ISO에 의해서 지정)
- 대다수 데이터베이스는 SQL을 사용하여 데이터를 조회, 입력, 수정, 삭제한다.

※ SQL 명령문의 종류
DQL : Data Query Language(질의어), SELECT
DML : Data Manipulation Language(데이터 조작어), INSERT, UPDATE, DELETE
DDL : Data Definition Language(데이터 정의어), CREATE, ALTER, DROP, TRUNCATE, RENAME
TCL : Transaction Control Language(트랜젝션 처리어), COMMIT, ROLLBACK, SAVEPOINT
DCL : Data Control Language(데이터 제어어), GRANT, REVOKE

-----------------------------------------------------------------------------------------------
DQL - SELECT문 ☞ 저장된 데이터를 조회

DML - INSERT문 ☞ 새로운 데이터를 삽입
DML - UPDATE문 ☞ 기존의 데이터를 변경
DML - DELETE문 ☞ 기존의 데이터를 삭제
(COMMIT하기 전에 ROLLBACK으로 삭제하기 이전 상태로 되돌릴 수 있다.
즉, 용량은 그대로 있고 데이터만 삭제)

DDL - CREATE문 ☞ 새로운 테이블을 생성
DDL - ALTER문  ☞ 기존의 테이블을 변경(컬럼 추가, 컬럼 크기 변경 등)
DDL - TRUNCATE문 ☞ 객체내의 데이터를 삭제
        DML의 DELETE문과의 차이점 : TCL의 ROLLBACK으로 삭제하기 이전 상태로 되돌릴 수 없다.
        (용량은 지워지지만 구조는 남아있다.)
DDL - DROP문 ☞ 기존 테이블을 삭제할 때 사용
        테이블의 내용과 구조 자체를 모두 제거한다.(즉, 용량, 구조, 데이터 모두 다 제거된다.)
DDL - RENAME문 ☞ 기존의 테이블의 이름을 변경

TCL - COMMIT ☞ 변경된 내용을 영구 저장
TCL - ROLLBACK  ☞ 변경되기 이전 상태로 되돌림
TCL - SAVEPOINT ☞ 특정 위치까지는 영구 저장 혹은 이전 상태로 되돌릴 수 있도록 
        트랜잭션 중에 저장점을 만들 때 사용

DCL - GRANT문 ☞ 사용자에게 특정 권한을 부여할 때 사용
DCL - REVOKE문 ☞ 사용자에게 부여했던 특정 권한을 제거할 때 사용
-----------------------------------------------------------------------------------------------



시작메뉴 -> cmd -> 
> sqlplus --SQL 문을 실행시키고 그 결과를 볼 수 있도록 오라클에서 제공하는 툴
> user-name: system
> password: 0000

HR 유저 사용하기 위해 HR 유저 계정 풀기 --데이터베이스 사용자는 오라클 계정과 같은 의미로 사용
ALTER : 고치다, 바꾸다
ALTER USER hr 
ACCOUNT unlock;

--비밀번호 지정
ALTER USER hr
IDENTIFIED BY 0000;

데이터관리 : Table
행열로 이루어진 2차원 구조의 Table로 데이터를 관리

--dba_users 구조보기
DESC dba_users;

--사용자 정보 확인
SELECT username
FROM dba_users;

SELECT *
FROM dba_users;

--전체 테이블 조회
SELECT * FROM ALL_TABLES; --(관리자일 경우)
SELECT * FROM USER_TABLES; --(관리자 아닐 경우)
SELECT * FROM TAB; --(관리자 아닐 경우)

TAB은 TABLE의 약자로 HR사용자가 소유하고 있는 
테이블의 정보를 알려주는 데이터딕셔너리(Data Dictionary)이다.
데이터딕셔러니(Data Dictionary) : 데이터베이스와 관련된 모든 정보를 제공한다.

--user_tables 에서 table_name 보기
SELECT table_name 
FROM user_tables
ORDER BY table_name;

--user_tables 구조 보기, TABLE_NAME 확인
DESC user_tables;

--SELECT * PRIVILEGE FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');
resource role, connect role에 부여된 권한 조회
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE IN('CONNECT', 'RESOURCE');

--SELECT * FROM DUAL;

pl/sql developer 사용자 환경 설정.
SQL developer 도구 글꼴 변경 
- 도구 > 환경설정... > 코드 편집기 > 글꼴 > 글꼴 크기
SQL developer 창 초기화 : 창 > 팩토리 설정으로 창 재설정

SQL에디터에서 줄번호 보이게 설정
 - 도구 > 환경설정 > 코드 편집기 > 행 여백 > 행 번호 표시에 체크.
 
4. 모델러
3. 튜너
2. DBA
1. DB엔지니어 ☞ 3~5년

오라클  : MySQL 합병, 유료화
MariaDB : 새로 창업, 구글과 연동(리눅스에서 기본 사용)

오라클 사용 가능 OS : 윈도우, 리눅스(리눅스에서 Maria DB를 기본으로 사용), UNIX

오라클에서는 user자체가 DB : cf) MySQL에서는 데이터베이스로 표현
오라클에서는 dba_users 테이블에 있는 username 이 하나의 데이터 베이스

※ 데이터베이스 설계
1. 요구사항 분석 	        ☞ 요구사항명세서
2. 개념적 설계			    ☞ ER 다이어그램
3. 논리적 설계			    ☞ 릴레이션 스키마, attribute, tuple
4. 물리적 설계와 구현	    ☞ 물리적 스키마, column, row

-----------------------------------------------------------------------------------------------
※ 오라클 버전
 8i : 이때부터 8080포트 사용
 9i : 
10g : g ☞ 그리드 컴퓨팅, 
      휴지통 개념 생김. 그래서, purge생김, drop table 테이블명 purge;
      10g ☞ 한글 2바이트
11g : 11g부터 한글 3바이트
12c : c ☞ 클라우드 서비스
 :
 :
19c
-----------------------------------------------------------------------------------------------
1521 : 기본 DB포트
8080 : 톰캣이 기본으로 사용
tomcat : WAS(Web Application Server)의 종류

Oracle XE버전 사용(Standard하고는 틀림)
Orccle DB : 램 1기가 사용
설치는 쉽지만 제거는 어려움
오라클 사이트에서 reinstall 다운로드 받아 제거

※ 오라클 종류
- Database Standard Edition 2(SE2) : 가장 기본적인 DB 제품. CPU 소켓 2개까지만 사용이 가능하고 그 이상일 경우 EE로 구입해야함. 
        SE2에서는 Real Application Cluster(RAC : 관리 컨트롤) 옵션만 지원. 
- Database Enterprise Edition(EE) : 고사양 서버에서 사용가능한 기업용 DB. 
        SE2에서 지원되지 않는 모든 옵션이 지원 가능.
- Database Express Edition(XE) : 개발용, 교육용 등으로 무료사용이 가능한 DB.
        상업용도로 판매하는 것은 불가능.
- Database Personal Edition(PE) : 개인용 PC에서 사용할 수 있는 DB. 네트워크 연결이 되어 있지 않은 환경에서 사용 가능. 
        총판 통해 판매되고 있음.
- WebLogic Server
- Business Analyst
- Big Data(Big Data Appliance랑 다름)


SQL  : Structured Query Language
조회(Query Language): SELECT
조작 DML(Data Manipulation Language): INSERT, UPDATE, DELETE
       DML : SELECT, INSERT, UPDATE, DELETE
정의 DDL(Data Definition Language): CREATE, DROP, ALTER, TRUNCATE, RENAME
권한제어 DCL(Data Control Language): GRANT, REVOKE
트랜잭션제어 TCL (Transaction Control Language): COMMIT, ROLLBACK

※ SQL문의 작성 방법
SQL문은 대소문자를 구분하지 않고(안의 데이터만 구분) 
일반적으로 절 단위로 줄바꿈을 하여 쓴다.
문장의 끝에 세미콜론(;) 을 기술하여 명령의 끝을 표시한다.

DML만 commit 실행, 나머지는 auto commit 됨.
commit : 트랜잭션(묶음, 덩어리) 완료, 확정

SYSTEM 계정에서 hanul사용자 계정 만든 후 테이블 만들어 데이터 삽입 후 
sqldeveloper와 cmd창에서 비교해가며 commit 확인

--hanul 사용자 계정 생성 후 비밀번호 지정
CREATE USER hanul 
IDENTIFIED BY 0000;

--hanul사용자 계정 생성 후 권한 부여
--Role (하나이상의 권한으로 이루어진 집합체 : resource, connect, dba...) 권한 부여
--https://fliedcat.tistory.com/98


GRANT CONNECT, 
      RESOURCE,
      CREATE VIEW
TO hanul;



※ 오라클 11g SQL*PLUS로 로그인 하기
도스창에서 Sql*Plus를 실행하기 위해서 HANUL 계정으로 접속하기
시작 > 실행 > CMD

C:\Users\계정>SQLPLUS HANUL/0000
--접속된 유저 확인하기
SQL> SHOW USER

--HANUL 계정으로 접속한 상태에서 HR 계정으로 접속하는 방법
--connect HR/[오라클 설치 시 입력했던 암호]
SQL>CONNECT HR/0000

--HR 계정으로 접속이 되었는지 확인하기
SQL> SHOW USER

오라클 서버 나가기
SQL>EXIT

Oracle을 종료하지 않고 OS 명령을 수행할 수 있도록 OS 환경으로 잠시 나가는 명령어
SQL>HOST

C:\Users\hoho0829>EXIT --다시 오라클 환경인 sqlplus로 돌아옴
도스프롬프트를 나가는 명령어 exit를 사용하면 sqlplus로 돌아오게 된다.

--HR 유저에 관리된 table 확인
SELECT table_name FROM user_tables;
SELECT * FROM user_tables;
SELECT * FROM TAB; 
-- TAB은 TABLE의 약자로 HR사용자가 소유하고 있는 
-- 테이블의 정보를 알려주는 데이터딕셔러니(Data Dictionary)이다.
-- 데이터딕셔러니(Data Dictionary) : 데이터베이스와 관련된 모든 정보를 제공한다.

TABLE_NAME 
-----------------------------------------------------------------------------------------------
REGIONS     : 대륙정보
LOCATIONS   : 위치정보
DEPARTMENTS : 부서정보
JOBS        : 업무정보
EMPLOYEES   : 사원정보
JOB_HISTORY : 업무이력정보
COUNTRIES   : 국가정보
-----------------------------------------------------------------------------------------------

2.1. 데이터 조회 

● DESC ☞ SQL*PLUS 명령어, 
테이블의 컬럼 이름, 데이터형, 길이, NULL 허용 유무 등 특정 테이블의 정보를 제공
DESCRIBE 테이블명 ==  DESC 테이블명
DESC employees; /*employees 테이블 구조 파악*/

이름                   널?            유형           
--------------         --------      ------------ 
EMPLOYEE_ID(사번)      NOT NULL      NUMBER(6)    
FIRST_NAME(이름)                     VARCHAR2(20) 
LAST_NAME(성)          NOT NULL      VARCHAR2(25) 
EMAIL(이메일)          NOT NULL      VARCHAR2(25) 
PHONE_NUMBER(휴대전화)               VARCHAR2(20) 
HIRE_DATE(입사일)      NOT NULL      DATE         
JOB_ID(업무코드)       NOT NULL      VARCHAR2(10) 
SALARY(급여)                         NUMBER(8,2)  
COMMISSION_PCT(상여율)               NUMBER(2,2)  
MANAGER_ID(매니저아이디)             NUMBER(6)    
DEPARTMENT_ID(부서코드)              NUMBER(4) 



