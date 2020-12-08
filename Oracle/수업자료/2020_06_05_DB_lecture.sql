[�������� 4-3]
01. ������̺��� �Ȱ��� �̸�(first_name)�� �� �̻� �ִ� �̸��� �� �̸��� ��� �� �������� 
��ȸ�ϴ� �������� �ۼ��Ѵ�. 
SELECT  first_name, 
        COUNT(*) cnt
FROM employees
GROUP BY first_name
HAVING COUNT(*) >= 2;

02. �μ���ȣ, �� �μ��� �޿��Ѿװ� �޿���ո� ��ȸ�ϴ� �������� �ۼ��Ѵ�. 
��, �μ� �޿������ 8000 �̻��� �μ��� ��ȸ�ǵ��� �Ѵ�.
SELECT  department_id, 
        SUM(salary) sum_sal, 
        ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 8000;

03. �⵵���� �Ի��� ������� ��ȸ�ϴ� �������� �ۼ��Ѵ�.
��, �⵵�� 2014 �� ���·� ǥ��ǵ��� �Ѵ�.
SELECT  TO_CHAR(hire_date, 'YYYY') hire_date, 
        COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;
-----------------------------------------------------------------------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

�ǽ�
01. �츮ȸ�� ������� ��������(�����ڵ�)�� ��� ���� �ľ��ϰ��� �Ѵ�.
��������(�����ڵ�), ����� ��ȸ
SELECT job_id, COUNT(*) emp_cnt
FROM employees
GROUP BY job_id;


02. �μ��� �޿� ������ �ľ��ϰ��� �Ѵ�.
�μ��ڵ�, �޿���� ��ȸ- �޿������ ���� �μ����� �����ϰ�
�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.

SELECT department_id, ROUND(AVG(salary), 2) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 2 desc;


03. �μ���, ������ �޿��հ踦 �ľ��ϰ��� �Ѵ�.
�μ��ڵ�, �����ڵ�, �޿��հ� ��ȸ

SELECT department_id, job_id, SUM(salary) sum_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1, 2;


04. �μ��ڵ� 60�� �μ��� ���� ������� ��� ���� �ľ��ϰ��� �Ѵ�.
60 �� �μ��� ���� ������� �μ��ڵ�, ��� ���� ��ȸ(HAVING �� ���)
SELECT department_id, COUNT(*) cnt
FROM employees
GROUP BY department_id
HAVING department_id = 60;
 
05. �μ��� �޿������ 10000 �̻��� �μ��� �ľ��ϰ��� �Ѵ�.
�μ��� �޿������ 10000�̻��� �μ��ڵ�, �޿���ո� ��ȸ
�޿���մ� �ݿø��Ͽ� �Ҽ� ��°�ڸ����� ǥ��.

SELECT department_id, ROUND(AVG(salary),2) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary) >= 10000;

06. �� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
ORDER BY 1;

07. 100�� �μ��� ���� ������ �ľ��ϰ��� �Ѵ�.
100�� �μ��� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
WHERE department_id=100
GROUP BY department_id;

08. �� �μ��� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ������� 15�� �̻��� �μ��� ���� �μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 15;

09. �� �μ��� �μ��޿������ 8000 �̻��� �μ��� ����
�μ��ڵ�, �μ�����, �μ��޿���� ��ȸ
SELECT department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id
HAVING AVG(salary)>=8000;

10. �� �μ��� �ִ�޿��� �ľ��ϰ��� �Ѵ�. 
�� �μ��� �ִ�޿��� 10000 �̻��� �μ��ڵ�, �ִ�޿��� ��ȸ. 
SELECT department_id, MAX(salary) max_sal
FROM employees
GROUP BY department_id
HAVING MAX(salary)>= 10000; -- �ִ�޿��� 10000 �̻�
 
11. �� �� �̻� �ִ� ���� � �͵��� �ֳ� �ľ��ϰ��� �Ѵ�. 
�� �� �̻� �ִ� ����, ���� ��ȸ
SELECT last_name, COUNT(*) cnt
FROM employees
GROUP BY last_name
HAVING COUNT(*)>=2;


