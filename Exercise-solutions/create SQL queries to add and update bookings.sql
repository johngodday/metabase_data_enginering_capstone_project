#######################################################
--                Solution To Task one
--                Exercise: Create SQL queries to add and update bookings
#####################################################################################

-- Exercise: Create SQL queries to add and update bookings
-- Task 1

DELIMITER //
CREATE PROCEDURE AddBooking(
    IN new_booking_id INT, 
    IN new_customer_id INT, 
    IN new_booking_date DATE, 
    IN new_table_number INT, 
    IN new_staff_id INT)
BEGIN
    -- Insert the new booking record
    INSERT INTO Bookings(
        BookingID, 
        CustomerID, 
        Date, 
        TableNumber, 
        StaffID)
    VALUES(
        new_booking_id, 
        new_customer_id, 
        new_booking_date, 
        new_table_number,
        new_staff_id
    );

    SELECT 'New booking added' AS 'Confirmation';
END;
//
DELIMITER ;


CALL AddBooking(17, 1, '2022-10-10', 5, 2);

#######################################################
--                Solution To Task two
--                Exercise: Create SQL queries to add and update bookings
#####################################################################################

-- Task 2

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN booking_id_to_update INT, 
    IN new_booking_date DATE)
BEGIN
    -- Update the booking record
    UPDATE Bookings
    SET Date = new_booking_date
    WHERE BookingID = booking_id_to_update;

    SELECT CONCAT('Booking ', booking_id_to_update, ' updated') AS 'Confirmation';
END;
//
DELIMITER ;

CALL UpdateBooking(9, '2022-11-15');

#######################################################
--                Solution To Task three
--                Exercise: Create SQL queries to add and update bookings
#####################################################################################
-- Task 3

DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id_to_cancel INT)
BEGIN
    -- Delete the booking record
    DELETE FROM Bookings
    WHERE BookingID = booking_id_to_cancel;

    SELECT CONCAT('Booking ', booking_id_to_cancel, ' cancelled') AS 'Confirmation';
END;
//
DELIMITER ;

CALL CancelBooking(9);