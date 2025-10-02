const fs = require('fs');
const path = require('path');
const sqlite3 = require('sqlite3');

const db = new sqlite3.Database('./db/practice.db');

const exercisesDir = path.join(__dirname, '../exercises');
const files = fs.readdirSync(exercisesDir).filter(f => f.endsWith('.sql'));

files.forEach(file => {
    const query = fs.readFileSync(path.join(exercisesDir, file), 'utf8');
    console.log(`\n--- Running ${file} ---`);
    db.all(query, [], (err, rows) => {
        if (err) {
            console.error(`Error in ${file}:`, err.message);
        } else {
            console.table(rows);
        }
    });
});

// Close DB after all queries finish (quick hack)
setTimeout(() => db.close(), 500);
