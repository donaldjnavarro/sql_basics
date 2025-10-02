# SQL Basics

Some example SQL for reference

## Getting started

Create practice.db with seed data from init.sql. This is also used to reset the db for a clean slate.

```bash
node scripts/reset.js
```

## Usage

In **package.json** scripts you will find prepackaged commands for the following tasks:

* Launch CLI for running any test in the exercises folder. Resets the database between each file selection.
* Reset the database for a clean slate
* Run all the files in the exercises folder

## Structure and stack

Database is `db/practice.db`

Queries are in `exercises/*.sql`

SQL is handled by **sqlite3**
