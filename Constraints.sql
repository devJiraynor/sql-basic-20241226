USE practice_sql;

-- 제약조건 : 데이터베이스 테이블 컬럼에 삽입, 수정, 삭제 시 규칙을 적용하는 방법

-- NOT NULL 제약조건 : 해당 컬럼에 null을 지정하지 못하도록 하는 제약
-- [자기 자신 테이블의 INSERT, UPDATE에 영향을 미침]
CREATE TABLE not_null_table (
    null_column INT NULL,
    not_null_column INT NOT NULL
);

-- NOT NULL 제약조건이 지정된 컬럼을 삽입시 선택하지 않았을 경우
-- Error Code : 1364
INSERT INTO not_null_table (null_column) VALUES (1);
-- NOT NULL 제약조건이 지정된 컬럼에 null을 지정할 경우
-- Error Code : 1048
INSERT INTO not_null_table VALUES (1, null);

INSERT INTO not_null_table VALUES (1, 1);
INSERT INTO not_null_table VALUES (null, 2);
INSERT INTO not_null_table (not_null_column) VALUES (3);

-- NOT NULL 제약조건이 지정된 컴럼에 null로 수정할 경우
-- Error Code : 1048
UPDATE not_null_table SET not_null_column = null;

-- UNIQUE 제약조건 : 해당 컬럼에 중복된 데이터를 지정할 수 없도록 하는 제약
-- [자기 자신 테이블의 INSERT, UPDATE에 영향을 미침]
CREATE TABLE unique_table (
    unique_column INT UNIQUE,
    not_unique_column INT
);

INSERT INTO unique_table VALUES (1, 1);
-- UNIQUE 제약조건이 지정된 컬럼에 중복된 데이터를 지정하려는 경우
-- Error Code : 1062
INSERT INTO unique_table VALUES (1, 1);

INSERT INTO unique_table VALUES (2, 1);

-- UNIQUE 제약조건이 지정된 컬럼에 중복된 데이터로 수정하려 하는 경우
-- Error Code : 1062
UPDATE unique_table SET unique_column = 1;

-- Key : 레코드의 구분을 위한 컬럼의 조합 (1, ~)
-- 슈퍼키 (Super Key) : 컬럼의 조합으로 독립적인 레코드를 구분할 수 있는 키
-- 후보키 (Candidate Key) : 최소한의 컬럼으로 레코드를 구분할 수 있는 키
-- 기본키 (Primary Key) : 후보키에서 프로세스에 맞게 선택된 레코드를 구분할 수 있는 키
-- 대체키 (Alternate Key) : 후보키에서 기본키로 선택되지 않은 나머지 키
-- 복합키 (Composite Key) : 두 개 이상의 컬럼의 조합으로 레코드를 구분할 수 있는 기본키