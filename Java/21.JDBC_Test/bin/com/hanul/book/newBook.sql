SELECT
    *
FROM tblBook;

CREATE TABLE newBook(
num VARCHAR2(20) PRIMARY KEY NOT NULL,
title VARCHAR2(30),
company VARCHAR2(20),
name VARCHAR2(10),
cost NUMBER
);

INSERT INTO newbook
VALUES('000-00-0000-000-0', 'JAVA', 'ÇÑºû', '±èÀ±¸í', 27000);

INSERT INTO newbook
VALUES('111-11-1111-111-1', 'JSP', 'ÇýÁö¿ø', '¿ÀÁ¤¿ø', 33000);

SELECT
    *
FROM newbook;

COMMIT;