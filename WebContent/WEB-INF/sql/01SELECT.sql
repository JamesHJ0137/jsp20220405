-- -- 한 줄 주석
-- SELECT : 테이블에 있는 데이터 가져오는 명령문
-- FROM : 어떤 테이블
-- ; : 명령문 종료
SELECT * FROM Customers;

-- data : table의 한 줄 (row & record & entry)

-- 8개 테이블 조회

SELECT * FROM Categories;
SELECT * FROM Employees;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Shippers;
SELECT * FROM Suppliers;

-- 특성 속성(attribute & column & field)만 조회
-- SELECT 키워드 다음에 column명 나열
-- * : 모든 column

SELECT CustomerName, Address FROM Customers;
SELECT FirstName, BirthDate FROM Employees;

-- Employees 테이블에서 FirstName과 LastName을 조회하는데 
-- FirstName이 왼쪽에 위치하도록 조회 쿼리 작성

SELECT FirstName, LastName From Employees;
SELECT LastName, FirstName From Employees;
-- 쓰는 순서에 따라 컬럼 위치 변경 가능

-- 대소문자 구분 안함 (데이터베이스 Vendor, Version 마다 다름)
select FIRSTNAME, LASTNAME from Employees;
select FIRSTNAME, LASTNAME from employees;

-- 작성 관습 : 키워드는 대문자
-- 컬럼명 : lowerCamelCase, snake_case, SNAKE_CASE