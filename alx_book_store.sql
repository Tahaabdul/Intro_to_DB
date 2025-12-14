-- SQL script to create a database schema for a bookstore application
-- Create the database
CREATE DATABASE alx_book_store;

-- Use the newly created database
USE alx_book_store;
-- -----------------------------------------------------------------------------
-- Table: Authors
-- Stores information about the authors of the books.
-- -----------------------------------------------------------------------------
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- -----------------------------------------------------------------------------
-- Table: Books
-- Stores information about the books available in the bookstore.
-- -----------------------------------------------------------------------------
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- -----------------------------------------------------------------------------
-- Table: Customers
-- Stores information about the customers of the bookstore.
-- -----------------------------------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL, -- Email is often unique
    address TEXT
);

-- -----------------------------------------------------------------------------
-- Table: Orders
-- Stores information about orders placed by customers.
-- -----------------------------------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- -----------------------------------------------------------------------------
-- Table: Order_Details
-- Stores information about the books included in each order (the line items).
-- This is the junction table for the many-to-many relationship between Orders and Books.
-- -----------------------------------------------------------------------------
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Optional: Create a combined index for faster lookup on order details
CREATE INDEX idx_order_book ON Order_Details (order_id, book_id);