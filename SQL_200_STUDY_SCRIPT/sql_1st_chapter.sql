/*�ʺ��ڸ� ���� SQL 200�� PRACTICE*/

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

select * from emp;

SELECT empno, ename, sal
  FROM emp;
  
SELECT empno, ename, sal, deptno
  FROM emp;
  
SELECT *
  FROM emp;
  
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
  FROM emp;
  
SELECT DEPT.*, deptno from dept;

SELECT empno as "��� ��ȣ", ename as "��� �̸�", sal as "Salary"
  FROM emp;
-- �÷� ��Ī�� ���� �����̼� ��ũ�� ������� �ϴ� ���:
/* 1. ��ҹ��ڸ� �����Ͽ� ����� �� like in Salary */
/* 2. ���鹮�ڸ� ����� �� like in ��� ��ȣ */
/* 3. Ư�����ڸ� ����� ��($,_,#�� ����)*/


SELECT ename, sal *(12 + 3000)
  FROM emp;
  
SELECT ename, sal *(12 + 3000) as ����
  FROM emp;

SELECT ename, sal *(12 + 3000) as ����
  FROM emp
 ORDER
    BY ���� desc;
    
SELECT ename || sal
  FROM emp;
  
SELECT ename || '�� ������ ' || sal || '�Դϴ�.' as ��������
  FROM emp;
  
SELECT ename || '�� ������ ' || job || '�Դϴ�.' as ��������
  FROM emp;
  
SELECT DISTINCT job
  FROM emp;

SELECT UNIQUE job
  FROM emp;

-- distinct �� unique�� ��� ����� ����.

SELECT ename, sal
  FROM emp
 ORDER
    BY sal asc;

-- �����͸� �����ؼ� ����Ϸ��� ORDER BY���� ���
-- ORDER BY�� �ڿ� �����ϰ��� �ϴ� �������� �÷��� ����� �� ��������,�������� ���Ĺ�� �ɼ� �ۼ�
-- ORDER BY���� SQL �ۼ� �ÿ��� �� �������� �ۼ��ϰ� ����Ŭ�� ������ ���� �� �������� ����
-- ORDER BY���� �� �������� ����ǹǷ� SELECT���� ����� �÷� ��Ī�� ORDER BY������ ��� ����

SELECT ename, sal as ����
  FROM emp
 ORDER
    BY ���� asc;
    
SELECT ename, deptno, sal
  FROM emp
 ORDER
    BY deptno asc, sal desc ;
    
SELECT ename, deptno, sal
  FROM emp
 ORDER
    BY 2 asc, 3 desc ;

-- SELECT�� Į���� ������� ORDER BY������ Į���� ���ڷ� ��ġ ����

SELECT ename, sal, job
  FROM emp
 WHERE sal = 3000;
 
/* >,<,BETWEEN AND, LIKE, >=,<=,=,!=,^=,<>,IS NULL, IN(�˻�) */

SELECT ename as �̸�, sal as ����
  FROM emp
 WHERE sal >= 3000;
 
-- ����Ŭ�� FROM���� �����ϰ� WHERE���� �����Ͽ� ������ ����. WHERE���� SELECT���� ����� ��Ī ��� �� �������� �ĺ��ڶ�� ���� �߻�.

SELECT ename, sal, job, hiredate, deptno
  FROM emp
 WHERE ename='SCOTT';
 
--���ڿʹ� �ٸ��� ���ڸ� �˻��� ������ ���� ���ʿ� SINGLE QUATATION MARK �����־�� ��.
--SINGLE QUATATION MARK �ȿ� �ִ� ���� ���ڰ� �ƴ϶� ���ڶ�� ����Ŭ���� �˷��ִ� ��
--���� �� �ƴ϶� ��¥�� SINGLE QUATATION MARK�� �����־�� ��.

SELECT ename, hiredate
  FROM emp
 WHERE hiredate = '81/11/17';
 
--��¥ ������ �˻� �� ���� ������ session�� ��¥ ���Ŀ� ���� �ۼ�
--���� ������ session�� ��¥ ������ NSL_SESSION_PARAMETERS�� ��ȸ�Ͽ� Ȯ��

SELECT *
  FROM NLS_SESSION_PARAMETERS
 WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD';

SELECT ename, sal
  FROM emp
 WHERE hiredate='81/11/17';
