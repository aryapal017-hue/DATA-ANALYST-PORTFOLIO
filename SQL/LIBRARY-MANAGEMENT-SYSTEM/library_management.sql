CREATE DATABASE library_management;
USE library_management;

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATE NOT NULL
);

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category_id INT,
    published_year INT,
    total_copies INT NOT NULL,
    available_copies INT NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE issued_books (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    fine_amount DECIMAL(10,2) DEFAULT 0,
    
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO members (member_name, email, phone, join_date) VALUES
('Aarav Sharma', 'aarav@gmail.com', '9876543210', '2025-01-10'),
('Diya Patel', 'diya@gmail.com', '9876543211', '2025-02-15'),
('Kabir Singh', 'kabir@gmail.com', '9876543212', '2025-03-01'),
('Ananya Rao', 'ananya@gmail.com', '9876543213', '2025-03-20'),
('Rohan Mehta', 'rohan@gmail.com', '9876543214', '2025-04-05');

INSERT INTO authors (author_name, country) VALUES
('J.K. Rowling', 'United Kingdom'),
('Chetan Bhagat', 'India'),
('George Orwell', 'United Kingdom'),
('Ruskin Bond', 'India'),
('Dan Brown', 'United States');

INSERT INTO categories (category_name) VALUES
('Fiction'),
('Technology'),
('Romance'),
('History'),
('Mystery');

INSERT INTO books 
(title, author_id, category_id, published_year, total_copies, available_copies)
VALUES
('Harry Potter and the Philosopher Stone', 1, 1, 1997, 10, 8),
('Half Girlfriend', 2, 3, 2014, 7, 5),
('1984', 3, 4, 1949, 6, 4),
('The Blue Umbrella', 4, 1, 1980, 5, 3),
('The Da Vinci Code', 5, 5, 2003, 8, 6),
('Harry Potter and the Chamber of Secrets', 1, 1, 1998, 6, 6);

INSERT INTO issued_books
(member_id, book_id, issue_date, due_date, return_date, fine_amount)
VALUES
(1, 1, '2026-09-01', '2026-09-15', '2026-09-14', 0),
(2, 2, '2026-09-02', '2026-09-16', NULL, 0),
(3, 3, '2026-09-03', '2026-09-17', NULL, 0),
(1, 5, '2026-08-10', '2026-08-24', '2026-08-28', 20),
(4, 4, '2026-09-05', '2026-09-19', NULL, 0);

SELECT 
    b.book_id,
    b.title,
    a.author_name,
    c.category_name,
    b.published_year,
    b.available_copies
FROM books b
JOIN authors a ON b.author_id = a.author_id
JOIN categories c ON b.category_id = c.category_id;

SELECT
    i.issue_id,
    m.member_name,
    b.title,
    i.issue_date,
    i.due_date,
    i.return_date,
    i.fine_amount
FROM issued_books i
JOIN members m ON i.member_id = m.member_id
JOIN books b ON i.book_id = b.book_id;

SELECT
    m.member_name,
    b.title,
    i.issue_date,
    i.due_date
FROM issued_books i
JOIN members m ON i.member_id = m.member_id
JOIN books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL;

SELECT
    m.member_name,
    b.title,
    i.due_date,
    DATEDIFF(CURDATE(), i.due_date) AS overdue_days
FROM issued_books i
JOIN members m ON i.member_id = m.member_id
JOIN books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL
AND i.due_date < CURDATE();

SELECT
    title,
    total_copies,
    available_copies
FROM books
WHERE available_copies <= 3;

SELECT
    c.category_name,
    COUNT(b.book_id) AS total_books
FROM categories c
LEFT JOIN books b ON c.category_id = b.category_id
GROUP BY c.category_name;

SELECT
    b.title,
    COUNT(i.issue_id) AS times_issued
FROM books b
JOIN issued_books i ON b.book_id = i.book_id
GROUP BY b.book_id, b.title
ORDER BY times_issued DESC
LIMIT 1;

SELECT
    m.member_name,
    COUNT(i.issue_id) AS books_borrowed
FROM members m
JOIN issued_books i ON m.member_id = i.member_id
GROUP BY m.member_id, m.member_name
HAVING COUNT(i.issue_id) > 1;

UPDATE issued_books
SET return_date = CURDATE()
WHERE issue_id = 2;

UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 2;