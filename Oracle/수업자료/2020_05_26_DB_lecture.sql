--tblMember ���̺� ����
CREATE TABLE tblMember(
num NUMBER,
name VARCHAR2(10),
age NUMBER,
addr VARCHAR2(50),
tel VARCHAR2(20)
);

--���̺� �̸� ����
SELECT table_name
FROM user_tables;

--���̺� ���� ����
DESC tblMember;

--���ڵ� ����
INSERT INTO tblMember(num, name, age, addr, tel)
VALUES (1,'ȫ�浿',30,'���ֱ����� ���� �󼺵�','010-1111-1111');

INSERT INTO tblMember
VALUES (2,'��浿',27,'���ֱ����� ���� ���̵�','010-2222-2222');

--��ü ������ ��ȸ
SELECT *
FROM tblmember;

--�̸�, ���� ��ȸ
SELECT name, age
FROM tblmember;

--���� ����(DB�� �ݿ�)
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
--tblmember���̺� phone �ʵ� �߰�
ALTER TABLE tblmember
ADD phone VARCHAR2(10);

--tblmember���̺� ���� ����
DESC tblmember;

--tblmember���̺� phone �ʵ� ũ�� ����
ALTER TABLE tblmember
MODIFY (phone VARCHAR2(20));

DESC tblmember;

--tblmember���̺� phone�ʵ� �̸��� mobilephone���� ����
ALTER TABLE tblmember
RENAME COLUMN phone TO mobilephone;

DESC tblmember;

--tblmember���̺� phone�ʵ� ����
ALTER TABLE tblmember
DROP COLUMN mobilephone;

DESC tblmember;

--������ ����
INSERT INTO tblmember(num, name, age, addr, tel)
VALUES(1,'ȫ�浿',30,'���ֱ����� ���� �󼺵�', '010-1111-1111');

INSERT INTO tblmember(tel, addr, age, num, name)
VALUES('010-2222-2222', '���ֱ����� ���� ���̵�', 27, 2,'��浿');

INSERT INTO tblmember
VALUES(3, '��浿', 35, '���ֱ����� �ϱ� �����','010-3333-3333');

INSERT INTO tblmember(num, name, age)
VALUES(4,'�̼���',55);

--������ ��ȸ
SELECT *
FROM tblmember;

COMMIT;

--4�� ���ڵ� ����(����, ������Ʈ)
UPDATE tblmember
SET addr='���ֱ����� ���걸 �Ű���', tel='010-4444-4444';

SELECT *
FROM tblmember;

--Ȯ�����
ROLLBACK;

--4�� ���ڵ� ����(����, ������Ʈ)
UPDATE tblmember
SET addr='���ֱ����� ���걸 �Ű���', tel='010-4444-4444'
WHERE num=4;

SELECT *
FROM tblmember;

--3�� ���ڵ��� �ּҸ� �ڱ��� �ּҷ� �����غ�����
UPDATE tblmember
SET addr='���ֱ����� �ϱ� �����'
WHERE num=3;

SELECT *
FROM tblmember;

COMMIT;

--4�� ���ڵ� ����
DELETE FROM tblmember
WHERE num=4;

SELECT *
FROM tblmember;

ROLLBACK;

--��ȸ SELECT
--��ȣ, �̸�, ���� ��ȸ

SELECT num, name, age
FROM tblmember;

--��浿 ��ȸ
SELECT *
FROM tblmember
WHERE name='��浿';

--���̰� 30�� �̻� ��ȸ
SELECT *
FROM tblmember
WHERE age>=30;

SELECT *
FROM tblmember;

--���̰� 30�븸 ��ȸ
SELECT *
FROM tblmember
WHERE age>=30 AND age<=40;

SELECT *
FROM tblmember
WHERE age BETWEEN 30 AND 40;

--�ּҿ� Ư�� ���ڰ� ���Ե� ȸ�� ���(LIKE ������)
��% : ������ ���۵Ǵ� �÷� ��ȸ
%�� : ������ ������ �÷� ��ȸ
%��% : ���� �����ϴ� �÷� ��ȸ

--�ּҿ��� ������ ���Ե� ���ڵ� ���
SELECT *
FROM tblmember
WHERE addr LIKE '%����%';

SELECT *
FROM tblmember
WHERE addr LIKE '��%';

SELECT *
FROM tblmember
WHERE addr LIKE '%��';

--�����Լ�
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

--������ ��� ������� ���� �հ� ��ȸ
SELECT SUM(age) sum_age
FROM tblmember
WHERE addr LIKE '%����%';

SELECT *
FROM tblmember
WHERE num=1
OR num=3;

SELECT *
FROM tblmember
WHERE num IN(1,3);

SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') today
FROM dual;

























