USE practice_sql;

-- 제약조건 : 데이터베이스 테이블 컬럼에 삽입, 수정, 삭제 시 규칙을 적용하는 방법

-- NOT NULL 제약조건 : 해당 컬럼에 null을 지정하지 못하도록 하는 제약
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

