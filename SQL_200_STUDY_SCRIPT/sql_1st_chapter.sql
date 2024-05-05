/*초보자를 위한 SQL 200제 PRACTICE*/

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

SELECT empno as "사원 번호", ename as "사원 이름", sal as "Salary"
  FROM emp;
-- 컬럼 별칭에 더블 쿼테이션 마크를 감싸줘야 하는 경우:
/* 1. 대소문자를 구분하여 출력할 때 like in Salary */
/* 2. 공백문자를 출력할 때 like in 사원 번호 */
/* 3. 특수문자를 출력할 때($,_,#만 가능)*/


SELECT ename, sal *(12 + 3000)
  FROM emp;
  
SELECT ename, sal *(12 + 3000) as 월급
  FROM emp;

SELECT ename, sal *(12 + 3000) as 월급
  FROM emp
 ORDER
    BY 월급 desc;
    
SELECT ename || sal
  FROM emp;
  
SELECT ename || '의 월급은 ' || sal || '입니다.' as 월급정보
  FROM emp;
  
SELECT ename || '의 직업은 ' || job || '입니다.' as 직업정보
  FROM emp;
  
SELECT DISTINCT job
  FROM emp;

SELECT UNIQUE job
  FROM emp;

-- distinct 와 unique의 출력 결과가 같다.

SELECT ename, sal
  FROM emp
 ORDER
    BY sal asc;

-- 데이터를 정렬해서 출력하려면 ORDER BY절을 사용
-- ORDER BY절 뒤에 정렬하고자 하는 데이터의 컬럼명 기술한 뒤 내림차순,오름차순 정렬방식 옵션 작성
-- ORDER BY절은 SQL 작성 시에도 맨 마지막에 작성하고 오라클이 실행할 때도 맨 마지막에 실행
-- ORDER BY절은 맨 마지막에 실행되므로 SELECT절에 사용한 컬럼 별칭을 ORDER BY절에도 사용 가능

SELECT ename, sal as 월급
  FROM emp
 ORDER
    BY 월급 asc;
    
SELECT ename, deptno, sal
  FROM emp
 ORDER
    BY deptno asc, sal desc ;
    
SELECT ename, deptno, sal
  FROM emp
 ORDER
    BY 2 asc, 3 desc ;

-- SELECT절 칼럼의 순서대로 ORDER BY절에서 칼럼을 숫자로 대치 가능

SELECT ename, sal, job
  FROM emp
 WHERE sal = 3000;
 
/* >,<,BETWEEN AND, LIKE, >=,<=,=,!=,^=,<>,IS NULL, IN(검색) */

SELECT ename as 이름, sal as 월급
  FROM emp
 WHERE sal >= 3000;
 
-- 오라클은 FROM절을 실행하고 WHERE절을 실행하여 에러가 발행. WHERE절에 SELECT절에 사용한 별칭 사용 시 부적합한 식별자라고 에러 발생.

SELECT ename, sal, job, hiredate, deptno
  FROM emp
 WHERE ename='SCOTT';
 
--숫자와는 다르게 문자를 검색할 때에는 문자 양쪽에 SINGLE QUATATION MARK 감싸주어야 함.
--SINGLE QUATATION MARK 안에 있는 것이 숫자가 아니라 문자라고 오라클에게 알려주는 것
--문자 뿐 아니라 날짜도 SINGLE QUATATION MARK로 감싸주어야 함.

SELECT ename, hiredate
  FROM emp
 WHERE hiredate = '81/11/17';
 
--날짜 데이터 검색 시 현재 접속한 session의 날짜 형식에 맞춰 작성
--현재 접속한 session의 날짜 형식은 NSL_SESSION_PARAMETERS를 조회하여 확인

SELECT *
  FROM NLS_SESSION_PARAMETERS
 WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT='YY/MM/DD';

SELECT ename, sal
  FROM emp
 WHERE hiredate='81/11/17';
--인출된 행 없음
--YY는 현재 세기의 년도로 인식하여 아직 현재 세기에서 그 년도가 되지 않았을 시 출력이 안됨.
--RR는 현재 년도 이상의 년도가 입력되면 직전 세기로 인식하여 출력됨.
--ALTER SESSION SET 명령어는 현재 내가 접속한 세션의 파라미터를 변경하는 명령어. 현재 세션에서만 유효. 로그아웃 후 재접속 시 기본값으로 복구되어 세팅됨.
--SESSION이란 데이터베이스 유저로 로그인해서 로그아웃할 때까지의 한 단위

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';

SELECT ename, sal*12 as 연봉
  FROM emp
 WHERE sal*12 >= 36000;
 
SELECT ename, sal, comm, sal + comm
  FROM emp
 WHERE deptno = 10;
-- 부서 번호가 10인 사원들의 커미션이 없기 때문에 null값으로 출력되어 정수와 null값이 더해질 수 없기 때문에 null값으로 sal+comm이 출력됨

SELECT ename, sal, NVL(comm, 0), sal + NVL(comm,0)
  FROM emp
 WHERE deptno = 10;
--null값 없이 정상적으로 출력됨

SELECT ename, sal, job, deptno
  FROM emp
 WHERE sal <= 1200;
 
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000;
--BETWEEN은 경계값 포함
--BETWEEN 하한값 AND 상한값으로 작성하여야 검색 가능.

SELECT ename, sal
  FROM emp
 WHERE sal NOT BETWEEN 1000 AND 3000;
 
SELECT ename, sal
  FROM emp
 WHERE (sal < 1000 OR sal > 3000);
 
--위의 두 코드는 결과가 동일하지만 NOT BETWEEN을 쓰는 것이 OR을 사용하는 것보다 깔끔하다.

SELECT ename, hiredate
  FROM emp
 WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';
 
SELECT ename, sal
  FROM emp
 WHERE ename LIKE 'S%'
 
--%는 와일드카드라고 함. 와일드카드란 이 자리에 어떠한 철자가 와도 상관 없고 철자의 개수가 몇 개가 되든 상관 없다는 뜻.
--와일드카드를 사용하려면 LIKE 연산자를 붙여줘야 함. 이퀄 연산자(=)를 붙여준다면 S%라는 이름을 가진 사원을 검색하겠다는 뜻이 됨.

SELECT ename
  FROM emp
 WHERE ename LIKE '%T';
--왜 명령어가 올바르게 종료되지 않았는지 이유를 알 수 없음. 오탈자가 없는데. 

SELECT ename
  FROM emp
 WHERE ename LIKE '_M%';
-- ENAME SMITH 출력됨.

SELECT ename
  FROM emp
 WHERE ename LIKE '%T';
--SCOTT 출력됨.

SELECT ename
  FROM emp
 WHERE ename LIKE '%A%';

SELECT ename, comm
  FROM emp
 WHERE comm is null;
--null값 검색 시 is null 써야 함. !=NULL로 검색 불가. 이유는 NULL은 데이터가 없는 상태이고 알 수 없는 값이므로.

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
 
--WHERE TRUE 조건 AND TRUE 조건이어야 데이터가 반환됨. 둘 중 하나라도 FALSE라면 반환되지 않음.

--SQL 첫발 내딛기 입문편 끝.