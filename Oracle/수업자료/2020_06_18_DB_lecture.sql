3. �����÷� ���� ���� - ���� ������ ��� �÷��� ���� �÷��� ���, ������ ������� �������� �÷��� ������
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
GROUP BY department_id; --������ ���� �߻�

SELECT department_id, MAX(salary) max_sal, first_name --101�� ����, ����� �̻���
FROM employees
GROUP BY department_id, first_name; --������ ������ �̻� ��� �߻�

�ذ��� 1. �ζ��κ� ��� : �μ��� �ִ� �޿��� ���� ����� ���̺�� ���(�μ��� �μ��� �ִ�޿��� �μ��� �޿��� �޾Ƽ� ó��)

�μ��� �ִ� �޿�
SELECT department_id, MAX(salary) max_sal --12��
FROM employees
GROUP BY department_id;

�ζ��� �� ���
SELECT e.department_id, e.salary, e.first_name --11��, null���� ��ȸ �ȵ�
                      --********* �� MAX(salary) �ƴ�!!!
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id
AND e.salary = m.max_sal;

SELECT e.department_id, e.salary, e.first_name --12��, null������ ��ȸ��
FROM employees e, ( SELECT department_id, MAX(salary) max_sal
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0) --�μ�����
AND e.salary = m.max_sal; --�ִ�޿��� �޿��� �޾Ƽ� ó��

�ذ��� 2. �����÷� �������� ��� : ���������� ������� ������(12��)�̹Ƿ� '='(equal)�� ��� �Ұ�
�׷���, IN �����ڷ� ��ü

�����÷� �������� ���
SELECT e.department_id, e.salary, e.first_name --23���� ���, �׷캰�� ��ȸ�� �ȵ� ��Ȳ
                      --********* �� MAX(salary) �ƴ�!!!
FROM employees e
WHERE e.department_id IN ( SELECT department_id         --��������(�׻� ���� ����)
                           FROM employees               --��������(�׻� ���� ����)
                           GROUP BY department_id )     --��������(�׻� ���� ����)
