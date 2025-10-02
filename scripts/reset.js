const fs = require("fs");
const sqlite3 = require("sqlite3");

const dbFile = "./db/practice.db";
const initFile = "./db/init.sql";

const db = new sqlite3.Database(dbFile);

const schema = fs.readFileSync(initFile, "utf8");

db.exec(schema, (err) => {
    if (err) throw err;
    console.log("Database reset complete.");
    db.close();
});
