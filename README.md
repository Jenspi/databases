# E-Commerce Database System
Oracle PL/SQL e-commerce DB project: design schemas, manage data, run queries, and modularize code for easy reuse & testing. .    ༘˚⋆🛍️ ｡⋆ 🛒 ⋆ 𖦹.✧˚

<!--Project version, tech stack-->
<p align="center">
<img src="https://img.shields.io/badge/PL/SQL-FCC624?style=for-the-badge&color=red">
<img src="https://img.shields.io/badge/Oracle-FCC624?style=for-the-badge&color=red">
<img src="https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&color=red"><br>
</p>

## 📋 Table of Contents
- [E-Commerce Database System](#e-commerce-database-system)
  - [📋 Table of Contents](#-table-of-contents)
  - [📘 Project Summary](#-project-summary)
  - [🎯 Project Features](#-project-features)
  - [🔖 Project Requirements](#-project-requirements)
  - [🚀 Run This Project (No Installation Required)](#-run-this-project-no-installation-required)
  - [🧪 Expected Output](#-expected-output)
  - [❣️ A Detailed Breakdown of the 10 Phases](#️-a-detailed-breakdown-of-the-10-phases)
    - [Phase 1: Automatic Data Type Detection (Java Program)](#phase-1-automatic-data-type-detection-java-program)
    - [Phase 2: Entity-Relationship (ER) Modeling](#phase-2-entity-relationship-er-modeling)
    - [Phase 3: Entity-Relationship (ER) Mapping \& Generating SQL Insert Statements](#phase-3-entity-relationship-er-mapping--generating-sql-insert-statements)
      - [Phase 3 Part 1– ER Mapping for online retail store](#phase-3-part-1-er-mapping-for-online-retail-store)
      - [Phase 3 Part 2– Generating SQL Insert Statements](#phase-3-part-2-generating-sql-insert-statements)
      - [Why is automating the generation of SQL insert statements important?](#why-is-automating-the-generation-of-sql-insert-statements-important)
    - [Phase 4: SQL DDL \&](#phase-4-sql-ddl-)
      - [Phase 4 Part 1– SQL DDL](#phase-4-part-1-sql-ddl)
      - [Phase 4 Part 2– Populating the Database](#phase-4-part-2-populating-the-database)
    - [Phase 5: ✨Introductory✨ SQL Retrieval Queries \& Query Processing](#phase-5-introductory-sql-retrieval-queries--query-processing)
      - [Phase 5 Part 1– SQL Retrieval Queries](#phase-5-part-1-sql-retrieval-queries)
      - [Phase 5 Part 2– Query Processing](#phase-5-part-2-query-processing)
    - [Phase 6: ✨Intermediate✨ Retrieval Queries \& Understanding Query Processing](#phase-6-intermediate-retrieval-queries--understanding-query-processing)
      - [Phase 6 Part 1– Intermediate Retrieval Queries](#phase-6-part-1-intermediate-retrieval-queries)
      - [Phase 6 Part 2– Understanding Query Processing](#phase-6-part-2-understanding-query-processing)
    - [Phase 7: Intermediate Retrieval Queries + Transactions \& Serialization](#phase-7-intermediate-retrieval-queries--transactions--serialization)
      - [Phase 7 Part 1– Intermediate Retrieval Queries](#phase-7-part-1-intermediate-retrieval-queries)
      - [Phase 7 Part 2– Transactions \& Serialization](#phase-7-part-2-transactions--serialization)
    - [Phase 8: PL/SQL Triggers \& PL/SQL Procedures](#phase-8-plsql-triggers--plsql-procedures)
      - [Phase 8 Part 1– PL/SQL Triggers](#phase-8-part-1-plsql-triggers)
      - [Phase 8 Part 2– PL/SQL Procedures](#phase-8-part-2-plsql-procedures)
    - [Phase 9: Java Database Connectivity (JDBC) with Prepared Statements](#phase-9-java-database-connectivity-jdbc-with-prepared-statements)
    - [Phase 10: Normalization](#phase-10-normalization)
      - [Phase 10 Part 1– Product Relation](#phase-10-part-1-product-relation)
      - [Phase 10 Part 2– Customer Relation](#phase-10-part-2-customer-relation)
      - [Phase 10 Part– Updated Project Schema](#phase-10-part-updated-project-schema)


## 📘 Project Summary
This 16-week long project for <i><b>Data Models and Database Management Systems</b>– CSCI4125</i> demonstrates practical use of **Oracle PL/SQL** to design, implement, and manage a relational database system with business logic and data consistency/accuracy. It showcases schema design, advanced SQL querying, and reusable/modular PL/SQL development through a <b>realistic e-commerce data model</b>.


## 🎯 Project Features
<b> 📑 Data Processing & Automation </b>
- <b>Scalable</b> to millions of records
- <b>Build data import/export</b> workflows
- <b>Generate SQL INSERT statements</b> from raw text files
- <b>Automatic data type detection</b> for any dataset with the use of Java
- <b>Solidfy understanding</b> of query logic by building <b>flat file models</b> in Java

<b> 🗄️ Database Design & Architecture </b>
- <b>Entity-Relationship (ER)</b> modeling + mapping
- <b>Design and implement an e-commerce database</b> (<b>customers</b>, <b>orders</b>, <b>products</b>, <b>reviews</b>)

<b> 🖇️ Business Logic & Operations </b>
- Write <b>complex SQL queries</b> and <b>aggregations</b>
- <b>Develop modular PL/SQL procedures</b>, <b>functions</b>, and <b>triggers</b> to enforce <b>business logic</b>

<b> 👩🏼‍💻 Developer Experience </b>
- <b>No installation required</b> – runs on free <b>Oracle LiveSQL</b>
  - <b>Runtime execution output</b> via DBMS_OUTPUT
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


## 🔖 Project Requirements
📦 Oracle account


## 🚀 Run This Project (No Installation Required)

This project uses <b>PL/SQL</b>.  
You can run all scripts for free on **Oracle LiveSQL**.

<b> 📌 Open LiveSQL </b><br>
https://freesql.com/

<b> 📌 Create a workspace (free) </b><br>
<p align="left"><img src="./README_images/sign-in_sql-developer.png" height=70% width=70%><br>Click <b>“Login / Sign Up”</b> → create an Oracle account if you don’t have one.
</p><br>

<b> 📌 How to run the files: </b><br>
<p align="center"><img src="./README_images/step-1.png" height=50% width=50%><img src="./README_images/success.png" height=50% width=50%></p><br>

[**‼️ Files located in in ECommerceDB/**](./ECommerceDB/)<br>
Drag `setup.sql` into the SQL Worksheet window and press run. If it was successful, you will see the tables appear in the Navigator pane and results in the Query Results! ☺️🎉

Drag each `.sql` file (in the order below) into the SQL Worksheet window and press the Run button. Check the Query Results tab for output.
1. **setup.sql** — Creates tables + populates all data except LineItem + adds Inventory column
2. **triggers.sql** — Creates inventory management system trigger + inserts LineItem data (trigger fires here)
3. **procedures.sql** — Defines Invoice procedure + runs test calls
4. **queries.sql** — Optional test queries
   

## 🧪 Expected Output
When running `schema.sql`, you should see output similar to the following in the **DBMS Output** panel:
`// TODO: picture here`
|           | <b>PRODUCT COUNT: SHOULD BE 20</b>  |
|-----------|-------------------------------------|
| <b>1</b>  | 20                                  |
|           | <b>REVIEW COUNT: SHOULD BE 12</b>   |
| <b>2</b>  | 12                                  |
...
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>

<br>

## ❣️ A Detailed Breakdown of the 10 Phases

### Phase 1: Automatic Data Type Detection (Java Program)
<a id="phase-1"></a>
<p align="center"><img src="./phase1/input.png" width=50% height=50% align="center"></p><p align="center"><i>Phase 1 Input: .txt or .csv file of data</i></p>
<p align="center"><img src="./phase1/output.png" width=50% height=50% align="center"></p><p align="center"><i>Phase 1 Output: .csv of data types (built upon in <a href=#phase-3 >Phase 3</a>)</i></p>

<b>Java program that does a simple evaluation for the data types of values in a file. Scalable, volume-independent, and data-agnostic.</b>
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 2: Entity-Relationship (ER) Modeling
<a id="phase-2"></a>
<p align="center"><img src="./phase2/E-R Model.png" width=70% height=70%></p><p align="right"><i>My Entity-Relationship Model for the request quoted below.<br>Entities (in squares), attributes (in ovals) and keys (underlined), and the relationships (in triangles) (including cardinality and participation) among the online retail store.</i></p>

> <i>Our database keeps track of customers and the orders they make. For each customer, we store a unique customer ID, name, and date of birth. We also allow customers to store multiple shipping addresses. We only allow New Orleanians to be customers so an address is just the street address; we don’t store city, state or zip.
> 
>   Once a customer registers their account, they can place as many orders as they want. However, an order is only made by one customer, no split orders. For each order, we store a unique confirmation number, the order date, the cost of products in the order, the shipping cost, and the total order cost. The cost of the products is computed from the sum of all the items and their quantities. The shipping cost is determined based on the cost of the products. If the order is at least $35, we offer free shipping. Otherwise, we charge a standard $10 for shipping. The total cost is the sum of the product costs and the shipping cost.
> 
>   Orders may include many products and a product may be part of many orders. For each product, we store a unique ID, name, price, and the inventory. When a product is included in an order, we also record the quantity of the product included in the order; this quantity also needs to be subtracted from the inventory.   
> 
>   We also store anonymous reviews for products. For each review, we store a number, which is only unique for each product, a rating (1 to 5), and the review text, which is limited to 255 characters.  
>
>   We also have a rewards program where customers can receive credit for referring other customers. A current customer can refer as many people they want (for more credits), but only one person can receive credit for referencing another customer. </i>
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 3: Entity-Relationship (ER) Mapping & Generating SQL Insert Statements
<a id="phase-3"></a>

#### Phase 3 Part 1– ER Mapping for online retail store
<p align="center"><img src="./phase3/er-map.png" width=50% height=50% align="center"></p><p align="center"><i>Developing a complete logical schema (ER Map) based on <a href=#phase-2 >Phase 2's ER Model</a>.</i></p>

#### Phase 3 Part 2– Generating SQL Insert Statements
<p align="center"><img src="./phase3/input.png" width=50% height=50% align="center"></p><p align="center"><i>Phase 3 Input: .txt file of data</i></p>
<p align="center"><img src="./phase3/output.png" width=50% height=50% align="center"></p><p align="center"><i>Phase 3 Output: .csv of SQL insert statements (built on <a href=#phase-1 >Phase 1</a>)</i></p>

<b>Phase 3</b> builds on the previous Phase 1, which was a Java program that determines data types of values in a file. Phase 3 takes our data from a text file and automatically generates SQL insert statements for the data.

#### Why is automating the generation of SQL insert statements important?
- <b>Less Copy/Pasting SQL</b>– automates SQL insert statements for you to copy/paste into a `.sql` file.
- <b>Scalability</b>– works with thousands or millions of records to populate.
- <b>Even Your Grandma Could Do It</b>– a non-CS end-user can pass in data without needing to write any SQL.
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 4: SQL DDL & 
<a id="phase-4"></a>

#### Phase 4 Part 1– SQL DDL
<p align="center"><img src="./phase4/Part 1- SQL DDL/store-ddl.png" width=50% height=50% align="center"></p><p align="center"><i>SQL DDL script to define my tables Customer, Address, Product, Review, Orders, and LineItem.</i></p>

Phase 4 builds on our previous phase. Here, we are defining a DDL to run in SQL Developer. Then, we can move on to Part 2 to populate our database, also in SQL Developer.

#### Phase 4 Part 2– Populating the Database
<p align="center"><img src="./phase4/Part 2- Populating/input.png" width=100% height=100% align="center"></p><p align="center"><i>Phase 4 Input: six .txt files of data.</i></p>

<p align="center"><img src="./phase4/Part 2- Populating/output-1-3.png" width=100% height=100% align="center"><br><img src="./phase4/Part 2- Populating/output-4-6.png" width=100% height=100% align="center"></p><p align="center"><i>Phase 4 Output: six SQL scripts containing INSERT statements, using Phase 3's Java program.</i></p>

Here, we populate our 6 brand new tables by putting our input into our Phase 3 Java code that automates SQL insert statements, taking the output from that program, and putting it into SQL Developer.

<b>If you want to verify that all records were populated</b>, you can run `SELECT COUNT(*) FROM [table name]` in SQL Developer. This should return 20 for Customer, 15 for Address, 20 for Product, 12 for Review, 50 for Orders, and 100 for Lineitem.

<b>Run SQL scripts in SQL Developer in the order of the following to guarantee <i>referential integrity</i>:</b>
<br>Product,
<br>Review,
<br>Customer, 
<br>Address, 
<br>Orders, 
<br>LineItem
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 5: ✨Introductory✨ SQL Retrieval Queries & Query Processing
<a id="phase-5"></a>

#### Phase 5 Part 1– SQL Retrieval Queries
<p align="center"><img src="./phase5/input.png" height=50% width=50%><br><i>Introductory SQL Retrieval Query <b>Input</b></i></p>
<p align="center"><img src="./phase5/sql-query-code.png" height=100% width=50%><br><i>Introductory SQL Retrieval Query Code</i></p>
<p align="center"><img src="./phase5/sql-query-results.png" height=50% width=50%><br><i>Introductory SQL Retrieval Query Results</i></p>
Phase 5 is based on Introductory SQL: <b>SQL Retrieval Queries</b>. A bunch of practice problems!

#### Phase 5 Part 2– Query Processing
<p align="center"><img src="./phase5/input.png" height=50% width=50%><br><i>Introductory SQL Retrieval Query <b>Input</b></i></p>
<p align="center"><img src="./phase5/query-8-java-code.png" height=100% width=50%><br><i>Flat File Model (Java Program) of SQL Retrieval Query</i></p>
<p align="center"><img src="./phase5/Query-8_SQL-Output.png" height=50% width=50%><br><i>SQL Retrieval Query Result For Java Program to Replicate</i></p>
<p align="center"><img src="./phase5/Query-8_Java-Output.png" height=50% width=50%><br><i>Flat File Model Result</i></p>

>Query #8: Find the name of the product with the highest price. Do not hardcode any prices or other values – you must use SQL without assuming you know the current database snapshot.

One of benefits of SQL is the <b>program-data independence</b> supported by the relational model (or the DBMS). To fully understand the power of SQL, it is helpful to know how the <b>equivalent could be implemented in the flat file model</b>. In this task, we wrote a Java method that is the flat file model solution for Query #8 in Part 1.
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 6: ✨Intermediate✨ Retrieval Queries & Understanding Query Processing
<a id="phase-6"></a>

#### Phase 6 Part 1– Intermediate Retrieval Queries
<p align="center"><img src="./phase6/sql-retrieval-queries.png" height=50% width=50%><br><i>Intermediate SQL Retrieval Query Code</i></p>
<p align="center"><img src="./phase6/sql-results-1.png" height=50% width=50%><img src="./phase6/sql-results-2.png" height=50% width=50%><br><i>Intermediate SQL Retrieval Query Code Results</i></p>

Phase 6 is based on Inter SQL: <b>Intermediate Retrieval Queries</b>. Wrote queries (without hardcoding) to find the following:
1. Find the names of <b>all customers who have at least one address</b>
2. For <b>each product id, list the total quantity sold</b>
3. Find the <b>names</b> of <b>all products</b> that do <b>not have any reviews</b>
4. Find the <b>names of all customers</b> who were <b>referred by 'Margot Robbie'</b>. <i>Note: You must use the string ‘Margot Robbie’ and not hardcode the ID.</i>

#### Phase 6 Part 2– Understanding Query Processing
<p align="center"><img src="./phase6/java-query-1.png" height=50% width=50%><img src="./phase6/java-query-2.png" height=50% width=50%><br><i>Flat File Model (Java Program) of SQL Retrieval Queries #1 & #2</i></p>
<p align="center"><img src="./phase6/sql-queries-1-and-2.png" height=50% width=50%><br><i>SQL Retrieval Query Result For Java Program to Replicate</i></p>
<p align="center"><img src="./phase6/flat-file-output.png" height=50% width=50%><br><i>Flat File Model Result</i></p>

>Query #1: Find the names of all customers who have at least one address<br>
>Query #2: For each product id, list the total quantity sold

One of benefits of SQL is the <b>program-data independence</b> supported by the relational model (or the DBMS). To fully understand the power of SQL, it is helpful to know how the <b>equivalent could be implemented in the flat file model</b>. In this task, we wrote a Java method that is the flat file model solution for Queries #1 and #2 in Part 1.
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 7: Intermediate Retrieval Queries + Transactions & Serialization 
<a id="phase-7"></a>

#### Phase 7 Part 1– Intermediate Retrieval Queries
<p align="center"><img src="./phase7/sql-queries-1-4.png" height=50% width=50%><img src="./phase7/sql-queries-5-8.png" height=50% width=50%><br><i><b>More</b> Intermediate SQL Retrieval Query Code</i></p>
<p align="center"><img src="./phase7/sql-query-output.png" height=50% width=50%><br><i>Intermediate SQL Retrieval Query Code Results</i></p>

More Inter SQL: <b>Intermediate Retrieval Queries</b>. Wrote queries (without hardcoding) to find the following:
1. Retrieve the names of all products which have sold a total quantity greater than 30.
2. Retrieve the names of all customers who were referred by someone who was referred by the customer with ID C15. Ex. Return CustomerA who was referred by CustomerB where CustomerB was referred by customer C15
3. Find the customer name's that have ordered the least expensive product
4. Find the avg review rating for each product that has received a review (do no include products that have not received a review).
5. List the total cost for each order (quantity * price for all products for each order ID) where the order cost is greater than 1000.
6. List customers that have spent more than $1000 on orders
7. Find the total number of orders placed by customers who were referred by Margot Robbie; use the regular expression function REGEXP_LIKE.
8. Find all customer names where both the first name and last name begin with a vowel

#### Phase 7 Part 2– Transactions & Serialization
<p align="center"><img src="./phase7/S1.png" height=50% width=50%><img src="./phase7/S2.png" height=50% width=50%><br><i>Precedence graphs for S1 and S2</i></p>

Consider the three transactions T1, T2, and T3, and the schedules S1 and S2 given below. Draw the serializability (precedence) graphs for S1 and S2, and state whether each schedule is serializable or not. If a schedule is serializable, write down the equivalent serial schedule(s).

T1: R1(X), R1(Z), W1(X)
T2: R2(Z), R2(Y), W2(Z), W2(Y)
T3: R3(X), R3(Y), W3(Y)


S1: R1(X), R2(Z), R1(Z), R3(X), R3(Y), W1(X), W3(Y), R2(Y), W2(Z), W2(Y) 
S2: R1(X), R2(Z), R3(X), R1(Z), R2(Y), R3(Y), W1(X), W2(Z), W3(Y), W2(Y)
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 8: PL/SQL Triggers & PL/SQL Procedures
<a id="phase-8"></a>

#### Phase 8 Part 1– PL/SQL Triggers
<p align="center"><img src="./phase8/inventory-maintenance-trigger.png" height=100% width=100%><br><i>SQL trigger that will maintain the inventory for products.</i></p>

Wrote a trigger that will fire when we INSERT a row into the Lineitem table. This trigger will check the value of Inventory for the corresponding ProductID. 

#### Phase 8 Part 2– PL/SQL Procedures
<p align="center"><img src="./phase8/procedure-example.png" height=30% width=30%><br><i>Example invoice return</i></p>
<p align="center"><img src="./phase8/procedure-part-1.png" height=50% width=50%><img src="./phase8/procedure-part-2.png" height=50% width=50%><br><i>PL/SQL procedure that generates an invoice for a given customer ID and order date</i></p>

Wrote a PL/SQL procedure that generates an invoice for a <b>given customer ID and order date</b>. The invoice will compute some of the derived columns we saw in Phase 2, specifically product cost, shipping cost, and total cost.
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 9: Java Database Connectivity (JDBC) with Prepared Statements
<a id="phase-9"></a>

<p align="center"><img src="./phase9/java-invoice-generation-1.png" height=70% width=70%><br><img src="./phase9/java-invoice-generation-2.png" height=70% width=70%><br><i>Java application that generates an invoice for a given customer ID and order date.</i></p>
<p align="center"><img src="./phase9/generated-invoice-1.png" height=40% width=40%><img src="./phase9/generated-invoice-2.png" height=50% width=50%><br><i>Generated invoices when passing in Customer ID and Order Date; handles no invoice as well.</i></p>

Wrote a Java application that generates an invoice for a given customer ID and order date. The invoice will compute some of the derived columns we saw in Phase 2, specifically product cost, shipping cost, and total cost.
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 10: Normalization
<a id="phase-10"></a>

#### Phase 10 Part 1– Product Relation
<p align="center"><img src="./phase10/task-1-info.png" height=50% width=50%><br><i>Part 1 Info: New PRODUCT Relation</i></p>
<p align="center"><img src="./phase10/2NF.png" height=70% width=70%><br><i>Removed any partial key dependencies to create PRODUCT Relation in <b>Second Normal Form</b></i></p>
<p align="center"><img src="./phase10/3NF.png" height=70% width=70%><br><i>Removed any transitive dependencies to create PRODUCT Relation in <b>Third Normal Form</b></i></p>

Since we've originally designed the web store database, fields have been added to the original PRODUCT relation. We start to notice some data inconsistencies (due to update anomalies caused by data redundancy). Our job is to evaluate and fix these problems.

#### Phase 10 Part 2– Customer Relation
<p align="center"><img src="./phase10/task-2-info.png" height=50% width=50%><br><i>Part 2 Info: New CUSTOMER relation to store (multiple) payment methods for customers.</i></p>
<p align="center"><img src="./phase10/1NF.png" height=50% width=50%><br><i>Proper 1NF to allow multiple payment methods for each customer.</i></p>

Someone in our organization created the new CUSTOMER relation above to store (multiple) payment methods for customers. To allow multiple payment methods for each customer, we had to alter the relation so that it is in proper 1NF.

<p align="center"><img src="./phase10/2NF.png" height=70% width=70%><br><i>Redundancies and decomposition on functional dependencies.</i></p>

With 1NF introducing redundancies (payment methods), we have to decompose on functional dependencies. <b>Decompose on this functional dependency:</b><br>
`CustomerID → Name, DateOfBirth, ReferrerID`

<b>Resulting decomposition:</b><br>
`CUSTOMER(CustomerID, Name, DateOfBirth, ReferrerID)`<br>
`CUSTOMER_PAYMENT(CustomerID, PaymentMethod)`

<p align="center"><img src="./phase10/1NF-to-3NF.png" height=50% width=50%><br><i>New relation(s) in proper 3NF.</i></p>

Using the functional dependencies identified, we then show the new relation(s) in proper 3NF.

#### Phase 10 Part– Updated Project Schema

<p align="center"><img src="./phase10/updated-project-schema-3NF.png" height=50% width=50%><br><i>Updated schema for the entire web store in proper 3NF.</i></p>

Using information gathered from parts 1 and 2, we drew the updated schema for the entire web store in proper 3NF.<br>
<i>Note: Parts of Phase 10 may be incorrect due to not saving professor feedback :(</i>
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>