AND e.salary IN ( SELECT MAX(salary) max_sal
                  FROM employees
                  GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --11���� ���, �׷캰�� ��ȸ��, null���� ��ȸ �ȵ�
FROM employees e
WHERE (e.department_id, e.salary) IN ( SELECT department_id, MAX(salary) max_sal
                      --********              �μ����� �ִ�޿��� �޿��� ����
                                       FROM employees
                                       GROUP BY department_id );

SELECT e.department_id, e.salary, e.first_name --12���� ���, �׷캰�� ��ȸ��, null������ ��ȸ ��
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
03-01. �μ����� ���� ���� �޿��� �޴� ����� 
--���� ������ ������� �μ�, �ִ�޿��̹Ƿ� �����÷����� ����, --�μ����� �ִ�޿��� �޿��� ����
--�׷���, IN ������ ���
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ  
�����÷� ��������

�����÷� ���� ���� xxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, first_name || ' ' || last_name name, --����� �̻���, 
       department_id, salary, job_id                     --�μ�����, �ִ�޿� ���� �����ؼ�
FROM employees                                           --�μ����� �ִ밪�� ��ȸ�Ǿ� 12����
WHERE department_id IN ( SELECT department_id            --��ȸ�Ǿ�� �ϴµ� 23���� ��� ��Ÿ��.
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
03-02. �μ����� ���� ���� �޿��� �޴� ����� 
���, ����, �μ��ڵ�, �޿�, �����ڵ� ��ȸ 
�ζ��κ� ��������
�ζ��κ� ���� ����1 �� �׷��Լ� �ݵ�� alias  --�μ��� �ִ�޿��� ���̺�ó�� ���
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE e.department_id = m.department_id ----null ������ 11�� ��ȸ 
AND e.salary = m.max_sal --�� max_sal : alias�Ѱ�
ORDER BY 3;

�ζ��κ� ���� ����2 NVL �Լ� ��� �� �׷��Լ� �ݵ�� alias  --�μ��� �ִ�޿��� ���̺�ó�� ���
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.salary, e.job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id, 0) --null ������ 12�� ��ȸ
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

04. �� �μ��� �ֱٿ� �Ի��� ������� --���� ������ ������� �μ���, �ֱ� �Ի�
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
WHERE NVL(e.department_id,0) = NVL(m.department_id,0) --�μ����� 
AND e.hire_date = m.max_hire_date --�ֱ� �Ի����ڸ� �Ի����ڷ� ����
ORDER BY 3;

�����÷� ��������
SELECT employee_id, last_name, department_id, hire_date --14��(�ߺ��� 2������)
FROM employees
WHERE (NVL(department_id,0), hire_date) IN ( SELECT NVL(department_id,0), MAX(hire_date) --�μ����� �ֱ� �Ի����ڸ� �Ի����ڷ� ���� 
                                             FROM employees 
                                             GROUP BY department_id )
ORDER BY 3;

-----------------------------------------------------------------------------------------------

05. �Ŵ����� ���� �μ���
�μ��ڵ�, ����� ��ȸ
SELECT department_id, employee_id --1��   90   100
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
SELECT d.department_id, d.department_name --1��, 90	Executive
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.manager_id IS NULL;

����(���)�� ���� ����
SELECT department_id, department_name --1��
FROM departments
WHERE department_id IN ( 90 );

SELECT department_id, department_name --1��
FROM departments
WHERE department_id IN ( SELECT department_id
                         FROM employees
                         WHERE manager_id IS NULL );
�����÷� ���� ����
SELECT department_id, department_name --1�� 
FROM departments
WHERE ( department_id, manager_id ) --��  
IN ( SELECT department_id, employee_id --�� ���� ������ ������� �μ��ڵ�, ���
     FROM employees
     WHERE manager_id IS NULL );

-----------------------------------------------------------------------------------------------        
4. ��ȣ���� ���� ���� : ���������� �÷��� ���� ������ �������� ���Ǵ� ����
- ���������� ���� ���� ������ �ְ�, ���� ������ ��� ���� �޾Ƽ� ���������� ��ȯ�ؼ� 
  �����ϴ� ����
- ���������� �÷��� ���� ������ �������� ���Ǿ� ���������� ���������� ���� ����
- ���� ���̺�� ���� ���� ���̺� ���� JOIN ������ ����.
- ���� ������ ���� ������ ��� ������ �ְ� �޴´ٴ� �ǹ�

�� ���������� �÷��� ���� ������ �������� ���Ǵ� 
  ��ȣ���� ���� ������ ���·� ���ȴ�.(WHERE ������ ���)
- ��Į�� ���� �������� �ٷ� ����
                          
5. ��Į�� ���� ���� : SELECT ���� ��� , ����(���)��, �����÷��� ��ȸ����, 
   Scalar : (ũ��)�ϳ�, Vector : ũ��� ����
- �ܼ��� �׷��Լ��� �����  SELECT ������ ��ȸ�ϰ��� �Ҷ�
- SELECT ���� ���� ������ ����Ͽ� �ϳ��� �÷�ó�� ����ϱ� ���� ����(ǥ�� �뵵)
- ����(Join)�� ��ü ǥ�������ε� ���� ���  
- �ڵ强 �����͸� ��ȸ�ϰ��� �Ҷ�  
- ���� ���ǽ��� �ʿ��Ҷ��� ��Į�� �������� �ȿ��� WHERE ���ǽ� ���


1) �ܼ��� �׷��Լ��� ������� SELECT ���� ��ȸ�ϰ��� �Ҷ�

01. �� ����� �޿� ������ �ľ��ϰ��� �Ѵ�.
��� ����� ���, ��, �޿�, ȸ����ձ޿�, ȸ���ִ�޿� ��ȸ

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SELECT employee_id, last_name, salary, --107�� �������� ��� �̻�
       ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal
FROM employees
GROUP BY employee_id, last_name, salary; --xxxx, ������� SALARY, AVG_SAL, MAX_SAL ���غ���
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

SELECT ROUND(AVG(salary)) avg_sal --6462
FROM employees; 

�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�
SELECT employee_id, last_name, salary, --107��
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal,
       ( SELECT MAX(salary) FROM employees ) max_sal
FROM employees;
�ۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡۡ�

SELECT ���� �׷��Լ��� ���� �Ǹ� ������ �׷��Լ� �̿��� �÷��� 
GROUP BY ���� ����ϰų� �׷��Լ��� �� �� �ִ�.

2) �ڵ强 ���̺��� �ڵ��(��, ������ �÷���)�� SELECT ���� ��ȸ�ϰ��� �� �� : ��ȣ���� ���� ����, Outer Join ����Ѱ� ó��

01. ��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ1

�Ϲ� ����
SELECT employee_id, last_name, e.department_id, d.department_name 107��
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
ORDER BY 1;

��ȣ���� ���� ���� : ���������� �÷��� ���� ������ �������� ���Ǵ� ����

