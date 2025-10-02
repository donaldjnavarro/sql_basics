-- Drop tables if they exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;

-- Users table
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  age INTEGER
);

INSERT INTO users (name, email, age) VALUES
  ('Alice Smith', 'alice@example.com', 30),
  ('Alice Smith', 'different_alice@example.com', 46),
  ('Bob Johnson', 'bob@example.com', 25),
  ('Charlie Lee', 'charlie@example.com', 35),
  ('Dana Kim', 'dana@example.com', 28),
  ('Eve Martinez', 'eve@example.com', 30),
  ('Frank Moore', 'frank@example.com', NULL); -- null age for testing

-- Orders table
CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  product TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  price REAL NOT NULL,
  order_date TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO orders (user_id, product, quantity, price, order_date) VALUES
  (1, 'Laptop', 1, 1200.00, '2025-09-20'),
  (2, 'Monitor', 2, 250.00, '2025-09-21'),
  (1, 'Mouse', 1, 25.00, '2025-09-22'),
  (3, 'Laptop', 1, 1200.00, '2025-09-23'),
  (4, 'Keyboard', 1, 75.00, '2025-09-23'),
  (5, 'Monitor', 1, 250.00, '2025-09-24'),
  (3, 'Mouse', 2, 25.00, '2025-09-25'),
  (2, 'Laptop', 1, 1200.00, '2025-09-26'),
  (999, 'Laptop', 1, 1200.00, '2025-09-26');
