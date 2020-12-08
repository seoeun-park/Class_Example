
--01. employees, jobs ���̺��� �̿��Ͽ�
--�޿��� �ְ�, ���� �޿� ���� ���� �ִ� 10�� �μ�����
--���, �̸�, �޿�, ���� ������ ��ȸ�Ѵ�.
SELECT e.employee_id, e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
--AND e.salary BETWEEN MIN(salary) AND MAX(salary)      
--���� : where ���ǹ� �ȿ��� min/max�� �� �� ����
AND e.salary BETWEEN j.min_salary AND j.max_salary
AND e.department_id = 10;

--OUTER JOIN : NULL ���� �����Ǵ� ������ �����ؼ� ǥ���ϱ� ���� ����
--�����Ǵ� ���� ���� ����� ������� ��ȯ�Ѵ�. ��, NULL������ ��ȯ
--�׷��� ���������� ������ �߻����� �ʵ��� ������ ���� ������ ���������ʿ� + ��ȣ�� ���δ�.

--01. ��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);        --106�� �� ��ȸ(NULL�� ����)
--employees ���̺� �����ȣ�� 178���� ����� �μ��ڵ尡 null�̹Ƿ�
--���� ���� �� department�� + ��ȣ�� ���δ�.

--02.��� ����� ���, ��, �����ڵ�, �������� ��ȸ
SELECT  e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id;          --null���� �����Ƿ� outer join�� �ʿ� x

--03.��� ����� ���, ��, �μ���, �������� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
ORDER BY 1;

--04.��� ����� ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name, 
               l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND  l.location_id(+) = d.location_id                 
--�� �� null���� �����Ƿ� outer join�� �ʿ䰡 ������ �̹� departments ���̺� �ʿ� +�� �پ����Ƿ�
--�ٸ� �������ǽĿ� departments ���̺��� ���ԵǾ��ٸ�
--departments�� �ٸ� ���� ����࿡��  +�� �ٿ��� �Ѵ�.
ORDER BY 1;

--05. ��� ����� ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT e.department_id, e.last_name, d.department_id, 
                d.department_name,
                j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id;

---------------------------------------------------------------------------------------------------
--�ǽ�

--01. ������ ����� 149�� ������� 
--���, ��, �μ��ڵ�, �μ����� ��ȸ
SELECT e.manager_id, e.last_name,
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id = 149;


--02. ���� ��ҹ��� �����ϰ� a �� �ִ� ���� ���� ������� 
--���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%a%';



--03. Ŀ�̼��� �޴� ������� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name,
                d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND l.location_id(+) = d.location_id
AND e.commission_pct IS NOT NULL;


-----------------------------------------------------------------------------------------------
--SELECT ���� ����� ALIAS ���̳� SELECT �������� ��ġ�� 
--ORDER BY �������� ��� �� �� �ִ�.
--: WHERE ��, GROUP BY ��, HAVING �������� 
--  SELECT ����� �÷� ALIAS �� �÷��� ��ġ�� ����� �� ����.
-----------------------------------------------------------------------------------------------

--04. �μ��� ������� ������ �ľ��ϰ��� �Ѵ�.
--�μ��ڵ尡 60 �� ������ �μ��� ���� �μ��� ��ձ޿��� 5000 �̻��� �μ��� 
--�μ��ڵ�, ��� ��, �޿��հ�, �޿����, �ִ�޿�, �����޿�, 
--�ֱ��Ի�����, �����Ի����� ��ȸ
SELECT department_id, COUNT(*) cnt, SUM(salary) sum_sal,
               ROUND(AVG(salary), 2) avg_sal,
               MAX(salary) max_sal, MIN(salary) min_sal,
               MAX(hire_date) max_hire, MIN(hire_date) min_hire
FROM employees
WHERE department_id <= 60
GROUP BY department_id
HAVING ROUND(AVG(salary), 2) >= 5000
ORDER BY 1;


--05. �������º��� ������� ������ �ľ��ϰ��� �Ѵ�.
--�������º��� ��� ���� 10���̻��� �������¿� ����
--�����ڵ�, �����������, ��������ձ޿�, �������ִ�޿�, �������ּұ޿�, 
--�������ֱ��Ի�����, �����������Ի����� ��ȸ
SELECT j.job_id, COUNT(j.job_id), ROUND(AVG(e.salary), 2) avg_sal,
               j.max_salary, j.min_salary,  
               jh.end_date, jh.start_date
FROM employees e, jobs j, job_history jh
WHERE e.job_id = j.job_id
AND  j.job_id =  jh.job_id
GROUP BY j.job_id, j.max_salary, j.min_salary,jh.end_date, jh.start_date
HAVING COUNT(j.job_id) >= 10
ORDER BY 1;

----------------------------------------------------------------------------------------------------------

--SELF JOIN


-- employees��manager_id �� employees�� employee_id�� ��Ī���� employees�� firstname�� ������
-- manager_name���� ���ο� ������ ���� �����͸� ����


--01. ��� ����� ���, �̸�, �Ŵ������, �Ŵ��� �̸� ������ ��ȸ
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
-- employees ���̺��� manager_id�� null�� �����Ƿ� outer join�� �ؾ� ��
ORDER BY 1;

