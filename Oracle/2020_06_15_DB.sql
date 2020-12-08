--���� ����(Sub Query)

--01. �޿��� �츮 ȸ�� ��� �޿����� �� ���� �޿��� �޴� �����
--���, �̸�, ��, �޿� ������ ��ȸ
SELECT AVG(salary)
FROM employees;
--��� : 6461.831775700934579439252336448598130841

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary <= 6461.831775700934579439252336448598130841;

--SELECT employee_id, first_name, last_name, salary
--FROM employees
--HAVING salary <= AVG(salary) ;
-- ����

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary <= (SELECT AVG(salary)
                                FROM employees);
                                
-- �Ϲ� ���� ����
-- ���� �������ȿ� �ִ� �� �ٸ� ������(WHERE/HAVING������ ���)
-- �Լ��� ���� ���� ���� �� ���



--02. �츮 ȸ�翡�� ���� ���� �޿��� �޴� �����
-- ���, ��, ��, �޿� ��ȸ
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) 
                             FROM employees);
            
            
--03. ��� 150�� ������� �� ���� �޿��� �޴� �������
--���, ��, �μ��ڵ�, �����ڵ�, �޿���ȸ
SELECT employee_id, last_name, department_id, job_id, salary
FROM employees
WHERE salary > (SELECT salary
                             FROM employees
                             WHERE employee_id = 150);
                             
--04. ���޿��� ���� ���� ����� ���, �̸�, ��, �������� ������ ��ȸ
SELECT e.employee_id, e.first_name, e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND salary = (SELECT MAX(salary) FROM employees);

--05. ������� �޿��� �츮 ȸ�� ��ձ޿� �̻� �ְ� �޿� ���Ͽ� �ش��ϴ� ������� ���, ��, �޿� ��ȸ
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN (SELECT AVG(salary) FROM employees) 
                         AND(SELECT MAX(salary) FROM employees);

--06. �츮 ȸ�翡�� ���� ���� �޿��� �޴� �����
--���, ��, �����ڵ�, �μ��ڵ�, �μ���, �޿� ��ȸ
SELECT e.employee_id, e.last_name, e.job_id, 
               d.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND salary = (SELECT MIN(salary) FROM employees);

--02. �μ����� Marketing�� �μ��� ���� �������
-- ���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
               d.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.department_name = 'Marketing';

-- �� ������ ���������� �̿��� ��ȸ�� �ʿ�� ������ 
-- ���� �ٸ� ���̺��� ���� ������ ��쿡�� ���������� �̿��ؼ� ���ؾ� �Ѵ�.
SELECT employee_id, first_name || ' ' || last_name name,
               department_id, job_id
FROM employees e
WHERE department_id = (SELECT department_id 
                                              FROM departments 
                                              WHERE department_name =  'Marketing');
                                              
                                
--�츮 ȸ�� ����Ժ��� ���� �Ի��� ������� ���, ����, �Ի����� ��ȸ
--������ �׸� �����ϴ� �Ŵ����� ���� ����� ���Ѵ�.

--���� ����
SELECT employee_id, first_name || ' ' || last_name name,
               hire_date
FROM employees
WHERE hire_date < (SELECT hire_date 
                                    FROM employees 
                                    WHERE manager_id IS NULL);

--INNER JOIN(���� ���̺��� ��� ������ ���)
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                e.hire_date
FROM employees e, employees m
WHERE e.hire_date < m.hire_date
AND m.manager_id IS NULL;

--�μ��� ��ġ�ڵ尡 1700 ��(1700�� �ƴ�) �μ��� ���� �������
--���, ����, �μ��ڵ�, �����ڵ� ��ȸ

--�Ϲ� ����
SELECT e.employee_id, e.first_name || ' ' ||  e.last_name name,
                e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id = 1700;

--���� ����
SELECT employee_id, first_name || ' ' ||  last_name name,
                department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id 
                                            FROM departments 
                                            WHERE location_id = 1700);
                                                                                       
-- �츮 ȸ�翡�� mgr ������ �����ϴ� ������ ���� �μ��� ���� ������� ���, ��, �����ڵ� ��ȸ

--�Ϲ� ����
SELECT e.employee_id, e.last_name, e.job_id
FROM employees e, employees m
WHERE e.department_id = m.department_id(+)
AND LOWER(m.job_id) LIKE '%mgr%'
ORDER BY 1;

--���� ����
SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id IN (SELECT department_id 
                                            FROM employees 
                                            WHERE LOWER(job_id) LIKE '%mgr%');

-- �� �μ��� �ּ� �޿��� 40�� �μ��� �ּұ޿����� �� ���� �μ� �ڵ�, �ּ� �޿� ��ȸ

SELECT department_id, MIN(salary) min_sal
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT  MIN(salary) 
                                        FROM  employees
                                        WHERE  department_id = 40);
                                        
--�ٹ����� �����ڵ尡 UK(��, country_id�� UK)�� ���� �ִ� �μ���
--�μ� �ڵ�, ��ġ�ڵ�, �μ��� ��ȸ
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE l.country_id = 'UK'
AND d.location_id = l.location_id(+);


SELECT department_id, location_id, department_name
FROM departments
WHERE location_id IN (SELECT location_id FROM locations WHERE country_id = 'UK');

--���� ��ҹ��ڿ� �����ϰ� z�� ���Ե� ���� ���� ������ ���� �μ��� ����
--������� ���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                                            FROM employees
                                            WHERE LOWER(last_name) LIKE '%z%');

--60�� �μ������ ���� �޿��� �޴� �������
--������� ���, ��, �޿�, �μ��ڵ�

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary  IN (SELECT salary
                            FROM employees
                            WHERE department_id = 60);

--60�� �μ��� ������ �����鼭 60�� �μ������ ���� �޿��� �޴� �������
--������� ���, ��, �޿�, �μ��ڵ�                            
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary  IN (SELECT salary
                            FROM employees
                            WHERE department_id = 60)
AND department_id NOT IN 60;
--AND department_id <> 60;     

--�츮 ȸ�� ����� �� �μ����� Marketing �̰ų� IT�� ���� �������
--���, ��, �μ��ڵ� ��ȸ

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN (SELECT department_id
                                            FROM departments
                                            WHERE department_name IN ('Marketing', 'IT'));





