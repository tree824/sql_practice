/*�ʺ��ڸ� ���� SQL 200�� PRACTICE*/
/*15~55*/
alter session set nls_date_format='RR/MM/DD';

drop table emp;
drop table dept;

CREATE TABLE DEPT
       (DEPTNO number(10),
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) NOT NULL,
 ENAME               VARCHAR2(10),
 JOB                 VARCHAR2(9),
 MGR                 NUMBER(4) ,
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) );

INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'81-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'81-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'81-05-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'81-04-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'81-09-10',1250,1400,30);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'81-02-11',1600,300,30);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'81-08-21',1500,0,30);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'81-12-11',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'81-02-23',1250,500,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'81-12-11',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'80-12-11',800,NULL,20);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'82-12-22',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'83-01-15',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'82-01-11',1300,NULL,10);

commit;

drop  table  salgrade;

create table salgrade
( grade   number(10),
  losal   number(10),
  hisal   number(10) );

insert into salgrade  values(1,700,1200);
insert into salgrade  values(2,1201,1400);
insert into salgrade  values(3,1401,2000);
insert into salgrade  values(4,2001,3000);
insert into salgrade  values(5,3001,9999);

commit;

SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
  FROM emp;
  
SELECT count(ename)
  FROM emp;
  
SELECT count(*)
  FROM emp;

SELECT count(*)
  FROM dept;
  
SELECT ENAME, SAL
  FROM emp
 WHERE LOWER(ename)='scott';
 
SELECT SUBSTR('SMITH', 1,3)
  FROM DUAL;

SELECT SUBSTR('SMITH', 2)
  FROM DUAL;
  
SELECT ename, LENGTH(ename)
  FROM emp;

SELECT ename, LENGTH(ename), LENGTHB(ename)
  FROM emp;
/*LENGTHB�� ����Ʈ�� ũ�⸦ ��ȯ. ����� �� ���ڿ� 1����Ʈ�̹Ƿ� LENGTH�� ������ �� ��ȯ*/
SELECT LENGTHB('�����ٶ�')
  FROM DUAL;
/*�ѱ��� �� ���ڿ� 3����Ʈ�̹Ƿ� 15 ���*/

SELECT INSTR('SMITH', 'M')
  FROM DUAL;

SELECT INSTR('abcdefg@naver.com', '@')
  FROM DUAL;
/*INSTR�� ��ȯ ���� ����, �ش� ������ ��ġ�� ����.
SELECT SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@')+1)
  FROM DUAL;
/*naver.com*/
SELECT SUBSTR('abcdefg@naver.com', -(LENGTH('abcdefg@gmail.com')-INSTR('abcdefg@naver.com','@')))
  FROM DUAL;
/*naver.com*/

