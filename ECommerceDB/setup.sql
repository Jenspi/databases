-- ECommerceDB
-- Jenny Spicer | December 12, 2025
-- SQL DDL + DML (excluding LineItem, located in procedures.sql) Setup Script

DROP TABLE LineItem;
DROP TABLE Orders;
DROP TABLE Address;
DROP TABLE Customer;
DROP TABLE Review;
DROP TABLE Product;

--PRODUCT(ID, Name, Price, Inventory)
CREATE TABLE Product(
    P_ID CHAR(3),
    P_Name VARCHAR(30),
    P_Price NUMBER(5,2),
    Inventory NUMBER DEFAULT 64,
    
    CONSTRAINT ProductPK PRIMARY KEY (P_ID)
);

--REVIEW(ProductID, Number, Rating, Text)
CREATE TABLE Review(
    R_ProductID CHAR(3),
    R_Number NUMBER(1),
    R_Rating NUMBER(1),   
    R_Text VARCHAR(250),
    
    CONSTRAINT ReviewPK PRIMARY KEY (R_ProductID, R_Number),
    CONSTRAINT ReviewFK FOREIGN KEY (R_ProductID) REFERENCES Product(P_ID)
);

--CUSTOMER(ID, Name, DateOfBirth, ReferrerID)
CREATE TABLE Customer(
    C_ID CHAR(3),
    C_Name VARCHAR(20),
    C_DateOfBirth DATE,
    C_ReferrerID CHAR(3),
    
    CONSTRAINT CustomerPK PRIMARY KEY(C_ID),
    CONSTRAINT CustomerFK FOREIGN KEY(C_ReferrerID) REFERENCES Customer(C_ID)
);

--ADDRESS(CustID, Address)
CREATE TABLE Address(
    A_CustID CHAR(3),
    A_Address VARCHAR(25),
    
    CONSTRAINT AddressPK PRIMARY KEY (A_CustID, A_Address),
    CONSTRAINT AddressFK FOREIGN KEY (A_CustID) REFERENCES Customer(C_ID)
);

--ORDERS(OrderNumber, OrderDate, CustID)
CREATE TABLE Orders(
    O_OrderNumber CHAR(5),
    O_OrderDate DATE,
    O_CustID CHAR(3),
    
    CONSTRAINT OrdersPK PRIMARY KEY (O_OrderNumber),
    CONSTRAINT OrdersFK FOREIGN KEY (O_CustID) REFERENCES Customer(C_ID)
);

--LINEITEM(OrderNumber, ProductID, Quantity)
CREATE TABLE LineItem(
    L_OrderNumber CHAR(5),
    L_ProductID CHAR(3),
    L_Quantity NUMBER(3),
    
    CONSTRAINT LineItemPK PRIMARY KEY (L_OrderNumber, L_ProductID),
    CONSTRAINT LineItemFK FOREIGN KEY (L_OrderNumber) REFERENCES Orders(O_OrderNumber),
    CONSTRAINT LineItemFK2 FOREIGN KEY (L_ProductID) REFERENCES Product(P_ID)
);

commit;

-- Add Inventory column to Product table
ALTER TABLE Product ADD Inventory NUMBER DEFAULT 64;
commit;

-- =====================
-- PRODUCT
-- =====================
INSERT INTO product VALUES('P01','Taylor Swift Ticket',199.99);
INSERT INTO product VALUES('P02','Database Textbook',75.25);
INSERT INTO product VALUES('P03','Beignet Mix',3.49);
INSERT INTO product VALUES('P04','Pralines',9.99);
INSERT INTO product VALUES('P05','Crystal Hot Sauce',3.49);
INSERT INTO product VALUES('P06','Harry Styles Ticket',65.99);
INSERT INTO product VALUES('P07','Lizzo Ticket',150.99);
INSERT INTO product VALUES('P08','Tony Chachere''s',3.29);
INSERT INTO product VALUES('P09','Coffee',4.10);
INSERT INTO product VALUES('P10','Alvin Kamara Jersey',60.50);
INSERT INTO product VALUES('P11','1 lb of Crawfish',4.00);
INSERT INTO product VALUES('P12','Jazz Fest Ticket',95.00);
INSERT INTO product VALUES('P13','1 lb of Boudin',5.99);
INSERT INTO product VALUES('P14','Streetcar Ticket',2.25);
INSERT INTO product VALUES('P15','Audubon Zoo Ticket',29.99);
INSERT INTO product VALUES('P16','1 Dozen Oysters',20.00);
INSERT INTO product VALUES('P17','Jazz at the Sandbar Ticket',0.00);
INSERT INTO product VALUES('P18','Snoball',3.99);
INSERT INTO product VALUES('P19','Frozen Coffee',9.99);
INSERT INTO product VALUES('P20','Saints Ticket',89.45);
commit;

