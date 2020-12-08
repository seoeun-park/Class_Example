5. SELF JOIN
: �ϳ��� ���̺��� �� �� ����Ͽ� ������ ���̺� �� ���κ��� JOIN �� ���� 
  �����͸� ��ȸ�Ͽ� ����� ��ȯ, �� �� ���̺� ������ �� ������ �÷��� ���� ���谡 �ִ�. 

employees ���̺��� �������, ������������ �ִ�.
������ ���̺��� ���� �� �غ��Ͽ� ���̺� ������ �ϴ� SELF JOIN

01. ��� ����� ���, �̸�, �Ŵ������, �Ŵ����̸� ������ ��ȸ
SELECT  e.employee_id, e.first_name, 
        e.manager_id manager_id, 
        m.first_name manager_name
        --e.manager_id�� m.employee_id�� ����, 
        --��, ������̺� 2���� �ƴ϶� ��� ���̺� 1��, �Ŵ��� ���̺� 1�� ���� ���ζ�� �����ϱ�
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;

SELECT  e.employee_id, e.first_name, 
        NVL(e.manager_id,0) manager_id_1, 
        NVL(TO_CHAR(e.manager_id),'�Ŵ��� ����') manager_id_2, 
        NVL2(e.manager_id,TO_CHAR(e.manager_id),'������ ����') manager_id3,
        
        NVL(m.first_name,'�Ŵ��� �̸� ����') manager_name_1,
        NVL2(m.first_name, m.first_name, '�Ŵ��� �̸� ����') manager_name_2
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY e.employee_id;

-----------------------------------------------------------------------------------------------
[ �������� 5-1 ]                                                                             
01. �̸��� �ҹ��� v�� ���Ե� ��� ����� ���, �̸�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT e.employee_id, e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(first_name) LIKE '%v%'
ORDER BY 1;

02. Ŀ�̼��� �޴� ����� ���, �̸�, �޿�, Ŀ�̼� �ݾ�, �μ����� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, Ŀ�̼� �ݾ��� ���޿��� ���� Ŀ�̼� �ݾ��� ��Ÿ����.
SELECT  e.employee_id, e.first_name, e.salary, 
        salary*NVL(e.commission_pct,0) comm, 
        d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND commission_pct IS NOT NULL
ORDER BY 1;

03. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, �������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
SELECT  d.department_id, d.department_name, 
        l.location_id, l.city, 
        c.country_id, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id;

04. ����� ���, �̸�, �����ڵ�, �Ŵ����� ���, �Ŵ����� �̸�, �Ŵ����� �����ڵ带 ��ȸ�Ͽ� 
����� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT  e.employee_id, e.first_name, e.job_id, e.manager_id, 
        m.first_name manager_name, m.job_id job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

05. ��� ����� ���, �̸�, �μ���, ����, �ּ� ������ ��ȸ�Ͽ� ��� ������ �����ϴ� �������� �ۼ��Ѵ�.
SELECT  e.employee_id, e.first_name, 
        d.department_id, 
        l.city, l.street_address 
FROM employees e, departments d, locations l 
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
ORDER BY 1;

-----------------------------------------------------------------------------------------------
�ǽ�
01. ��� ����� ���, ����, �����ڵ�, �Ŵ������, �Ŵ�������, �Ŵ����� �����ڵ� ��ȸ�Ͽ�
��� ������ ���� --SELF JOIN
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       e.job_id, e.manager_id, 
       m.first_name || ' ' || m.last_name manager_name, m.job_id
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
ORDER BY 1;

02. ���� King�� ������� ���, ����, �μ��ڵ�, �μ��� ��ȸ
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, 
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND LOWER(last_name) LIKE 'king';

03. ��ġ�ڵ尡 1400 �� ���ÿ��� ��� �μ��� �ֳ� �ľ��ϰ��� �Ѵ�.
��ġ�ڵ尡 1400 �� ���ø�, �μ��� ��ȸ
SELECT l.city, d.department_name
FROM locations l, departments d
WHERE d.location_id = l.location_id     ---������ �������!
AND d.location_id = 1400;

04. ��ġ�ڵ� 1800 �� ���� �ٹ��ϴ� �������
���, ����, �����ڵ�, �޿�, �μ���, ��ġ�ڵ� ��ȸ
SELECT  e.employee_id, e.first_name || ' ' || e.last_name name, 
        e.job_id, e.salary, 
        d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND d.location_id = 1800;

05. �ڽ��� �Ŵ������� ���� �Ի��� ������� 
���, ����, �Ի�����, �Ŵ�������, �Ŵ��� �Ի����� ��ȸ --SELF JOIN
SELECT e.employee_id, e.first_name || ' ' || e.last_name name, e.hire_date, 
       m.first_name || ' ' || m.last_name manager_name, m.hire_date
FROM employees e, employees m
WHERE e.manager_id = m.employee_id(+)
AND e.hire_date < m.hire_date; --�ڽ��� �Ŵ������� ���� �Ի��� = �ڽ��� �Ի����� < �Ŵ����� �Ի����� ;

06. toronto �� �ٹ��ϴ� �������
���, ��, �����ڵ�, �μ��ڵ�, �μ���, ���� ��ȸ
SELECT  e.employee_id, e.last_name, e.job_id, 
        d.department_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
--AND LOWER(city) LIKE '%toronto%';
--AND LOWER(city) LIKE 'toronto';
AND LOWER(city) = 'toronto';

07. Ŀ�̼��� �޴� ��� ������� ��, �μ���, ��ġ�ڵ�, ���� ��ȸ
SELECT  e.last_name, d.department_name, 
        l.location_id, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id(+)
AND d.location_id = l.location_id(+)
AND commission_pct IS NOT NULL; --Ŀ�̼��� �޴�;

-----------------------------------------------------------------------------------------------