--����� �� ����
--YY�� ���� ������ �⵵�� �ν��Ͽ� ���� ���� ���⿡�� �� �⵵�� ���� �ʾ��� �� ����� �ȵ�.
--RR�� ���� �⵵ �̻��� �⵵�� �ԷµǸ� ���� ����� �ν��Ͽ� ��µ�.
--ALTER SESSION SET ��ɾ�� ���� ���� ������ ������ �Ķ���͸� �����ϴ� ��ɾ�. ���� ���ǿ����� ��ȿ. �α׾ƿ� �� ������ �� �⺻������ �����Ǿ� ���õ�.
--SESSION�̶� �����ͺ��̽� ������ �α����ؼ� �α׾ƿ��� �������� �� ����

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';

SELECT ename, sal*12 as ����
  FROM emp
 WHERE sal*12 >= 36000;
 
SELECT ename, sal, comm, sal + comm
  FROM emp
 WHERE deptno = 10;
-- �μ� ��ȣ�� 10�� ������� Ŀ�̼��� ���� ������ null������ ��µǾ� ������ null���� ������ �� ���� ������ null������ sal+comm�� ��µ�

SELECT ename, sal, NVL(comm, 0), sal + NVL(comm,0)
  FROM emp
 WHERE deptno = 10;
--null�� ���� ���������� ��µ�

SELECT ename, sal, job, deptno
  FROM emp
 WHERE sal <= 1200;
 
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000;
--BETWEEN�� ��谪 ����
--BETWEEN ���Ѱ� AND ���Ѱ����� �ۼ��Ͽ��� �˻� ����.

SELECT ename, sal
  FROM emp
 WHERE sal NOT BETWEEN 1000 AND 3000;
 
SELECT ename, sal
  FROM emp
 WHERE (sal < 1000 OR sal > 3000);
 
--���� �� �ڵ�� ����� ���������� NOT BETWEEN�� ���� ���� OR�� ����ϴ� �ͺ��� ����ϴ�.

SELECT ename, hiredate
  FROM emp
 WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';
 
SELECT ename, sal
  FROM emp
 WHERE ename LIKE 'S%'
 
--%�� ���ϵ�ī���� ��. ���ϵ�ī��� �� �ڸ��� ��� ö�ڰ� �͵� ��� ���� ö���� ������ �� ���� �ǵ� ��� ���ٴ� ��.
--���ϵ�ī�带 ����Ϸ��� LIKE �����ڸ� �ٿ���� ��. ���� ������(=)�� �ٿ��شٸ� S%��� �̸��� ���� ����� �˻��ϰڴٴ� ���� ��.

SELECT ename
  FROM emp
 WHERE ename LIKE '%T';
--�� ��ɾ �ùٸ��� ������� �ʾҴ��� ������ �� �� ����. ��Ż�ڰ� ���µ�. 

SELECT ename
  FROM emp
 WHERE ename LIKE '_M%';
-- ENAME SMITH ��µ�.

SELECT ename
  FROM emp
 WHERE ename LIKE '%T';
--SCOTT ��µ�.

SELECT ename
  FROM emp
 WHERE ename LIKE '%A%';

SELECT ename, comm
  FROM emp
 WHERE comm is null;
--null�� �˻� �� is null ��� ��. !=NULL�� �˻� �Ұ�. ������ NULL�� �����Ͱ� ���� �����̰� �� �� ���� ���̹Ƿ�.

SELECT ename, comm
  FROM emp
 WHERE comm is not null;
 
SELECT ename, sal, job
  FROM emp
 WHERE job in ('SALESMAN', 'ANALYST','MANAGER');
 
SELECT ename, sal, job
  FROM emp
 WHERE (job='SALESMAN' or job='ANALYST' or job='MANAGER');

 
SELECT ename, sal, job
  FROM emp
 WHERE job not in ('SALESMAN', 'ANALYST', 'MANAGER');
 
SELECT ename, sal, job
  FROM emp
 WHERE (job != 'SALESMAN' and job !='ANALYST' and job != 'MANAGER');
 
SELECT ename, sal, job
  FROM emp
 WHERE job='SALESMAN' AND sal >= 1200;
 
--WHERE TRUE ���� AND TRUE �����̾�� �����Ͱ� ��ȯ��. �� �� �ϳ��� FALSE��� ��ȯ���� ����.

--SQL ù�� ����� �Թ��� ��.