-- =====================
-- REVIEW
-- =====================
INSERT INTO review VALUES('P02',1,4,'Almost new—cover is a bit dirty/bent but bought new. Good authentic book though');
INSERT INTO review VALUES('P02',2,5,'It''s a great book for college level database courses.');
INSERT INTO review VALUES('P02',3,5,'This textbook is getting me through my databases study unit at University without it I''d be lost. The book is well organised and the explanations are clear with many examples and diagrams. The shipping time was incredible.');
INSERT INTO review VALUES('P02',4,5,'Great book. Refined and improved.');
INSERT INTO review VALUES('P03',1,5,'Having had beignets in New Orleans I was looking to replicate at home. This mix is legit! My kids beg me to make it every weekend. As long as you follow the sirectuons to a T they turn out perfect.');
INSERT INTO review VALUES('P03',2,5,'Easy to make but you need to use a lot of flour rolling out since the dough is very sticky when mixed. Don''t roll too thin or will not get puffy like they are at the Cafe.');
INSERT INTO review VALUES('P03',3,5,'The mix is great. Have bought it many times either online or straight from Cafe'' Du Monde. Love the cafe.');
INSERT INTO review VALUES('P05',1,5,'The only hot sauce my family wants.');
INSERT INTO review VALUES('P05',2,1,'Love the hot sauce but 1 of the bottles was broken and I can''t put in to replace it. So idk what to do about it being broken.');
INSERT INTO review VALUES('P05',3,1,'This was crystal original hot sauce. Not extra hot as written in the description');
INSERT INTO review VALUES('P05',4,5,'I''d say that this is my #2 hot sauce right behind OG Tabasco. I don''t think you can ever go wrong it. Tangy but not fiery.');
INSERT INTO review VALUES('P05',5,5,'This is the best Louisiana style hot sauce ever great price large bottles don''t even think about it so good');
commit;

-- =====================
-- CUSTOMER
-- =====================
INSERT INTO customer VALUES('C01','Will Smith','07-JAN-72',NULL);
INSERT INTO customer VALUES('C02','Margot Robbie','14-APR-92',NULL);
INSERT INTO customer VALUES('C03','Ryan Gosling','01-JAN-80','C02');
INSERT INTO customer VALUES('C04','Dwayne Johnson','09-MAY-70',NULL);
INSERT INTO customer VALUES('C05','Emma Stone','13-OCT-85','C01');
INSERT INTO customer VALUES('C06','Tom Hanks','20-DEC-60',NULL);
INSERT INTO customer VALUES('C07','Idris Elba','02-NOV-75','C02');
INSERT INTO customer VALUES('C08','Gal Gadot','06-JUL-86',NULL);
INSERT INTO customer VALUES('C09','Will Ferrell','28-JUN-62',NULL);
INSERT INTO customer VALUES('C10','Chris Evans','10-FEB-80','C02');
INSERT INTO customer VALUES('C11','Jamie Foxx','21-JUL-74',NULL);
INSERT INTO customer VALUES('C12','Tom Hardy','03-APR-82','C01');
INSERT INTO customer VALUES('C13','Rami Malek','12-MAR-88',NULL);
INSERT INTO customer VALUES('C14','Vin Diesel','24-AUG-76','C11');
INSERT INTO customer VALUES('C15','Adam Driver','04-FEB-85',NULL);
INSERT INTO customer VALUES('C16','Scarlett Johansson','16-JAN-86','C09');
INSERT INTO customer VALUES('C17','Miles Teller','21-OCT-89','C15');
INSERT INTO customer VALUES('C18','Salma Hayek','29-MAR-65',NULL);
INSERT INTO customer VALUES('C19','Russell Crowe','19-SEP-68','C15');
INSERT INTO customer VALUES('C20','Ewan McGregor','23-DEC-73','C17');
commit;

-- =====================
-- ADDRESS
-- =====================
INSERT INTO address VALUES('C01','1500 Sugar Bowl Dr');
INSERT INTO address VALUES('C02','1501 Dave Dixon Dr');
INSERT INTO address VALUES('C03','2000 Lakeshore Dr');
INSERT INTO address VALUES('C04','1380 Port of New Orleans');
INSERT INTO address VALUES('C06','945 Magazine St');
INSERT INTO address VALUES('C07','800 Decatur St');
INSERT INTO address VALUES('C08','1 Collins Diboll Cir');
INSERT INTO address VALUES('C09','6801 Franklin Ave');
INSERT INTO address VALUES('C01','6500 Magazine St');
INSERT INTO address VALUES('C01','1751 Gentilly Blvd');
INSERT INTO address VALUES('C03','615 Pere Antoine Alley');
INSERT INTO address VALUES('C04','1111 Canal St');
INSERT INTO address VALUES('C06','545 St Charles Ave');
INSERT INTO address VALUES('C07','701 N Rampart St');
INSERT INTO address VALUES('C08','1 Canal St');
commit;

