USE passwords;

SET @key = 'database-key';

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

SELECT
    url,
    AES_DECRYPT(password, @key) AS password
FROM password_entries
WHERE url = 'https://mysql.com';

SELECT
    users.first_name,
    users.last_name,
    users.username,
    users.email,
    password_entries.website_name,
    password_entries.url,
    AES_DECRYPT(password_entries.password, @key) AS password,
    password_entries.comment,
    password_entries.created_at
FROM password_entries
JOIN users
ON password_entries.user_id = users.user_id
WHERE password_entries.url LIKE 'https%';

UPDATE password_entries
SET url = 'https://github.com'
WHERE url = 'http://github.com';

UPDATE password_entries
SET password = AES_ENCRYPT('NewTestPassword!', @key)
WHERE website_name = 'Spotify';