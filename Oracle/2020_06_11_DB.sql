--06. �μ��ڵ� 10,20,40,60�� �μ��� ���� �������
--���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ

SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name,
               j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
AND d.department_id IN(10, 20, 40, 60);

--JOIN ON
SELECT e.employee_id, e.last_name, 
               d.department_id, d.department_name,
               j.job_id, j.job_title
FROM employees e JOIN departments d
ON e.department_id = d.department_id(+)
JOIN jobs j
ON e.job_id = j.job_id
WHERE d.department_id IN(10, 20, 40, 60);

--JOIN USING 
SELECT e.employee_id, e.last_name, 
               department_id, d.department_name,
               job_id, j.job_title
FROM employees e JOIN departments d
USING (department_id)
JOIN jobs j
USING (job_id)
WHERE department_id IN(10, 20, 40, 60);

-----------------------------------------------------------------------------------------------
--�ǽ� ANSI JOIN ���� --INNER ���θ�
--01. ���, ��, �μ��ڵ�, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               l.location_id, l.city 
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+);

-- ����Ŭ JOIN���� (+)�� ����� ANSI JOIN������ LEFT JOIN/RIGHT JOIN�� ��ü�Ѵ�.
SELECT e.employee_id, e.last_name, d.department_id, d.department_name,
               l.location_id, l.city 
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

SELECT e.employee_id, e.last_name, department_id, d.department_name,
               location_id, l.city 
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id);


--02. ����� 110, 130, 150 �� ������� ���, ��, �μ��� ��ȸ�ϴ� ANSI��������
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.employee_id IN(110, 130, 150);

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
WHERE e.employee_id IN(110, 130, 150);

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.employee_id IN(110, 130, 150);


--03. ���, ����, �����ڻ��, ������ ����, �����ھ����ڵ� ��ȸ�ϴ� ANSI ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
               m.employee_id, m.first_name || ' ' || m.last_name m_name,
               m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.employee_id, e.first_name || ' ' || e.last_name e_name,
               m.employee_id, m.first_name || ' ' || m.last_name m_name,
               m.job_id
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id(+);



--04. ���� king �� ����� ���, ����, �μ��ڵ�, �μ��� ANSI ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.last_name = 'King';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name = 'King';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                department_id, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.last_name = 'King';


--05. ������ ����� 149 ���� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) 
AND e.manager_id = 149;

SELECT e.employee_id, e.last_name, d.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;

SELECT e.employee_id, e.last_name, department_id, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE e.manager_id = 149;


--06. ��ġ�ڵ� 1400�� ���ø�, �μ��� ��ȸ
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE l.location_id = d.location_id
AND l.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
ON l.location_id = d.location_id
WHERE l.location_id = 1400;

SELECT l.city, d.department_name
FROM locations l JOIN departments d
USING (location_id)
WHERE location_id = 1400;


--07. ��ġ�ڵ� 1800�� �ٹ��ϴ� ������� ���, ��, �����ڵ�, �μ���, ��ġ�ڵ� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.location_id
FROM locations l, departments d, employees e
WHERE e.department_id = d.department_id(+)
AND  l.location_id(+) = d.location_id
AND l.location_id = 1800;

SELECT e.employee_id, e.last_name, d.department_name, l.location_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
LEFT JOIN locations l
ON  l.location_id(+) = d.location_id
WHERE l.location_id = 1800;

SELECT e.employee_id, e.last_name, d.department_name, location_id
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING  (location_id)
WHERE location_id = 1800;


--08. ���� ��ҹ��� �����ϰ� z�� �ִ� ������� ���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
WHERE LOWER(e.last_name) LIKE '%z%';

SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
USING (department_id)
WHERE LOWER(e.last_name) LIKE '%z%';



--09. �����ں��� ���� �Ի��� ����� ���, ��, �Ի�����, 
--    �����ڻ��, �����ڼ�, �������Ի����� ��ȸ
SELECT e.employee_id, e.last_name, e.hire_date,
                m.employee_id, m.last_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+);

SELECT e.employee_id, e.last_name, e.hire_date,
                m.employee_id, m.last_name, m.hire_date
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id;


--10. �����ڵ尡 clerk������ ���������� ������� ���, ��, �μ���, �������� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id(+)
AND e.job_id = j.job_id
AND LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+)
LEFT JOIN jobs j
ON e.job_id = j.job_id
WHERE LOWER(e.job_id) LIKE '%clerk%';

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN jobs j
USING (job_id)
WHERE LOWER(job_id) LIKE '%clerk%';


--11. toronto �� �ٹ��ϴ� ���, ��, �μ��ڵ�, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND LOWER(l,city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, d.department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE LOWER(l.city) LIKE '%toronto%';

SELECT e.employee_id, e.last_name, department_id, d.department_name, l.city
FROM employees e LEFT JOIN departments d
USING (department_id)
LEFT JOIN locations l
USING (location_id)
WHERE LOWER(l.city) LIKE '%toronto%';


-----------------------------------------------------------------------------------------------
--�ǽ�
--01. ��� ����� ���, ��, �μ��� ��ȸ --LEFT JOIN, RIHGT JOIN 2����
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.last_name, d.department_name
FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id;


--02. ��� ����� ���, ��, �μ���, ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;

SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM departments d RIGHT JOIN employees e
ON e.department_id = d.department_id
LEFT JOIN jobs j
ON e.job_id = j.job_id;


--03. ��� ����� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;


SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM departments d RIGHT JOIN employees e 
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;


--04. �����ڻ���� 149���� ��� ����� ���, ��, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.manager_id = 149;


--05. Ŀ�̼��� �޴� ��� ������� ���, ��, �μ���, ���ø� ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

SELECT e.employee_id, e.last_name, d.department_name, l.city
FROM departments d RIGHT JOIN employees e 
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;


--06. ��� �μ��� ���� �μ��ڵ�, �μ���, ���ø�, ������, ����� ��ȸ
SELECT d.department_id, d.department_name, l.city, c.country_name, r.region_name
FROM departments d JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
JOIN regions r
ON c.region_id = r.region_id;


--07. ������� �ٹ��ϴ� �μ��� �� �μ��� ����� �� ���̳� �ֳ� �ľ��ϰ��� �Ѵ�.
--    �μ��ڵ�, �μ���, ����� ��ȸ
SELECT d.department_id, d.department_name, COUNT(*) cnt
FROM departments d
GROUP BY d.department_id, d.department_name;

    
--[�������� 5-2]
--01. ����� 110, 130, 150 �� �������
--    ���, �̸�, �μ��� ��ȸ�ϴ� ����Ŭ ���� �� ANSI��������
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

SELECT e.employee_id, e.first_name, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id(+);

--02. ������� ���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ, ��������� ����    
SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY 1;

SELECT e.employee_id, e.last_name, e.department_id, j.job_id, j.job_title
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
ORDER BY 1;


-----------------------------------------------------------------------------------------------