-- =====================
-- ORDERS
-- =====================
INSERT INTO orders VALUES('O0001','30-Jan-23','C08');
INSERT INTO orders VALUES('O0002','30-Jan-23','C07');
INSERT INTO orders VALUES('O0003','30-Jan-23','C04');
INSERT INTO orders VALUES('O0004','30-Jan-23','C03');
INSERT INTO orders VALUES('O0005','30-Jan-23','C08');
INSERT INTO orders VALUES('O0006','30-Jan-23','C04');
INSERT INTO orders VALUES('O0007','30-Jan-23','C08');
INSERT INTO orders VALUES('O0008','30-Jan-23','C02');
INSERT INTO orders VALUES('O0009','30-Jan-23','C19');
INSERT INTO orders VALUES('O0010','30-Jan-23','C14');
INSERT INTO orders VALUES('O0011','31-Jan-23','C05');
INSERT INTO orders VALUES('O0012','31-Jan-23','C17');
INSERT INTO orders VALUES('O0013','31-Jan-23','C12');
INSERT INTO orders VALUES('O0014','31-Jan-23','C15');
INSERT INTO orders VALUES('O0015','31-Jan-23','C13');
INSERT INTO orders VALUES('O0016','31-Jan-23','C01');
INSERT INTO orders VALUES('O0017','31-Jan-23','C20');
INSERT INTO orders VALUES('O0018','31-Jan-23','C03');
INSERT INTO orders VALUES('O0019','31-Jan-23','C11');
INSERT INTO orders VALUES('O0020','01-Feb-23','C09');
INSERT INTO orders VALUES('O0021','01-Feb-23','C03');
INSERT INTO orders VALUES('O0022','01-Feb-23','C13');
INSERT INTO orders VALUES('O0023','01-Feb-23','C07');
INSERT INTO orders VALUES('O0024','01-Feb-23','C02');
INSERT INTO orders VALUES('O0025','01-Feb-23','C01');
INSERT INTO orders VALUES('O0026','01-Feb-23','C13');
INSERT INTO orders VALUES('O0027','01-Feb-23','C18');
INSERT INTO orders VALUES('O0028','01-Feb-23','C20');
INSERT INTO orders VALUES('O0029','01-Feb-23','C19');
INSERT INTO orders VALUES('O0030','01-Feb-23','C12');
INSERT INTO orders VALUES('O0031','02-Feb-23','C02');
INSERT INTO orders VALUES('O0032','02-Feb-23','C04');
INSERT INTO orders VALUES('O0033','02-Feb-23','C06');
INSERT INTO orders VALUES('O0034','02-Feb-23','C08');
INSERT INTO orders VALUES('O0035','02-Feb-23','C10');
INSERT INTO orders VALUES('O0036','02-Feb-23','C12');
INSERT INTO orders VALUES('O0037','02-Feb-23','C14');
INSERT INTO orders VALUES('O0038','02-Feb-23','C01');
INSERT INTO orders VALUES('O0039','02-Feb-23','C03');
INSERT INTO orders VALUES('O0040','03-Feb-23','C09');
INSERT INTO orders VALUES('O0041','03-Feb-23','C01');
INSERT INTO orders VALUES('O0042','03-Feb-23','C03');
INSERT INTO orders VALUES('O0043','03-Feb-23','C05');
INSERT INTO orders VALUES('O0044','03-Feb-23','C07');
INSERT INTO orders VALUES('O0045','03-Feb-23','C13');
INSERT INTO orders VALUES('O0046','03-Feb-23','C17');
INSERT INTO orders VALUES('O0047','03-Feb-23','C08');
INSERT INTO orders VALUES('O0048','03-Feb-23','C06');
INSERT INTO orders VALUES('O0049','03-Feb-23','C04');
INSERT INTO orders VALUES('O0050','03-Feb-23','C02');
commit;

-- SELECT COUNT(*) "Product Count: should be 20" FROM Product;
-- SELECT COUNT(*) "Review Count: should be 12" FROM Review;
-- SELECT COUNT(*) "Customer Count: should be 20" FROM Customer;
-- SELECT COUNT(*) "Address Count: should be 15" FROM Address;
-- SELECT COUNT(*) "Orders Count: should be 50" FROM Orders;
-- SELECT COUNT(*) "LineItem Count: should be 100" FROM LineItem;