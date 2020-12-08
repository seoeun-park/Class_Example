3. ��¥ȭ�Լ�: TO_DATE(���, ǥ������)  
'19-08-04' -> ��ȯ����:��¥����, 
'������', 'abc' -> ��ȯ�Ұ�

SELECT * 
FROM v$nls_parameters;

SELECT VALUE 
FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT'; /* RR/MM/DD */

SELECT '201006' d1,                        /* 201006 */
       TO_DATE('20-10-06') d2,             /* 20/10/06 */
       TO_DATE('201006') d3,               /* 20/10/06 */
       TO_DATE('201006','DDMMRR') d4,      /* 06/10/20 */   /* ��¥�� '/'�� ���� */
       TO_DATE('20-10-06', 'DD-MM-RR') d5, /* 06/10/20 */   /* ��¥�� '/'�� ���� */
       TO_DATE('20-10-06', 'RR-MM-DD') d6, /* 20/10/06 */   /* ��¥�� '/'�� ���� */
       TO_DATE('20-10-06', 'YY-MM-DD') d7  /* 20/10/06 */   /* ��¥�� '/'�� ���� */
FROM dual;

SELECT 10 + 20 n1,      /* 30 */
       '10' + '20' n2,  /* 30 */
       10 + '20' n3     /* 30 */
FROM dual;

SELECT  TO_DATE('2013-05-27') DATE1,    /* 13/05/27 */
        TO_DATE('2013-06-27 11:12:35', 'YYYY/MM/DD HH:MI:SS AM') DATE2 /* 13/06/27 */ /* ��¥�� '/'�� ���� */
FROM dual;

SELECT  TO_DATE('2013-05-27') DATE1,    /* 13/05/27 */
        TO_DATE('2013-06-27 11:12:35', 'RR/MM/DD HH:MI:SS') DATE2, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'RRRR/MM/DD HH:MI:SS') DATE3, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'YY/MM/DD HH:MI:SS') DATE4, /* 13/06/27 */
        TO_DATE('2013-06-27 11:12:35', 'YYYY/MM/DD HH:MI:SS') DATE5, /* 13/06/27 */
        TO_DATE(SYSDATE, 'YYYY/MM/DD HH:MI:SS') DATE6 /* 13/06/27 */  
FROM dual;

SELECT  TO_CHAR('2013-06-27 11:12:35 AM', 'RR/MM/DD HH:MI:SS') DATE1  
/* �Էµ� ��¥�� TO_CHAR�� ��ȯ �ȵ� */
FROM dual;

SELECT  TO_CHAR(SYSDATE, 'RRRR/MM/DD HH:MI:SS') DATE1  
/* SYSDATE�� TO_CHAR�� ��ȯ �� */
FROM dual;

-----------------------------------------------------------------------------------------------
[�������� 3-3]
01. ������̺��� 30�� �μ��� ���, ����, �޿�, �ٹ�������, �ٹ������ ��ȸ
��, �ٹ��������� ���� ��¥�� �������� ��¥�Լ��� ���
SELECT employee_id, first_name || ' ' || last_name, salary, 
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
       FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees
WHERE department_id = 30;

02. �޿��� 12000 �̻��� ������� ���, ����, �޿��� ��ȸ�Ͽ�
�޿������� �����Ѵ�.
�޿��� ������� õ���� ��ȣ�� ����Ͽ� ǥ���Ѵ�.
SELECT employee_id, first_name ||' '|| last_name name, 
       TRIM(TO_CHAR(salary, '9,999,999,999')) salary
FROM employees
WHERE salary >= 12000 --�޿��� 12000 �̻�
ORDER BY salary ASC;

03. 2005�� ��(2004�����)�� �Ի��� ������� 
���, ����, �Ի�����, �Ի����� ������ ��ȸ�Ͽ� 
�ֱٿ� �Ի��� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' '|| last_name name,
       hire_date, TO_CHAR(hire_date, 'DY') hire_day
FROM employees 
WHERE TO_CHAR(hire_date, 'YYYY') <= 2004 
--WHERE hire_date <= '2004/12/31'; 
--WHERE hire_date < '2005/01/01';  --2005 �� ��(2004�����)�� �Ի���;      
ORDER BY hire_date DESC; --�Ի��� �� < 2005; 

-----------------------------------------------------------------------------------------------


�� �Ϲ��Լ� : NULL �� ���Ǿ��� ��� ���� NULL �� ������ �Ǿ� ����

commission_pct Ȯ��
SELECT employee_id, first_name, salary, commission_pct
FROM employees;

Ŀ�̼Ǳݾ��� 1000 �̸��� ����� ���, �̸�, �޿�, Ŀ�̼ǿ���, Ŀ�̼Ǳݾ��� ��ȸ
SELECT employee_id, first_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

��ȸ�� NULL ���� ġȯ�ϴ� �Լ� : NVL(Null VaLue)�Լ�, DECODE �Լ�
NVL(�÷�,0) : ���� NULL �̸� 0���� ġȯ, �ƴϸ� �÷��� ��
DECODE(�÷�, A, 1, B, 2, 3) : �÷����� A�̸� 1, B�̸� 2, �װ͵� �ƴϸ� 3

1. �����Ͱ��� NULL �� ��� �ٸ� ������ ��ü�Ͽ� ��ȯ�ϴ� �Լ�
: NVL(���, NULL �϶� ��ȯ ǥ��) �� NULL VALUE, ����Ŭ������ ���
  NULL �϶� ��ȯ ǥ���� ������ Ÿ���� ����� ������ Ÿ�԰� ���ƾ� �Ѵ�.

desc employees;

