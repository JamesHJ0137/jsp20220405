CREATE DATABASE mydb2;
USE mydb2;

CREATE TABLE Board (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
    body VARCHAR(2000) NOT NULL,
    inserted DATETIME NOT NULL DEFAULT NOW()
);

DROP TABLE reply;

CREATE TABLE Reply (
	id INT PRIMARY KEY AUTO_INCREMENT,
	board_id INT, -- foreign key (참조키, 외래키)
	content VARCHAR(255) NOT NULL,
    inserted DATETIME DEFAULT NOW(),
    FOREIGN KEY (board_id) REFERENCES Board(id) -- FOREIGN KEY 제약사항 추가
);

-- 테이블 관계
-- 1:1
-- 학생 (이름, 생년월일...), 학력(출신학교, 졸업년도)

-- 1:n
-- 게시물(게시물번호, 내용), 댓글 (댓글 내용)

-- n:n
-- 학생 (이름, 생년월일...), 회사 (회사명, ...)

SELECT * FROM Board;

SET SQL_SAFE_UPDATES = 0;
UPDATE Board 
SET inserted = date_sub(inserted, INTERVAL 1 DAY);

DELETE FROM Board WHERE id IN (2, 4);

SELECT * FROM Reply;

