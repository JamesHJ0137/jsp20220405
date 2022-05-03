USE w3schools;

SELECT * FROM Orders;
-- 주문한 적 없는 고객명 조회 (JOIN, SUBQUERY)

-- JOIN
SELECT c.CustomerName
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL
ORDER BY 1;

-- SUBQUERY
SELECT CustomerName
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)
ORDER BY 1;

-- 고객별 주문 수 (JOIN, SUBQUERY)
SELECT c.CustomerName, COUNT(o.OrderID) NumOfOrders
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY 1;

SELECT c.CustomerName, 
(SELECT COUNT(o.OrderID) FROM Orders o WHERE o.CustomerID = c.CustomerID) AS NumOfOrders
FROM Customers c
ORDER BY 1;

--
SELECT p.ProductName, c.CategoryName
FROM Products p JOIN Categories c
ON p.CategoryID = c.CategoryID
ORDER BY 1;

-- SUBQUERY
SELECT p.ProductName, 
	(SELECT CategoryName FROM Categories c WHERE c.CategoryID = p.CategoryID) CategoryName
FROM Products p
ORDER BY 1;

-- Suppliers, Customers
-- 고객과 공급자가 모두 있는 나라 조회 (JOIN, SUBQUERY)

-- JOIN
SELECT DISTINCT c.Country FROM Customers c JOIN Suppliers s ON c.Country = s.Country ORDER BY c.Country;
-- SUBQUERY
SELECT DISTINCT Country
FROM Suppliers
WHERE Country IN (SELECT Country FROM Customers)
ORDER BY 1;

-- 결과 : 현재 누가 얼마 가지고 있는지? (단, 만원 이상 있는 사람만)
-- USERS : 계좌번호 이름
-- Transactions : id(key), 계좌번호, 입출금금액, 날짜

-- leetCode 1587

-- SUBQUERY
SELECT (SELECT name FROM Users u WHERE t.account = u.account) name, 
     SUM(t.amount) balance
FROM Transactions t
GROUP BY t.account
HAVING balance > 10000;

-- JOIN
SELECT u.name, SUM(t.amount) balance
FROM Users u JOIN Transactions t 
ON u.account = t.account
GROUP BY u.account
HAVING balance > 10000;

-- 1407

SELECT name, 
IFNULL((SELECT SUM(distance) FROM Rides WHERE user_id = Users.id),0) travelled_distance
FROM Users
ORDER BY 2 DESC, 1;

SELECT u.name,
SUM(IFNULL (r.distance, 0)) travelled_distance
FROM Users u LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY 2 DESC, 1;

-- 1965

SELECT e.employee_id
FROM Employees e 
LEFT JOIN Salaries s 
ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL

UNION

SELECT s.employee_id
FROM Employees e 
RIGHT JOIN Salaries s
ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL
ORDER BY 1;