CREATE DATABASE mydb3;
USE mydb3;

-- 중복되는 값이 없도록, null로 남지 않도록 하는 것이 중요 포인트
-- 정규화 (Normal Form) : 이전 정규화가 만족해야 다음 정규화로 넘어갈 수 있음

-- 제1정규화 (First Normal Form) 1NF
-- 제2정규화 (Second Normal Form) 2NF
-- 제3정규화 (Third Normal Form) 3NF

-- 제1정규화
-- 규칙 1: 열은 원자적 값만 포함한다 (atomic)
-- 규칙 2: 같은 데이터가 여러 열에 반복되지 말아야 한다

-- 이름 주소 저장하고 싶다
CREATE TABLE Person1 (
	name VARCHAR(200) PRIMARY KEY,
    address VARCHAR(200)
);

SET autocommit = 1;
INSERT INTO Person1 (name, address) VALUES ('A', '서울시 역삼동 111');

COMMIT;

CREATE TABLE toy (
toy_id INT PRIMARY KEY,
toy VARCHAR(255)
);

CREATE TABLE toy_colour (

toy_id INT,
colour VARCHAR(255),
FOREIGN KEY (toy_id) REFERENCES toy(toy_id),
PRIMARY KEY (toy_id, colour)
);

DROP TABLE toy_colour;

CREATE TABLE toy_colour(
toy_colour_id INT PRIMARY KEY AUTO_INCREMENT,
toy_id INT,
colour VARCHAR(255),
FOREIGN KEY (toy_id) REFERENCES toy (toy_id)
);

