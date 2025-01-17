USE practice_sql;

CREATE TABLE employee (
    employee_number INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    age INT,
    department_code VARCHAR(2)
);

CREATE TABLE department (
    department_code VARCHAR(2) PRIMARY KEY,
    name VARCHAR(30),
    tel_number VARCHAR(15)
);

ALTER TABLE employee 
ADD CONSTRAINT employee_department_code_fk
FOREIGN KEY (department_code)
REFERENCES department (department_code);

ALTER TABLE employee
DROP CONSTRAINT employee_department_code_fk;

INSERT INTO department VALUES ('A', '영업부', '051-111-1111');
INSERT INTO department VALUES ('B', '인사부', '051-111-2222');
INSERT INTO department VALUES ('C', '총무부', '051-111-3333');

INSERT INTO employee (name, age, department_code) 
VALUES ('홍길동', 23, 'A');
INSERT INTO employee (name, age, department_code) 
VALUES ('이영희', 32, 'D');
INSERT INTO employee (name, age, department_code) 
VALUES ('김철수', 23, 'B');
INSERT INTO employee (name, age, department_code) 
VALUES ('이성계', 40, 'A');
INSERT INTO employee (name, age, department_code) 
VALUES ('왕건', 18, 'D');

SELECT * FROM department;
SELECT * FROM employee;

-- Alias : 쿼리문에서 사용되는 별칭 (AS 키워드 사용)
-- 컬럼 및 테이블에서 사용가능
-- 결과 혹은 원래 이름을 다르게 지정하고 싶을 때 사용
SELECT 
    employee_number AS '사번',
    name AS '사원 이름',
    age AS '사원 나이',
    department_code AS '부서 코드'
FROM employee AS e;

-- AS 키워드는 생략 가능
SELECT 
    employee_number '사번',
    name '사원 이름',
    age '사원 나이',
    department_code '부서 코드'
FROM employee e;