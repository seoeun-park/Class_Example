PK : ���̺��� ���ڵ带 ������ �� �ִ� �ּ��� �÷�(UNIQUE, NOT NULL)
FK : �ٸ� ���̺��� PK�� �����ϴ� �÷�. 
PK ��.  FK �� .    �θ�� �ڽİ���� �� �� �ֽ��ϴ�.

PK�� �ַ� �й�, �ֹι�ȣ, �����ȣ �� ������ ���� ������ �÷��� �ַ� PK �� ����� �˴ϴ�.

��)
�л� ���̺� 
�й�(PK)   �̸�     �ּ�             �а���ȣ(FK)
1111       ȫ�浿   ��������         a11
1112       ������   �տ���           a11
1113       ���屺   ������           a12
1114       ��ö��   �޵���           a12

�а� ���̺�
�а���ȣ(PK) �а���
a11          ���а�
a12          ������

���� ���� �ΰ��� ���̺��� �ֽ��ϴ�.  
�л� ���̺��� �л� �������� �����ϰ� ������ �� �ִ� �÷����� �й��� �����ϱ⿡ PK�� �Ǹ� 
�а���ȣ �÷��� �ߺ��� �Ǳ⿡ ������ ������ Ű�� �ƴ�����

�а� ���̺��� �а���ȣ(PK)�� ����� �� �ֱ⿡ FK�� �˴ϴ�. 
�̷��� ���踦 ���� �� ���̺��� �����Ͽ� �����͸� ������ �� �ְ� �˴ϴ�.  

���� ��� �л� ���̺��� ��� �л���  �й�, �̸�, �а����� ����ϰ��� �ϸ�

SELECT �й�, �̸�, �а����̺�.�а���
FROM �л����̺�, �а����̺�
WHERE �л����̺�.�а���ȣ = �а����̺�.�а���ȣ ;

��� ������ �ɾ �ذ��� �� �ֽ��ϴ�. �̷��� PK �� FK �� ������ �� ������ 
�������� �ߺ��� �ּ�ȭ �ϱ� ���� ����ȭ�� ���� ���̺��� ���������� �����Դϴ�. 

���� ��� �л�, �а� ���̺�� �������� �ʰ� ó������ ������ �־��ٸ�

������ ���̺�

�й�    �̸�       �ּ�         �а���ȣ  �а���
1111    ȫ�浿     ��������     a11       ���а�
1112    ������     �տ���       a11       ���а�
1113    ���屺     ������       a12       ������
1114    ��ö��     �޵���       a12       ������

���� ���ְ����� �а����� �ߺ��˴ϴ�. 
���� ������ �÷��� ���� ��� ũ�� �������� �ʰ�����
�÷��� 10�� 20�� 30���� �ǵ� ��û�� �������� ���� �߻����� �� �� �ֽ��ϴ�. 
�̷��� �ߺ��Ǵ� �����͸� �ּ�ȭ �ϰ���  ����ȭ�� ���ܳ����ϴ�.

��� - PK�� FK�� ������ �����ͺ��̽� RDBMS ���� �ݵ�� �ʿ��ϴ�.

PK�� �����͸� ������ �� �ִ� �÷��̸� 
FK�� PK�� �����ǰų� NULL ���� ���´�.


5. ����(JOIN)
�ϳ��� ���̺�κ��� �����͸� ��ȸ�� �� ���� ���
�������� ���̺�κ��� �����͸� ��ȸ�Ͽ�
������ ���̺��� �������� ��ȸ�ϱ� �����ϴ� ����ϴ� ����� JOIN�̶�� �Ѵ�.
*****************************

�μ������� ������  �ִ� ���̺�: departments
SELECT * --27��
FROM departments; 

��������� ������ �ִ� ���̺�: employees
SELECT * --107��
FROM employees;  

���������� ������ �ִ� ���̺� : jobs
SELECT * --19��
FROM jobs;  
------------------------------------------------------------------
1. CARTESIAN PRODUCT
�� WHERE ���� JOIN ������ ������� �ʾ� �߸��� ���������� ����� ���� �Ǵ� ����: 
cartesian product, cross join, SQL���� ���̴� ��찡 ����

