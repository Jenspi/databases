-- ECommerceDB
-- Jenny Spicer | December 12, 2025
-- PL/SQL Triggers + LineItem Data

-- Note: Inventory column is added in setup.sql
-- UPDATE Product SET Inventory = 64; -- (only if you need to reset inventory)

--Write a trigger that will fire when you INSERT a row into the Lineitem table.
--This trigger will check the value of Inventory for the corresponding ProductID.
    --? If Inventory is currently 0, then the product is out of stock. In this case, return an error
    --message “Product #[insert the ProductID] is out of stock!” and cancel the insert.
    --? If the Inventory minus the quantity is less than 0, then we cannot fulfill this order. In
    --this case, return an error message “Product #[insert the ProductID] does not have
    --enough stock for this order!” and cancel the insert.
    --? If the Inventory minus the quantity is greater than or equal to 0, we can fulfill the
    --order. In this case, update the product inventory to reflect this order.
CREATE OR REPLACE TRIGGER Task1
BEFORE INSERT ON LineItem
for each row
DECLARE
    --T_Inventory Product.Inventory%type;
    T_Inventory NUMBER;
BEGIN
    SELECT Inventory INTO T_Inventory
    FROM Product
    WHERE P_ID = :new.L_ProductID;
    
    IF(T_Inventory = 0) THEN raise_application_error(-20999,'Product #'||:new.L_ProductID||' is out of stock!');--throw custom user error
    ELSIF( (T_Inventory-:new.L_Quantity) < 0) THEN
        raise_application_error(-20998, 'Product #'||:new.L_ProductID||' does not have enough stock for this order!');--throw custom user error
    ELSIF( (T_Inventory-:new.L_Quantity) >= 0) THEN
        UPDATE Product
        SET Inventory = (T_Inventory-:new.L_Quantity)
        WHERE P_ID = :new.L_ProductID;
    END IF;
END;
/

DELETE FROM Lineitem;

