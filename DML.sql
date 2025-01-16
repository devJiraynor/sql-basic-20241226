USE practice_sql;

-- 데이터 조작어 (DML)
-- 테이블에 데이터를 삽입, 조회, 수정, 삭제 할때 사용

-- INSERT : 테이블에 레코드를 삽입하는 명령어

-- 1. 모든 컬럼에 대하여 삽입
-- INSERT INTO 테이블명 VALUES (데이터1, 데이터2, ...);
-- 테이블 구조의 컬럼 순서에 맞게 모든 데이터를 입력해야함
INSERT INTO example_table VALUES ('A', 'B');

-- 2. 특정 컬럼을 선택하여 삽입
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
-- VALUES (데이터1, 데이터2, ...);
-- 지정한 컬럼의 순서와 데이터의 순서가 일치해야함
-- 만약에 default값이 없으며 not null인 컬럼은 반드시 데이터 삽입해야함
INSERT INTO example_table (example_column2) 
VALUES ('선택 데이터');

-- SELECT : 테이블에서 레코드를 조회할 때 사용하는 명령어

-- 1. 모든 데이터 조회
-- SELECT * FROM 테이블명;
SELECT * FROM example_table;

-- 2. 컬럼 선택 조회
-- SELECT 조회할컬럼, ... FROM 테이블명;
SELECT example_column2 FROM example_table;

-- 3. 레코드 선택 조회
-- SELECT 조회할컬럼, ... FROM 테이블명 WHERE 조건;
SELECT * FROM example_table WHERE column1 IS NULL;