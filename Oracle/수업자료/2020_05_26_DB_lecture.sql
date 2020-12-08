--tblMember 태이블 생성
CREATE TABLE tblMember(
num NUMBER,
name VARCHAR2(10),
age NUMBER,
addr VARCHAR2(50),
tel VARCHAR2(20)
);

--테이블 이름 보기
SELECT table_name
FROM user_tables;

--테이블 구조 보기
DESC tblMember;

--레코드 삽입
INSERT INTO tblMember(num, name, age, addr, tel)
VALUES (1,'홍길동',30,'광주광역시 서구 농성동','010-1111-1111');

INSERT INTO tblMember
VALUES (2,'김길동',27,'광주광역시 서구 쌍촌동','010-2222-2222');

--전체 데이터 조회
SELECT *
FROM tblmember;

--이름, 나이 조회
SELECT name, age
FROM tblmember;

--최종 저장(DB에 반영)
COMMIT;

DROP TABLE tblMember;

SELECT table_name
FROM user_tables;

CREATE TABLE tblmember (
num NUMBER,
name VARCHAR(10),
age NUMBER,
addr VARCHAR2(50),
tel VARCHAR2(20)
);
--tblmember테이블에 phone 필드 추가
ALTER TABLE tblmember
ADD phone VARCHAR2(10);

--tblmember테이블 구조 보기
DESC tblmember;

--tblmember테이블에 phone 필드 크기 변경
ALTER TABLE tblmember
MODIFY (phone VARCHAR2(20));

DESC tblmember;

--tblmember테이블에 phone필드 이름을 mobilephone으로 변경
ALTER TABLE tblmember
RENAME COLUMN phone TO mobilephone;

DESC tblmember;

--tblmember테이블에 phone필드 삭제
ALTER TABLE tblmember
DROP COLUMN mobilephone;

DESC tblmember;

--데이터 삽입
INSERT INTO tblmember(num, name, age, addr, tel)
VALUES(1,'홍길동',30,'광주광역시 서구 농성동', '010-1111-1111');

INSERT INTO tblmember(tel, addr, age, num, name)
VALUES('010-2222-2222', '광주광역시 서구 쌍촌동', 27, 2,'김길동');

INSERT INTO tblmember
VALUES(3, '김길동', 35, '광주광역시 북구 용봉동','010-3333-3333');

INSERT INTO tblmember(num, name, age)
VALUES(4,'이순신',55);

--데이터 조회
SELECT *
FROM tblmember;

COMMIT;

--4번 레코드 수정(갱신, 업데이트)
UPDATE tblmember
SET addr='광주광역시 광산구 신가동', tel='010-4444-4444';

SELECT *
FROM tblmember;

--확정취소
ROLLBACK;

--4번 레코드 수정(갱신, 업데이트)
UPDATE tblmember
SET addr='광주광역시 광산구 신가동', tel='010-4444-4444'
WHERE num=4;

SELECT *
FROM tblmember;

--3번 레코드의 주소를 자기집 주소로 변경해보세요
UPDATE tblmember
SET addr='광주광역시 북구 용봉동'
WHERE num=3;

SELECT *
FROM tblmember;

COMMIT;

--4번 레코드 삭제
DELETE FROM tblmember
WHERE num=4;

SELECT *
FROM tblmember;

ROLLBACK;

--조회 SELECT
--번호, 이름, 나이 조회

SELECT num, name, age
FROM tblmember;

--김길동 조회
SELECT *
FROM tblmember
WHERE name='김길동';

--나이가 30세 이상 조회
SELECT *
FROM tblmember
WHERE age>=30;

SELECT *
FROM tblmember;

--나이가 30대만 조회
SELECT *
FROM tblmember
WHERE age>=30 AND age<=40;

SELECT *
FROM tblmember
WHERE age BETWEEN 30 AND 40;

--주소에 특정 문자가 포함된 회원 출력(LIKE 연산자)
광% : 광으로 시작되는 컬럼 조회
%광 : 광으로 끝나는 컬럼 조회
%광% : 광을 포함하는 컬럼 조회

--주소에서 서구가 포함된 레코드 출력
SELECT *
FROM tblmember
WHERE addr LIKE '%서구%';

SELECT *
FROM tblmember
WHERE addr LIKE '광%';

SELECT *
FROM tblmember
WHERE addr LIKE '%광';

--내장함수
SELECT *
FROM tblmember;

SELECT COUNT(name) cnt
FROM tblmember;

SELECT SUM(age) sum_age
FROM tblmember;

SELECT AVG(age) avg_age
FROM tblmember;

SELECT MAX(age) max_age
FROM tblmember;

SELECT MIN(age) min_age
FROM tblmember;

SELECT age current_age, age+1 next_age
FROM tblmember;

SELECT *
FROM tblmember;

--서구에 사는 사람들의 나이 합계 조회
SELECT SUM(age) sum_age
FROM tblmember
WHERE addr LIKE '%서구%';

SELECT *
FROM tblmember
WHERE num=1
OR num=3;

SELECT *
FROM tblmember
WHERE num IN(1,3);

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') today
FROM dual;

























