USE digital_library_db;

-- Question 1: Display all categories
SELECT * FROM Categories;

-- Question 2: Display all books
SELECT * FROM Books;

-- Question 3: Display all students
SELECT * FROM Students;

-- Question 4: Display all issued records
SELECT * FROM IssuedBooks;

-- Question 5: Display all fines
SELECT * FROM Fines;

-- Question 6: Show books with category names
SELECT b.BookID, b.Title, c.CategoryName
FROM Books b
JOIN Categories c ON b.CategoryID = c.CategoryID;

-- Question 7: Show which student borrowed which book
SELECT s.StudentName, b.Title, i.IssueDate, i.ReturnDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID;

-- Question 8: Find overdue books not returned within 14 days
SELECT s.StudentID, s.StudentName, b.BookID, b.Title, c.CategoryName, i.IssueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
JOIN Categories c ON b.CategoryID = c.CategoryID
WHERE i.ReturnDate IS NULL
AND i.IssueDate < CURDATE() - INTERVAL 14 DAY;

-- Question 9: Show most popular categories
SELECT c.CategoryName, COUNT(*) AS TotalBorrowed
FROM IssuedBooks i
JOIN Books b ON i.BookID = b.BookID
JOIN Categories c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalBorrowed DESC;

-- Question 10: Show books not yet returned
SELECT s.StudentName, b.Title, i.IssueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL;

-- Question 11: Count books borrowed by each student
SELECT s.StudentName, COUNT(*) AS TotalBooksBorrowed
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
GROUP BY s.StudentName
ORDER BY TotalBooksBorrowed DESC;

-- Question 12: Show penalty report
SELECT s.StudentName, b.Title, i.IssueDate, f.FineAmount
FROM Fines f
JOIN IssuedBooks i ON f.IssueID = i.IssueID
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID;

-- Question 13: Find inactive students
SELECT s.StudentID, s.StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT DISTINCT StudentID
    FROM IssuedBooks
    WHERE IssueDate >= CURDATE() - INTERVAL 3 YEAR
);

-- Question 14: Delete inactive students
-- DELETE FROM Students
-- WHERE StudentID NOT IN (
--     SELECT StudentID
--     FROM (
--         SELECT DISTINCT StudentID
--         FROM IssuedBooks
--         WHERE IssueDate >= CURDATE() - INTERVAL 3 YEAR
--     ) AS ActiveStudents
-- );

-- Question 15: Check remaining students
SELECT * FROM Students;