import mysql.connector

try:
    # Attempt to connect to the MySQL database server
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password=""
    )

    # Create a cursor to execute SQL commands
    cursor = connection.cursor()
    
    # Execute the SQL command to create the database (if it doesn't exist)
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    
    # Print success message
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    # Catch and handle any errors during connection or execution
    print(f"Error while connecting to MySQL: {e}")

finally:
    # Ensure the connection and cursor are closed, regardless of success or failure
    if connection.is_connected():
        cursor.close()
        connection.close()