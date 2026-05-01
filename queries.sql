-- 4a: Selection
SELECT * FROM copy WHERE shelf_loc LIKE 'A%';

-- 4b: Projection
SELECT title, pub_year FROM book;

-- 4c: Composition of sigma and pi
SELECT isbn, shelf_loc FROM copy WHERE shelf_loc >= 'B';

-- 4d: Equi-Join across four relations
SELECT m.full_name, b.title
FROM   loan l
JOIN   member m ON l.member_no = m.member_no
JOIN   copy   c ON l.copy_no   = c.copy_no
JOIN   book   b ON c.isbn      = b.isbn
WHERE  l.return_date IS NULL;

-- 4e: Left Outer Join
SELECT m.full_name,
       COUNT(l.loan_id) AS active_loans
FROM   member m
LEFT OUTER JOIN loan l
    ON m.member_no = l.member_no
   AND l.return_date IS NULL
GROUP BY m.member_no, m.full_name;

-- 4f: Set Difference
SELECT isbn FROM book
EXCEPT
SELECT c.isbn FROM copy c JOIN loan l ON c.copy_no = l.copy_no;
