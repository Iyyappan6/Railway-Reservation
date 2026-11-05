USE railway_db

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
)

CREATE TABLE trains (
    train_id INT PRIMARY KEY,
    train_name VARCHAR(50),
    train_type VARCHAR(30),
    total_seats INT
)

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(50),
    city VARCHAR(50)
)

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    train_id INT,
    from_station INT,
    to_station INT,
    booking_date DATE,
    ticket_price DECIMAL(10,2)
)

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2)
)

INSERT INTO passengers VALUES
(1, 'Arun', 22, 'Male', '9876543210'),
(2, 'Priya', 25, 'Female', '9876543211'),
(3, 'Kumar', 30, 'Male', '9876543212'),
(4, 'Divya', 21, 'Female', '9876543213'),
(5, 'Ramesh', 35, 'Male', '9876543214'),
(6, 'Sneha', 28, 'Female', '9876543215')

INSERT INTO trains VALUES
(101, 'Chennai Express', 'Express', 500),
(102, 'Pandian Express', 'Superfast', 600),
(103, 'Vande Bharat', 'Premium', 400),
(104, 'Rockfort Express', 'Express', 450),
(105, 'Kovai Express', 'Superfast', 550)

INSERT INTO stations VALUES
(201, 'Chennai Central', 'Chennai'),
(202, 'Madurai Junction', 'Madurai'),
(203, 'Coimbatore Junction', 'Coimbatore'),
(204, 'Trichy Junction', 'Trichy'),
(205, 'Salem Junction', 'Salem')

INSERT INTO bookings VALUES
(301, 1, 101, 201, 202, '2026-11-01', 450),
(302, 2, 102, 202, 201, '2026-11-02', 550),
(303, 3, 103, 201, 203, '2026-11-03', 900),
(304, 4, 104, 204, 201, '2026-11-04', 350),
(305, 5, 105, 205, 203, '2026-11-05', 400),
(306, 6, 101, 201, 204, '2026-11-05', 300)

INSERT INTO payments VALUES
(401, 301, 'UPI', 'Success', 450),
(402, 302, 'Card', 'Success', 550),
(403, 303, 'UPI', 'Pending', 900),
(404, 304, 'Cash', 'Success', 350),
(405, 305, 'Card', 'Success', 400)

SELECT * FROM passengers
SELECT * FROM trains
SELECT * FROM stations
SELECT * FROM bookings
SELECT * FROM payments


SELECT passenger_name, age from passengers

select * from passengers where age > 25

-- A passenger has booked a ticket on which train, the ticket price should be displayed 

SELECT p.passenger_name, t.train_name, b.booking_date, b.ticket_price FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id
INNER JOIN trains t ON b.train_id = t.train_id

-- Need to display passenger name, train name, departure station, destination station, and ticket price

SELECT p.passenger_name, t.train_name, s1.station_name AS From_Station, s2.station_name AS To_Station, b.ticket_price FROM bookings b
INNER JOIN passengers p ON b.passenger_id = p.passenger_id
INNER JOIN trains t ON b.train_id = t.train_id
INNER JOIN stations s1 ON b.from_station = s1.station_id
INNER JOIN stations s2 ON b.to_station = s2.station_id

-- Passenger name, train name, ticket price, payment method, and payment status need to be displayed

SELECT p.passenger_name, t.train_name, b.ticket_price, py.payment_method, py.payment_status, py.amount FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id
INNER JOIN trains t ON b.train_id = t.train_id
LEFT JOIN payments py ON b.booking_id = py.booking_id

-- Let's calculate how much total ticket revenue a train has earned

SELECT t.train_name, SUM(b.ticket_price) AS Total_Revenue FROM trains t
INNER JOIN bookings b ON t.train_id = b.train_id
GROUP BY t.train_name
ORDER BY Total_Revenue DESC

-- The system should display successful and pending railway payments separately
-- Payment Success Details

SELECT p.passenger_name, py.payment_method, py.amount, py.payment_status FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id
INNER JOIN payments py ON b.booking_id = py.booking_id
WHERE py.payment_status = 'Success'

-- Pending Payment Details

SELECT p.passenger_name, t.train_name, py.amount, py.payment_status FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id
INNER JOIN trains t ON b.train_id = t.train_id
INNER JOIN payments py ON b.booking_id = py.booking_id
WHERE py.payment_status = 'Pending'

-- Payment Summary – COUNT + GROUP BY

SELECT payment_status, COUNT(*) AS Total_Payments, SUM(amount) AS Total_Amount FROM payments
GROUP BY payment_status

-- Each passenger total bookings

SELECT p.passenger_name, COUNT(b.booking_id) AS Total_Bookings FROM passengers p
LEFT JOIN bookings b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.passenger_name

-- Highest ticket price

SELECT MAX(ticket_price) AS Highest_Ticket_Price
FROM bookings

-- Lowest ticket price

SELECT MIN(ticket_price) AS Lowest_Ticket_Price
FROM bookings

-- Average ticket price

SELECT AVG(ticket_price) AS Average_Ticket_Price
FROM bookings

-- People who made more than one booking   

SELECT p.passenger_name, COUNT(b.booking_id) AS Total_Bookings FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id
GROUP BY p.passenger_id, p.passenger_name
HAVING COUNT(b.booking_id) > 1

-- Tickets priced higher than the average ticket price

SELECT * FROM bookings
WHERE ticket_price > (SELECT AVG(ticket_price) FROM bookings)

-- The passenger with the highest ticket price

SELECT passenger_name FROM passengers
WHERE passenger_id = (SELECT passenger_id FROM bookings
WHERE ticket_price = (SELECT MAX(ticket_price) FROM bookings))

-- Passengers who have not made any bookings

SELECT * FROM passengers
WHERE passenger_id NOT IN (SELECT passenger_id FROM bookings)
