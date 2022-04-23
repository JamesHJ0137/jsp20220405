USE w3schools;

SELECT * FROM Employees;
SELECT FirstName FROM Employees;
SELECT CustomerName, Address FROM Customers;
SELECT address, CustomerName FROM Customers;

-- WHERE : 어떤 Row(RECORD)를 선택할 지 결정하는 키워드

-- 예제 1) 나라가 멕시코인 고객들 조회
SELECT * FROM Customers
WHERE Country = 'Mexico';

-- 예제 2) 나라가 독일인 고객들 조회
SELECT * FROM Customers
WHERE Country = 'Germany';

-- 작은따옴표 : 문자열값

-- 예제 3) 고객ID가 1번인 고객 조회
SELECT * FROM Customers WHERE CustomerID = 1; -- 수형식은 작은따옴표 안씀, 근데 써도됨
SELECT * FROM Customers WHERE CustomerID = 90;
SELECT * FROM Customers WHERE CustomerID = '1';
SELECT * FROM Customers WHERE CustomerID = Germany; -- 문자열은 작은따옴표 꼭 써야함

-- 예제 4) 1번 고객의 이름 조회
SELECT CustomerName FROM Customers WHERE CustomerID = 1;

SELECT CustomerName, Address, City, PostalCode, Country 
FROM Customers WHERE CustomerID = 1;

SELECT CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country 
FROM Customers WHERE CustomerID = 1;

SELECT FirstName, LastName, BirthDate FROM Employees WHERE EmployeeID = 1;
SELECT CustomerName, City, Country, PostalCode FROM Customers;

-- city=' OR '1'='1
SELECT CustomerName, City, Country FROM Customers WHERE City = '' OR '1'='1';