���, ��, �μ��� ��ȸ
SELECT employee_id, last_name, department_name
FROM employees, departments;

employees: 107 *departments : 27 = 2889
107 * 27 = 2889 => cartesian product

�����ڵ�, ������, �μ��ڵ�, �μ���
SELECT job_id, job_title, department_id, department_name
FROM jobs, departments;

jobs: 19 *  departments : 27 = 513
19 * 27 = 513 => cartesian product

------------------------------------------------------------------
2. EQUI JOIN(ANSI������ INNER JOIN)
: WHERE ���� ���� ������ (=)�� ����ϴ� JOIN �����̴�.
�ڡڡڡڡ���, ���̺�� ���� �������� �����Ǵ� ���� ���� ����� ����� ��ȯ

�� JOIN ���� �� �÷��� ���� ���� �÷��� ���� �������ǽ� ����(�����̺��.�÷��� = ���̺��.�÷��� �� ���)

Table = Entity
���̺��� ���赵: Entity Relationship Diagram(ERD)

��Ȯ��, ���ռ�, ���Ἲ ����

������̺�                  �μ����̺�
����        �μ���ȣ        �μ���ȣ   �μ���
ȫ�浿      10              10         ������
��û        20              20         ���ߺ�
����ġ      10                    


�� ���̺����� ����
1. FROM ���� ���̺� ����� �����ϸ�, ���̺�� ALIAS �� �����Ѵ�.
   (�ڵ� ������ ���̰� �������� ���̱� ����)
2. ���������� WHERE ���� �ۼ��Ѵ�.

-----------------------------------------------------------------------------------
�� ������ �ۼ�����

1. ��ȸ�� �����͸� �ľ��� �� SELECT ���� �ۼ��Ѵ�. 
   SELECT �÷���1, ...
2. SELECT ���� ������ �÷������ � ���̺� �ִ��� �ľ��� �� FROM ���� �ۼ��Ѵ�.
   FROM ���̺��
 - ���� ���� ���̺�κ��� �����͸� ��ȸ�ؾ� �Ѵٸ� FROM ���� �ĸ�(,)�� ����
   FROM ���̺��1, ���̺��2
3. Ư�����ǿ� �´� ���������� ��ȸ�ؾ��ϴ� ��� WHERE ���� �ۼ��Ѵ�.
   WHERE ���ǽ�
 - FROM ���� ���̺��� ���� ���� ��� ���̺����������� �ۼ��Ѵ�.
   WHERE �������ǽ� --�����̺��.�÷��� = ���̺��.�÷���
 - �Ϲ����� ���ǽİ� ���̺����� ���ǽ��� ��� �ʿ��� ��� 
   WHERE �������ǽ� 
   AND �Ϲ����ǽ�
4. SELECT ���� �׷��Լ�(COUNT, SUM, AVG, MAX, MIN) �� ����� �÷�ǥ���� �ִµ� 
   �׷��Լ��� ������� ���� �÷�ǥ���� �Բ� �ִٸ� GROUP BY ���� �ۼ��Ѵ�.
 - �׷��Լ��� ������� ���� �÷�ǥ���� ���� ��� GROUP BY �������� ���
   GROUP BY �׷���������ǥ��
 GROUP BY ���� ����� ��� GROUP BY �� ���� ���� ����������࿡ ���� 
 - Ư�����ǿ� �´� ���������� ��ȸ�ؾ��ϴ� ���
   HAVING ���ǽ� - ���ǽ�: �⺻���� ���ǽ�, �׷��Լ�ǥ��  
   --��WHERE ������������ �׷��Լ�ǥ�� ��� �� ��! 
6. ��ȸ�� ����������࿡ ���� �����ؾ��ϴ� ��� ORDER BY ���� �ۼ��Ѵ�.
   ORDER BY ���ı���ǥ�� ����/��������

�� ���� �ؼ� ����
5. SELECT
1. FROM 
2. WHERE
3. GROUP BY
4. HAVING 
6. ORDER BY;

-----------------------------------------------------------------------------------------------
01. employees, departments ���̺��� ����Ͽ� 
���, ��, �μ��� ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  -- ������̺��� �μ��ڵ� = �μ����̺��� �μ��ڵ�;
ORDER BY 3;

