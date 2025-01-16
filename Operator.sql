USE practice_sql;

-- 거래내역 테이블
-- 거래번호 정수
-- 거래일자 날짜
-- 거래구분 가변문자열10
-- 내역 장문의문자열
-- 금액 실수
-- 세금 실수
-- 비고 장문의문자열

CREATE TABLE transaction (
    transaction_number INT,
    transaction_date DATE,
    transaction_type VARCHAR(10),
    breakdown TEXT,
    amount FLOAT,
    tax FLOAT,
    note TEXT
);

INSERT INTO transaction
VALUES (1, '2025-01-16', '구매', '기타자재', 100000, 10000, null);

INSERT INTO transaction
VALUES (2, '2025-01-16', '판매', '영양제', 70000, 7000, '종합 비타민');

INSERT INTO transaction
VALUES (3, '2025-01-17', '판매', '영양제', 120000, 12000, '종합 비타민');

INSERT INTO transaction
VALUES (4, '2025-01-17', '구매', '책상', 400000, 40000, '4개 구매');

INSERT INTO transaction
VALUES (5, '2025-01-17', '구매', '의자', 200000, 20000, '4개 구매');

INSERT INTO transaction
VALUES (6, '2025-01-20', '판매', '의약외품', 100000, 10000, '소염 진통제');

INSERT INTO transaction
VALUES (7, '2025-01-21', '판매', '의약외품', 50000, 5000, '소염 진통제');

INSERT INTO transaction
VALUES (8, '2025-01-21', '구매', '기타자재', 10000, 1000, '볼펜 및 노트');

INSERT INTO transaction
VALUES (9, '2025-01-24', '판매', '의료기기', 800000, 80000, '휠체어');

INSERT INTO transaction
VALUES (10, '2025-01-25', '판매', '의료기기', 50000, 5000, '체온계');

SELECT * FROM transaction;

-- 연산자

-- 산술 연산자
-- +, -, *, /, %
SELECT amount + tax FROM transaction;

-- 비교 연산자
-- 좌항과 우항을 비교
-- WHERE 절에서 자주 사용됨, 원하는 레코드를 정확히 조회하는데 중요한 역할을 수행함

-- = : 좌항과 우항이 같으면 true
SELECT * FROM transaction
WHERE transaction_type = '구매';

-- <>, != : 좌항과 우항이 다르면 true
SELECT * FROM transaction
WHERE transaction_type <> '구매';

SELECT * FROM transaction
WHERE breakdown != '영양제';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
SELECT * FROM transaction
WHERE amount < 70000;

SELECT * FROM transaction
WHERE amount <= 70000;

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
SELECT * FROM transaction
WHERE amount > 70000;

SELECT * FROM transaction
WHERE amount >= 70000;

ALTER TABLE transaction ADD complete BOOLEAN;
SELECT * FROM transaction;

UPDATE transaction SET complete = true
WHERE (transaction_number % 3) = 1;

UPDATE transaction SET complete = false
WHERE (transaction_number % 3) = 2;

UPDATE transaction SET note = null
WHERE transaction_number = 6;

-- <=> : 좌항과 우항이 모두 null이면 true
SELECT * FROM transaction
WHERE note <=> complete;