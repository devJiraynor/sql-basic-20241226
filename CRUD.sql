CREATE DATABASE crud;
USE crud;

CREATE TABLE user (
	id VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE TABLE board (
	board_number INT NOT NULL UNIQUE AUTO_INCREMENT,
    title TEXT NOT NULL,
    contents TEXT NOT NULL,
    write_date DATE NOT NULL,
    writer_id VARCHAR(20) NOT NULL,
    
    CONSTRAINT board_pk PRIMARY KEY (board_number),
    CONSTRAINT board_writer_fk FOREIGN KEY (writer_id) REFERENCES user (id)
);

CREATE VIEW board_view AS 
SELECT 
  B.board_number board_number,
  B.title title,
  U.nickname writer_nickname,
  B.write_date write_date,
  B.contents contents
FROM board B INNER JOIN user U
ON B.writer_id = U.id;


