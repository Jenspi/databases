DROP TABLE LineItem;
DROP TABLE Orders;
DROP TABLE Address;
DROP TABLE Customer;
DROP TABLE Review;
DROP TABLE Product;

--PRODUCT(ID, Name, Price)
CREATE TABLE Product(
    P_ID CHAR(3),
    P_Name VARCHAR(30),
    P_Price NUMBER(5,2),
    
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
    --I named the foreign keys this way because the way from class was confusing me
    --Please let me know if this will cause issues or confusion in the future for me
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

--running SQL scripts with     C:\Users\jmspicer\Desktop\file.sql
@C:\Users\jmspicer\Desktop\product.sql
@C:\Users\jmspicer\Desktop\review.sql
@C:\Users\jmspicer\Desktop\customer.sql
@C:\Users\jmspicer\Desktop\address.sql
@C:\Users\jmspicer\Desktop\orders.sql
@C:\Users\jmspicer\Desktop\lineitem.sql

--SELECT COUNT(*) "Product Count" FROM Product;
SELECT COUNT(*) "Review Count: should be 12" FROM Review;
SELECT COUNT(*) "Customer Count: should be 20" FROM Customer;
SELECT COUNT(*) "Address Count: should be 15" FROM Address;
SELECT COUNT(*) "Orders Count: should be 50" FROM Orders;
SELECT COUNT(*) "LineItem Count: should be 100" FROM LineItem;

commit;--Not sure if we needed this one