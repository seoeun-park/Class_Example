-----------------------------------------------------------------------------------------------
3. NON-EQUI JOIN
: �񱳿�����(<=, >=, <, >), ����������(BETWEEN), IN ������ ���� 
���� ������ (=) �̿��� �����ڸ� ����ϴ� JOIN �����̴�.
JOIN �ϴ� �÷��� ��ġ���� �ʰ� ����ϴ� JOIN �������� ���� ������� �ʴ´�.

01. employees, jobs ���̺��� �̿��Ͽ� --JOBS���̺� Ȯ��
�޿��� �ְ����� �޿� ���� ���� �ִ� 10�� �μ����� 
���, �̸�, �޿�, ���������� ��ȸ�Ѵ�.

SELECT  e.employee_id, e.last_name, 
        e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

-----------------------------------------------------------------------------------------------
4. OUTER JOIN : NULL ���� �����Ǵ� ������ �����ؼ� ǥ���ϱ� ���� ���� 
EQUI JOIN�� �������ǿ� ����񱳿����ڷ� ���� ����, 
��, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

������ OUTER JOIN �������� �����Ǵ� ���� ���� ����� ������� ��ȯ�Ѵ�.
�����Ǵ� ���� ���� ���̺� �÷��� (+) ��ȣ�� ǥ���Ѵ�.
��, ���������� ������ �߻����� �ʵ��� �ϱ� ���� ���α��
:��  �������ǽĿ��� (+)��ȣ�� ���������� ������ ���������ʿ� �ٿ��ش�.

������̺��� �μ���ġ ���� ���� ��� ��������(NULL)�� �ְ�
�μ����̺��� �μ��ڵ尡 NULL �ΰͿ� ���� ���������� �����Ƿ�
(�����Ͱ� ���� ���� �ִ� �� JOIN �÷��� (+)�� �߰�)
�μ����̺��� �μ��ڵ� �ʿ� OUTER ��ȣ�� ���δ�.

LEFT  OUTER JOIN : ��  �� ���̺� �������� NULL �����Ͽ� ��� ���(��ȣ�� �����ʿ� (+)�� ����)
RIGHT OUTER JOIN : ������ ���̺� �������� NULL �����Ͽ� ��� ���(��ȣ�� ��  �ʿ� (+)�� ����) 

-----------------------------------------------------------------------------------------------
������̺�(employees) �μ����̺�(departments(+))       ��ġ���̺�(locations(+))
��� �μ��ڵ�         �μ��ڵ�   �μ���    ��ġ�ڵ�    ��ġ�ڵ� �μ���ġ
100  10               10         ������    1600        1600     Seattle
101  20               20         �ѹ���    1700        1700     Paris
178  NULL             NULL       NULL      NULL        NULL     NULL     
-----------------------------------------------------------------------------------------------

01. ��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1; 

SELECT COUNT(job_id)
FROM jobs; --19

SELECT COUNT(DISTINCT job_id)
FROM employees; --19

02. ��� ����� ���, ��, �����ڵ�, �������� ��ȸ
SELECT  e.employee_id, e.last_name, 
        j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1; 

03. ��� ����� ���, ��, �μ���, �������� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_name, 
        j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1; 

04. ��� ����� ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;

05. ��� ����� ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        e.job_id, e.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1;
-----------------------------------------------------------------------------------------------
�ǽ�
01. ������ ����� 149�� ������� 
���, ��, �μ��ڵ�, �μ����� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;

02. ���� ��ҹ��� �����ϰ� a �� �ִ� ���� ���� ������� 
���, ��, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(last_name) LIKE '%a%';

03. Ŀ�̼��� �޴� ������� ���, ��, �μ���, ���ø� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL;

-----------------------------------------------------------------------------------------------
SELECT ���� ����� ALIAS ���̳� SELECT �������� ��ġ�� 
ORDER BY �������� ��� �� �� �ִ�.
: WHERE ��, GROUP BY ��, HAVING �������� 
  SELECT ����� �÷� ALIAS �� �÷��� ��ġ�� ����� �� ����.
-----------------------------------------------------------------------------------------------

04. �μ��� ������� ������ �ľ��ϰ��� �Ѵ�.
�μ��ڵ尡 60 �� ������ �μ��� ���� �μ��� ��ձ޿��� 5000 �̻��� �μ��� 
�μ��ڵ�, ��� ��, �޿��հ�, �޿����, �ִ�޿�, �����޿�, 
�ֱ��Ի�����, �����Ի����� ��ȸ
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal, 
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING AVG(salary) >= 5000 --HAVING department_id <= 60 AND AVG(salary) >= 5000
ORDER BY 1;

05. �������º��� ������� ������ �ľ��ϰ��� �Ѵ�.
�������º��� ��� ���� 10���̻��� �������¿� ����
�����ڵ�, �����������, ��������ձ޿�, �������ִ�޿�, �������ּұ޿�, 
�������ֱ��Ի�����, �����������Ի����� ��ȸ

SELECT job_id, COUNT(*) cnt, AVG(salary) avg_sal, 
       MAX(salary) max_sal, MIN(salary) min_sal, 
       MAX(hire_date) max_hire, MIN(hire_date) min_hire 
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 10;
-----------------------------------------------------------------------------------------------