��� ����� ���, ��, �μ��ڵ�, �μ��� ��ȸ2 ( ��Į�� ���� ������ "�μ���" ���ϱ� )
SELECT employee_id, last_name, department_id, --107��
       ( SELECT department_name 
         FROM departments d
         WHERE department_id = e.department_id ) department_name --e.department_id ���
FROM employees e;

02. ��� ����� ���, ��, �μ��ڵ�, �����ڵ�, �������� ��ȸ ( ��Į�� ���� ������ "��������" ���ϱ� )

�Ϲ� ����
SELECT employee_id, last_name, department_id, j.job_id, j.job_title --107��
FROM employees e, jobs j
WHERE e.job_id = j.job_id;

��Į�� ���� ����
SELECT employee_id, last_name, department_id, job_id, --107��
       ( SELECT job_title 
         FROM jobs 
         WHERE job_id = e.job_id ) job_title
FROM employees e;

03. �� �μ��� ���� �μ��ڵ�, �μ���, ���ø� ��ȸ ( ��Į�� ���� ������ "����" ���ϱ� )

�Ϲ� ����
SELECT department_id, department_name, l.city --27��
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

��Į�� ���� ����
SELECT department_id, department_name,  --27��
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

04. ��� ������� ���, ��, �޿�, �μ��ڵ�, �μ���, �����ڵ� ��ȸ

�Ϲ� ����
SELECT employee_id, last_name, salary, e.department_id, --107��
       department_name, job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

��Į�� ���� ���� ( ��Į�� ���� ������ "�μ���" ���ϱ� )
SELECT employee_id, last_name, salary, department_id, --107��
       ( SELECT department_name 
         FROM departments 
         WHERE department_id = e.department_id ) department_name,
       job_id
FROM employees e;
 
05. �� �μ��� ���� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ

�Ϲ� ����
SELECT d.department_id, d.department_name, d.location_id, l.city --27��
FROM departments d, locations l
WHERE d.location_id = l.location_id(+);

��Į�� ���� ����( ��Į�� ���� ������ "����" ���ϱ� )
SELECT department_id, department_name, location_id, --27��
       ( SELECT city 
         FROM locations 
         WHERE location_id = d.location_id ) city
FROM departments d;

06. �� �μ��� �μ��ڵ�, �μ���ձ޿� ��ȸ

�Ϲ� ����
SELECT department_id, ROUND(AVG(salary)) avg_sal --12��
FROM employees
GROUP BY department_id;

��ȣ�������� ����( ��Į�� ���� ������ "��ձ޿�" ���ϱ� )
SELECT department_id, --12��
       ( SELECT ROUND(AVG(salary)) 
         FROM employees
         WHERE department_id = e.department_id ) avg_sal
FROM employees e
GROUP BY department_id;

07. �� ����� ���� ����� �Ҽӵ� �μ��� �޿����� ��� ����� �޿��� �ľ��ϰ��� �Ѵ�.
���, ��, �μ��ڵ�, �޿�, �� ����� ���� �μ��� ��ձ޿� ��ȸ
                          �ءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx                         
SELECT employee_id, last_name, department_id, salary, ROUND(AVG(salary)) avg_sal --xxxx 107�� �������� ����� �̻���
FROM employees
GROUP BY employee_id, last_name, department_id, salary;
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

��ȣ�������� ����( ��Į�� ���� ������ "��ձ޿�" ���ϱ� )
SELECT employee_id, last_name, department_id, salary, --107��
       ( SELECT ROUND(AVG(m.salary)) 
         FROM employees m
         WHERE m.department_id = e.department_id ) dept_avg_sal
FROM employees e;


-----------------------------------------------------------------------------------------------
6. FROM���� ����ϴ� �ζ��κ� ���� ����
SELECT ���� ����� FROM ������ �ϳ��� ���̺�ó�� ���(���̺� ��ü �뵵)
--FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!

01. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
�츮 ȸ�� �ִ�޿�, �ּұ޿�, ��ձ޿��� ��ȸ
SELECT  MAX(salary) max_sal, --1��
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal
FROM employees;

MAX_SAL    MIN_SAL    AVG_SAL
---------- ---------- ----------
24000      2100       6462
     
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

02. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
���, ��, �޿�, �ִ�޿�, �ּұ޿�, ��ձ޿��� ��ȸ
SELECT employee_id, last_name, salary,  --107�� �������� ����� �̻�
       MAX(salary) max_sal, 
       MIN(salary) min_sal, 
       ROUND(AVG(salary)) avg_sal --xxxx
