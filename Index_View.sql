USE practice_sql;

-- 인덱스 (Index): 테이블에서 원하는 컬럼을 빠르게 조회하기 위해 사용하는 구조

-- 인덱스 생성
-- CREATE INDEX 인덱스명 ON 테이블명(컬럼, ...);
CREATE INDEX transaction_amount_idx ON transaction (amount);
CREATE INDEX transaction_amount_tax_idx ON transaction (amount, tax);
CREATE INDEX transaction_tax_amount_idx ON transaction (tax, amount);
CREATE INDEX transaction_amount_desc_idx ON transaction (amount DESC);

-- 테이블에 인덱스 추가
-- ALTER TABLE 테이블명 ADD INDEX 인덱스이름(컬럼명);
ALTER TABLE employee ADD INDEX employee_name_idx (name);

-- 인덱스 삭제
-- DROP INDEX 인덱스명 ON 테이블명;
DROP INDEX transaction_amount_desc_idx ON transaction;

-- 테이블에서 인덱스 삭제
-- ALTER TABLE 테이블명 DROP INDEX 인덱스명;
ALTER TABLE transaction DROP INDEX transaction_amount_idx;