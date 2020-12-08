--SELF JOIN : ������ ���̺��� ���� �� �غ��Ͽ� ���̺� ������ �ϴ� SELF JOIN

--01. ��� ����� ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸� ������ ��ȸ
SELECT e.employee_id, 
               e.first_name, 
               e.manager_id manager_1,
               NVL(e.manager_id, 0) manager_2,
               NVL(TO_CHAR(e.manager_id), '�Ŵ��� ����') manager_3,
               NVL2(e.manager_id, TO_CHAR(e.manager_id), '�Ŵ��� ����') manager_4,                    
               m.first_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

-----------------------------------------------------------------------------------------------
--[ �������� 5-1 ]                                                                             
--01. �̸��� �ҹ��� v�� ���Ե� ��� ����� ���, �̸�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.first_name LIKE '%v%'
AND e.department_id = d.department_id(+);


--02. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼� �ݾ�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
--��, Ŀ�̼� �ݾ��� ���޿��� ���� Ŀ�̼� �ݾ��� ��Ÿ����.
SELECT e.employee_id, e.first_name, e.salary,
               e.salary * NVL(e.commission_pct, 0) com,
               d.department_name
FROM employees e, departments d
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id(+);



--03. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, �������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT d.department_id, d.department_name,
                l.location_id, l.city, l.country_id,
                c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.coutry_id = c.country_id;


--04. ����� ���, �̸�, �����ڵ�, �Ŵ����� ���, �Ŵ����� �̸�, �Ŵ����� �����ڵ带 ��ȸ�Ͽ� 
--����� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT e.manager_id, e.first_name, e.job_id,
               e.employee_id, m.first_name, m.job_id 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;




--05. ��� ����� ���, �̸�, �μ���, ����, �ּ� ������ ��ȸ�Ͽ� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, 
               d.department_name,
               l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


-----------------------------------------------------------------------------------------------
--�ǽ�
--01. ��� ����� ���, ����, �����ڵ�, �Ŵ������, �Ŵ�������, �Ŵ����� �����ڵ� ��ȸ�Ͽ�
--��� ������ ���� --SELF JOIN
SELECT e.employee_id,  e.first_name || ' ' || e.last_name e_name, 
                e.job_id, e.manager_id,
                m.first_name || ' ' || m.last_name m_name,
                m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;


--02. ���� King�� ������� ���, ����, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.last_name = 'King'
AND e.department_id = d.department_id(+);


--03. ��ġ�ڵ尡 1400 �� ���ÿ��� ��� �μ��� �ֳ� �ľ��ϰ��� �Ѵ�.
--��ġ�ڵ尡 1400 �� ���ø�, �μ��� ��ȸ
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id
AND l.location_id = 1400;


--04. ��ġ�ڵ� 1800 �� ���� �ٹ��ϴ� �������
--���, ����, �����ڵ�, �޿�, �μ���, ��ġ�ڵ� ��ȸ
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
               e.job_id, e.salary,
               d.department_name, d.location_id
FROM employees e, locations l, departments d
WHERE  l.location_id = 1800
AND e.department_id = d.department_id(+);


--05. �ڽ��� �Ŵ������� ���� �Ի��� ������� 
--���, ����, �Ի�����, �Ŵ�������, �Ŵ��� �Ի����� ��ȸ --SELF JOIN
SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
                e.hire_date,
                m.first_name || ' ' || m.last_name m_name,
                m.hire_date
FROM employees e, employees m
WHERE e.hire_date < m.hire_date
AND e.manager_id = m.employee_id(+);


--06. toronto �� �ٹ��ϴ� �������
--���, ��, �����ڵ�, �μ��ڵ�, �μ���, ���� ��ȸ
SELECT e.employee_id, e.last_name, e.job_id,
               d.department_id, d.department_name,
               l.city
FROM employees e, departments d, locations l
WHERE LOWER(l.city) LIKE 'toronto'
AND e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


--07. Ŀ�̼��� �޴� ��� ������� ��, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.commission_pct IS NOT NULL
AND e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);


-----------------------------------------------------------------------------------------------

--ANSI JOIN : ���� ǥ�� JOIN ����
--SELECT �÷���1, �÷���2...
--FROM ���̺��1 INNER JOIN ���̺�� 2
--ON �������ǽ� WHERE �Ϲ�����       �Ǵ�
--USING (�����÷���) WHERE �Ϲ�����

--01. �μ��ڵ尡 60���� ���, ��, �μ��ڵ�, �μ��� ��ȸ

--����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.department_id = 60
ORDER BY 1;

--ANSI ���� : JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e JOIN departments d
--FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id = 60
ORDER BY 1;

--ANSI ���� : JOIN USING
-- USING �� ���� �÷����� SELECT, WHERE������ ���̺���� ����ؼ��� �ȵȴ�.
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e JOIN departments d
USING (department_id)
WHERE department_id = 60
ORDER BY 1;

--02. ���, ��, �����ڵ�, �������� ��ȸ(ANSI �������� �ۼ��϶�)
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id);

--03. ���� �ڵ尡 clerk ���� ���� ���¸� ������ �ִ� ����� ���, ��, �����ڵ�, �������� ��ȸ
--ANSI �������� �ۼ��϶�
SELECT e.employee_id, e.last_name, 
               j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, 
               job_id, j.job_title
FROM employees e JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%';

--04. �츮 ȸ�� �μ� ������ �ľ��ϰ��� �Ѵ�.
--�μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT d.department_id, d.department_name, l.location_id, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id;

SELECT d.department_id, d.department_name, location_id, l.city
FROM departments d JOIN locations l
USING (location_id);

