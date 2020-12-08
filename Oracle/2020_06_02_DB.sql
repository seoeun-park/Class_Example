--�μ��ڵ尡 60, 80, 100�� �μ��� ���� �������
--���, ��, ��ȭ��ȣ, ������ȣ, ���ι�ȣ ��ȸ
SELECT employee_id, department_id, last_name, phone_number, 
               SUBSTR(phone_number, 1, INSTR(phone_number, '.') - 1) "������ȣ",
               --(1 ~ �տ������� ù��° .�� �ִ� ��ġ���� �� �ڸ��� ��) ���� ���
               SUBSTR(phone_number, INSTR(phone_number, '.', -1) + 1) "���ι�ȣ"
               -- �ڿ������� ù��° .�� �ִ� ��ġ���� �� �ڸ��� �ڱ��� ��� ���ڸ� ���
FROM employees
WHERE department_id IN(60, 80, 100);

--���ڿ����� Ư�� ���ڿ��� ã�� �ٸ� ���ڿ��� �ٲ� ��ȯ�ϴ� �Լ� : REPLACE
SELECT REPLACE('You are not alone', 'You', 'We')    REP1,
               REPLACE('You are not alone', 'not')              REP2,
               REPLACE('You are not alone', 'not', null)     REP3
FROM dual;

SELECT TRANSLATE('You are not alone', 'You', 'We')    S1    --We are net alene
FROM dual;

--�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ��ĸ� ���� ���� �𸣴µ� ���� ���� �˰ڳķ� �����ϱ�
SELECT REPLACE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��') "TRANSLATE ��������"
FROM dual;

SELECT TRANSLATE('�ʴ� ���� �𸣴µ� ���� �ʸ� �˰ڴ���', '��', '��') "TRANSLATE ��������"
FROM dual;

--��¥ �Լ�
--��¥ +/- ����     -> ��¥
--��¥ - ��¥        -> ����
SELECT SYSDATE+1 tommorrow,
               SYSDATE-1  yesterday 
FROM dual;

SELECT SYSTIMESTAMP     --�и� �ʱ���
FROM dual;

--Ư�� ��¥�κ��� �� ���� ��/���� ��¥�� ��ȯ�ϴ� �Լ�
SELECT ADD_MONTHS(SYSDATE, 6)       after6M,
               ADD_MONTHS(SYSDATE, -3)      before3M
FROM dual;

--���� ��¥ - ������¥ : ���� ���� ����
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/04/20'), 1) diff
FROM dual;

--���� �����Ϻ��� ���ñ����� ���� ���� ������ �������� ���� ���� ���� �˾ƺ���
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, '20/04/20'), 1) PASSED,
                TRUNC(MONTHS_BETWEEN('20/10/08', SYSDATE), 1) REMAINED
FROM dual;

--����� 100���� ����� ���, ��, �Ի�����, �ٹ�������, �ٹ���� ��ȸ
-- �ٹ� ���� ��, �ٹ� ����� ������ ���ִɷ� ����Ͽ� ������ ǥ��
SELECT employee_id, last_name, hire_date,
               TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)) "�ٹ� ���� �� : TRUNC",
               FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)) "�ٹ� ���� �� : FLOOR",
               TRUNC(MONTHS_BETWEEN(SYSDATE, hire_date)/12) "�ٹ� �� �� : TRUNC",
               FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date)/12) "�ٹ� �� �� : FLOOR"
FROM employees
WHERE department_id = 100;

--9�� ���������� ���
SELECT LAST_DAY(ADD_MONTHS(SYSDATE, 3)) "last day"
FROM dual;

--�ش� ��¥ ������ ��¥ �߿��� char�� ��õ� ���Ͽ� �ش��ϴ� ù��° ��¥�� ��ȯ
SELECT NEXT_DAY(SYSDATE, '������') NEXT1,
               NEXT_DAY(SYSDATE, '�ݿ���') NEXT2, 
               NEXT_DAY(SYSDATE, '��')        NEXT3,
               NEXT_DAY(SYSDATE, 4)           NEXT4     --4�� ������
FROM dual;

SELECT 123456                                                   N,
                TO_CHAR(123456, '999999')               N1,
                TO_CHAR(123456, '999999999')         N2,
                TO_CHAR(123456, '9999')                   N3,
                TO_CHAR(123456, '999,999,999')       N4,
                TO_CHAR(123456, '099,999,999')       N5
FROM dual;






