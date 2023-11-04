show DATABASES;

Use littlelemondb;

SHOW tables;

-- Insert dummy data into Customers
INSERT INTO Customers (CustomerID, FullName, PhoneNumber, Email)
VALUES
(101,'John Doe', 0814356771, 'john.doe@example.com'),
(102,'Jane Doe', 0814356772,'jane.doe@example.com'),
(103,'Alice',0814356773, 'alice@example.com'),
(104,'Bob',0814356774, 'bob@example.com'),
(105,'Charlie', 0814356775, 'charlie@example.com'),
(109,'David',0814356767, 'david@example.com'),
(111,'Emily',0814356777, 'emily@example.com'),
(189,'Frank',0814356787, 'frank@example.com'),
(120,'Grace',0814356977, 'grace@example.com'),
(123,'Hannah',0814356237, 'hannah@example.com');

-- Insert dummy data into Staff Information
INSERT INTO Staff_info(StaffID, FullName, PhoneNumber, Email, role, Salary, CustomerID)
VALUES
(301, 'Sarah Matip', 2102934242, 'sarahmatip@mail.com','Manager', 55000,101),
(302, 'Tom', 23424209202, 'Tom@mail.com', 'Waiter', 30000,102),
(303, 'Linda', 23412347652, 'Linda@mail.com','Chef', 40000,103),
(304,'Robert', 24323424290, 'Robert@mail.com','Cashier', 31000,104),
(305,'Daniel', 248903424278, 'Daniel@mail.com', 'Waiter', 32000,105),
(306,'Susan',2342111420, 'Susan@mail.com', 'Hostess', 28000,109),
(307, 'Chris',2342420900, 'Chris@mail.com', 'Manager', 60000,111),
(308, 'Jessica', 23789425542, 'Jessica@mail.com', 'Chef', 38000, 189),
(309, 'Brian', 2123444242, 'Brian@mail.com', 'Waiter', 29000, 120),
(310,'Kim',23768904262, 'Kim@mail.com', 'Hostess', 27000, 123);

-- Insert dummy data into Menus
-- INSERT INTO menus (`Name`, `Type`, `Price`)
-- VALUES
-- ('Cheese Burger', 'Main', 10),
-- ('Veggie Burger', 'Main', 9),
-- ('French Fries', 'Side', 3),
-- ('Caesar Salad', 'Main', 8),
-- ('Chicken Wings', 'Appetizer', 6),
-- ('Coca Cola', 'Drink', 2),
-- ('Pasta', 'Main', 11),
-- ('Rice', 'Side', 4),
-- ('Margarita', 'Drink', 5),
-- ('Ice Cream', 'Dessert', 4);

-- Insert dummy data into Bookings
-- INSERT INTO `LittleLemonDB`.`Bookings` (`CustomerID`, `StaffID`, `Date`, `TableNumber`)
-- VALUES
-- (1, 1, '2023-09-01 12:00:00', 10),
-- (2, 2, '2023-09-01 12:30:00', 12),
-- (3, 3, '2023-09-02 13:00:00', 14),
-- (4, 4, '2023-09-02 14:00:00', 16),
-- (5, 5, '2023-09-03 15:00:00', 18),
-- (6, 6, '2023-09-03 16:00:00', 20),
-- (7, 7, '2023-09-04 17:00:00', 22),
-- (8, 8, '2023-09-04 18:00:00', 24),
-- (9, 9, '2023-09-05 19:00:00', 26),
-- (10, 10, '2023-09-05 20:00:00', 28);

-- Insert dummy data into Orders
-- INSERT INTO `LittleLemonDB`.`Orders` (`CustomerID`, `MenuItemID`, `StaffID`, `Date`, `Quantity`, `TotalCost`)
-- VALUES
-- (1, 1, 1, '2023-09-01 12:00:00', 2, 171),
-- (2, 2, 2, '2023-09-01 12:30:00', 1, 174),
-- (3, 3, 3, '2023-09-02 13:00:00', 3, 358),
-- (4, 4, 4, '2023-09-02 14:00:00', 1, 265),
-- (5, 5, 5, '2023-09-03 15:00:00', 4, 252),
-- (6, 6, 6, '2023-09-03 16:00:00', 2, 465),
-- (7, 7, 7, '2023-09-04 17:00:00', 1, 65),
-- (8, 8, 8, '2023-09-04 18:00:00', 2, 437),
-- (9, 9, 9, '2023-09-05 19:00:00', 3, 484),
-- (10, 10, 10, '2023-09-05 20:00:00', 1, 111);

-- Insert dummy data into OrderDeliveryStatuses
-- INSERT INTO `LittleLemonDB`.`OrderDeliveryStatuses` (`OrderID`, `Date`, `Status`)
-- VALUES
-- (1, '2023-09-01 12:15:00', 'Delivered'),
-- (2, '2023-09-01 12:45:00', 'Preparing'),
-- (3, '2023-09-02 13:15:00', 'Preparing'),
-- (4, '2023-09-02 14:15:00', 'Out for delivery'),
-- (5, '2023-09-03 15:15:00', 'Out for delivery'),
-- (6, '2023-09-03 16:15:00', 'Delivered'),
-- (7, '2023-09-04 17:15:00', 'Preparing'),
-- (8, '2023-09-04 18:15:00', 'Delivered'),
-- (9, '2023-09-05 19:15:00', 'Delivered'),
-- (10, '2023-09-05 20:15:00', 'Delivered'); 

#######################################################
--                Solution To Task One
--                Exercise: Create SQL queries to check available bookings based on user input
#####################################################################################

 INSERT INTO bookings (BookingID, Date, TableNumber) 
 values 
		(1, '2022-10-10', 5),
		(2, '2022-11-12', 3),
		(3, '2022-10-11', 2),
		(4, '2022-10-13', 2);
        
#######################################################
--                Solution To Task Two
--                Exercise: Create SQL queries to check available bookings based on user input
#####################################################################################

-- Task 2
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_status VARCHAR(50);

    SELECT COUNT(*) INTO @table_count
    FROM Bookings
    WHERE Date = booking_date AND TableNumber = table_number;

    IF (@table_count > 0) THEN
        SET table_status = 'Table is already booked.';
    ELSE
        SET table_status = 'Table is available.';
    END IF;

    SELECT table_status AS 'Table Status';
END;
//
DELIMITER ;
CALL CheckBooking('2022-10-10', 5);

#######################################################
--                Solution To Task Three
--                Exercise: Create SQL queries to check available bookings based on user input
#####################################################################################

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN new_booking_date DATE, IN new_table_number INT, IN new_customer_id INT, IN new_staff_id INT)
BEGIN
    DECLARE table_status INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE Date = new_booking_date AND TableNumber = new_table_number;

    IF (table_status > 0) THEN
        ROLLBACK;
        SELECT 'Booking could not be completed. Table is already booked on the specified date.' AS 'Status';
    ELSE
        INSERT INTO Bookings(Date, TableNumber, CustomerID, StaffID)
        VALUES(new_booking_date, new_table_number, new_customer_id, new_staff_id);

        COMMIT;
        SELECT 'Booking completed successfully.' AS 'Status';
    END IF;
END;
//
DELIMITER ;