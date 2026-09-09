# postgres-init

Schema/seed script for the KIK Cloud Infrastructure & CI/CD interview challenge.
Creates the `items` table used by `python-api` and seeds it with a few rows, so the
frontend has something to display once everything is deployed and connected.

## Contents

- `init.sql` — idempotent: safe to run more than once (`CREATE TABLE IF NOT EXISTS`,
  and seed rows are only inserted if the table is empty).

## Running manually

```bash
psql "host=<DB_HOST> port=<DB_PORT> dbname=<DB_NAME> user=<DB_USER> sslmode=require" -f init.sql
```

## Running from a pipeline

This is the script the "Database Init Pipeline" (Part 3, item 4) should execute against
the PostgreSQL Flexible Server after infrastructure is provisioned — typically via the
`psql` client (e.g. an Azure DevOps task/container step) authenticated with credentials
pulled from Key Vault / pipeline secrets, not hardcoded values. Because the server sits
behind a private endpoint, the pipeline agent will need network access to it (e.g. a
self-hosted agent inside the VNet, or a hosted agent connected via a private
connectivity option).
