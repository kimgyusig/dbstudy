-- 1. 암호화 하기 (해시 알고리즘)
SELECT STANDARD_HASH('1111', 'SHA256')  -- SHA256 암호화 방식
     , STANDARD_HASH('1111', 'SHA384')  -- SHA384 암호화 방식
     , STANDARD_HASH('1111', 'SHA512')  -- SHA512 암호화 방식
     , STANDARD_HASH('1111', 'MD5')     -- MD5 암호화 방식
  FROM DUAL;
  
-- 2. 순위 구하기   (동점자의 경우 같은 순위를 가짐)
SELECT EMP_NO, NAME, SALARY
     , RANK() OVER(ORDER BY SALARY ASC) AS 연봉적은순 --SALARY를 오름차순 정렬하고 순위를 매김
     , RANK() OVER(ORDER BY SALARY DESC) AS 연봉많은순 --SALARY를 내림차순 정렬하고 순위를 매김
  FROM EMPLOYEE_T;
-- 3. 행 번호 구하기 (동점자 처리 방식이 없음)
SELECT EMP_NO, NAME, SALARY
     , ROW_NUMBER() OVER(ORDER BY SALARY ASC) AS 연봉적은순
     , ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 연봉많은순
  FROM EMPLOYEE_T;


-- 4. 분기 처리하기

-- 문제. 사원번호, 사원명, 부서명 조회하기
--1	영업부
--2	인사부
--3	총무부
--4	기획부
-- 1) DECODE 함수
SELECT EMP_NO
    , NAME
    , DECODE(DEPART
    , 1, '영업부'
    , 2, '인사부'
    , 3, '총무부'
    , 4, '기획부') AS 부서명
  FROM EMPLOYEE_T;
   
-- 2) CASE WHEN 표현식
SELECT EMP_NO
     , NAME
     , CASE
       WHEN DEPART = 1 THEN '영업부'
       WHEN DEPART = 2 THEN '인사부'
       WHEN DEPART = 3 THEN '총무부'
       WHEN DEPART = 4 THEN '기획부'
       ELSE 'Unknown'
     END AS 부서명
   FROM EMPLOYEE_T;



-- 1. 사원들의 근무 개월 수를 정수로 내림하여 조회하시오.
-- 사번 근무개월수
-- 100  246
-- 101  219

 -- 2. 직업은 "분야_직급" 형식으로 되어 있다. 예) PU_MAN : 분야(PU), 직급(MAN)
 -- 분야와 직급을 분리하여 조회하시오.
 -- JOB_ID     분야  직급
 -- AC_ACCOUNT AC     ACCOUNT
 -- AC_MGR     AC     MGR


-- 3. FIRST_NAME과 LAST_NAME을 연결한 뒤 모두 대문자로 바꾼 이름을 조회하시오.
-- 사번 이름
-- 100  STEVEN KING
-- 101  NEENA KOCHHAR


-- 4. 사원들이 고용된 순서대로 순위를 매긴 뒤 조회하시오.
-- 입사순위 사번  고용일
-- 1        102   01/01/13
-- 2        206   02/06/07

-- 5. 사원번호, 부서번호, 부서명을 조회하시오.
-- 부서번호가 10이면 'Administration', 20이면 'Marketing', 30이면 'Purchasing', 40이면 'Human Resources', 50이면 'Shipping', 나머지는 'Unknown'
-- 사번  부서번호  부서명
-- 100   90        Unknown
-- ...
-- 114   30        Purchasing
      SELECT EMPLOYEE_ID AS 사번
     , DEPARTMENT_ID AS 부서번호
     , NVL(DECODE(DEPARTMENT_ID
        , 10, 'Administration'
        , 20, 'Marketing'
        , 30, 'Purchasing'
        , 40, 'Human Resources'
        , 50, 'Shipping'), 'Unknown') AS 부서명
  FROM EMPLOYEES;