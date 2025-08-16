import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Chidera@123#",
    database="alx_book_store"
)
mycursor = mydb.cursor()

# Create Authors table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
)
""")

# Create Books table (depends on authors)
mycursor.execute("""
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
)
""")

# create customers table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS customers(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
)
""")

# create orders table (depends on customers)
mycursor.execute("""
CREATE TABLE IF NOT EXISTS orders(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

)
""")

# create order_details table (depends on books and orders)
mycursor.execute("""
CREATE TABLE IF NOT EXISTS order_details(
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
    
)
""" )

print("✅ All tables created successfully!")