FROM employees
GROUP BY employee_id, last_name, salary
ORDER BY 1;

EMPLOYEE_ID LAST_NAME  SALARY   MAX(SALARY) MIN(SALARY) ROUND(AVG(SALARY))
--------------------------------------------------------------------------
100         King       24000    24000       24000       24000  --������ salary�� max, min, avg xxx
101         Kochhar    17000    17000       17000       17000
102         De Haan    17000    17000       17000       17000
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

��Į�� ���� ����  --SELECT ���� ���������� ����Ͽ� �ϳ��� �÷�ó�� ����ϱ� ���� ����
SELECT employee_id, last_name, salary,  --107��
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal       
FROM employees;

�ζ��κ� ���� ���� --SELECT ���� ����� FROM������ �ϳ��� ���̺�ó�� ����ϰ� ������
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal --107��
FROM employees, ( SELECT MAX(salary) max_sal, --ȸ���� �ִ�޿�, �ּұ޿�, ��ձ޿��� ���̺�ó�� ���
                  MIN(salary) min_sal, 
                  ROUND(AVG(salary)) avg_sal
                  FROM employees );
--FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!
 
EMPLOYEE_ID  LAST_NAME  SALARY    MAX_SAL    MIN_SAL  AVG_SAL
-------------------------------------------------------------
100          King       24000     24000      2100     6462
:            :          :         :          :        :
 
03. ����� �޴� �޿��� ȸ����ձ޿� �̻� �ִ�޿� ���Ͽ� �ش��ϴ� �������
���, ��, �޿�, �츮ȸ���ִ�޿�, �츮ȸ���ּұ޿�, �츮ȸ����ձ޿�

��Į�� ���� ����
SELECT employee_id, last_name, salary, --51��
       ( SELECT MAX(salary) FROM employees ) max_sal,
       ( SELECT MIN(salary) FROM employees ) min_sal,
       ( SELECT ROUND(AVG(salary)) FROM employees ) avg_sal
FROM employees
WHERE salary BETWEEN ( SELECT ROUND(AVG(salary)) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );       

�ζ��� �� ���� ����
SELECT employee_id, last_name, salary, max_sal, min_sal, avg_sal --51��
FROM employees, ( SELECT MAX(salary) max_sal, 
                         MIN(salary) min_sal,
                         ROUND(AVG(salary)) avg_sal 
                  FROM employees )
                --FROM ���� ����ϴ� �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!!
                --�μ��� �ִ�޿�, �ּұ޿�, ��ձ޿��� ���̺�ó�� ���
WHERE salary BETWEEN avg_sal AND max_sal;
                -- �� �� ��ձ޿��� �ִ�޿� ���̸� ������. 

04. �� �μ����� ���� ���� �޿��� �޴� �������
���, ��, �μ��ڵ�, �޿� ��ȸ

�� �μ����� ���� ���� �޿�
SELECT department_id, MAX(salary) max_sal
FROM employees 
GROUP BY department_id;

�����÷� ���� ����
SELECT employee_id, last_name, department_id, salary --12��
FROM employees
WHERE (NVL(department_id, 0), salary) IN ( SELECT NVL(department_id, 0), MAX(salary) 
                                           FROM employees 
                                           GROUP BY department_id )
ORDER BY 3;

�ζ��� �� ���� ����
SELECT employee_id, last_name, e.department_id, salary --12��
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0)
AND e.salary = m.max_sal
ORDER BY 3;

05. �츮ȸ�� ������� �޿������� ������ ���̺��� �ִ�.
���, ��, �μ��ڵ�, �޿�, �μ�����, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿� ��ȸ
�ζ��κ�� ��ȸ

�μ��� �μ�����, �μ��ִ�޿�, �μ��ּұ޿�, �μ���ձ޿� ��ȸ
SELECT  COUNT(*) cnt, --12��
        MAX(salary) max_sal, 
        MIN(salary) min_sal, 
        ROUND(AVG(salary)) avg_sal,
        department_id
FROM employees
GROUP BY department_id;

�ζ��� �� ���� ����
SELECT e.employee_id, e.last_name, e.department_id, e.salary, --107��
       m.cnt, m.max_sal, m.min_sal, m.avg_sal
FROM employees e, ( SELECT  COUNT(*) cnt, 
                            MAX(salary) max_sal, 
                            MIN(salary) min_sal, 
                            ROUND(AVG(salary)) avg_sal,
                            department_id
                    FROM employees
                    GROUP BY department_id ) m
