--LOWER() : �ҹ��ڷ� ��ȯ
--UPPER() : �빮�ڷ� ��ȯ

-- ���� King�� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
--WHERE last_name = 'King';
--WHERE LOWER(last_name)='king';
WHERE UPPER(last_name)='KING';

-- ���� ��ҹ��� �����ϰ� z�� �ִ� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--LOWER(last_name) LIKE '%z%';

--WHERE last_name LIKE '%Z%'
--OR last_name LIKE '%z%';

--�ܾ� ������ ù���ڴ� �빮��, �������� �ҹ���ȭ �ϴ� �Լ� : INITCAP(���)
--�̴ϼȸ� �빮�ڷ� ��ȯ
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

--���� ������(char1)�� Ư�� ����(char 2)�� ä���� ��ȯ�ϴ� �Լ�
-- 3��° �μ� �ڸ��� �Ѱ��ִ� ���� ������ �������� ó��
SELECT LPAD('abc', 5, '?') p1,
            RPAD('abc', 5, '#') p2,
           '['|| LPAD('abc', 5) p3,
           RPAD('abc', 5)||']' p4
FROM dual;

SELECT LPAD('abc', 10, '@') p1
FROM dual;

SELECT employee_id, LPAD(last_name, 20) last_name
FROM employees;

--���� �����Ϳ��� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�( TRIM() )
--      : ������ ���ڴ� �Ѱ��� ���� ����
--      : �Է»��ڿ��� ����� �Ǽ��� ������ �Է½�
--      request.getParameter('UserId').TRIM();

-- ��ġ ���� : �⺻�� BOTH(����)
SELECT TRIM('a' FROM 'abcdcbaaaaa')                      t1,
               TRIM(LEADING 'a' FROM 'abcdcba')             t2,
               TRIM(TRAILING 'a' FROM 'abcdcbaaaaa')    t3,
               TRIM(BOTH 'a' FROM 'abcdcbaaaaa')           t4,
               '   abcdcba'                                                      t5,
               --���鸸 �ڸ�
               TRIM('   abcdcba')                                           t6
FROM dual;

--������ ���ڸ� �������� ���� ����
--����/�����ʺ��� ���������� �����ؼ� �ϳ��� �ش� ���ڿ� ������ ������ ���̻� �ڸ��� �ʰ� ��
SELECT LTRIM('abcdcba', 'a')          t1,
               LTRIM('abcdcba', 'ba')        t2,
               RTRIM('abcdcba', 'acb')      t3,
               RTRIM('abcdcba', 'adb')      t4,
               RTRIM('abcdcba', 'bc')        t5,        
               --t5 : �� ������ ���� 'a'�� 'bc'�� ���� ���ڰ� �ƴϹǷ� �ƹ��͵� �ڸ��� �ʰ� �״�� ��ȯ
               RTRIM('    abcdcba    ')       t6
FROM dual;

--���ڿ����� ���ڿ��� �Ϻθ� ��ȯ : SUBSTR()
-- �ι�° �μ�(position, ���� ��ġ) : ������ ���� ����, ������ �� ��� �����ʺ���
--����° �μ�(length, �� ����) : ���� �� ���ڿ��� ������ ��ȯ
SELECT SUBSTR('You are not alone', 5, 3)     s1,        -- are
               SUBSTR('You are not alone', 5)         s2,        -- are not alone
               SUBSTR('You are not alone', -5, 3)    s3,        -- alo
               SUBSTR('You are not alone', -5)        s4         -- alone
FROM dual;

--���ڿ����� Ư�� ���ڿ��� ��ġ�� ������ġ�� ��ȯ�ϴ� �Լ� : INSTR()
--INSTR(�����, ã�� ���ڿ�, ���ڿ� ã�� ���� ��ġ, �� ��° ��)
-- ����° �μ� : ������ ���� ���� �� �����ʿ��� ����
--�׹�° �μ� : �������� �� default ���� 1
--                         1         7    11141719
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)           s1,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', 12, 2)         s2,     -- 17
               INSTR('Every sha-la-la-la-la', 'la', 12, 4)         s3,     -- 0
               INSTR('Every sha-la-la-la-la', 'la', 12)             s4,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', -3, 2)          s5,     -- 14
               INSTR('Every sha-la-la-la-la', 'la', -10)            s6      -- 11
FROM dual;

--������ �̸����� ID�� SERVICER�� ������ ����Ͻÿ�
SELECT  'tjdms5322@naver.com' email,
                SUBSTR('tjdms5322@naver.com', 1, INSTR('tjdms5322@naver.com', '@') - 1) id,
                --���� ��ġ 1��°���� 9(10 - 1)��°������ ���ڿ��� �ڸ�
                SUBSTR('tjdms5322@naver.com', INSTR('tjdms5322@naver.com', '@') + 1) servicer
                --������ġ (10 + 1)��°���� ��� ���ڿ��� �ڸ�
FROM dual;

               

