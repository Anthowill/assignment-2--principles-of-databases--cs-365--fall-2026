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