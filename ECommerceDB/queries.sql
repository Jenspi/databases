/* Jenny Spicer ; 4125 ; September 2023 */

-- ==============================================
-- Introductory SQL: SQL Retrieval Queries
-- ==============================================

--1. [4 pts] Find all products (their names) with a price greater than $100.
SELECT P_Name "Products > $100:"
FROM Product
WHERE P_Price > 100;

--2. [4 pts] Find all Customers who were not referred by another customer.
SELECT C_Name "Customers not referred:"
FROM Customer
WHERE C_ReferrerID IS NULL;

--3. [4 pts] Find the average rating for all reviews.
SELECT AVG(R_Rating) "Average Rating:"
FROM Review;

--4. [4 pts] Find all the “Ticket”s from product and sort the output by the price (any direction).
-- Hint: remember the LIKE operator.
SELECT P_Name, P_Price
FROM Product
WHERE P_Name LIKE '%Ticket%'
ORDER BY P_Price DESC;


--5. [4 pts] Find the minimum and maximum date of births amongst all customer.
--Use only a single query that returns a single row (ex. 01-JAN-70, 01-JAN-99).
SELECT MIN(C_DateOfBirth), MAX(C_DateOfBirth) FROM Customer;


--6. [4 pts] Find all reviews that contain the word "Great". Make sure to remove case sensitivity
-- Hint: remember the LIKE operator.
SELECT R_Text "Reviews with 'great'"
FROM Review
WHERE LOWER(R_Text) LIKE '%great%';


--7. [4 pts] Find the number of reviews for P05 with a rating between 3 and 5.
SELECT COUNT(*) "Reviews for P05 3<x<5"
FROM (SELECT * FROM Review WHERE R_ProductID = 'P05')
WHERE R_Rating BETWEEN 3 AND 5;--"between" is inclusive

--8. [7 pts] Find the name of the product with the highest price. Do not hardcode any prices or other values –
-- you must use SQL without assuming you know the current database snapshot.
SELECT P_Name "Highest Priced:"
FROM Product
WHERE P_Price = (SELECT MAX(P_Price) FROM Product);

--9. [7 pts] Find the product names with a price greater than the average overall price of products + 25% (i.e., greater than 1.25 * average price).
-- Do not hardcode any prices or other values – you must use SQL without assuming you know the current database snapshot.
SELECT P_Name "Priced greater than average:"
FROM Product
WHERE P_Price > (SELECT (AVG(P_Price)*1.25) FROM Product);

-- ==============================================
-- Inter SQL: Intermediate Retrieval Queries
-- ==============================================

--1. Find the names of all customers who have at least one address-----DONE
SELECT DISTINCT C_Name "Customers with 1+ address(es)"
FROM Customer, Address--inner join
WHERE C_ID = A_CustID;

--2. For each product id, list the total quantity sold-----DONE
SELECT L_ProductID "Products", SUM(L_Quantity) "Quantities"
FROM LineItem
GROUP BY L_ProductID;

--3. Find the names of all products that do not have any reviews-----DONE
SELECT P_Name "All products with no reviews"
FROM product FULL OUTER JOIN review--full join
ON product.P_ID = review.R_ProductID
WHERE R_Rating IS NULL;

--4. Find the names of all customers who were referred by 'Margot Robbie'.
--Note: You must use the string �Margot Robbie� and not hardcode the ID.
SELECT C_Name "All customers referred by Margot Robbie"
FROM Customer 
WHERE C_ReferrerID = (  SELECT C_ID
                        FROM Customer
                        WHERE C_Name = 'Margot Robbie' --Gets ID of string
                    );
commit;

-- 1. Retrieve the names of all products which have sold a total quantity greater than 30.
SELECT DISTINCT P_Name "Products with more than 30 sold:"---done
FROM Product, LineItem
WHERE L_Quantity > 30;

-- 2. Retrieve the names of all customers who were referred by someone who was referred by
-- the customer with ID C15. Ex. Return CustomerA who was referred by CustomerB where
-- CustomerB was referred by customer C15
SELECT C_Name "Names of customers:"
FROM Customer
WHERE C_ReferrerID IN (SELECT C_ID FROM Customer WHERE C_ReferrerID = 'C15');--done

-- 3. Find the customer names that have ordered the least expensive product
SELECT C_Name "Customers who ordered the least expensive product"
FROM Product, Customer, LineItem, Orders
WHERE O_OrderNumber = L_OrderNumber
AND L_ProductID = P_ID
AND C_ID = O_CustID
AND P_Price = (SELECT MIN(P_Price) FROM Product);

-- 4. Find the avg review rating for each product that has received a review (do no include
-- products that have not received a review).
SELECT R_ProductID "Product", AVG(R_Rating) "Average review rating"---done
FROM Review
WHERE R_Rating IS NOT NULL
GROUP BY R_ProductID;

-- 5. List the total cost for each order (quantity * price for all products for each order ID) where
-- the order cost is greater than 1000. Note: shipping cost was also a derived attribute - we will
-- discuss how to build a function that can add that into the cost when we get to PL/SQL in Ch 5.
-- https://docs.oracle.com/en/database/other-databases/nosql-database/25.3/sqlreferencefornosql/group-clause.html
SELECT L_OrderNumber, P_Name, SUM(L_Quantity*P_Price)
FROM LineItem, Product
WHERE L_ProductID = P_ID
GROUP BY L_OrderNumber, P_Name
HAVING SUM(L_Quantity*P_Price) > 1000;

-- 6. List customers that have spent more than $1000 on orders
SELECT C_Name "Customers who have sent over $1000"
FROM Customer, Product
WHERE 1000 < (SELECT SUM(P_Price) FROM Product);
-- I have a feeling this isn't correct

-- 7. Find the total number of orders placed by customers who were referred by Margot Robbie.
SELECT COUNT(O_OrderNumber) "Number of orders placed:"
FROM Orders
WHERE O_CustID IN 
                 ( SELECT C_ID
                  FROM Customer, Orders
                  WHERE C_ReferrerID = (  SELECT C_ID
                                          FROM Customer
                                          WHERE C_Name = 'Margot Robbie' --gets C_ID
                                        ));----done

--8. Find all customer names where both the first name and last name begin with a vowel
-- This problem requires (no points if you don't) you to use the regular expression function
-- REGEXP_LIKE that we discussed in class.
SELECT C_Name "Begins/ends with a vowel:"
FROM Customer
WHERE REGEXP_LIKE(C_Name, '^[aeiouyAEIOUY]+[aA-zZ]*\s[aeiouyAEIOUY]');---done


commit;