/*
   DDL
   1. Data Definition Language
   2. 데이터 정의어
   3. 데이터베이스 객체를 다루는 언어이다.
   4.종류
     1)CREATE   : 생성
     2)ALTER    : 수정
     3)DROP     : 삭제(완전 삭제)
     4)TRUNCATE : 삭제 (내용만 삭제)
*/

-- 테이블 삭제
DROP TABLE CUSTOMER_T;
DROP TABLE BANK_T;

-- 테이블 생성
CREATE TABLE BANK_T (
    BANK_CODE VARCHAR2(20 BYTE) NOT NULL,
    BANK_NAME VARCHAR2(30 BYTE),
    CONSTRAINT PK_BANK          PRIMARY KEY(BANK_CODE)
);
CREATE TABLE CUSTOMER_T(
   CUST_NO    NUMBER              NOT NULL,
   CUUT_NAME  VARCHAR2(30 BYTE)   NOT NULL,
   CUST_PHONE VARCHAR(30 BYTE)    UNIQUE,
   CUST_AGE   NUMBER(3)           CHECK(CUST_AGE >= 0 AND CUST_AGE <= 120),
                               -- CHECK(CUST_AGE BETWEEN 0 AND 120),
   BANK_CODE VARCHAR2(20 BYTE),
   CONSTRAINTS PK_CUSTOMER PRIMARY KEY(CUST_NO),
   CONSTRAINTS FK_CUSTOMER_BANK FOREIGN KEY(BANK_CODE) REFERENCES BANK_T(BANK_CODE)
);

/*
  테이블 수정하기
  1. 칼럼 추가하기      : ALTER TABLE 테이블명 ADD         칼럼명 데이터타입 제약조건
  2. 칼럼 수정하기      : ALTER TABLE 테이블명 MODIFY      칼럼명 데이터타입 제약조건
  3. 칼럼 삭제하기      : ALTER TABLE 테이블명 DROP COLUMN 칼럼명
  4. 칼럼 이름 바꾸기   : ALTER TABLE 테이블명 RENAME COLUMN 기존칼럼명 TO 신규칼럼명
  5. 테이블 이름 바꾸기 : ALTER TABLE 테이블명 RENAME TO 신큐테이블명
*/
