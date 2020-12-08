3.2 �����Լ�
1. ��/�ҹ��� ��ȯ �Լ� : UPPER/LOWER(����)

SELECT *
FROM employees;

01. ����/��¥ ������ ǥ�� : ''
���� King �� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE last_name = 'King';
--WHERE UPPER(last_name) = 'KING';
--WHERE LOWER(last_Name) = 'king';

02. ���� ��ҹ��� �����ϰ� z �� �ִ� ������� ���, ��, �� ��ȸ
SELECT employee_id, last_name, first_name
FROM employees
WHERE UPPER(last_name) LIKE '%Z%';
--WHERE LOWER(last_name) LIKE '%z%';
--WHERE last_name LIKE '%z%' OR last_name LIKE '%Z%' ; 
--���� ��ҹ��� �����ϰ� z �� �ִ�

2. �ܾ� ������ ù���ڴ� �빮��, �������� �ҹ���ȭ �ϴ� �Լ�: INITCAP(���)
    : �̴ϼȸ� �빮�ڷ� ��ȯ
--SELECT INITCAP('we are studing oracle') title     /* We Are Studying Oracle */
SELECT INITCAP('WE ARE STDUYING ORACLE') title      /* We Are Studying Oracle */   
--SELECT INITCAP('wE aRE sTDUYing oRACLE') title    /* We Are Studying Oracle */
FROM dual;

SELECT email, INITCAP(email) INITCAP,
       first_name, UPPER(first_name) UPPER, LOWER(first_name) LOWER
FROM employees;

3. ���� ������(char1)�� Ư�� ����(char2)�� ä���� ��ȯ�ϴ� �Լ� 
    : LPAD/RPAD(char1, n [, char2])
    : LPAD/RPAD(���, ��üũ��, ��������), pad : ä�� �ִ°�
    : ����° �Ķ������ �������� ���� ���� : default ���鹮��

SELECT LPAD('abc', 5,'?')   p1,  /*??abc*/
       RPAD('abc', 5, '#')  p2,  /*abc##*/
       '['||LPAD('abc', 5)  p3,  /*[__abc*/
       RPAD('abc', 5)||']'  p4   /*abc__]*/
FROM dual;

SELECT LPAD('abc', 10, '@') p1  /*@@@@@@@abc*/
FROM dual;

SELECT employee_id, LPAD(last_name , 20, ' ') last_name
--SELECT employee_id, LPAD(last_name , 20) last_name �� ������ ���鹮��
FROM employees;

4. ���ڵ����Ϳ��� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
   : ������ ���ڴ� ���� ���� ���� ���ɡ�  �� TRIM
   : �Է»��ڿ��� ����� �Ǽ��� ������ �Է½�
   : request.getParameter('UserId').TRIM();

TRIM([LEADING, TRAILING, BOTH] [, TRIM_char] [FROM] char)
�� TRIM(��������ġ ���Ź����Ѱ� FROM �����) ��
TRIM(LEADING/TRAILING/BOTH ���Ź���(���ѱ��ڸ� ����) FROM �����)
  ������ ��ġ - ����:LEADING, ������:TRAILING, ����:BOTH
  ������ ��ġ ���� ���� - default:BOTH
  ���Ź��� ���� ���� - default ���鹮��
  
SELECT TRIM('a' FROM 'abcdcbaaaaa')          t1, /*bcdcb*/
       TRIM(LEADING 'a' FROM 'abcdcba')      t2, /*bcdcba*/
       TRIM(TRAILING 'a' FROM 'abcdcbaaaaa') t3, /*abcdcb*/
       TRIM(BOTH 'a' FROM 'abcdcbaaaaa')     t4, /*bcdcb*/
       '  abcdcba '                          t5, /*__abcdcba_*/
       TRIM('  abcdcba ')                    t6  /*abcdcba*/
FROM dual;

5. ���ڵ����Ϳ� Ư�����ڸ� �����ϰ� ��ȯ�ϴ� �Լ�
    : ������ ���ڸ� �ڿ��� �� ���� ���� �� TRIM�Լ��� ������
    : LTRIM/RTRIM(char1 [,char2])
    : LTRIM/RTRIM(�����, �����ҹ����ǳ���)
    : �� ��° �Ķ���� ���� ���� - default ���鹮��
    
SELECT LTRIM( 'abcdcba' , 'a' )  t1, /* bcdcba */
       LTRIM( 'abcdcba' , 'ba' ) t2, /* cdcba */
       RTRIM( 'abcdcba' , 'acb') t3, /* abcd */
       RTRIM( 'abcdcba' , 'adb') t4, /* abcdc */
       RTRIM( 'abcdcba' , 'bc')  t5, /* abcdcba */
       RTRIM( '   abcdcba   ')   t6  /* ___abcdcba */