WHERE NVL(e.department_id, 0) = NVL(m.department_id, 0);

-----------------------------------------------------------------------------------------------
7. ��� �������ุ ��ȸ�� ����.
���������� ��ȸ�ؿ��� ���� : ROWNUM - ���̺� �������� �ʴ� �÷��� �ƴ����� 
����� �� �ִ� ��¥ �÷�(PSEUDO COLUMN), 
SELECT ���� WHERE ������ ���,
�� �������� ����� ���� �� �࿡ ���� ������
�ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء�
�� ���� �������� ���� ����(ORDER BY) �� ���� �������� ���� �ű��(ROWNUM)
-  ROWNUM�� �ζ��� ���� Ư���� �̿��Ͽ� ����¡ ó�� ���� �۾��� ����

�Խ��ǿ��� �Ϲ������� ������ ��ȣ�� 3 ������ �̻��� ���� ���� ���� ����. 
��, ������ ��ȣ�� ���� ���� �ξ� �� ���� ��ȸ�ϰ� �ְ�, 
�� ������ 5 ������ ������ ������ ��ȸ���� 95% �̻�

�츮ȸ�� ������� 
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees;

�츮ȸ�� ����鿡 ���� �޿��� ���� �޴� ������ �����Ͽ� 
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
ORDER BY salary DESC;

�츮ȸ�� ����� ��������� �����Ͽ� 10������
���, ��, �޿� ��ȸ
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10;

SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10
ORDER BY salary DESC;

�ζ��� �� ����Ͽ�
�޿� ���� 10���� ���� ���, �̸�, �޿� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary DESC ) e
WHERE ROWNUM <= 10;

�ζ��� �� ����Ͽ�
�޿� ���� 10���� ���, �̸�, �޿� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, first_name, salary
       FROM employees
       ORDER BY salary ) e
WHERE ROWNUM <= 10;

���� ���� �Ի��� ��� 10�� ���� ���, ��, �Ի����� ��ȸ
SELECT ROWNUM, e.* 
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date ) e
WHERE ROWNUM <= 10;
-----------------------------------------------------------------------------------------------
8. ������ �����ϰ��� �Ѵٸ�
RANK() OVER(������������) - 1,2,2,2,2,6
DENSE_RANK() OVER(������������) - 1,2,2,2,2,3 
    --DENSE : ������, ������

�� ROWNUM : �������� ����� ���� �� �࿡ ���� ������
�Ի����ڸ� �������� �������� 10������(���� �Ի��� ��� 10��)
���, ��, �Ի����� ��ȸ
SELECT ROWNUM, e.*
FROM ( SELECT employee_id, last_name, hire_date
       FROM employees
       ORDER BY hire_date) e
WHERE ROWNUM <= 10 ;

SELECT * 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY hire_date) rank, 
              employee_id, last_name, hire_date
       FROM employees )
WHERE rank <= 10;

������ ��ȸ �� SELECT 
SELECT �÷���, ....
FROM ���̺��, ....
WHERE ��������
WHERE �Ϲ�����
WHERE �������� AND �Ϲ�����
GROUP BY ����
HAVING �Ϲ�����(�׷��Լ�)
ORDER BY ���ı���;

-----------------------------------------------------------------------------------------------
[�������� 6-4]
01. �޿��� ���� ���� 5�� ����� 
����, ���, �̸�, �޿��� ��ȸ�ϴ� �������� 
DENSE_RANK()�� ����� �ζ��κ� ���� ������ ����Ͽ� �ۼ�

�޿� ���� 5���� ����, ���, �̸�, �޿� ��ȸ
SELECT e.* 
FROM ( SELECT DENSE_RANK() OVER(ORDER BY salary) rank, 
              employee_id, first_name, salary
       FROM employees ) e
WHERE rank <= 5;

02. �μ����� ���� �޿��� ���� �޴� ����� 
���, �̸�, �μ��ڵ�, �޿�, �����ڵ带 ��ȸ�ϴ� ������ 
�ζ��� �� ���� ������ ����Ͽ� �ۼ�

SELECT employee_id, first_name, e.department_id, salary, job_id
FROM employees e, ( SELECT department_id, MAX(salary) max_sal 
                    FROM employees 
                    GROUP BY department_id ) m
WHERE NVL(e.department_id,0) = NVL(m.department_id,0)
AND e.salary = m.max_sal
ORDER BY e.department_id;
-----------------------------------------------------------------------------------------------



