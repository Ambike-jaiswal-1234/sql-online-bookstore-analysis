-- 1. DATABASE SETUP

CREATE DATABASE OnlineBookstore;

-- DATABASE SELECTION
\c OnlineBookstore;

-- TABLE CREATION
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
     Book_ID INT PRIMARY KEY,
	 Title VARCHAR(100),
	 Author VARCHAR(50),
     Genre VARCHAR(50),
     Published_Year INT,
     Price NUMERIC(10,2),
     Stock INT
);
DROP TABLE IF EXISTS Customers;
-- TABLE CREATION
CREATE TABLE Customers(
       Customer_ID SERIAL PRIMARY KEY,
       Name VARCHAR(50),
       Email VARCHAR(100),
       Phone VARCHAR(15),
       City VARCHAR(50),
       Country VARCHAR(150)
);
-- TABLE CREATION
CREATE TABLE Orders(
       Order_ID SERIAL PRIMARY KEY,
       Customer_ID INT REFERENCES Customers(Customer_ID),
       Book_ID INT REFERENCES Books(Book_ID),
       Order_Date DATE,
       Quantity INT,
       Total_Amount NUMERIC(10,2)
);


-- 2. DATA IMPORT

-- DATA IMPORT: Books Table
COPY Books(Book_ID, Title,	Author,	Genre,	Published_Year,	Price,	Stock)
FROM 'C:\Books.csv'
CSV HEADER;

-- DATA IMPORT: Customers Table
COPY Customers(Customer_ID,	Name, Email, Phone,	City, Country)
FROM 'C:\Customers.csv'
CSV HEADER;

-- DATA IMPORT: OrderS Table
COPY Orders(Order_ID, Customer_ID, Book_ID,	Order_Date,	Quantity, Total_Amount)
FROM 'C:\Orders.csv'
CSV HEADER;


-- 3. BUSINESS ANALYSIS QUERIES


-- BUSINESS QUERY 1:Get all Fiction books.
SELECT * FROM Books
WHERE Genre='Fiction';

-- BUSINESS QUERY 2: Find books published after 1950.
SELECT * FROM Books
WHERE published_year>1950;

-- BUSINESS QUERY 3: Retrieve customers from Canda 
SELECT * FROM Customers
WHERE country='Canada';

-- BUSINESS QUERY 4: Show orders placed in November 2023
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- BUSINESS QUERY 5: Retrieve the total stock of books available
SELECT SUM(stock) AS tOTAL_Stock
FROM books;

-- BUSINESS QUERY 6: Find the details of the most expensive book
SELECT * FROM books
ORDER BY Price DESC 
LIMIT 1;

-- BUSINESS QUERY 7: Show all customers who ordered more than 1 quantity of a book
SELECT * FROM Orders
WHERE quantity>1;

-- BUSINESS QUERY 8: Retrieve all orders where the total amount exceeds $20
SELECT * FROM Orders
WHERE total_amount>20;

-- BUSINESS QUERY 9: List all genres available in the Books table
SELECT DISTINCT * FROM Books;

-- BUSINESS QUERY 10: Find the book with the lowest stock
SELECT * FROM books ORDER BY stock LIMIT 1;

-- BUSINESS QUERY 11: Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS Revenue FROM Orders;

-- ADVANCE BUSINESS ANALYSIS QUERIES:

-- BUSINESS QUERY 1: Retrieve the total number of books sold for each genre
SELECT * FROM Orders;

SELECT b.Genre, SUM(o.quantity) AS Total_books_Sold
FROM 
Orders o
Join 
Books b 
ON 
o.book_id = b.book_id
GROUP BY b.Genre;

-- BUSINESS QUERY 2: Find the average price of books in the "fantasy" genre
SELECT AVG(price) AS Average_Price FROM Books
WHERE Genre = 'Fantasy';

-- BUSINESS QUERY 3: List customers who have placed at least 2 orders
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name


HAVING COUNT(Order_id) >=2; 

-- BUSINESS QUERY 4: Find the most frequently ordered book
SELECT o. Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1; 

-- BUSINESS QUERY 5: Show the top 3 most expensive books of 'fantasy' Genre
SELECT * FROM books
WHERE genre ='Fantasy'
ORDER BY price DESC LIMIT 3;

-- BUSINESS QUERY 6: Retrieve the tolat quantity of books sold by each author
SELECT b.author, SUM(o.quantity) AS Total_books_sold
FROM 
orders o
JOIN 
books b 
ON o.book_id=b.book_id
GROUP BY b.Author; 

-- BUSINESS QUERY 7: List the cities where customers who spent over $30 are located
SELECT DISTINCT c.city , total_amount
FROM
orders o
JOIN 
customers c
ON o.customer_id=c.customer_id
WHERE o.total_amount > 30;

-- BUSINESS QUERY 8: Find the customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(O.total_amount) AS Total_Spent
FROM 
orders o
JOIN 
customers c 
ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc;

-- BUSINESS QUERY 9: Calculate bthe stock remaining after fulfilling all orders
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,
       b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM 
books b
LEFT JOIN 
orders o 
ON b.book_id = o.book_id
GROUP BY b.book_id ORDER BY b.book_id;






