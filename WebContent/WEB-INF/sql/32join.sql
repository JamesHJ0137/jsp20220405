-- JOIN

USE mydb2;

SELECT * FROM Board; -- 4개열, 14개행
SELECT * FROM Reply; -- 4개열, 6개행

SELECT * FROM Board, Reply; -- 결합(Cartesian Product) : 8개열, 84개행
SELECT * FROM Reply Board;
SELECT * FROM Board JOIN Reply; -- Certessian Product
SELECT * FROM Board JOIN Reply ON Board.id = Reply.board_id; -- INNER JOIN (이 과정에서 주로 사용할 것)
SELECT * FROM Board, Reply WHERE Board.id = Reply.board_id; -- INNER JOIN
SELECT * FROM Board JOIN Reply WHERE Board.id = Reply.board_id; -- INNER JOIN
