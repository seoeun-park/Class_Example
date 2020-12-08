
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DY HH24:MI:SS') d1,
                TO_CHAR(SYSDATE, 'RRRR MON DD') d2,
                TO_CHAR(SYSDATE, 'YY-MM-DD') d3,
                TO_CHAR(SYSDATE, 'RR-MM-DD') d4, 
                TO_CHAR(SYSDATE, 'RR-MM-DD HH:MI:SS') d5,
                TO_CHAR(SYSDATE, 'RR-MM-DD HH24:MI:SS') d6,
                TO_CHAR(SYSDATE, 'YY-MM-DD DAY') d7,
                TO_CHAR(SYSDATE, 'YY-MM-DD DY') d8
FROM dual;

-- TO_DATE�� TO_CHAR�� ������
-- TO_CHAR�� ���� ���ϴ� ��¥ ��� ����� �״�� ����� �� ������
-- TO_DATE�� ��¥ ��� ����� �����ϴ��� RR/MM/DD �������� ���
-- �׸��� TO_CHAR�� TO_CHAR('2020-04-20', 'RR/MM/DD')�� ����
-- TO_CHAR�� ���Ǵ�� �ۼ��� ��¥�� ��ȯ�� �ȵǰ�, SYSDATE�� ��ȯ�� �����ϴ�.

-- ��� ���̺��� 30�� �μ��� ���, ����, �޿�, �ٹ�������, �ٹ������ ��ȸ
--��, �ٹ� ���� ���� ���� ��¥�� �������� ��¥ �Լ��� ���
SELECT employee_id, first_name || ' ' || last_name name, salary, 
                FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) work_months,
                FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) work_years
FROM employees;

--�޿��� 12000 �̻��� ������� ���, ����, �޿��� ��ȸ�Ͽ� �޿������� �����Ѵ�.
--�޿��� ������� õ������ ��ȣ�� ����Ͽ� ǥ���Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name,
                TRIM(TO_CHAR(salary, '999,999,999')) salary
                --TRIM(���ڿ�) -> �� ���� ������ �ڸ�
FROM employees
WHERE salary >= 12000
ORDER BY salary;

--2005�� ��(2004�����)�� �Ի��� ������� ���, ����, �Ի�����, �Ի����� ������ ��ȸ�Ͽ�
-- �ֱٿ� �Ի��� ��������� �����Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name, hire_date,
               TO_CHAR(hire_date, 'DY') hire_day 
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') < 2005
ORDER BY hire_date DESC;

-- Ŀ�̼� �ݾ��� 1000 �̸��� ����� ���, �̸� �޿�, Ŀ�̼� ����, Ŀ�̼� �ݾ��� ��ȸ
-- Ŀ�̼� �ݾ� = Ŀ�̼� ���� * �޿�
SELECT employee_id, first_name, salary, commission_pct,
               salary * commission_pct
               -- Ŀ�̼� ������ NULL���� ���� ����(NULL�� ������ �ȵǱ� ������)
FROM employees
WHERE salary * commission_pct < 1000;

-- ��ȸ�� NULL���� ġȯ�ϴ� �Լ� : NVL(Null VaLue)�Լ�, DECODE �Լ�
-- NVL(�÷�, 0) : ���� NULL�̸� 0���� ġȯ
-- ù��° �μ��� �ι�° �μ��� ������ Ÿ���� ���ƾ� ��
--DECODE(�÷�, A, 1, B, 2, 3) : �÷����� A�̸� 1, B�̸� 2, �װ͵� �ƴϸ� 3���� ġȯ
SELECT employee_id, first_name, salary, commission_pct,
               salary * NVL(commission_pct, 0)
FROM employees
WHERE salary * NVL(commission_pct, 0) < 1000;

--���, ��, �޿�, Ŀ�̼� ����, �ѱ޿� ��ȸ
--�ѱ޿� = �޿� + Ŀ�̼� �ݾ�
SELECT employee_id, last_name, salary, commission_pct,
                salary + salary * NVL(commission_pct, 0) total_salary1,
                salary * (1+  NVL(commission_pct, 0)) total_salary2                
FROM employees;

