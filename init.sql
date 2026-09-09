-- KIK Interview Challenge - initial schema and seed data
-- Intended to be run once against the target PostgreSQL Flexible Server / database
-- (see README.md for how the Database Init pipeline should invoke this file).

BEGIN;

CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO items (name, description)
SELECT * FROM (
    VALUES
        ('Welcome Widget', 'Sample row inserted by init.sql'),
        ('Second Widget', 'Confirms the API can read multiple rows'),
        ('Third Widget', 'Confirms ordering by id works as expected')
) AS seed(name, description)
WHERE NOT EXISTS (SELECT 1 FROM items);

COMMIT;
