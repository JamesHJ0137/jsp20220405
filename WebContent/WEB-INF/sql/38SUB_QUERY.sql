USE mydb2;

-- 댓글이 있는 게시물
-- JOIN
SELECT DISTINCT b.id, b.title 
FROM Board b JOIN Reply r ON b.id = r.board_id;
-- SUBQUERY
SELECT id, title
FROM board
WHERE id IN -- (8, 12, 13);
(SELECT board_id FROM Reply);

-- 댓글이 없는 게시물
-- JOIN
SELECT b.id, B.title
FROM Board b LEFT JOIN Reply r ON b.id = r.board_id
WHERE r.id IS NULL;

-- SUBQUERY
SELECT id, title
FROM Board
WHERE id NOT IN -- (13, 15, 20, 21);
(SELECT board_id FROM Reply);

-- 게시글별 댓글 수
-- JOIN
SELECT b.*, COUNT(r.id) NumOfReply
FROM Board b LEFT JOIN Reply r ON b.id = r.board_id 
GROUP BY b.id
ORDER BY b.id DESC;
-- SUBQUERY
SELECT b.*, (SELECT COUNT(r.id) FROM Reply r WHERE board_id = b.id) NumOfReply
FROM Board Board
ORDER BY b.id DESC;
