Use littlelemondb;

SHOW tables;

#######################################################
--                Solution To Task One
--                Exercise: Create optimized queries to manage and analyze data
#####################################################################################
create procedure GetMaxQuantity()
SELECT MAX(orders.Quantity)
FROM orders;
;

call GetMaxQuantity;

#######################################################
--                Solution To Task two
--                Exercise: Create optimized queries to manage and analyze data
#####################################################################################

PREPARE GetOrderDetail from 'SELECT OrderID, Quantity, TotalCost from Orders where OrderID=?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

#######################################################
--                Solution To Task three
--                Exercise: Create optimized queries to manage and analyze data
#####################################################################################

DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderIDToDelete INT)
BEGIN
  DECLARE orderExistence INT;

  -- Check if the order exists in the database
  SELECT COUNT(*) INTO orderExistence FROM Orders WHERE OrderID = orderIDToDelete;

  -- If the order exists, delete it
  IF orderExistence > 0 THEN
    -- First delete related records from OrderDeliveryStatuses table
    DELETE FROM delivery_status WHERE OrderID = orderIDToDelete;

    -- Then delete the order from the Orders table
    DELETE FROM Orders WHERE OrderID = orderIDToDelete;

    SELECT CONCAT('Order ', orderIDToDelete, ' is cancelled') AS 'Confirmation';
  ELSE
    SELECT CONCAT('Order ', orderIDToDelete, ' does not exist') AS 'Confirmation';
  END IF;
END;
//
DELIMITER ;