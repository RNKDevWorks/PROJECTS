CREATE DATABASE IF NOT EXISTS digital_library_db;
USE digital_library_db;

DROP TABLE IF EXISTS IssuedBooks;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL
);

CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    BookID INT NOT NULL,
    IssueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);