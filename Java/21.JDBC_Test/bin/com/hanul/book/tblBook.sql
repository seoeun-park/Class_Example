--tblBook ���̺� ����
CREATE TABLE tblBook(
num NUMBER NOT NULL,
title VARCHAR2(30),
company VARCHAR2(20),
name VARCHAR2(10),
cost NUMBER
);

DESC tblBook;

--������ ���ڵ� ����
INSERT INTO tblBook VALUES(1, 'JAVA', '�Ѻ�', '������', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '������', '������', 33000);

--��ü ���ڵ� �˻�
SELECT *
FROM tblBook;

ALTER TABLE tblBook
ADD CONSTRAINT num PRIMARY KEY (num);

COMMIT;

DROP TABLE tblBook;

--tblBook ���̺� ����
CREATE TABLE tblBook(
num NUMBER PRIMARY KEY NOT NULL,
title VARCHAR2(30),
company VARCHAR2(20),
name VARCHAR2(10),
cost NUMBER
);

INSERT INTO tblBook VALUES(1, 'JAVA', '�Ѻ�', '������', 27000);
INSERT INTO tblBook VALUES(2, 'JSP', '������', '������', 33000);