USE digital_library_db;

INSERT INTO Books VALUES
(1, 'Java Basics', 'Science'),
(2, 'Python Programming', 'Science'),
(3, 'World History', 'History'),
(4, 'Modern Fiction', 'Fiction'),
(5, 'Database Systems', 'Science'),
(6, 'Indian Heritage', 'History'),
(7, 'Story Collection', 'Fiction'),
(8, 'Physics Fundamentals', 'Science'),
(9, 'Chemistry Concepts', 'Science'),
(10, 'English Literature', 'Literature');

INSERT INTO Students VALUES
(1, 'Nanda', '2021-06-15'),
(2, 'Rahul', '2020-08-10'),
(3, 'Amit', '2019-01-05'),
(4, 'Priya', '2022-03-12'),
(5, 'Sneha', '2021-11-20'),
(6, 'Kiran', '2018-07-25'),
(7, 'Anjali', '2023-01-15'),
(8, 'Vikram', '2022-09-18'),
(9, 'Pooja', '2020-12-01'),
(10, 'Ravi', '2019-05-10');

INSERT INTO IssuedBooks VALUES
(1, 1, 1, '2025-03-01', NULL),
(2, 2, 2, '2025-03-10', '2025-03-18'),
(3, 3, 3, '2024-12-20', NULL),
(4, 4, 4, '2025-03-15', NULL),
(5, 5, 5, '2025-02-01', '2025-02-10'),
(6, 1, 6, '2025-01-10', NULL),
(7, 2, 7, '2025-02-05', '2025-02-14'),
(8, 6, 8, '2021-01-01', '2021-01-10'),
(9, 7, 9, '2025-03-20', NULL),
(10, 8, 10, '2025-02-25', '2025-03-05');