12. �⵵��(��������)�� �Ի��� ��� ���� �ľ��ϰ��� �Ѵ�. 
�⵵, ��� �� ��ȸ - �⵵�� 2020�� ���·� ǥ��
SELECT TO_CHAR(hire_date, 'YYYY') hire_date, COUNT(*) cnt
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

2001	  1
2002	  7
2003	  6
2004	 10
2005	 29
2006	 24
2007	 19
2008	 11

13. �� �μ����� ������ �ľ��ϰ��� �Ѵ�.
�� �μ��� �μ��ڵ�, �μ�����, �μ��޿����, �μ��ְ�޿�, �μ������޿� ��ȸ
SELECT  department_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal,
        MAX(salary) max_sal, MIN(salary) min_sal
FROM employees       
GROUP BY department_id
ORDER BY 1;

14. �� �������� ������ �ľ��ϰ��� �Ѵ�.
�� ������ �����ڵ�, �����ϴ»����, �����޿����, �����ְ�޿�, ���������޿� ��ȸ
SELECT job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal,
       MAX(salary) max_sal, MIN(salary) min_sal
FROM employees
GROUP BY job_id
ORDER BY 1;

15. �� �μ��� �μ��� �������� �μ��ڵ�, �����ڵ�, �����, �޿���� ��ȸ
SELECT department_id, job_id, COUNT(*) cnt, ROUND(AVG(salary)) avg_sal
FROM employees
GROUP BY department_id, job_id
ORDER BY 1;


ROLLUP 
GROUP BY ������ ROLLUP �Լ��� ����Ͽ� GROUP BY ������ ���� ����� �Բ� 
�ܰ躰 �Ұ�, �Ѱ� ������ ����
�� GROUP BY ������ �ڡڡ�ROLLUP���� ���� �÷�ǥ���ڡڡڿ� ���� �Ѱ踦 ������

01. �μ��� ������� �޿��հ�, �Ѱ�(???)�� ��ȸ�Ѵ�.
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id
ORDER BY department_id;

DEPARTMENT_ID   COUNT(*) SUM(SALARY)
-----------------------------------------
10                 1          4400
20                 2         19000
30                 6         24900
40                 1          6500
50                45        156400
60                 5         28800
70                 1         10000
80                34        304500
90                 3         58000
100                6         51608
110                2         20308

11�� ���� ���õǾ����ϴ�. 

02. �μ��� ������� �޿��հ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY ROLLUP(department_id)
ORDER BY department_id;

DEPARTMENT_ID   COUNT(*) SUM(SALARY)
-----------------------------------------
10                 1          4400
20                 2         19000
30                 6         24900
40                 1          6500
50                45        156400
60                 5         28800
70                 1         10000
80                34        304500
90                 3         58000
100                6         51608
110                2         20308
                 106        684416

12�� ���� ���õǾ����ϴ�. 

03. �μ� �� ������ ������� �޿��հ�, �μ��� �Ұ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id, job_id  
ORDER BY department_id, job_id;

DEPARTMENT_ID JOB_ID   COUNT(*)     SUM(SALARY)
------------- ---------- ---------- -----------
10	          AD_ASST	      1	        4400
20	          MK_MAN	      1	       13000
20	          MK_REP	      1	        6000
30	          PU_CLERK	      5	       13900
30	          PU_MAN	      1	       11000
40	          HR_REP	      1	        6500
50	          SH_CLERK       20	       64300
50	          ST_CLERK       20	       55700
50	          ST_MAN	      5	       36400
60	          IT_PROG         5	       28800
70	          PR_REP	      1	       10000
80	          SA_MAN	      5	       61000
80	          SA_REP	     29	      243500
90	          AD_PRES         1	       24000
90	          AD_VP	          2	       34000
100	          FI_ACCOUNT      5	       39600
100	          FI_MGR	      1	       12008
110	          AC_ACCOUNT      1	        8300
110	          AC_MGR	      1	       12008

