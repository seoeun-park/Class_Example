--�μ����� Marketing�� �μ��� ���� �������
--���, ����, �μ��ڵ�, �����ڵ� ��ȸ

SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id
                                            FROM departments
                                            WHERE department_name = 'Marketing');
                                            SELECT employee_id, first_name || ' ' || last_name name,
                department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id
                                            FROM departments
                                            WHERE department_name = 'Marketing');

--------------------------------------------------------------------------------------------
--���� �÷�

--�μ����� ���� ���� �޿��� �޴� ����� �μ��ڵ�, �ִ�޿��� ��ȸ
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
ORDER BY 1;     --12�� ��ȸ

--�μ����� ���� ���� �޿��� �޴� ����� �μ��ڵ�, �ִ�޿�, �̸��� ��ȸ
SELECT department_id, first_name, MAX(salary) max_sal
FROM employees
GROUP BY department_id, first_name 
ORDER BY 1;     --101��
--12�� ���� first_name�� �߰��ؾ� ��

--�ذ� ��� 1. �ζ��� �� ��� : ���̺�
SELECT e.department_id, e.first_name, e.salary
FROM employees e, (SELECT department_id, MAX(salary) max_sal
                                    FROM employees
                                    GROUP BY department_id) m
WHERE   NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

--�ذ� ��� 2. ���� �÷� �������� ��� : ���� ������ ������� ������(12��)�̹Ƿ� =�� ���Ұ�
--�׷��� IN �����ڷ� ��ü
SELECT e.department_id, e.salary, e.first_name
FROM employees e
WHERE e.department_id IN (SELECT department_id
                                               FROM employees
                                               GROUP BY department_id)
--WHERE e.department_id = �ٸ� ���̺� department_id
AND e.salary IN (SELECT MAX(salary) max_sal
                             FROM employees
                             GROUP BY department_id);   --23���� ��ȸ(�ùٸ��� ���� ���)
--AND e.salary = �ٸ� ���̺� max_sal

SELECT e.department_id, e.salary, e.first_name
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN (SELECT NVL(department_id,0), MAX(salary) max_sal
                                                                            FROM employees
                                                                            GROUP BY department_id);
--12�� �� ��ȸ, �׷캰�� ��ȸ��

--�μ����� ���� ���� �޿��� �޴� ����� ���, ����, �μ��ڵ�, �޿� ���� �ڵ� ��ȸ

--�ζ��� ��
SELECT e.employee_id, e.first_name || ' ' || e.last_name name,
                e.department_id, e.salary, e.job_id
FROM employees e, (SELECT department_id, MAX(salary) max_sal
                                    FROM employees
                                    GROUP BY department_id) m
WHERE  NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

-- ���� Į��
SELECT employee_id, salary, first_name || ' ' || last_name name,
                department_id, salary, job_id
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN (SELECT NVL(department_id,0), MAX(salary) max_sal
                                                                            FROM employees
                                                                            GROUP BY department_id);
                                                                            
--�μ����� ���� �ֱٿ� �Ի��� �����
--���, ����, �μ��ڵ�, �Ի����� ��ȸ
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

--�ζ��� ��
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
                e.department_id, e.hire_date
FROM employees e, (SELECT DISTINCT(department_id), MAX(hire_date) max_hire
                                    FROM employees
                                    GROUP BY department_id) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.hire_date = m.max_hire;

-- ���� Į��
SELECT DISTINCT(department_id), employee_id, 
                first_name || ' ' || last_name name,
                hire_date
FROM employees e
WHERE (NVL(e.department_id,0), hire_date) IN (SELECT NVL(department_id,0), MAX(hire_date)
                                                                              FROM employees
                                                                              GROUP BY department_id);
                                                                              
--�Ŵ����� ���� ���(��, ���� employee_id�� 100)�� �Ŵ����� �ִ� �μ��ڵ� �μ����� ��ȸ
SELECT employee_id
FROM employees
WHERE manager_id IS NULL;

SELECT DISTINCT(e.department_id), d.department_name
FROM  departments d, employees e
WHERE d.department_id(+) = e.department_id
AND e.manager_id IN (SELECT employee_id
                                      FROM employees
                                      WHERE manager_id IS NULL);
                                      
------------------------------------------------------------------------------------
--��Į�� ���� ����(������ ��ü)

--�� ����� �޿� ������ �ľ��ϰ��� �Ѵ�.
--��� ����� ���, ��, �޿�, ȸ����ձ޿�, ȸ���ִ�޿� ��ȸ

SELECT e.employee_id, e.last_name, e.salary, 
               (SELECT ROUND(AVG(salary)) avg_sal
                FROM employees) avg_sal,
                (SELECT MAX(salary) max_sal
                FROM employees) max_sal
FROM employees e
GROUP BY e.employee_id, e.last_name, e.salary;

--��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.last_name, e.department_id,  (SELECT department_name
                                                                                            FROM departments
                                                                                            WHERE department_id = e.department_id) department_name
FROM employees e
ORDER BY 1;
                                                        

--��� ����� ���, ��, �μ��ڵ�, �����ڵ�, ���� ���� ��ȸ
SELECT e.employee_id, e.last_name, e.department_id, e.job_id, 
                (SELECT job_title
                 FROM jobs
                 WHERE job_id = e.job_id) job_title
FROM employees e
ORDER BY 1;




