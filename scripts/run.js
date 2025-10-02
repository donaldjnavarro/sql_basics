const fs = require("fs");
const sqlite3 = require("sqlite3");

// grab filename from command line
const file = process.argv[2];
if (!file) {
    console.error("Usage: node scripts/run.js exercises/q1.sql");
    process.exit(1);
}

const query = fs.readFileSync(file, "utf8");
const db = new sqlite3.Database("./db/practice.db");

db.all(query, [], (err, rows) => {
    if (err) throw err;
    console.log("Query:", query.trim());
    console.table(rows);
    db.close();
});
