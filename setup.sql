DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

USE passwords;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE password_entries (
    password_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    website_name VARCHAR(100),
    url VARCHAR(255),
    password VARBINARY(255),
    comment VARCHAR(255),
    created_at TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

