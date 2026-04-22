CREATE DATABASE IF NOT EXISTS digital_library_db;
USE digital_library_db;

DROP TABLE IF EXISTS Fines;
DROP TABLE IF EXISTS IssuedBooks;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
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

CREATE TABLE Fines (
    FineID INT PRIMARY KEY,
    IssueID INT NOT NULL,
    FineAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IssueID) REFERENCES IssuedBooks(IssueID)
);