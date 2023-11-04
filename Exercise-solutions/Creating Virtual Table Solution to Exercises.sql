show DATABASES;

Use littlelemondb;

SHOW tables;

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


-- ALTER table littlelemondb.menu
-- add column Type varchar(256),
-- add column Price decimal;

-- Insert dummy data into Menu
INSERT INTO menu (MenuId, Description, Name, Type, Price)
VALUES
(1,'burger menu','Cheese Burger', 'Main', 10),
(2,'burger menu','Veggie Burger', 'Main', 9),
(33,'fries menu','French Fries', 'Side', 3),
(44,'salad menu','Caesar Salad', 'Main', 8),
(55,'chicken menu','Chicken Wings', 'Appetizer', 6),
(66,'drink menu','Coca Cola', 'Drink', 2),
(77,'pasta menu','Pasta', 'Main', 11),
(88,'food menu','Rice', 'Side', 4),
(99,'food menu','Margarita', 'Drink', 5),
(10,'ice-cream menu','Ice Cream', 'Dessert', 4);

-- Insert dummy data into Bookings
INSERT INTO bookings (BookingID, Date, TableNumber)
VALUES
(11,  '2023-09-01 12:00:00', 10),
(12,  '2023-09-01 12:30:00', 12),
(13,  '2023-09-02 13:00:00', 14),
(14,  '2023-09-02 14:00:00', 16),
(5,  '2023-09-03 15:00:00', 18),
(6,  '2023-09-03 16:00:00', 20),
(7,  '2023-09-04 17:00:00', 22),
(8,  '2023-09-04 18:00:00', 24),
(9,  '2023-09-05 19:00:00', 26),
(10,  '2023-09-05 20:00:00', 28);

-- Insert dummy data into Orders
-- INSERT INTO `LittleLemonDB`.`Orders` (OrderID, Date, Quantity, TotalCost, BookingID, CustomerID, MenuID, DeliveryID)
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

ALter table delivery_status
add COLUMN status VARCHAR(256);

-- Insert dummy data into DeliveryStatus
INSERT INTO delivery_status (DeliveryID, Delivery_date, Status)
VALUES
(1, '2023-09-01 12:15:00', 'Delivered'),
(2, '2023-09-01 12:45:00', 'Preparing'),
(3, '2023-09-02 13:15:00', 'Preparing'),
(4, '2023-09-02 14:15:00', 'Out for delivery'),
(5, '2023-09-03 15:15:00', 'Out for delivery'),
(6, '2023-09-03 16:15:00', 'Delivered'),
(7, '2023-09-04 17:15:00', 'Preparing'),
(8, '2023-09-04 18:15:00', 'Delivered'),
(9, '2023-09-05 19:15:00', 'Delivered'),
(10, '2023-09-05 20:15:00', 'Delivered'); 

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