USE passwords;

SET @key = 'database-key';

-- Create a new entry
INSERT INTO password_entries
(user_id, website_name, url, password, comment, created_at)
VALUES
(
    1,
    'Stack Overflow',
    'http://stackoverflow.com',
    AES_ENCRYPT('TestPassword11!', @key),
    'Programming account',
    NOW()
);

-- Get the password associated with a URL
SELECT
    url,
    CAST(AES_DECRYPT(password, @key) AS CHAR) AS password
FROM password_entries
WHERE url = 'https://mysql.com';

-- Get all password-related information for HTTPS URLs
SELECT
    users.first_name,
    users.last_name,
    users.username,
    users.email,
    password_entries.website_name,
    password_entries.url,
    CAST(AES_DECRYPT(password_entries.password, @key) AS CHAR) AS password,
    password_entries.comment,
    password_entries.created_at
FROM password_entries
JOIN users
ON password_entries.user_id = users.user_id
WHERE password_entries.url LIKE 'https%';

-- Change a URL
UPDATE password_entries
SET url = 'https://github.com'
WHERE url = 'http://github.com';

-- Change a password
UPDATE password_entries
SET password = AES_ENCRYPT('NewTestPassword!', @key)
WHERE website_name = 'Spotify';

-- Remove an entry based on URL
DELETE FROM password_entries
WHERE url = 'http://trello.com';

-- Remove an entry based on password
DELETE FROM password_entries
WHERE CAST(AES_DECRYPT(password, @key) AS CHAR) = 'TestPassword8!';