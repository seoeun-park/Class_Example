--tblBook 테이블 생성
CREATE TABLE tblBook(
num NUMBER NOT NULL,
title VARCHAR2(30),
company VARCHAR2(20),
name VARCHAR2(10),
cost NUMBER
);

DESC tblBook;

--임의의 레코드 삽입
INSERT INTO tblBook VALUES(1, 'JAVA', '한빛', '김윤명', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '혜지원', '오정원', 33000);

--전체 레코드 검색
SELECT *
FROM tblBook;

ALTER TABLE tblBook
ADD CONSTRAINT num PRIMARY KEY (num);

COMMIT;

DROP TABLE tblBook;

--tblBook 테이블 생성
CREATE TABLE tblBook(
num NUMBER PRIMARY KEY NOT NULL,
title VARCHAR2(30),
company VARCHAR2(20),
name VARCHAR2(10),
cost NUMBER
);

INSERT INTO tblBook VALUES(1, 'JAVA', '한빛', '김윤명', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '혜지원', '오정원', 33000);