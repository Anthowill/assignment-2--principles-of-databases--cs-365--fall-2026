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

INSERT INTO users
(first_name, last_name, username, email)
VALUES
(
    'Anthony',
    'Williams',
    'anthonyw',
    'anthony@example.com'
);

SET @key = 'database-key';

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'MySQL',
    'https://mysql.com',
    AES_ENCRYPT('TestPassword1!', @key),
    'MySQL account',
    '2026-01-10 12:00:00'
);

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'GitHub',
    'http://github.com',
    AES_ENCRYPT('TestPassword2!', @key),
    'GitHub account',
    '2026-02-15 12:00:00'
);

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'Spotify',
    'http://spotify.com',
    AES_ENCRYPT('TestPassword3!', @key),
    'Spotify account',
    '2026-03-20 12:00:00'
);

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'Discord',
    'http://discord.com',
    AES_ENCRYPT('TestPassword4!', @key),
    'Discord account',
    '2026-04-10 12:00:00'
);

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'Steam',
    'http://store.steampowered.com',
    AES_ENCRYPT('TestPassword5!', @key),
    'Steam account',
    '2026-05-01 12:00:00'
);

INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'Reddit',
    'http://reddit.com',
    AES_ENCRYPT('TestPassword6!', @key),
    'Reddit account',
    '2026-05-18 12:00:00'
);