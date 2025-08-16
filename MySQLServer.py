import mysql.connector
from mysql.connector import Error

try:
    # 1. Connect to MySQL server (NOT to a specific database yet)
    mydb = mysql.connector.connect(
        host="localhost",     # Host where MySQL is running
        user="root",          # Your MySQL username
        password="Chidera@123#"  # Your MySQL password
    )

    if mydb.is_connected():
        mycursor = mydb.cursor()

        # 2. Create database if it doesn't exist
        mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        # 3. Success message
        print("Database 'alx_book_store' created successfully!")

except Error as e:
    # 4. Print error if connection or creation fails
    print(f"Error: {e}")

finally:
    # 5. Close cursor and connection if they were opened
    if 'mycursor' in locals() and mycursor is not None:
        mycursor.close()
    if 'mydb' in locals() and mydb.is_connected():
        mydb.close()
        print("MySQL connection is closed")