FROM dual;
   
6) ���ڿ����� ���ڿ��� �Ϻθ� ��ȯ(�� ���°���� �����)�ϴ� �Լ�
    : SUBSTR(string, position [, LENGTH])
    : SUBSTR(�����, ������ġ, �����)
    �ι�° �Ķ����(position : ������ġ), ���� ���� ���� �� �����ʿ�������
    ����° �Ķ����(LENGTH : �����) ������ �� �� ���ڿ��� ������ ��ȯ
               1   5   9   13
SELECT SUBSTR('You are not alone', 5, 3)  s1, /* are */
       SUBSTR('You are not alone', 5)     s2, /* are not alone */
       SUBSTR('You are not alone', -5, 3) s3, /* alo */
       SUBSTR('You are not alone', -5)    s4  /* alone */
FROM dual;

7) ���ڿ����� Ư�����ڿ��� ��ġ�� �ڽ�����ġ�� ��ȯ�ϴ� �Լ�
    : INSTR(char, search_string [, position] [ , _th])
    : INSTR(�����, ã�¹��ڿ�, ���ڿ�ã�½�����ġ, ���°��)
    �ι�° �Ķ���� �� ã�¹��ڿ�
    ����° �Ķ���� �� ���ڿ� ã�� ���� ��ġ, 
       ���� ���� ���� �� �����ʿ������� ���ʹ������� �� �������� ��� ����
    �׹�° �Ķ���� �� ���°��, ���� ���� - default 1

              1     7   11 14 17 19
SELECT INSTR('Every sha-la-la-la-la', 'la', 1, 2)   s1, 
       /* 1����ġ���� ã�� �����ؼ� 2��°�� �����ϴ� 'la' ���� ��ġ : 14 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 2)  s2, /* 17 */
       INSTR('Every sha-la-la-la-la', 'la', 12, 4)  s3, /* 0 */
       INSTR('Every sha-la-la-la-la', 'la', 12)     s4, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -3, 2)  s5, /* 14 */
       INSTR('Every sha-la-la-la-la', 'la', -10)    s6  /* 11 */
                     /*-11-8 -5 -2*/            
FROM dual;

-----------------------------------------------------------------------------------------------
email                 @��ġ  id(1��°���� @��ġ �ձ���)   ����������(@��ġ �ں��� ������)
-----------------------------------------------------------------------------------------------
honggildong@naver.com  12    honggildong         1,11     naver.com      13,22
admin@google.com        6    admin               1, 5     google.com      7,16  
hoho0829@hanmail.net    9    hoho0829            1, 8     daum.net       10,20
-----------------------------------------------------------------------------------------------

������ �̸��Ͽ��� ���̵�� ���������ڸ� ��ȸ
SELECT 'hoho0829@hanmail.net' email,   
        SUBSTR('hoho0829@hanmail.net', 1, INSTR('hoho0829@hanmail.net', '@')-1) id,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1) servicer1,
        SUBSTR('hoho0829@hanmail.net', INSTR('hoho0829@hanmail.net', '@')+1,
        	LENGTH('hoho0829@hanmail.net')-INSTR('hoho0829@hanmail.net', '@')) servicer2
FROM dual;

--JOBS ���̺��� �����ڵ�, ��������, ����, ��å ��ȸ
--����, ��å�� �����ڵ忡�� '_'�������� ��ȸ(����_��å)
SELECT job_id, job_title
FROM jobs;

[�ǽ�]
JOB_ID   JOB_TITLE   '_'��ġ   ���ڿ�����   _���� ���� ����     ����      ��å        
-----------------------------------------------------------------------------------------------
AD_PRES  President        3            7            4            AD       PRES 
:
:

SELECT job_id,
       job_title,
       INSTR(job_id,'_') "_��ġ",
       LENGTH(job_id) "���ڿ�����",
       LENGTH(job_id)-INSTR(job_id,'_') "_���� ���� ����", 
       SUBSTR(job_id,1,INSTR(job_id,'_')-1) "����",   /* _�������� ���� */
       SUBSTR(job_id,INSTR(job_id,'_')+1) "��å1",     /* _���ĺ��� ���� */
       SUBSTR(job_id,INSTR(job_id,'_')+1,LENGTH(job_id)-INSTR(job_id,'_')) "��å2"
FROM jobs;