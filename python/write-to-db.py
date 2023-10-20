import mysql.connector
import os

# Replace these with your actual MySQL database credentials
db_config = {
    'host': 'localhost',
    'port': 3306,
    'user': os.getenv("MYSQL_USER"),
    'password': os.getenv("MYSQL_PSWD"),
    'database': 'mysql'
}

# Data to be inserted into the database
data = {
    'username': 'john_doe',
    'email': 'john.doe@example.com'
}

# Establish a connection to the MySQL server
try:
    connection = mysql.connector.connect(**db_config)
    print("Connected to MySQL database!")

    # Create a cursor object using the cursor() method
    cursor = connection.cursor()

    # Execute the query for user table creation
    create_user_table_query = "CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, username VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL);"
    cursor.execute(create_user_table_query)

    # Execute the query with the data dictionary
    insert_query = "INSERT INTO users (username, email) VALUES (%(username)s, %(email)s)"
    cursor.execute(insert_query, data)

    # Commit changes to the database
    connection.commit()

    print("Data inserted successfully!")

except mysql.connector.Error as error:
    print("Error: {}".format(error))

finally:
    # Close the cursor and connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection closed.")
