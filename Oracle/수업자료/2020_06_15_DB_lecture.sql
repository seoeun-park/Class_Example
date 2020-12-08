6.1 ���� ����(Sub Query) :
SQL ���� �ȿ� �����ϴ� �� �ٸ� SQL ������ ���� ������ �Ѵ�.
���� ������ ��ȣ�� ���� ����ϰ� ���� ������ ���Ե� �������� ���������� �Ѵ�.
            �ءءءءءءءءءءءءءءءءءءء�
===============================================================================================
�� ���� ������ ��ġ�� ���� ��Ī 
- SELECT ���� �ִ� ���� ���� : ��Į�� ���� ����, SQL���� ���ϰ��� ��Į�� ���̶� ��.
  Scalar : (ũ��)�ϳ�, Vector : ũ��� ����
  SELECT ���� ���� ������ ����Ͽ� �ϳ��� �÷�ó�� ����ϱ� ���� ����(ǥ�� �뵵)
  ����(JOIN)�� ��ü ǥ�������ε� ���� ���



- FROM ���� �ִ� ���� ���� : �ζ��� ��
  SELECT ���� ����� FROM ������ �ϳ��� ���̺�ó�� ���(���̺� ��ü �뵵)
  �ζ��� �� ���� ������ ORDER BY ���� �� �� ����.
  (�� ��� �뵵�� �ƴ� ���̺�ó�� ��� �뵵�̹Ƿ� ���� ������ �ʿ䰡 ����.)
  �ζ��� �� ���� �������� �׷��Լ��� ��.��.�� alias �����ؾ� ��!!!
  alias ���������ν� �ϳ��� �÷����� �����



- WHERE ���� �ִ� ���� ���� : �Ϲ� ���� ����
   �� SELECT ���� ����� �ϳ��� ����(���)ó�� ��� 
   (�������� ���� ������ ����� ���� �޶���) �� ����(���)������, ����(���)������, �����÷������� ���� �޶���
   �� ���������� �������� ���鶧 �������������� ������ ���� ����

�� �Ϲ� ���� ���� - ���� �������ȿ� �ִ� �� �ٸ� ������ (WHERE/HAVING ������ �ȿ��� ���), 
 �ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء� 
  ����, �Լ��� ���Ѱ��� ���Ҷ�, �ٸ� ������ ���Ѱ��� ���Ҷ�
 �ءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءءء� 
1. ����(���)�� ���� ���� - �������� ����ϴ� ���� ������ ������� �������� ���
2. ����(���)�� ���� ���� - �������� ����ϴ� ���� ������ ������� �������� ���
3. ���� �÷� ���� ���� - �������� ����ϴ� ���� ������ ����÷��� �����÷��� ���

4. Scalar ���� ���� - SELECT ���� ����ϴ� ���� ����
5. ��ȣ ���� ���� ���� - ���������� �÷��� ���� ������ �������� ���Ǵ� ���(��Į�� ���� �������� �ٷ�)

6. �ζ��� �� ���� ���� - FROM ���� ����ϴ� ���� ����
===============================================================================================

1. ������(WHERE, HAVING)�� ����ϴ� ����(���)�� ���� ���� 
����(���)�� ���� ���� ������: =, !=, <>, <, >, <=, >= 

01. �޿��� �츮ȸ�� ��ձ޿����� �� ���� �޿��� �޴� ����� 
���, �̸�, ��, �޿� ������ ��ȸ

��. �츮ȸ�� ��� �޿�
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

��. ������ Ȯ���� ��� �޿��� �������� ���� �ۼ�
SELECT employee_id, first_name, last_name, salary --������� ������, 56��
FROM employees
WHERE salary < 6461.831775700934579439252336448598130841; 

��. ��� �޿��� ��� ��� ������ �� �� ������
SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < AVG(salary); --xxx ����, WHERE �������� �׷��Լ� ��� �� ��!

��. �츮 ȸ�� �޿��� ������ �Ǹ� ����� �Է��� �� �����Ƿ� ������ �ɶ����� �����ؾ� �ϹǷ�
WHERE ���� ����� ������� �ʰ�, 
������ ������ ����� �����ϰ� ������ ���� ������ �����.
******************************************

��. ��� ��� ��� �޿��� ��ȸ�ϴ� �������� �־���  
SELECT employee_id, first_name, last_name 
FROM employees
WHERE salary < ( SELECT AVG(salary) 
                 FROM employees ); --���� ���� ���
