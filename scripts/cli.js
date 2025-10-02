#!/usr/bin/env node
const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");
const inquirer = require("inquirer");
const sqlite3 = require("sqlite3");

const exercisesDir = path.join(__dirname, "../exercises");

async function main() {
    while (true) {
        const files = fs.readdirSync(exercisesDir)
            .filter(f => f.endsWith(".sql"))
            .sort();

        const { selectedFile } = await inquirer.prompt([{
            type: "list",
            name: "selectedFile",
            message: "Select a SQL exercise to run (Ctrl+C to exit):",
            choices: files
        }]);

        console.log(`\n--- Resetting database before running ${selectedFile} ---`);
        execSync("node scripts/reset.js", { stdio: "inherit" });

        console.log(`\n--- Running ${selectedFile} ---`);
        const query = fs.readFileSync(path.join(exercisesDir, selectedFile), "utf8");
        const db = new sqlite3.Database("./db/practice.db");

        db.all(query, [], (err, rows) => {
            if (err) {
                console.error(`Error: ${err.message}`);
            } else {
                console.table(rows);
            }
            db.close();
        });

        // Wait a little to ensure db.close() finishes before looping
        await new Promise(r => setTimeout(r, 200));
        console.log("\nPress any key to continue...");
        await inquirer.prompt([{ type: "input", name: "continue", message: "" }]);
        console.clear();
    }
}

main();