19�� ���� ���õǾ����ϴ�. 

04. �μ� �� ������ ������� �޿��հ�, �μ��� �Ұ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY ROLLUP(department_id, job_id)   
ORDER BY department_id, job_id;

DEPARTMENT_ID   JOB_ID              COUNT(*)        SUM(SALARY)
------------------------------------------------------------------
10	            AD_ASST	            1	            4400
10		                            1	            4400
20	            MK_MAN	            1	           13000
20	            MK_REP	            1	            6000
20	    	                        2	           19000
30	            PU_CLERK	        5	           13900
30	            PU_MAN	            1	           11000
30		                            6	           24900
40	            HR_REP	            1	            6500
40		                            1	            6500
50	            SH_CLERK	       20	           64300
50	            ST_CLERK	       20	           55700
50	            ST_MAN	            5	           36400
50		                           45	          156400
60	            IT_PROG	            5	           28800
60		                            5	           28800
70	            PR_REP	            1	           10000
70		                            1	           10000
80	            SA_MAN	            5	           61000
80	            SA_REP	           29	          243500
80		                           34	          304500
90	            AD_PRES	            1	           24000
90	            AD_VP	            2	           34000
90		                            3	           58000
100	            FI_ACCOUNT	        5	           39600
100	            FI_MGR	            1	           12008
100		                            6	           51608
110	            AC_ACCOUNT	        1	            8300
110	            AC_MGR	            1	           12008
110		                            2	           20308
                                  106	          684416

CUBE
GROUP BY ���� CUBE �Լ��� ����Ͽ� 
GROUP BY ������ ���� ����� ��� ����� ���տ� ���� �Ұ�, �Ѱ� ������ ���� �� �ִ�.

01. �μ� �� ������ ������� �޿��հ�, �μ��� �Ұ�, �Ѱ踦 ��ȸ�Ѵ�.
SELECT department_id, job_id, COUNT(*), SUM(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY CUBE(department_id, job_id)   
ORDER BY department_id, job_id;

DEPARTMENT_ID   JOB_ID              COUNT(*)        SUM(SALARY)
------------------------------------------------------------------
10	            AD_ASST	            1	            4400
10		                            1	            4400
20	            MK_MAN	            1	           13000
20	            MK_REP	            1	            6000
20	    	                        2	           19000
30	            PU_CLERK	        5	           13900
30	            PU_MAN	            1	           11000
30		                            6	           24900
40	            HR_REP	            1	            6500
40		                            1	            6500
50	            SH_CLERK	       20	           64300
50	            ST_CLERK	       20	           55700
50	            ST_MAN	            5	           36400
50		                           45	          156400
60	            IT_PROG	            5	           28800
60		                            5	           28800
70	            PR_REP	            1	           10000
70		                            1	           10000
80	            SA_MAN	            5	           61000
80	            SA_REP	           29	          243500
80		                           34	          304500
90	            AD_PRES	            1	           24000
90	            AD_VP	            2	           34000
90		                            3	           58000
100	            FI_ACCOUNT	        5	           39600
100	            FI_MGR	            1	           12008
100		                            6	           51608
110	            AC_ACCOUNT	        1	            8300
110	            AC_MGR	            1	           12008
110		                            2	           20308
                AC_ACCOUNT	        1	            8300
                AC_MGR	            1	           12008
                AD_ASST	            1	            4400
                AD_PRES	            1	           24000
                AD_VP	            2	           34000
                FI_ACCOUNT	        5	           39600
                FI_MGR	            1	           12008
                HR_REP	            1	            6500
                IT_PROG	            5	           28800
                MK_MAN	            1	           13000
                MK_REP	            1	            6000
                PR_REP	            1	           10000
                PU_CLERK	        5	           13900
                PU_MAN	            1              11000
                SA_MAN	            5              61000
                SA_REP	           29             243500
                SH_CLERK	       20              64300
                ST_CLERK	       20	           55700
                ST_MAN	            5	           36400
                                  106             684416
