-- 1. Retrieve the names of all products which have sold a total quantity greater than 30.
SELECT distinct P_Name "Products with more than 30 sold:"---done
FROM Product, LineItem
WHERE L_Quantity > 30;

-- 2. Retrieve the names of all customers who were referred by someone who was referred by
-- the customer with ID C15. Ex. Return CustomerA who was referred by CustomerB where
-- CustomerB was referred by customer C15
SELECT C_Name "Names of customers:"
FROM Customer
WHERE C_ReferrerID IN (SELECT C_ID FROM Customer WHERE C_ReferrerID = 'C15');--done

-- 3. Find the customer names that have ordered the least expensive product 
--SELECT P_ID FROM Product WHERE P_Price = (SELECT MIN(P_Price) FROM Product);--get the ID of the lowest priced product
--SELECT L_OrderNumber from lineitem where L_ProductID = ( SELECT P_ID FROM Product WHERE P_Price = (SELECT MIN(P_Price) FROM Product) );--get order numbers of P17
--SELECT O_custID from orders where O_OrderNumber = (SELECT L_OrderNumber from lineitem where L_ProductID = ( SELECT P_ID FROM Product WHERE P_Price = (SELECT MIN(P_Price) FROM Product) ));--get IDS of people who ordered that order number

-- was meant to combine these but its getting too complicated and im already getting errors

-- 4. Find the avg review rating for each product that has received a review (do no include
-- products that have not received a review).
SELECT R_ProductID "Product", AVG(R_Rating) "Average review rating"---done
FROM Review
where r_rating is not null
GROUP BY R_ProductID;

-- 5. List the total cost for each order (quantity * price for all products for each order ID) where
-- the order cost is greater than 1000. Note: shipping cost was also a derived attribute - we will
-- discuss how to build a function that can add that into the cost when we get to PL/SQL in Ch 5.
--SELECT O_OrderNumber, SUM(L_Quantity*P_Price)
--FROM Orders, LineItem, Product
--ON O_OrderNumer = L_OrderNumber
--ON L_ProductID = P_ID
--GROUP BY O_OrderNumber
--HAVING SUM(L_Quantity *P_Price) > 1000;

--doesn't work, can't figure out why

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