SELECT RTRIM( SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@')+1), '.com')
  FROM DUAL;
/* @ ���� ���ں��� ����ϵ� .com�� �߶󳽴�.*/

SELECT ename, REPLACE(sal, 0, '*')
  FROM emp;
/* ���ڸ� ���� *�� �����ؼ� ����� �� �ִ�.*/

SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*')
  FROM emp;
/* ������ ���� 0~3������ *�� ���*/
/* ����ȭ + replace */

/*SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('smiths', 's')
  FROM DUAL; */
/*���� �߻�*, ���ȣ�� �ҽǵǾ��ٶ�� ���� �޽���*/

SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
  FROM DUAL;
/* smith, mith, smit, mith ��µ� */
DELETE FROM emp WHERE TRIM(ename)='JACK';
COMMIT;
insert into emp(empno,ename,sal,job,deptno) values(8291, 'JACK ', 3000, 'SALESMAN', 30);
commit;
/* JACK�� �̸� �� ������ �Ϻη� �߰�*/
/* ���� ���� JACK �Է����� ������ 1�� �߰��Ǵµ� ���� �Է½� Ŀ�� �ϷḸ �ǰ� 1�� �߰����� �ʾ� ���� Ŀ�� ����� ���� ��� �ȵ�.*/
SELECT ename, sal
  FROM emp
 WHERE ename='JACK ';
/* ENAME, SAL �÷� �� ��µ� ��� ������ ��µ��� ���� */

SELECT ename, sal
  FROM emp
 WHERE RTRIM(ename)='JACK';

DELETE FROM emp WHERE TRIM(ename)='JACK';
COMMIT;

SELECT '876.567' as ����, ROUND(876.567,1)
  FROM DUAL;
/*ROUND�� �ݿø�, �ι�° ���ڿ� ���� ������ �ڸ����� �ݿø��Ͽ� ����Ͽ���*/
SELECT '876.567' as ����, TRUNC(876.567,1)
  FROM DUAL;
/*TRUNC�� �� ��° ���ڿ� ���� ���ڱ��� ����� �� ���� ������ ���ڵ��� ��� ������ */
/*�μ��� ������ �� ��� �Ҽ��� ���� �� ������ �ڸ����� �ٷ� ���� */
/*�μ��� 0�� �� ��� �Ҽ��� �ڸ��� �������� �Ҽ��� ���ĸ� ���� ���� */
/*ROUND�� ������ ������� ���� */

SELECT MOD(10,3)
  FROM DUAL;
/* ������ MOD=modulus*/

SELECT empno, MOD(empno, 2)
  FROM emp;

SELECT empno, ename
  FROM emp
 WHERE MOD(empno,2) = 0;
 
SELECT FLOOR(10/3)
  FROM DUAL;
/*FLOOR ���� */

SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
  FROM emp;
/*��¥ �� ���� �� Ȯ��. �ټ� ���� �� Ȯ�� ���� */  

SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')
  FROM DUAL;
  
SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')) / 7) AS "�� �ּ�"
  FROM DUAL;

SELECT ADD_MONTHS(TO_DATE('2019-05-01', 'RRRR-MM-DD'), 100)
  FROM DUAL;
/*27/09/01*/
SELECT TO_DATE('2019-05-01') + 100
  FROM DUAL;
/*19/08/09*/
SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '100' month
  FROM DUAL;

SELECT TO_DATE('2019-05-01', 'RRRR-MM-DD') + interval '1-3' year(1) to month
  FROM DUAL;
/*1�� 3���� ���� ��¥ ���. 20/08/01*/

SELECT TO_DATE('2019-05-01','RRRR-MM-DD') + TO_YMINTERVAL('03-05') as ��¥
  FROM DUAL;
/*3�� 5���� ���� ��¥*/
/*������ ���ȣ ���� �߻�. RRRR���� ���µ� ���� �𸣰���.=>������ 1�ڿ� ���� ' ����*/

SELECT '2019/05/22' as ��¥, NEXT_DAY('2019/05/22', '������')
  FROM DUAL;
/*���ƿ��� ������(NEXT_DAY�� �ι�° ���ڷ� �޴� ����)�� ��¥*/  
SELECT NEXT_DAY(SYSDATE, 'ȭ����') as "���� ��¥"
  FROM DUAL;
/*SYSDATE ���� ��¥�� 2024-04-10, ���ƿ��� ȭ������ ��¥�� 24/04/16�� ��µ� */

SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), 'ȭ����') as "���� ��¥"
  FROM DUAL;
/*�ش� ���ڷκ��� 100�� �ڿ� ���ƿ��� ȭ������ ��¥. 27/09/28*/
SELECT NEXT_DAY(ADD_MONTHS(sysdate, 100), 'ȭ����') as "���� ��¥"
  FROM DUAL;
/*32/08/17, SYSDATE=24/04/10*/
SELECT '2019/05/22' as ��¥, LAST_DAY('2019/05/22') as "������ ��¥"
  FROM DUAL;
/*�ش� ��¥�� ���Ե� ���� ������ ��¥*/

SELECT LAST_DAY(sysdate) - SYSDATE as "���� ��¥"
  FROM DUAL;
/*���÷κ��� �̹� �޿� ��ĥ�� ���Ҵ��� ���. SYSDAYE=24-04-10, 20*/

SELECT ename, hiredate, LAST_DAY(hiredate)
  FROM emp
 WHERE ename='KING';

SELECT ename, TO_CHAR(hiredate, 'DAY') as ����, TO_CHAR(sal, '999,999') as ����
  FROM emp
 WHERE ename='SCOTT';
/* �Ի����� ���Ϸ� ����ϰ�, TO_CHAR(sal, '999,999')�� ������ ����� �� õ ������ ,��� ǥ���Ͽ� ���*/
/* ��¥�� ���ڷ� ��ȯ�ؼ� ����ϸ� ��¥���� ��, ��, ��, ���� ���� �����ؼ� ��� ���� */

SELECT hiredate, TO_CHAR(hiredate, 'RRRR') as ����, TO_CHAR(hiredate, 'MM') as ��, TO_CHAR(hiredate, 'DD') as ��, TO_CHAR(hiredate, 'DAY') as ����
  FROM emp
 WHERE ename='KING';
 
SELECT ename, hiredate
  FROM emp
 WHERE TO_CHAR(hiredate, 'RRRR') = '1981';

SELECT ename as �̸�, EXTRACT(year from hiredate) as ����,
                     EXTRACT(month from hiredate) as ��,
                     EXTRACT(day from hiredate) as ��
  FROM emp;

SELECT ename as �̸�, TO_CHAR(sal, '999,999') as ����
  FROM emp;

SELECT ename as �̸�, TO_CHAR(sal*200, '999,999,999') as ����
  FROM emp;
  
SELECT ename as �̸�, TO_CHAR(sal*200, 'L999,999,999') as ����
  FROM emp;
/*L �� ��ȭ */
