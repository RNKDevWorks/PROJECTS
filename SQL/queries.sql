USE digital_library_db;

-- Table Creation and Description
DESC Books;
DESC Students;
DESC IssuedBooks;

-- Overdue Logic
SELECT s.StudentID, s.StudentName, b.BookID, b.Title, b.Category, i.IssueDate
FROM IssuedBooks i
INNER JOIN Students s ON i.StudentID = s.StudentID
INNER JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND i.IssueDate < CURDATE() - INTERVAL 14 DAY;

-- Popularity Index
SELECT b.Category, COUNT(*) AS TotalBorrowed
FROM IssuedBooks i
INNER JOIN Books b ON i.BookID = b.BookID
GROUP BY b.Category
ORDER BY TotalBorrowed DESC;

-- View inactive students
SELECT s.StudentID, s.StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT DISTINCT StudentID
    FROM IssuedBooks
    WHERE IssueDate >= CURDATE() - INTERVAL 3 YEAR
);

-- Delete inactive students (run only if needed)
DELETE FROM Students
WHERE StudentID NOT IN (
    SELECT StudentID
    FROM (
        SELECT DISTINCT StudentID
        FROM IssuedBooks
        WHERE IssueDate >= CURDATE() - INTERVAL 3 YEAR
    ) AS ActiveStudents
);

-- Final check
SELECT * FROM Students;