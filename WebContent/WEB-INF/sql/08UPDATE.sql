USE w3schools;

-- safe mode 해제ALTER
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Employees ORDER BY EmployeeID DESC;
DESC Employees;

UPDATE Employees
SET LastName = 'Sunja',
	FirstName = 'YeohJung'
WHERE EmployeeID = 1;

-- 예제 1) 1번 고객 (Customers Table)의
-- 계약자명 (ContactName)은 'Alfred Schimidt'
-- 도시(City)는 'Frankfurt'로 변경

UPDATE Customers
SET ContactName = 'Alfred Schimidt',
	City = 'Frankfurt'
    WHERE CustomerID = 1;
    
SELECT * FROM Customers WHERE CustomerID = 1;

UPDATE Customers
SET ContactName = 'Juan'
WHERE Country = 'Mexico';

SELECT * FROM Customers WHERE Country = 'Mexico';

SELECT * FROM Products;

UPDATE Products
SET Price = Price + 2;

