USE mydb3;
-- 페이지 : 369p
-- 제2정규화 (Second Normal Form, 2NF)
-- 제1정규형이어야 하고,
-- 부분적 함수 의존이 없다.
-- key가 아닌 열이 합성 key의 일부에 종속되는 경우 (363p)
-- 간단한 해결책은 인위적으로 컬럼 하나를 만들어 키로 둘 것

-- 페이지 : 374p
-- 제3정규화 (Third Normal Form, 3NF)
-- 제2정규형이어야 하고
-- 이향적 종속이어야 한다. (364p)
-- 키가 아닌 열이 키가 아닌 다른 열에 종속되는 경우

CREATE TABLE courses (
	course_id INT PRIMARY KEY,
    course_name VARCHAR(255),
    instructor VARCHAR(255),
    instructor_phone VARCHAR(255)
);

DROP TABLE course;

CREATE TABLE course(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
	course_name VARCHAR(255),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

CREATE TABLE instructor(
	instructor_id INT PRIMARY KEY AUTO_INCREMENT,
	instructor_name VARCHAR(255),
    instructor_phone VARCHAR(255)
);
