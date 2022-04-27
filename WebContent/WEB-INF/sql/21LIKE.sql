USE w3schools;

SELECT * FROM Employees;

-- '_' : 하나의 문자
-- LIKE : 유사한, ~~같은

SELECT * FROM Employees
WHERE Photo LIKE 'EmpID_.pic';

-- '%' : 0개 이상의 문자

SELECT * FROM Employees WHERE LastName LIKE 'D%';
SELECT * FROM Employees WHERE LastName LIKE '%n';

-- 중간에 n이 포함된 모든 것
SELECT * FROM Employees WHERE LastName LIKE '%n%';

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%' ORDER BY CustomerName;

SELECT * FROM Employees;
