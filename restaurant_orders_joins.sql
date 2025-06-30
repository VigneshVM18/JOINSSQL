
-- Create Restaurants Table
CREATE TABLE restaurants(
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Create Orders Table
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    restuarant_id INT NOT NULL,
    order_date DATE NOT NULL
);

-- Insert Data into Restaurants Table
INSERT INTO restaurants (id, name, location) VALUES
(1, 'Tasty Bites', 'Mumbai'),
(2, 'Spicy Treat', 'Delhi'),
(3, 'Green Garden', 'Bangalore'),
(4, 'Ocean Grill', 'Chennai');

-- Insert Data into Orders Table
INSERT INTO orders (order_id, restuarant_id, order_date) VALUES
(101, 1, '2025-06-01'),
(102, 1, '2025-06-03'),
(103, 2, '2025-06-04'),
(104, 5, '2025-06-05'); -- This order has a non-matching restaurant

-- INNER JOIN: Only matching records from both tables
SELECT r.name AS restaurant_name, o.order_date
FROM restaurants r
JOIN orders o ON r.id = o.restuarant_id;

-- LEFT JOIN: All restaurants, with or without matching orders
SELECT r.name AS restaurant_name, o.order_date
FROM restaurants r
LEFT JOIN orders o ON r.id = o.restuarant_id;

-- RIGHT JOIN: All orders, with or without matching restaurants
SELECT r.name AS restaurant_name, o.order_date
FROM restaurants r
RIGHT JOIN orders o ON r.id = o.restuarant_id;

-- FULL OUTER JOIN workaround using UNION (MySQL does not support FULL OUTER JOIN directly)
SELECT r.name AS restaurant_name, o.order_date
FROM restaurants r
LEFT JOIN orders o ON r.id = o.restuarant_id

UNION

SELECT r.name AS restaurant_name, o.order_date
FROM restaurants r
RIGHT JOIN orders o ON r.id = o.restuarant_id;
