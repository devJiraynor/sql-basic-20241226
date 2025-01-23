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

CREATE TABLE comment (
  comment_number INT NOT NULL UNIQUE AUTO_INCREMENT,
  board_number INT NOT NULL,     
  writer_id VARCHAR(20) NOT NULL, 
  conents TEXT NOT NULL,             
  write_datetime DATETIME NOT NULL,  
  status BOOLEAN NOT NULL,
  parent_comment INT,

  CONSTRAINT comment_pk PRIMARY KEY (comment_number),
  CONSTRAINT comment_board_fk FOREIGN KEY (board_number) REFERENCES board (board_number),
  CONSTRAINT comment_user_fk FOREIGN KEY (writer_id) REFERENCES user (id),
  CONSTRAINT parent_comment_fk FOREIGN KEY (parent_comment) REFERENCES comment (comment_number)
);


