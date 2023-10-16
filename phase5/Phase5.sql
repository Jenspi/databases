/* Jenny Spicer ; 4125 ; September 2023 */
-- Using Phase4 tables
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
