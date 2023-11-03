show DATABASES;

Use littlelemondb;

SHOW tables;

#######################################################
--                Solution To Task One
--                Exercise: Create a virtual table to summarize data
#####################################################################################
CREATE VIEW OrdersView AS
    SELECT 
        od.OrderID, od.Quantity, od.TotalCost
    FROM
        orders od
    WHERE
        od.Quantity > 2;
        

#######################################################
--                Solution To Task two
--                Exercise: Create a virtual table to summarize data
#####################################################################################

CREATE VIEW OrdersView2 AS
    SELECT 
        cus.CustomerID, cus.FullName, ord.OrderID, ord.TotalCost
    FROM
        customer cus
            INNER JOIN
        orders ord
    WHERE
        ord.TotalCost > 150
    ORDER BY ord.TotalCost DESC;


#######################################################
--                Solution To Task three
--                Exercise: Create a virtual table to summarize data
#####################################################################################

SELECT 
    Name
FROM
    menu
WHERE
    MenuID = ANY (SELECT 
            MenuID
        FROM
            orders
        WHERE
            Quantity > 2)