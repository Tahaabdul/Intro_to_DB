-- SQL Script: Retrieve Full Description of 'books' Table

-- This script retrieves the full description of the 'books' table by querying
-- the INFORMATION_SCHEMA.COLUMNS table, which stores metadata about all tables.

USE alx_book_store;

SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store'
AND TABLE_NAME = 'Books';
