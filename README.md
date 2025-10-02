# SQL Basics

Some example SQL for reference

## Getting started

Create practice.db with seed data from init.sql. This is also used to reset the db for a clean slate.

```bash
node scripts/reset.js
```

## Usage

Running a SQL query

```bash
node scripts/run.js exercises/q1.sql
```

## Structure and stack

Database is `db/practice.db`

Queries are in `exercises/*.sql`

SQL is handled by **sqlite3**