Ŀ�̼� �ݾ��� 1000 �̸���
���, ��, �޿�, Ŀ�̼ǿ���, Ŀ�̼Ǳݾ� ��ȸ
Ŀ�̼Ǳݾ� = �޿� * Ŀ�̼ǿ���
SELECT employee_id, last_name, salary, commission_pct, salary*commission_pct comm
FROM employees
WHERE salary*commission_pct < 1000;

NVL ���
SELECT employee_id, last_name, salary, commission_pct, salary*NVL(commission_pct,0) comm
FROM employees
WHERE salary*NVL(commission_pct,0) < 1000;
     
���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ��ȸ
�ѱ޿� = �޿� + Ŀ�̼Ǳݾ� 
       = �޿� * (�޿� * Ŀ�̼ǿ���) 
       = �޿� * (1 + Ŀ�̼ǿ���) �� �޿� * (1 + NVL(Ŀ�̼ǿ���,0))

SELECT employee_id, last_name, salary, commission_pct,
       salary * (salary * NVL(commission_pct, 0)) total_salary 
       --salary * (1+ NVL(commission_pct, 0)) total_salary
FROM employees;

2. ������ ���� NULL �� ��� ��ȯ ǥ���� 
NULL �� �ƴ� ��� ��ȯ ǥ���� ���� ������ �� �ִ� ������ �Լ�
: NVL2(���, NULL�� �ƴ� ��� ��ȯ��, NULL �� ��� ��ȯ��)
: NVL2(���, ����� ���� ���� ��� ��ȯ��, ���� ���� ��� ��ȯ��) �ڡڡڡ�
  NULL �� ��� ��ȯǥ���� NULL �ƴ� ��� ��ȯǥ���� ������ Ÿ���� ���ƾ� �Ѵ�.
  NULL �� ��� ��ȯ Ÿ�� = NULL �ƴ� ��� ��ȯ Ÿ��

Ŀ�̼��� �޴� ����� �ѱ޿� = �޿� + Ŀ�̼Ǳݾ�
         ���� �ʴ� ����� �ѱ޿� = �޿���

���, ��, �޿�, Ŀ�̼ǿ���, �ѱ޿� ���� ��ȸ
SELECT employee_id, last_name, salary, commission_pct,
     --NVL(commission_pct, 'Ŀ�̼Ǳݾ׾���') type1,
       NVL(TO_CHAR(commission_pct,'0.00'),'Ŀ�̼Ǳݾ׾���') type2,
       
       NVL2(commission_pct, '�޿�+Ŀ�̼Ǳݾ�', '�޿�') type3,
       NVL2(commission_pct, 'salary+commission', 'salary') type4,
       NVL2(commission_pct, salary*(1+commission_pct), salary) type5
FROM employees;

�޿�, Ŀ�̼ǿ���, NVL ��� �ѱ޿�, NVL2 ��� �ѱ޿� ��ȸ.
SELECT salary, commission_pct, 
       salary + salary*NVL(commission_pct,0), --NVL���
       NVL2(commission_pct, salary + salary * commission_pct, salary), --NVL2���
       NVL2(commission_pct, salary * (1 + commission_pct), salary) --NVL2���
FROM employees;


3. �����Ͱ��� NULL �� ��� ��ü�ؼ� ��ȯ ǥ���� ���� �� ������ �� �ִ� ���� �Լ�
  : NULL �� �ƴ� ù��° �����͸� ��ȯ�ϴ� �Լ�
 COALESCE(���ǥ��, ��üǥ��1, ��üǥ��2, ��üǥ��3, ...) 
    �� COALESCE : ��ġ��, �����ϴ�, ��ü�ϴ�, �յ��ϴ�
 NULL �� NULL �Ǵ� ''�� ǥ��
 
SELECT COALESCE('a', '', NULL, 'd') n1,     /* a */
       COALESCE(NULL, 'b', NULL, 'd') n2,   /* b */
       COALESCE(NULL, '', 'c', 'd') n3,     /* c */
       COALESCE(NULL, '', NULL, 'd') n4,    /* d */
       COALESCE(NULL, '', NULL, '') n5      /* (null) */
FROM dual;
-----------------------------------------------------------------------------------------------
name    �޴���            ��                �繫��
ȫ�浿  010-1234-5678
��û                      062-1234-5678
����ġ                                      062-1234-5679
-----------------------------------------------------------------------------------------------
SELECT name, COALESCE(�޴���, ��, �繫��)  ����ó
FROM dual;
-----------------------------------------------------------------------------------------------
���
NAME       ����ó
ȫ�浿     010-1234-4567
��û       062-1234-5678
����ġ     062-1234-5679

-----------------------------------------------------------------------------------------------
[�������� 3-4]
���, ��, �μ��ڵ�, �����ڵ�, �Ի�����, �Ŵ����ڵ�, �Ŵ������翩��(NVL, NVL2 ���� ���) ��ȸ
�Ŵ������翩�δ� �� ����� ���� 

NVL�� �����ڰ� ������ manager_id�� �����ڰ� ������ '����'���� ǥ��,
NVL2��
����� ������(�Ŵ���)�� ������ '����' ����
       ������(�Ŵ���)�� ������ '����' ���� ��ȸ�ǰ� �Ѵ�.
       
SELECT  employee_id, last_name, department_id, job_id, hire_date, manager_id,
        NVL(manager_id, 0) manager_id2,
        --NVL(manager_id,'����') manager_id2, --����, ������ Ÿ���� NUMBER(6,0)
        NVL(TO_CHAR(manager_id),'����') manager_id3,
        NVL2(manager_id, '����', '����')  manager_exist1,
        NVL2(manager_id, 'Manager', 'No Manager') manager_exist2,
        NVL2(manager_id, 'O', 'X') manager_exist3
FROM employees;
-----------------------------------------------------------------------------------------------
desc employees;
-----------------------------------------------------------------------------------------------

