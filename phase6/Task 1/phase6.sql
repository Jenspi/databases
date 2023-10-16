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