--WHERE salary < ȸ����ձ޿�;--�츮ȸ�� �޿��� ��պ��� �� ���� �޴�


02. �޿��� �츮ȸ�� �޿��� ��պ��� �� ���� �޴� ������� 
���, ��, �����ڵ�, �޿� ��ȸ

�츮ȸ�� �޿��� ���
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

SELECT employee_id, last_name, job_id, salary --56��
FROM employees
WHERE salary < 6461.831775700934579439252336448598130841;
                 
SELECT employee_id, last_name, job_id, salary  --56��
FROM employees
WHERE salary < ( SELECT AVG(salary) 
                 FROM employees );
--WHERE salary < ȸ����ձ޿�;--�츮ȸ�� �޿��� ��պ��� �� ���� �޴�


03. �츮ȸ�翡�� ���� ���� �޿��� �޴� ����� 
���, ��, ��, �޿� ��ȸ

�츮ȸ�翡�� ���� ���� �޿�
SELECT MAX(salary) --24000
FROM employees; 

SELECT employee_id, last_name, first_name, salary
FROM employees
WHERE salary = 24000; 

SELECT employee_id, last_name, first_name, salary
FROM employees
WHERE salary = ( SELECT MAX(salary) 
                 FROM employees ); 
--WHERE salary IN ( SELECT MAX(salary) --�츮ȸ�翡�� ���� ���� �޿��� �޴� 
--                  FROM employees ); 

04. ��� 150�� ������� �� ���� �޿��� �޴� ������� 
���, ��, �μ��ڵ�, �����ڵ�, �޿� ��ȸ

��� 150�� ����� �޿�
SELECT salary  --10000
FROM employees 
WHERE employee_id = 150;

SELECT  employee_id, last_name, department_id, --15��
        job_id, salary
FROM employees
WHERE salary > 10000;

SELECT  employee_id, last_name, department_id, --15��
        job_id, salary
FROM employees
WHERE salary > ( SELECT salary 
                 FROM employees 
                 WHERE employee_id = 150 );
--WHERE salary > ��� 150�� ����� �޿�;

05. ���޿��� ���� ���� ����� 
���, �̸�, ��, �������� ������ ��ȸ

�츮ȸ�� �ְ� �޿�
SELECT MAX(salary) --24000
FROM employees;

SELECT e.employee_id, e.first_name, e.last_name, j.job_title 
FROM  employees e, jobs j 
WHERE  e.job_id = j.job_id
AND e.salary = 24000;

SELECT e.employee_id, e.first_name, e.last_name, j.job_title 
FROM  employees e, jobs j 
WHERE  e.job_id = j.job_id
AND e.salary = ( SELECT MAX(e.salary) 
                 FROM employees e );
 
06. ������� �޿��� �츮ȸ�� ��� �޿� �̻� �ְ� �޿� ���Ͽ� �ش��ϴ�
������� ���, ��, �޿� ��ȸ

�츮 ȸ�� ��� �޿�
SELECT AVG(salary) --6461.831775700934579439252336448598130841
FROM employees;

�츮 ȸ�� �ְ� �޿�
SELECT MAX(salary) --24000
FROM employees;

SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN 6461 AND 24000;
                 
SELECT employee_id, last_name, salary
FROM employees
WHERE salary BETWEEN ( SELECT AVG(salary) FROM employees ) 
             AND     ( SELECT MAX(salary) FROM employees );

-----------------------------------------------------------------------------------------------
[�������� 6-1]
01. �츮ȸ�翡�� ���� ���� �޿��� �޴� ����� 
���, ��, �����ڵ�, �μ��ڵ�, �μ���, �޿� ��ȸ

�츮 ȸ�� �ּ� �޿�
SELECT MIN(salary) --2100
FROM employees;

SELECT  e.employee_id, e.last_name, e.job_id, 
        e.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.salary = 2100;

SELECT  e.employee_id, e.last_name, e.job_id, 
        e.department_id, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.salary = ( SELECT MIN(e.salary) 
                 FROM employees e );
--WHERE e.salary = �츮ȸ�翡�� ���� ���� �޿�;

02. �μ����� Marketing �� �μ��� ���� ������� 
���, ����, �μ��ڵ�, �����ڵ� ��ȸ

�μ����� Marketing�� �μ��ڵ�
SELECT department_id --20
FROM departments
WHERE LOWER(department_name) = 'marketing';

�Ϲ� ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(d.department_name) = 'marketing';

���� ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e
WHERE e.department_id = 20;

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e    --�� ���������� �������� ���鶧 �������������� ������ ���� ����????? XXXX
WHERE e.department_id = ( SELECT d.department_id 
                          FROM departments d
                          WHERE LOWER(d.department_name) = 'marketing' );

03. �츮ȸ�� ����Ժ��� ���� �Ի��� ������� 
���, ����, �Ի����� ��ȸ
������ �׸� �����ϴ� �Ŵ����� ���� ����� ���Ѵ�.

����� �Ի�����
SELECT e.hire_date --03/06/17
FROM employees e
WHERE e.manager_id IS NULL;

�Ϲ� ���� --SELF JOIN
SELECT e.employee_id, e.first_name || ' '|| e.last_name name, e.hire_date  --10��
FROM employees e, employees m
WHERE e.hire_date < m.hire_date 
AND m.manager_id IS NULL;

���� ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date  --10��
FROM employees e
WHERE e.hire_date < TO_DATE('03/06/17'); --����� �Ի�����


SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date  --10��
FROM employees e
WHERE e.hire_date < ( SELECT m.hire_date 
                      FROM employees m
                      WHERE m.manager_id IS NULL );
--WHERE hire_date < ����� �Ի�����;
-----------------------------------------------------------------------------------------------

===============================================================================================
����. ������(WHERE, HAVING)�� ����ϴ� ����(���)�� ���� ����
      �ءءءءءءءءءءءءءءءءءءءءءءءءءءء�
����(���)�� ���� ���� ������: =, !=, <>, <, >, <=, >=
===============================================================================================
����. ������(WHERE, HAVING)�� ����ϴ� ����(���)�� ���� ����
      �ءءءءءءءءءءءءءءءءءءءءءءءءءءء�
����(���)�� ���� ���� ������: IN, NOT IN
===============================================================================================

2. ����(���)�� ���� ���� - �������� ����� ���� ������ ������� ���� ���� ���
- ������ : IN, NOT IN(��, '='�� IN ���� ��ü), 
  ���� ����� �� �� �̻��� ��Һ� �Ұ�, �׷���, IN ������ ���
  ���� ������ ����� ���� ���� ��� '=', '<', '>' �� ���� ��Һ񱳰� �Ұ�
  WHERE ������ �׷��Լ�(MIN, MAX ��) ��� �Ұ�!
  WHERE ���� �ƴ� ���� �������� �׷��Լ�(MIN, MAX ��) ��밡��

- �÷�ǥ�� IN, NOT �÷�ǥ�� IN, �÷�ǥ�� NOT IN
-----------------------------------------------------------------------------------------------

01. �μ��� ��ġ�ڵ尡 1700 ��/ (1700�� �ƴ�) �μ��� ���� �������
    �ءءءءءءءءءءءءءءءءءءءءء�                   �ءءءءءءءءءء�
���, ����, �μ��ڵ�, �����ڵ���ȸ

��ġ�ڵ尡 1700 �� �μ�
SELECT d.department_id, d.location_id --21��, �� ������
FROM departments d 
WHERE d.location_id = 1700; 

�Ϲ� ���� 
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id IN (1700);

���� ����
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, --18����
       e.department_id, e.job_id
FROM employees e 
WHERE e.department_id IN ( 10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270 );
--WHERE e.department_id = (��ġ�ڵ尡 1700 �� �μ�);

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, --18����
       e.department_id, e.job_id
FROM employees e 
WHERE e.department_id IN ( SELECT department_id 
                      --NOT IN (SELECT department_id 
                           FROM departments
                           WHERE location_id = 1700 );
--WHERE e.department_id = (��ġ�ڵ尡 1700 �� �μ�);

                   
02. �츮ȸ�翡�� mgr ������ �����ϴ� ������ ���� �μ��� ���� �������
���, ��, �����ڵ� ��ȸ ---DDDDD, ���� ���� 

mgr ������ �����ϴ� ����� �μ��ڵ�
SELECT department_id    --100, 110 2��
FROM employees
WHERE LOWER(job_id) LIKE '%mgr%';

�Ϲ� ����
SELECT e.employee_id, e.last_name, e.job_id  --8��
FROM employees e, employees m
WHERE e.department_id = m.department_id(+)
AND LOWER(m.job_id) LIKE '%mgr%'
ORDER BY 1;

���� ����
SELECT e.employee_id, e.last_name, e.job_id --8��
FROM employees e
WHERE e.department_id IN ( 100, 110 ) 
ORDER BY 1;

SELECT employee_id, last_name, job_id  --8��
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(job_id) LIKE '%mgr%' ) 
ORDER BY 1;


