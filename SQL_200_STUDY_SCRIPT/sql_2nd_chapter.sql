/*초보자를 위한 SQL 200제 PRACTICE*/
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
/*LENGTHB는 바이트의 크기를 반환. 영어는 한 글자에 1바이트이므로 LENGTH와 동일한 수 반환*/
SELECT LENGTHB('가나다라마')
  FROM DUAL;
/*한글은 한 글자에 3바이트이므로 15 출력*/

SELECT INSTR('SMITH', 'M')
  FROM DUAL;

SELECT INSTR('abcdefg@naver.com', '@')
  FROM DUAL;
/*INSTR의 반환 값은 숫자, 해당 문자의 위치인 숫자.
SELECT SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@')+1)
  FROM DUAL;
/*naver.com*/
SELECT SUBSTR('abcdefg@naver.com', -(LENGTH('abcdefg@gmail.com')-INSTR('abcdefg@naver.com','@')))
  FROM DUAL;
/*naver.com*/

SELECT RTRIM( SUBSTR('abcdefg@naver.com', INSTR('abcdefg@naver.com', '@')+1), '.com')
  FROM DUAL;
/* @ 다음 문자부터 출력하되 .com을 잘라낸다.*/

SELECT ename, REPLACE(sal, 0, '*')
  FROM emp;
/* 숫자를 문자 *로 변경해서 출력할 수 있다.*/

SELECT ename, REGEXP_REPLACE(sal, '[0-3]', '*')
  FROM emp;
/* 월급의 숫자 0~3까지를 *로 출력*/
/* 정규화 + replace */

/*SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('smiths', 's')
  FROM DUAL; */
/*오류 발생*, 우괄호가 소실되었다라는 오류 메시지*/

SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
  FROM DUAL;
/* smith, mith, smit, mith 출력됨 */
DELETE FROM emp WHERE TRIM(ename)='JACK';
COMMIT;
insert into emp(empno,ename,sal,job,deptno) values(8291, 'JACK ', 3000, 'SALESMAN', 30);
commit;
/* JACK의 이름 뒤 공백을 일부러 추가*/
/* 공백 없이 JACK 입력했을 때에는 1행 추가되는데 공백 입력시 커밋 완료만 되고 1행 추가되지 않아 밑의 커밋 결과들 전부 출력 안됨.*/
SELECT ename, sal
  FROM emp
 WHERE ename='JACK ';
/* ENAME, SAL 컬럼 명만 출력됨 사원 데이터 출력되지 않음 */

SELECT ename, sal
  FROM emp
 WHERE RTRIM(ename)='JACK';

DELETE FROM emp WHERE TRIM(ename)='JACK';
COMMIT;

SELECT '876.567' as 숫자, ROUND(876.567,1)
  FROM DUAL;
/*ROUND는 반올림, 두번째 인자에 넣은 숫자의 자리까지 반올림하여 계산하여라*/
SELECT '876.567' as 숫자, TRUNC(876.567,1)
  FROM DUAL;
/*TRUNC는 두 번째 인자에 넣은 숫자까지 남기고 그 숫자 이후의 숫자들은 모두 버려라 */
/*인수로 음수가 올 경우 소수점 이전 그 숫자의 자리부터 바로 버림 */
/*인수로 0이 올 경우 소수점 자리를 기준으로 소수점 이후를 전부 버림 */
/*ROUND도 동일한 방식으로 동작 */

SELECT MOD(10,3)
  FROM DUAL;
/* 나머지 MOD=modulus*/

SELECT empno, MOD(empno, 2)
  FROM emp;

SELECT empno, ename
  FROM emp
 WHERE MOD(empno,2) = 0;
 
SELECT FLOOR(10/3)
  FROM DUAL;
/*FLOOR 내림 */

SELECT ename, MONTHS_BETWEEN(sysdate, hiredate)
  FROM emp;
/*날짜 간 개월 수 확인. 근속 개월 수 확인 가능 */  

SELECT TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')
  FROM DUAL;
  
SELECT ROUND((TO_DATE('2019-06-01', 'RRRR-MM-DD') - TO_DATE('2018-10-01', 'RRRR-MM-DD')) / 7) AS "총 주수"
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
/*1년 3개월 후의 날짜 출력. 20/08/01*/

SELECT TO_DATE('2019-05-01','RRRR-MM-DD') + TO_YMINTERVAL('03-05') as 날짜
  FROM DUAL;
/*3년 5개월 후의 날짜*/
/*누락된 우괄호 오류 발생. RRRR에서 나는데 이유 모르겠음.=>이유는 1뒤에 빠진 ' 때문*/

SELECT '2019/05/22' as 날짜, NEXT_DAY('2019/05/22', '월요일')
  FROM DUAL;
/*돌아오는 월요일(NEXT_DAY의 두번째 인자로 받는 요일)의 날짜*/  
SELECT NEXT_DAY(SYSDATE, '화요일') as "다음 날짜"
  FROM DUAL;
/*SYSDATE 오늘 날짜가 2024-04-10, 돌아오는 화요일의 날짜로 24/04/16이 출력됨 */

SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일') as "다음 날짜"
  FROM DUAL;
/*해당 일자로부터 100달 뒤에 돌아오는 화요일의 날짜. 27/09/28*/
SELECT NEXT_DAY(ADD_MONTHS(sysdate, 100), '화요일') as "다음 날짜"
  FROM DUAL;
/*32/08/17, SYSDATE=24/04/10*/
SELECT '2019/05/22' as 날짜, LAST_DAY('2019/05/22') as "마지막 날짜"
  FROM DUAL;
/*해당 날짜가 포함된 달의 마지막 날짜*/

SELECT LAST_DAY(sysdate) - SYSDATE as "남은 날짜"
  FROM DUAL;
/*오늘로부터 이번 달에 며칠이 남았는지 출력. SYSDAYE=24-04-10, 20*/

SELECT ename, hiredate, LAST_DAY(hiredate)
  FROM emp
 WHERE ename='KING';

SELECT ename, TO_CHAR(hiredate, 'DAY') as 요일, TO_CHAR(sal, '999,999') as 월급
  FROM emp
 WHERE ename='SCOTT';
/* 입사일을 요일로 출력하고, TO_CHAR(sal, '999,999')는 월급을 출력할 때 천 단위를 ,찍어 표시하여 출력*/
/* 날짜를 문자로 변환해서 출력하면 날짜에서 년, 월, 일, 요일 등을 추출해서 출력 가능 */

SELECT hiredate, TO_CHAR(hiredate, 'RRRR') as 연도, TO_CHAR(hiredate, 'MM') as 달, TO_CHAR(hiredate, 'DD') as 일, TO_CHAR(hiredate, 'DAY') as 요일
  FROM emp
 WHERE ename='KING';
 
SELECT ename, hiredate
  FROM emp
 WHERE TO_CHAR(hiredate, 'RRRR') = '1981';

SELECT ename as 이름, EXTRACT(year from hiredate) as 연도,
                     EXTRACT(month from hiredate) as 달,
                     EXTRACT(day from hiredate) as 일
  FROM emp;

SELECT ename as 이름, TO_CHAR(sal, '999,999') as 월급
  FROM emp;

SELECT ename as 이름, TO_CHAR(sal*200, '999,999,999') as 월급
  FROM emp;
  
SELECT ename as 이름, TO_CHAR(sal*200, 'L999,999,999') as 월급
  FROM emp;
/*L 은 원화 */
