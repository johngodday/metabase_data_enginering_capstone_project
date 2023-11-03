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

CREATE PROCEDURE CancelOrder(IN OrderID INT)
DELETE FROM orders;