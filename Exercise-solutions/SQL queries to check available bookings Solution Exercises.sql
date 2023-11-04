show DATABASES;

Use littlelemondb;

SHOW tables;

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