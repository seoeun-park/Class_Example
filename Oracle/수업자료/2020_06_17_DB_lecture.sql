
3. �����÷� ���� ���� - ���� ������ ��� �÷��� ���� �÷��� ���
- �����÷��� pair �� ���·� ���Ѵ�.
https://data-make.tistory.com/25

-----------------------------------------------------------------------------------------------
01. �μ����� ���� ���� �޿��� �޴� ����� 
�μ��ڵ�, �ִ�޿��� ��ȸ.
SELECT department_id, MAX(salary) max_sal --12�� ��ȸ��
FROM employees
GROUP BY department_id --GROUP BY : null������ ��ȸ
ORDER BY 1;
-----------------------------------------------------------------------------------------------
02. �μ����� ���� ���� �޿��� �޴� ����� 
�μ��ڵ�, �ִ�޿�, �̸��� ��ȸ.
SELECT department_id, MAX(salary) max_sal, first_name --������ ���� �߻�
FROM employees
GROUP BY department_id;

SELECT department_id, MAX(salary) max_sal, first_name --101�� ����, ����� Ʋ��
FROM employees
GROUP BY department_id, first_name;

�ذ��� 1. �ζ��κ� ��� : �μ��� �ִ� �޿��� ���� ����� ���̺�� ���

�μ��� �ִ� �޿�
SELECT department_id, MAX(salary) max_sal --12��
FROM employees
GROUP BY department_id;

�ζ��� �� ���
SELECT e.department_id, e.salary, e.first_name --11��
                      --*********
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal;

SELECT e.department_id, e.salary, e.first_name --12��
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal;

�ذ��� 2. �����÷� �������� ��� : ���������� ������� ������(12��)�̹Ƿ� '='(equal)�� ��� �Ұ�
�׷���, IN �����ڷ� ��ü

�����÷� �������� ���
SELECT e.department_id, e.salary, e.first_name --23���� ���, �׷캰�� ��ȸ�� �ȵ� ��Ȳ
FROM employees e
WHERE e.department_id IN ( SELECT department_id         --��������(�׻� ���� ����)
                           FROM employees               --��������(�׻� ���� ����)
                           GROUP BY department_id )     --��������(�׻� ���� ����)
