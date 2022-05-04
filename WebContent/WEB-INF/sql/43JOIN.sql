USE w3schools;

SELECT * FROM Orders;
-- 1996-07-04 에 주문한 고객의 이름
SELECT o.OrderDate, c.CustomerName, o.EmployeeID 
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderDate = '1996-07-04';

-- 1996-07-04 에 주문한 고객의 이름과 처리한 직원의 이름
SELECT o.OrderDate, c.CustomerName, concat(e.FirstName, ' ', e.LastName) EmployeeName 
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
			  JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE o.OrderDate = '1996-07-04';

-- 1996-07-04 의 주문 처리한 직원명과 배송자명 조회
-- Orders, Employees, Shippers
SELECT o.OrderDate,  e.LastName, s.ShipperName
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
			  JOIN Shippers s ON o.ShipperID = s.ShipperID
WHERE o.OrderDate = '1996-07-04';

-- 1996-07-04 에 주문한 고객과 처리한 직원 배송한 배송자명
-- Orders, Customers, Employees, Shippers
SELECT o.OrderDate, c.CustomerName, e.LastName, s.ShipperName
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
			  JOIN Employees e ON o.EmployeeID = e.EmployeeID
              JOIN Shippers s ON o.ShipperID = s.ShipperID
WHERE o.OrderDAte = '1996-07-04';

-- 1996-07-04에 주문한 상품명들
-- Orders, OrderDetails, Products

SELECT o.OrderDate, p.ProductName, od.Quantity, p.Price, (od.Quantity * p.Price) total
FROM OrderDetails od JOIN Orders o ON od.OrderID = o.OrderID
					 JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate = '1996-07-04';

-- 1996-07-08 각 고객의 주문 총액
-- Orders, OrderDetails, Products, Customers
SELECT o.OrderDate, c.CustomerName, SUM(p.Price * od.Quantity) '총계'
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
			  JOIN OrderDetails od ON o.OrderID = od.OrderID
              JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate = '1996-07-08'
GROUP BY c.CustomerID;

-- 1996년 가장많은 주문을 받은 직원
-- 1996년 직원별 처리한 주문 총 금액을 조회 (금액이 높은 -> 낮은)
SELECT o.OrderDate, concat(e.FirstName, ' ', e.LastName) EmployeeName, p.Price, od.Quantity, SUM(p.Price * od.Quantity) total
FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
			  JOIN OrderDetails od ON o.OrderID = od.OrderID
              JOIN Products p ON od.ProductID = p.ProductID
WHERE OrderDate BETWEEN '1996-01-01' AND '1996-12-31'
GROUP BY e.EmployeeID
ORDER BY 2 DESC;

SELECT COUNT(*) FROM Orders;
SELECT Quantity FROM OrderDetails;
-- 가장 많은 상품수량이 팔린 카테고리
-- Categories Products OrderDetails

SELECT ca.CategoryName, od.Quantity, p.Price, SUM(p.Price * od.Quantity) total
FROM Categories ca JOIN Products p ON ca.CategoryID = p.CategoryID
				   JOIN OrderDetails od ON p.ProductID = od.ProductID
                   JOIN Orders o ON od.OrderID = o.OrderID
WHERE OrderDate
GROUP BY od.Quantity
ORDER BY 4 DESC;

-- lecturer
-- Categories OrderDetails Products
-- JOIN 조건에 WHERE 추가하면 JOIN 후 WHERE 절에서 RIGHT OUTER JOIN 결과가 사라져서 원하는 결과를 얻지 못했었다.
SELECT c.CategoryID, c.CategoryName, SUM(IFNULL(od.Quantity, 0)) Total
FROM Orders o JOIN OrderDetails od ON od.OrderID = o.OrderID AND o.OrderDate BETWEEN '1996-08-01' AND '1996-08-07'
			  JOIN Products p ON p.ProductID = od.ProductID
              RIGHT JOIN Categories c ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
ORDER BY Total DESC;

SELECT c.CategoryID, c.CategoryName, SUM(ifnull(od.Quantity, 0)) Total
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID AND OrderDate BETWEEN '1996-07-01' AND '1996-08-01'
				JOIN Products p ON p.ProductID = od.ProductID
                RIGHT JOIN Categories c ON c.CategoryId = p.categoryID
GROUP BY c.CategoryID
ORDER BY Total DESC;

