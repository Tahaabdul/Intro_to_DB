-- Use the database specified as an argument
USE alx_book_store;

-- Query to get the full description of the Books table
SELECT 
    TABLE_NAME
    COLUMN_NAME, 
    COLUMN_TYPE 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'Books';
