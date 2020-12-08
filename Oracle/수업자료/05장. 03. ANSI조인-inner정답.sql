-----------------------------------------------------------------------------------------------
01. ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
����Ŭ ����
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

JOIN ON
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name,
        l.location_id, l.city
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l  
ON d.location_id = l.location_id;

JOIN USING
SELECT  e.employee_id, e.last_name, 
        department_id, d.department_name,
        location_id, l.city
FROM  employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l  
USING (location_id);

02. ����� 110, 130, 150 �� �������
���, ��, �μ��� ��ȸ�ϴ� ANSI��������
����Ŭ ����
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (110, 130, 150);

JOIN ON
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE employee_id IN (110, 130, 150);

JOIN USING
SELECT  e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE employee_id IN (110, 130, 150);

03. ���, ����, �����ڻ��, �����ڼ���, �����ھ����ڵ� ��ȸ�ϴ� ANSI ����
����Ŭ ����
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id 
FROM employees e, employees m
WHERE e.manager_id = m.employee_id;

JOIN ON�� ����, JOIN USING ��� �Ұ�
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, 
       e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, 
       m.job_id
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id;

04. ���� king �� ����� 
���, ����, �μ��ڵ�, �μ��� ANSI ����
����Ŭ ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) = 'king';

JOIN ON
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) = 'king';

JOIN USING
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) = 'king';

05. ������ ����� 149 ���� ����� 
���, ��, �μ��ڵ�, �μ��� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.manager_id = 149;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

JOIN USING
SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;

06. ��ġ�ڵ� 1400�� ���ø�, �μ��� ��ȸ
����Ŭ ����
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id
AND d.location_id = 1400;

JOIN ON
SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
ON d.location_id = l.location_id
WHERE d.location_id = 1400;

JOIN USING
SELECT l.city, d.department_name
FROM locations l INNER JOIN departments d
USING (location_id)
WHERE location_id = 1400;

07. ��ġ�ڵ� 1800�� �ٹ��ϴ� ������� 
���, ��, �����ڵ�, �μ���, ��ġ�ڵ� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND location_id = 1800;

JOIN ON
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE location_id = 1800;

JOIN USING
SELECT e.employee_id, e.last_name, e.job_id, d.department_name, d.location_id
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE location_id = 1800;

08. ���� ��ҹ��� �����ϰ� z�� �ִ� ������� 
���, ��, �μ��� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%';

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE LOWER(last_name) LIKE '%z%';

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e INNER JOIN departments d
USING (department_id)
WHERE LOWER(last_name) LIKE '%z%';

09. �����ں��� ���� �Ի��� ����� 
���, ��, �Ի�����, �����ڻ��, �����ڼ�, �������Ի����� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

JOIN ON �� ��� ����, JOIN USING ��� �Ұ�
SELECT e.employee_id, e.last_name, e.hire_date, e.manager_id, 
       m.last_name, m.hire_date
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

10. �����ڵ尡 clerk ������ ���������� �������
���, ��, �μ���, �������� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

JOIN ON
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM  employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%'
ORDER BY 1;

JOIN USING
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e INNER JOIN departments d
USING (department_id)--ON e.department_id=d.department_id
INNER JOIN jobs j 
USING (job_id)--ON j.job_id=e.job_id
WHERE LOWER(job_id) LIKE '%clerk%'
ORDER BY 1;

--USING ���� ON�� ��� �ᵵ �������. 

ON ���� ����� ������ �̸��� �÷��� ���ؼ��� �ݵ�� ���̺���� ����Ѵ�.
USING ���� ����� �÷��� ���ؼ��� ����� ���̺���� ����ϸ� �ȵȴ�.

11. toronto �� �ٹ��ϴ�
���, ��, �μ��ڵ�, �μ���, ���ø� ��ȸ
����Ŭ ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';
JOIN ON
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

JOIN USING
SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
USING (department_id)
INNER JOIN locations l
USING (location_id)
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';

JOIN ON �� JOIN USING ȥ�� ��뵵 ����
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l
USING (location_id)--d.location_id=l.location_id
WHERE LOWER(city) = 'toronto';
    --WHERE LOWER(city) LIKE '%toronto%';
-----------------------------------------------------------------------------------------------