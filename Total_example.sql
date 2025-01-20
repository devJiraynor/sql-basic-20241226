USE school;

DROP TABLE teacher;
DROP TABLE class_room;
DROP TABLE class;
DROP TABLE student;

-- 학생 (학번, 이름, 주소, 휴대전화번호)
-- 학번 문자열(5) NN UQ PK
-- 이름 문자열(15) NN
-- 주소 장문문자열 NN
-- 휴대전화번호 문자열(13) UQ

-- 교사 (교번, 이름, 주소, 휴대전화번호, 직급)
-- 교번 문자열(10) NN UQ PK
-- 이름 문자열(15) NN
-- 주소 장문문자열 NN
-- 휴대전화번호 문자열(13) NN UQ
-- 직급 문자열(50) NN DF '일반교사'

-- 교실 (교실번호, 층, 좌석)
-- 교실번호 정수 NN UQ PK
-- 층 정수 NN CK(1층 ~ 5층)
-- 좌석 정수 NN CK(0 이상)

-- 수업 (수업코드, 이름)
-- 수업코드 문자열(3) NN UQ PK
-- 이름 문자열(50) NN
-- 교실 정수 NN FK (교실 - 교실번호)
-- 담당교사 문자열(10) NN FK (교사 - 교번)

-- 수강 (학번, 수업코드)
-- 학번 문자열(5) NN FK (학생 - 학번)
-- 수업코드 문자열(3) NN FK (수업 - 수업코드)
-- 성적 INT 

-- 하나의 수업은 하나의 교실에서 이루어지고 
-- 한명의 교사에 의해서 강의되어지며 여러명의 학생이 수업을 들을 수 있음
-- 단, 수업은 반드시 교실 및 교사가 존재해야함
-- 교실은 여러 수업을 진행할 수 있고 교사는 여러 수업을 강의할 수 있음
-- 학생은 여러 수업을 수강할 수 있음

-- 교실 1 : n 수업
-- 교사 1 : n 수업
-- 학생 n : m 수업

-- 1. 학생 테이블 생성
CREATE TABLE student (
    student_number VARCHAR(5) NOT NULL UNIQUE,
    name VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    tel_number VARCHAR(13) UNIQUE,

    CONSTRAINT student_pk PRIMARY KEY (student_number)
);

-- 2. 교사 테이블 생성
CREATE TABLE teacher (
    teacher_number VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(15) NOT NULL,
    address TEXT NOT NULL,
    tel_number VARCHAR(13) NOT NULL UNIQUE,
    position VARCHAR(50) NOT NULL DEFAULT '일반교사',

    CONSTRAINT teacher_pk PRIMARY KEY (teacher_number)
);

-- 3. 교실 테이블 생성
CREATE TABLE class_room (
    class_room_number INT NOT NULL AUTO_INCREMENT,
    floor INT NOT NULL CHECK(floor BETWEEN 1 AND 5),
    seats INT NOT NULL CHECK(seats >= 0),

    CONSTRAINT class_room_pk PRIMARY KEY (class_room_number)
);

-- 4. 수업 테이블 생성
CREATE TABLE class (
    class_code VARCHAR(3) NOT NULL UNIQUE,
    name VARCHAR(50) NOT NULL,
    class_room INT NOT NULL,
    charge_teacher VARCHAR(10) NOT NULL,

    CONSTRAINT class_pk PRIMARY KEY (class_code),
    CONSTRAINT class_class_room_fk
    FOREIGN KEY (class_room) REFERENCES class_room (class_room_number),
    CONSTRAINT class_teacher_fk
    FOREIGN KEY (charge_teacher) REFERENCES teacher (teacher_number)
);

-- 5. 수강 관계 테이블 생성
CREATE TABLE class_regist (
    student_number VARCHAR(5) NOT NULL,
    class_code VARCHAR(3) NOT NULL,
    score INT,

    CONSTRAINT class_regist_pk PRIMARY KEY (student_number, class_code),
    CONSTRAINT class_regist_student_fk
    FOREIGN KEY (student_number) REFERENCES student (student_number),
    CONSTRAINT class_regist_class_fk
    FOREIGN KEY (class_code) REFERENCES class (class_code)
);

-- 기본 레코드 삽입
INSERT INTO student VALUES ('25001', '홍길동', '부산광역시 부산진구', null);
INSERT INTO student VALUES ('25002', '김철수', '부산광역시 동구', '010-1111-1111');
INSERT INTO student VALUES ('25003', '이영희', '부산광역시 부산진구', '010-1111-2222');
INSERT INTO student VALUES ('25004', '홍길순', '부산광역시 수영구', null);
INSERT INTO student VALUES ('25005', '박보검', '부산광역시 동구', '010-1111-3333');
INSERT INTO student VALUES ('25006', '권지용', '부산광역시 동구', '010-1111-4444');
INSERT INTO student VALUES ('25007', '김태희', '부산광역시 부산진구', '010-1111-5555');
INSERT INTO student VALUES ('25008', '배수지', '부산광역시 중구', null);
INSERT INTO student VALUES ('25009', '남주혁', '부산광역시 부산진구', '010-1111-6666');
INSERT INTO student VALUES ('25010', '한가인', '부산광역시 수영구', '010-1111-7777');

SELECT * FROM student;

INSERT INTO teacher VALUES ('2000010101', '이성계', '부산광역시 강서구', '010-2222-1111', '교장');
INSERT INTO teacher VALUES ('2000010102', '이방과', '부산광역시 북구', '010-2222-2222', '교감');
INSERT INTO teacher VALUES ('2010010101', '이방원', '대구광역시 달성구', '010-2222-3333', '일반교사');
INSERT INTO teacher VALUES ('2010010102', '이도', '부산광역시 부산진구', '010-2222-4444', '일반교사');
INSERT INTO teacher VALUES ('2010010103', '이향', '부산광역시 강서구', '010-2222-5555', '교생');

SELECT * FROM teacher;