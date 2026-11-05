# RAILWAY RESERVATION MANAGEMENT SYSTEM
## MySQL Database Project Documentation

### 1. INTRODUCTION

The Railway Reservation Management System is a database management project developed using MySQL. The main purpose of this project is to manage railway passenger details, train information, station details, ticket bookings, and payment information.

This system stores all railway reservation-related information in separate database tables. SQL queries are used to retrieve, update, organize, and analyze the stored information.

The project uses relational database concepts such as Primary Keys, INNER JOIN, LEFT JOIN, GROUP BY, HAVING, Aggregate Functions, and Subqueries.

### 2. OBJECTIVES

The main objectives of this project are:

1. To maintain passenger information.
2. To store train details and seat information.
3. To manage railway station information.
4. To maintain passenger booking records.
5. To store ticket payment details.
6. To retrieve booking information using SQL JOIN operations.
7. To calculate total railway revenue.
8. To identify successful and pending payments.
9. To generate useful reports using aggregate functions.
10. To improve database management and data retrieval.

### 3. TECHNOLOGIES USED

- Database: MySQL
- Query Language: SQL
- Database Tool: MySQL Workbench
- Operating System: Windows

### 4. DATABASE INFORMATION

**Database Name:** railway_db

The project contains five main tables:

1. passengers
2. trains
3. stations
4. bookings
5. payments

### 5. TABLE STRUCTURE

#### 5.1 PASSENGERS TABLE

This table stores passenger personal information.

| Column Name | Data Type | Description |
|---|---|---|
| passenger_id | INT | Passenger ID (Primary Key) |
| passenger_name | VARCHAR(50) | Passenger name |
| age | INT | Passenger age |
| gender | VARCHAR(10) | Passenger gender |
| phone | VARCHAR(15) | Phone number |

#### 5.2 TRAINS TABLE

This table stores train-related information.

| Column Name | Data Type | Description |
|---|---|---|
| train_id | INT | Train ID (Primary Key) |
| train_name | VARCHAR(50) | Train name |
| train_type | VARCHAR(30) | Train category |
| total_seats | INT | Total seats |

#### 5.3 STATIONS TABLE

This table stores railway station details.

| Column Name | Data Type | Description |
|---|---|---|
| station_id | INT | Station ID (Primary Key) |
| station_name | VARCHAR(50) | Station name |
| city | VARCHAR(50) | City name |

#### 5.4 BOOKINGS TABLE

This table stores passenger ticket booking information.

| Column Name | Data Type | Description |
|---|---|---|
| booking_id | INT | Booking ID (Primary Key) |
| passenger_id | INT | Passenger ID |
| train_id | INT | Train ID |
| from_station | INT | Starting station ID |
| to_station | INT | Destination station ID |
| booking_date | DATE | Booking date |
| ticket_price | DECIMAL(10,2) | Ticket price |

#### 5.5 PAYMENTS TABLE

This table stores payment-related information.

| Column Name | Data Type | Description |
|---|---|---|
| payment_id | INT | Payment ID (Primary Key) |
| booking_id | INT | Booking ID |
| payment_method | VARCHAR(30) | Payment method |
| payment_status | VARCHAR(20) | Payment status |
| amount | DECIMAL(10,2) | Payment amount |

### 6. DATABASE RELATIONSHIPS

The project uses the following logical relationships:

- One passenger can have multiple bookings.
- One train can have multiple bookings.
- One station can be used as a starting or destination station.
- One booking can have a payment record.

The passenger_id, train_id, and station IDs connect the related tables through JOIN queries.

### 7. SQL OPERATIONS IMPLEMENTED

The following SQL concepts are implemented in this project:

**1. Database Creation and Selection**

Creates and selects the railway_db database.

**2. CREATE TABLE**

Creates five tables to store railway information.

**3. INSERT INTO**

Inserts passenger, train, station, booking, and payment records.

**4. SELECT**

Displays all records from the database tables.

**5. WHERE**

Retrieves passengers whose age is greater than 25.

**6. INNER JOIN**

Combines passenger, booking, train, and station information.

**7. LEFT JOIN**

Displays passenger booking and payment information, including bookings without matching payment records.

**8. GROUP BY**

Groups payment information based on payment status.

**9. ORDER BY**

Sorts train revenue in descending order.

**10. Aggregate Functions**

Uses SUM(), COUNT(), MAX(), MIN(), and AVG() to calculate useful information.

**11. HAVING**

Displays passengers who have made more than one booking.

**12. Subqueries**

Retrieves records using nested SELECT statements.

**13. IN and NOT IN**

Identifies passengers who have not made any bookings.

### 8. PROJECT MODULES

The project is divided into five modules.

**Module 1: Passenger Management**

Stores and retrieves passenger details such as name, age, gender, and phone number.

**Module 2: Train Management**

Maintains train names, train types, and total seat information.

**Module 3: Station Management**

Stores station names and their corresponding cities.

**Module 4: Booking Management**

Maintains passenger booking details, train details, journey stations, booking dates, and ticket prices.

**Module 5: Payment Management**

Stores payment methods, payment amounts, and payment statuses such as Success and Pending.

### 9. REPORTS AND ANALYSIS

The following reports can be generated using SQL queries:

1. Passenger details and their ages.
2. Passenger booking details with train names.
3. Journey starting and destination station details.
4. Passenger payment information.
5. Total revenue generated by each train.
6. Successful payment details.
7. Pending payment details.
8. Total payment count and amount based on payment status.
9. Total bookings made by each passenger.
10. Highest ticket price.
11. Lowest ticket price.
12. Average ticket price.
13. Passengers who have booked more than one ticket.
14. Bookings with ticket prices above the average price.
15. Passenger who booked the highest-priced ticket.
16. Passengers who have not made any bookings.

### 10. SAMPLE PROJECT DATA

The database contains:

- 6 passenger records.
- 5 train records.
- 5 station records.
- 6 booking records.
- 5 payment records.

The sample data is used to test different SQL operations and generate reports.

### 11. ADVANTAGES

1. Stores railway information in an organized manner.
2. Makes data retrieval easier.
3. Reduces manual record maintenance.
4. Helps analyze booking and payment details.
5. Provides useful revenue reports.
6. Demonstrates relational database concepts.
7. Makes it easier to identify pending payments.

### 12. FUTURE ENHANCEMENTS

The project can be improved in the future by adding:

1. Foreign Key constraints.
2. User login and authentication.
3. Automatic seat availability management.
4. Ticket cancellation functionality.
5. Online payment integration.
6. Booking confirmation and ticket generation.
7. A web-based user interface using Java, HTML, CSS, and JavaScript.

### 13. CONCLUSION

The Railway Reservation Management System is a MySQL-based database project developed to manage railway passenger, train, station, booking, and payment information.

This project demonstrates important SQL concepts such as table creation, data insertion, JOIN operations, aggregate functions, GROUP BY, HAVING, and subqueries.

Through this project, practical knowledge of MySQL database management and relational database operations is gained.

The project provides a foundation for developing a complete railway reservation application in the future.

---

**PROJECT TITLE:** Railway Reservation Management System

**DATABASE:** MySQL

**DATABASE NAME:** railway_db

**PROJECT TYPE:** Database Management System (DBMS)