INSERT INTO lineitem VALUES('O0001','P01',2);
INSERT INTO lineitem VALUES('O0001','P07',2);
INSERT INTO lineitem VALUES('O0001','P12',1);
INSERT INTO lineitem VALUES('O0002','P16',3);
INSERT INTO lineitem VALUES('O0002','P05',1);
INSERT INTO lineitem VALUES('O0002','P09',2);
INSERT INTO lineitem VALUES('O0002','P11',5);
INSERT INTO lineitem VALUES('O0002','P20',1);
INSERT INTO lineitem VALUES('O0003','P10',1);
INSERT INTO lineitem VALUES('O0003','P02',1);
INSERT INTO lineitem VALUES('O0004','P14',4);
INSERT INTO lineitem VALUES('O0004','P15',2);
INSERT INTO lineitem VALUES('O0004','P17',2);
INSERT INTO lineitem VALUES('O0004','P03',1);
INSERT INTO lineitem VALUES('O0004','P04',1);
INSERT INTO lineitem VALUES('O0005','P11',10);
INSERT INTO lineitem VALUES('O0006','P01',5);
INSERT INTO lineitem VALUES('O0006','P09',1);
INSERT INTO lineitem VALUES('O0006','P15',1);
INSERT INTO lineitem VALUES('O0007','P06',3);
INSERT INTO lineitem VALUES('O0007','P13',5);
INSERT INTO lineitem VALUES('O0007','P03',20);
INSERT INTO lineitem VALUES('O0007','P10',1);
INSERT INTO lineitem VALUES('O0008','P05',14);
INSERT INTO lineitem VALUES('O0008','P07',5);
INSERT INTO lineitem VALUES('O0008','P02',8);
INSERT INTO lineitem VALUES('O0008','P09',1);
INSERT INTO lineitem VALUES('O0008','P04',6);
INSERT INTO lineitem VALUES('O0009','P12',3);
INSERT INTO lineitem VALUES('O0009','P08',1);
INSERT INTO lineitem VALUES('O0009','P16',14);
INSERT INTO lineitem VALUES('O0009','P14',6);
INSERT INTO lineitem VALUES('O0009','P18',2);
INSERT INTO lineitem VALUES('O0010','P11',1);
INSERT INTO lineitem VALUES('O0011','P05',200);
INSERT INTO lineitem VALUES('O0011','P17',10);
INSERT INTO lineitem VALUES('O0011','P20',12);
INSERT INTO lineitem VALUES('O0012','P19',4);
INSERT INTO lineitem VALUES('O0012','P12',3);
INSERT INTO lineitem VALUES('O0012','P01',8);
INSERT INTO lineitem VALUES('O0012','P18',2);
INSERT INTO lineitem VALUES('O0013','P13',1);
INSERT INTO lineitem VALUES('O0014','P19',15);
INSERT INTO lineitem VALUES('O0014','P15',3);
INSERT INTO lineitem VALUES('O0015','P10',1);
INSERT INTO lineitem VALUES('O0016','P02',2);
INSERT INTO lineitem VALUES('O0016','P03',12);
INSERT INTO lineitem VALUES('O0016','P17',5);
INSERT INTO lineitem VALUES('O0016','P05',1);
INSERT INTO lineitem VALUES('O0016','P08',1);
INSERT INTO lineitem VALUES('O0016','P20',18);
INSERT INTO lineitem VALUES('O0017','P19',4);
INSERT INTO lineitem VALUES('O0018','P04',1);
INSERT INTO lineitem VALUES('O0018','P02',6);
INSERT INTO lineitem VALUES('O0019','P14',4);
INSERT INTO lineitem VALUES('O0020','P02',16);
INSERT INTO lineitem VALUES('O0021','P11',4);
INSERT INTO lineitem VALUES('O0021','P16',6);
INSERT INTO lineitem VALUES('O0021','P15',1);
INSERT INTO lineitem VALUES('O0022','P07',1);
INSERT INTO lineitem VALUES('O0023','P19',12);
INSERT INTO lineitem VALUES('O0024','P08',1);
INSERT INTO lineitem VALUES('O0025','P02',1);
INSERT INTO lineitem VALUES('O0025','P08',6);
INSERT INTO lineitem VALUES('O0026','P18',4);
INSERT INTO lineitem VALUES('O0027','P06',1);
INSERT INTO lineitem VALUES('O0028','P15',18);
INSERT INTO lineitem VALUES('O0028','P17',5);
INSERT INTO lineitem VALUES('O0028','P18',3);
INSERT INTO lineitem VALUES('O0028','P01',10);
INSERT INTO lineitem VALUES('O0028','P12',3);
INSERT INTO lineitem VALUES('O0029','P19',1);
INSERT INTO lineitem VALUES('O0030','P17',1);
INSERT INTO lineitem VALUES('O0031','P09',16);
INSERT INTO lineitem VALUES('O0031','P05',1);
INSERT INTO lineitem VALUES('O0032','P11',1);
INSERT INTO lineitem VALUES('O0033','P07',25);
INSERT INTO lineitem VALUES('O0034','P19',4);
INSERT INTO lineitem VALUES('O0034','P17',1);
INSERT INTO lineitem VALUES('O0034','P03',1);
INSERT INTO lineitem VALUES('O0035','P16',12);
INSERT INTO lineitem VALUES('O0035','P18',2);
INSERT INTO lineitem VALUES('O0036','P14',1);
INSERT INTO lineitem VALUES('O0037','P19',8);-- will throw error; purposefully throw error when not enough stock
INSERT INTO lineitem VALUES('O0037','P18',1);
INSERT INTO lineitem VALUES('O0038','P18',50);-- will throw error; purposefully throw error when not enough stock
INSERT INTO lineitem VALUES('O0039','P02',3);
INSERT INTO lineitem VALUES('O0040','P13',1);
INSERT INTO lineitem VALUES('O0041','P20',75);-- will throw error; purposefully throw error when not enough stock
INSERT INTO lineitem VALUES('O0042','P06',6);
INSERT INTO lineitem VALUES('O0043','P11',4);
INSERT INTO lineitem VALUES('O0044','P17',1);
INSERT INTO lineitem VALUES('O0044','P05',10);
INSERT INTO lineitem VALUES('O0045','P18',5);
INSERT INTO lineitem VALUES('O0045','P07',1);
INSERT INTO lineitem VALUES('O0046','P10',14);
INSERT INTO lineitem VALUES('O0047','P04',5);
INSERT INTO lineitem VALUES('O0048','P16',1);
INSERT INTO lineitem VALUES('O0049','P13',3);
INSERT INTO lineitem VALUES('O0050','P08',2);


SELECT P_ID, Inventory FROM Product ORDER BY P_ID;
Select COUNT(*) from LineItem;--should be __ if correct