-- NVL2(���, NULL�� �ƴ� ��� ��ȯ��, NULL�� ��� ��ȯ��)
--  �ι�° �μ��� ����° �μ��� ������ Ÿ���� ������ �ȴ�.
-- Ŀ�̼� ������ NULL�� ��� �� �޿��� �޿� + Ŀ�̼� �ݾ��� ��ȯ
-- Ŀ�̼� ������ NULL�� �ƴ� ��� �� �޿��� �޿��� ��ȯ

SELECT employee_id, last_name, salary, commission_pct,
               NVL(commission_pct, 0) type1,
               NVL(TO_CHAR(commission_pct, '0.00'), 'Ŀ�̼� ����') type2,
               NVL2(commission_pct, 'salary+commission', 'salary') type3,
               NVL(commission_pct, salary(1 + commission_pct), salary) type4
FROM employees;

--�޿�, Ŀ�̼� ����, NVL ��� �ѱ޿�, NVL2 ��� �ѱ޿�
SELECT employee_id, last_name, salary, commission_pct,
               salary * (1 +  NVL(commission_pct, 0)) "NVL ��� �ѱ޿�",
               NVL2(commission_pct, salary * (1 +  commission_pct), salary) "NVL2 ��� �ѱ޿�"               
FROM employees;

--COALESCE(���ǥ��, ��üǥ��1, ��üǥ��2, ��üǥ��3)
SELECT name, COALESCE(�޴���, ��, �繫��) ����ó
FROM dual;

--���, ��, �μ��ڵ�, �����ڵ�, �Ի�����, �Ŵ����ڵ�, �Ŵ������翩�� ��ȸ
--NVL�� manager_id�� �����ڰ� ������ '����'���� ǥ��,
--NVL2�� ����� ������(�Ŵ���)�� ������ '����'����, ������ '����'���� ��ȸ
SELECT employee_id, last_name, department_id, job_id, hire_date, 
                NVL(TO_CHAR(manager_id), '����') manager_id,
                NVL2(manager_id, '����', '����') "NVL2"
FROM employees;


--DECODE �� ����
SELECT employee_id, last_name, department_id, salary,
                DECODE(department_id, 10, salary * 0.1,
                                                          20, salary * 0.2,
                                                          30, salary * 0.3, salary * 0.05 ) bonus
FROM employees;

-- CASE WHEN THEN ELSE�� ���� (1)
SELECT employee_id, last_name, department_id, salary,
                CASE department_id WHEN 10 THEN salary * 0.1
                                                   WHEN 20 THEN salary * 0.2
                                                   WHEN 30 THEN salary * 0.3
                                                   ELSE salary * 0.05 
                END bonus
FROM employees;

-- CASE WHEN THEN ELSE�� ���� (2)
SELECT employee_id, last_name, department_id, salary,
                CASE WHEN department_id = 10 THEN salary * 0.1
                           WHEN department_id = 20 THEN salary * 0.2
                           WHEN department_id = 30 THEN salary * 0.3
                           ELSE salary * 0.05 
                END bonus
FROM employees;


-- ������� ���, �̸�, �����ڵ�, ������� ��ȸ
-- ��������� �����ڵ忡 ���� �з��Ѵ�
--DECODE �� CASE~END ����Ͽ� ��ȸ

--�����ڵ�    �������
--AD_PRES      A
--ST_MAN       B
--IT_PROG      C
--SA_REP       D
--ST_CLERK     E
--�� ��        X

SELECT employee_id, first_name, job_id, 
               DECODE(job_id, 'AD_PRES', 'A',
                                            'ST_MAN', 'B',
                                            'IT_PROG', 'C',
                                            'SA_REP ', 'D',
                                            'ST_CLERK', 'E', 'X') "�������"
FROM employees;

SELECT employee_id, first_name, job_id,
               CASE WHEN job_id =  'AD_PRES' THEN 'A'
                          WHEN job_id =  'ST_MAN' THEN 'B'
                          WHEN job_id =  'IT_PROG' THEN 'C'
                          WHEN job_id =  'SA_REP' THEN 'D'
                          WHEN job_id =  'ST_CLERK' THEN 'E'
                          ELSE 'X'
               END "�������"           
FROM employees;