AND e.salary IN ( SELECT MAX(salary) max_sal
                  FROM employees
                  GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --11���� ���, �׷캰�� ��ȸ��
FROM employees e
WHERE (e.department_id, e.salary) IN ( SELECT department_id, MAX(salary) max_sal
                                       FROM employees
                                       GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --12���� ���, �׷캰�� ��ȸ��
FROM employees e
WHERE (NVL(e.department_id,0), e.salary) IN ( SELECT NVL(department_id,0), MAX(salary) max_sal
                                         FROM employees
                                         GROUP BY department_id );

-----------------------------------------------------------------------------------------------
03. �μ����� ���� ���� �޿��� �޴� ����� 
���, ����, �μ��ڵ�, �ִ�޿�, �����ڵ� ��ȸ  

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, MAX(salary) max_sal, job_id --107�� ��� ��ȸ�� xxx, �μ����� ��ȸ�Ǿ�� ��.
FROM employees
--WHERE
GROUP BY employee_id, first_name, last_name, department_id, job_id --xxxx
--HAVING
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
�μ����� ���� ���� �޿��� �޴� ����� 
--���� ������ ������� �μ�, �ִ�޿��̹Ƿ� �����÷����� ����
--�׷���, IN ������ ���
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ  


�����÷� ���� ���� xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --����� �̻���, 
       department_id, salary, job_id                     --�μ����� �ִ밪�� ��ȸ�Ǿ� 12����
FROM employees                                           --��ȸ�Ǿ�� �ϴµ� 23���� ��� ��Ÿ��.
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         GROUP BY department_id )
AND salary IN ( SELECT MAX(salary)
                FROM employees
                GROUP BY department_id )
ORDER BY 3;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

�����÷� ���� ���� �ۡۡۡۡۡ�
�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id --null ������ 11�� ��ȸ 
FROM employees
WHERE ( department_id, salary ) IN ( SELECT department_id, MAX(salary) max_sal --�����÷� ���� ����
                                     FROM employees 
                                     GROUP BY department_id )
ORDER BY 3;

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, salary, job_id --null ������ 12�� ��ȸ
FROM employees
WHERE ( NVL(department_id,0), salary ) IN ( SELECT NVL(department_id, 0), MAX(salary) max_sal --�����÷� ���� ����
                                            FROM employees 
                                            GROUP BY department_id )
ORDER BY 3;

�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�
-----------------------------------------------------------------------------------------------
�� �μ����� ���� ���� �޿��� �޴� ����� 
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ 

�ζ��� �� ���� ����1 �� �׷��Լ� �ݵ�� alias  --�μ��� �ִ�޿��� ���̺�ó�� ���
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE m.department_id = e.department_id ----null ������ 11�� ��ȸ 
AND e.salary = m.max_sal --�� max_sal : alias�Ѱ�
ORDER BY 3;

�ζ��� �� ���� ����2 NVL �Լ� ��� �� �׷��Լ� �ݵ�� alias  --�μ��� �ִ�޿��� ���̺�ó�� ���
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(m.department_id,0) = NVL(e.department_id, 0) --null ������ 12�� ��ȸ
AND e.salary = m.max_sal --�� max_sal �� MAX(salary)�� alias�Ѱ�
ORDER BY 3;

-----------------------------------------------------------------------------------------------
EMPLOYEE_ID NAME                                           DEPARTMENT_ID     SALARY JOB_ID    
----------- ---------------------------------------------- ------------- ---------- ----------
        200 Jennifer Whalen                                           10       4400 AD_ASST   
        201 Michael Hartstein                                         20      13000 MK_MAN    
        114 Den Raphaely                                              30      11000 PU_MAN    
        203 Susan Mavris                                              40       6500 HR_REP    
        121 Adam Fripp                                                50       8200 ST_MAN    
        103 Alexander Hunold                                          60       9000 IT_PROG   
        204 Hermann Baer                                              70      10000 PR_REP    
        145 John Russell                                              80      14000 SA_MAN    
        100 Steven King                                               90      24000 AD_PRES   
        108 Nancy Greenberg                                          100      12008 FI_MGR    
        205 Shelley Higgins                                          110      12008 AC_MGR    
        178 Kimberely Grant                                       (null)       7000 SA_REP    

12�� ���� ���õǾ����ϴ�.
-----------------------------------------------------------------------------------------------

02. �� �μ��� �ֱٿ� �Ի��� ������� --���� ������ ������� �μ���, �ֱ� �Ի�
���, ��, �μ��ڵ�, �Ի����� ��ȸ

�μ��� �ֱ��Ի�����
SELECT department_id, MAX(hire_date)
FROM employees
GROUP BY department_id;

�ζ��κ� ��������
SELECT e.employee_id, e.last_name, e.department_id, e.hire_date --14��(�ߺ��� 2������)
FROM employees e, ( SELECT department_id, MAX(hire_date) max_hire_date
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.hire_date = m.max_hire_date
ORDER BY 3;

�����÷� ��������
SELECT employee_id, last_name, department_id, hire_date --14��(�ߺ��� 2������)
FROM employees
WHERE (NVL(department_id,0), hire_date) IN ( SELECT NVL(department_id,0), MAX(hire_date) 
                                             FROM employees 
                                             GROUP BY department_id )
ORDER BY 3;

03. �Ŵ����� ���� �μ���
�μ��ڵ�, ����� ��ȸ
SELECT department_id, employee_id
FROM employees
WHERE manager_id IS NULL; 

DEPARTMENT_ID EMPLOYEE_ID
------------- -----------
           90         100

04. �Ŵ����� ���� �μ���
�μ��ڵ�, �μ����� ��ȸ

DEPARTMENT_ID DEPARTMENT_NAME               
------------- ------------------------------
           90 Executive        

�Ϲ� ����
SELECT d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

����(���)�� ���� ����
SELECT department_id, department_name 
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
�����÷� ���� ����
SELECT department_id, department_name 
FROM departments
WHERE ( department_id, manager_id ) --��  
IN ( SELECT department_id, employee_id --�� ���� ������ ������� �μ��ڵ�, ���
     FROM employees
     WHERE manager_id IS NULL );

-----------------------------------------------------------------------------------------------        