03. �� �μ��� �ּұ޿��� 40�� �μ��� �ּұ޿����� �� ���� 
�μ��ڵ�, �ּұ޿� ��ȸ

40�� �μ��� �ּұ޿�
SELECT MIN(salary) --6500
FROM employees 
WHERE department_id = 40;

SELECT department_id, MIN(salary) min_sal --5��
FROM employees
--WHERE
GROUP BY department_id
HAVING MIN(salary) > 6500
ORDER BY 1;
--HAVING �μ��ּұ޿� > 40�� �μ��ּұ޿�;


SELECT department_id, MIN(salary) min_sal --5��
FROM employees
--WHERE
GROUP BY department_id
HAVING MIN(salary) > ( SELECT MIN(salary) 
                       FROM employees 
                       WHERE department_id = 40 )
ORDER BY 1;
--HAVING �μ��ּұ޿� > 40�� �μ��ּұ޿�;


04. �ٹ����� �����ڵ尡 UK(��, country_id�� UK)�� ���� �ִ� �μ��� 
�μ��ڵ�, ��ġ�ڵ�, �μ��� ��ȸ

�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�
SELECT location_id --����� ������ 2400, 2500, 2600
FROM locations 
WHERE LOWER(country_id) = 'uk';  

�Ϲ�����
SELECT d.department_id, d.location_id, d.department_name
FROM departments d, locations l
WHERE d.location_id =  l.location_id
AND LOWER(l.country_id)='uk';   

����(���)�� ���� ����
SELECT department_id, location_id, department_name --2��
FROM departments
WHERE location_id IN ( 2400, 2500, 2600 );
--WHERE location_id  = (�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�);

SELECT department_id, location_id, department_name --2��
FROM departments
WHERE location_id IN ( SELECT location_id
                       FROM locations 
                       WHERE LOWER(country_id) = 'uk' );
--WHERE location_id  = (�ٹ����� �����ڵ尡 UK �� ���� �ִ� �μ�);


05. ���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������ ���� �μ��� ���� 
������� ���, ����, �μ��ڵ�, �����ڵ� ��ȸ

-----------------------------------------------------------------------------------------------
�ڡڡڡں�. 
���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������� 
���, ����, �μ��ڵ�, �����ڵ� ��ȸ
SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE LOWER(last_name) LIKE '%z%'; --���� ��ҹ��� �����ϰ� z�� �ִ� ��;
-----------------------------------------------------------------------------------------------

���� ��ҹ��� �����ϰ� z �� ���Ե� ���� ���� ������ ���� �μ�
SELECT department_id, last_name --�μ��� 60, 80, 110
FROM employees
WHERE LOWER(last_name) LIKE '%z%';

SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.department_id, e.job_id
FROM employees e
WHERE e.department_id IN (60, 80, 110);

SELECT employee_id, first_name || ' ' || last_name name, 
       department_id, job_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM employees
                         WHERE LOWER(last_name) LIKE '%z%' );
--WHERE department_id = --���� ��ҹ��� �����ϰ� z �� ���Ե� ����� ���� �μ��� ����


06. 60�� �μ������ ���� �޿��� �޴� ������� 
������� ���, ��, �޿�, �μ��ڵ� ��ȸ

60�� �μ��� �޿�
SELECT salary --����� ������ : 9000, 6000, 4800, 4200
FROM employees 
WHERE department_id = 60;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN (4200, 4800, 6000, 9000);

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 );

07. 60�� �μ��� ������ �����鼭
60�� �μ������ ���� �޿��� �޴� ������� 
���, ��, �޿�, �μ��ڵ� ��ȸ
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT salary 
                  FROM employees 
                  WHERE department_id = 60 )
AND department_id != 60;
--AND department_id <> 60;
--AND department_id NOT IN(60);

08. �츮ȸ�� ����� �� �μ����� Marketing�̰ų� IT�� ���� �������
���, ��, �μ��ڵ� ��ȸ

�μ����� Marketing�̰ų� IT�� ����� �μ��ڵ�
SELECT department_id --20, 60
FROM departments 
WHERE department_name IN ('Marketing', 'IT');

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( 20,60 );

SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN ( SELECT department_id 
                         FROM departments 
                         WHERE department_name IN ('Marketing', 'IT') );
-----------------------------------------------------------------------------------------------
