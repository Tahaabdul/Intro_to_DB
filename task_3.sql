-- This script lists all tables in the currently active database by
-- querying the INFORMATION_SCHEMA.TABLES, adhering to the constraint
-- of not using the SHOW TABLES command.

SELECT
    TABLE_NAME
FROM
    INFORMATION_SCHEMA.TABLES
WHERE
    TABLE_SCHEMA = DATABASE()
    AND TABLE_TYPE = 'BASE TABLE';