02. employees, departments ���̺��� ����Ͽ� 
������� ���, ��, �μ��ڵ�, �μ��� ������ ��ȸ     
SELECT e.employee_id, e.last_name,
       d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id  --������̺��� �μ��ڵ� = �μ����̺��� �μ��ڵ�;
ORDER BY 1;

03. employees, jobs ���̺��� ����Ͽ� 
���, ��, �����ڵ�, �������� ������ ��ȸ
SELECT e.employee_id, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id --������̺��� �����ڵ� = �������̺��� �����ڵ�
ORDER BY 1;

JOIN �ϴ� ��� ���̺��� �߰��Ǹ� JOIN ������ �߰�
WHERE ���� JOIN ���ǰ� �Ϲ� ������ �Բ� ���

WHERE �������ǽĿ��� 
�Ϲ����� ���ǽİ� ���̺��������ǽ��� ��� �ʿ��� ��� 
�� WHERE �������ǽ� AND �Ϲ� ���ǽ�

04. employees, departments, jobs ���̺��� ����Ͽ� 
���, ��, �μ���, ���������� ��ȸ    --���������� table���� -1 ��ŭ �ʿ�!!
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

05. employees, departments, jobs ���̺��� ����Ͽ� 
���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, department_name, 
        e.job_id, job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
ORDER BY 1;

06. employees, departments, jobs ���̺��� ����Ͽ� 
����� 101���� ����� ���, �̸�, �μ���, �������� ������ ��ȸ
SELECT e.employee_id, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id
AND e.employee_id = 101;

07. employees, departments ���̺��� ����Ͽ� 
����� 100, 120, 130, 140�� �������
���, ��, �μ��ڵ�, �μ���
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND employee_id IN (100, 120, 130, 140);

08. �Ŵ����� ���� ����� ���, �̸�, ���������� ��ȸ�Ѵ�.
SELECT  e.employee_id, e.first_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;


-----------------------------------------------------------------------------------------------
�ǽ�

01. ���� ��ҹ��� �����ϰ� z�� �ִ� ���� ���� ������� 
���, ��, �μ��ڵ�, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND LOWER(last_name) LIKE '%z%'; --���� ��ҹ��� �����ϰ� z�� �ִ� ��;
     
02. Ŀ�̼��� �޴� ������� 
���, ��, �޿�, Ŀ�̼ǿ���, �������� ��ȸ
SELECT  e.employee_id, e.last_name, e.salary, 
        e.commission_pct com, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND commission_pct IS NOT NULL; --Ŀ�̼��� �޴� �����

03. Ŀ�̼��� �޴� ������� 
���, ��, �޿�, Ŀ�̼Ǳݾ�, �μ��� ��ȸ
SELECT  e.employee_id, e.last_name, e.salary, 
        e.salary*e.commission_pct com, d.department_name 
FROM employees e, departments d
WHERE e.department_id =  d.department_id 
AND commission_pct IS NOT NULL;

04. �� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø� ��ȸ
SELECT  d.department_id, d.department_name, 
        l.location_id, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id
ORDER BY 1;

05. ���, ��, �μ��ڵ�, �μ���, �ٹ������ø�, �ּ� ��ȸ
SELECT  e.employee_id, e.last_name, 
        d.department_id, d.department_name, 
        l.city, l.street_address
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
AND d.location_id = l.location_id;

06. ���, ��, �μ��ڵ�, �μ���, �����ڵ�, �������� ��ȸ  --���������� table���� -1 ��ŭ �ʿ�!!
SELECT e.employee_id, e.last_name, 
       d.department_id, d.department_name, 
       j.job_id, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id 
AND e.job_id = j.job_id 
ORDER BY 1;

07. �� �μ��� �μ��ڵ�, �μ���, ��ġ�ڵ�, ���ø�, �����ڵ�, ������, ����� ��ȸ 
-- �� �μ��� ���ض�� �����Ƿ� employees ���̺� �ʿ����
SELECT  d.department_id, d.department_name, 
        l.location_id, l.city, 
        l.country_id, c.country_name, 
        r.region_name
FROM departments d, locations l, countries c, regions r 
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
ORDER BY 1;


