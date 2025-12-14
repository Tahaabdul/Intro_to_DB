
-- USE the database we created earlier
USE alx_book_store;

-- -----------------------------------------------------------------------------
-- 1. Table: Authors
-- Stores information about authors.
-- -----------------------------------------------------------------------------
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- -----------------------------------------------------------------------------
-- 2. Table: Customers
-- Stores information about customers.
-- -----------------------------------------------------------------------------
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL, -- Ensure unique email addresses
    address TEXT
);

-- -----------------------------------------------------------------------------
-- 3. Table: Books
-- Stores information about books, linking to the Authors table.
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
-- 4. Table: Orders
-- Stores information about customer orders, linking to the Customers table.
-- -----------------------------------------------------------------------------
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- -----------------------------------------------------------------------------
-- 5. Table: Order_Details
-- Stores the line items for each order, linking to both Orders and Books.
-- This table implements the many-to-many relationship.
-- -----------------------------------------------------------------------------
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);