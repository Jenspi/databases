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
  - [❣️ A Detailed Breakdown of the 10 Phases](#️-a-detailed-breakdown-of-the-10-phases)
    - [Phase 1: Automatic Data Type Detection (Java Program)](#phase-1-automatic-data-type-detection-java-program)
    - [Phase 2: Entity-Relationship (ER) Modeling](#phase-2-entity-relationship-er-modeling)
    - [Phase 3: Entity-Relationship (ER) Mapping \& Generating SQL Insert Statements](#phase-3-entity-relationship-er-mapping--generating-sql-insert-statements)
      - [Phase 3 Part 1– ER Mapping for online retail store](#phase-3-part-1-er-mapping-for-online-retail-store)
      - [Phase 3 Part 2– Generating SQL Insert Statements](#phase-3-part-2-generating-sql-insert-statements)
      - [Why is automating the generation of SQL insert statements important?](#why-is-automating-the-generation-of-sql-insert-statements-important)
    - [Phase 4:](#phase-4)
    - [Phase 5:](#phase-5)
    - [Phase 6:](#phase-6)
    - [Phase 7:](#phase-7)
    - [Phase 8:](#phase-8)
    - [Phase 9:](#phase-9)
    - [Phase 10:](#phase-10)


## 📘 Project Summary
This 16-week long project for <i><b>Data Models and Database Management Systems</b>– CSCI4125</i> demonstrates practical use of **Oracle PL/SQL** to design, implement, and manage a relational database system with business logic and data consistency/accuracy. It showcases schema design, advanced SQL querying, and reusable/modular PL/SQL development through a <b>realistic e-commerce data model</b>.


## 🎯 Project Features

<b> 📑 Data Processing & Automation </b>
- <b>Scalable</b> to millions of records
- <b>Build data import/export</b> workflows
- <b>Generate SQL INSERT statements</b> from raw text files
- <b>Automatic data type detection</b> for any dataset with the use of Java

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
https://livesql.oracle.com

<b> 📌 Create a workspace (free) </b><br>
Click **“Login / Sign Up”** → create an Oracle account if you don’t have one.

<b> 📌 Open the SQL Worksheet </b><br>
Paste and run the following scripts in order:
<!--
`COMING SOON`
`// TODO: go through everything, copy non-redundant files to root directory, and update this section`
1. `schema.sql`
2. `sample_data.sql`
3. `procedures.sql`
4. `functions.sql`
5. `demo_run.sql` (calls the procedures/functions to show sample output)
-->
<!--
## 🧪 Expected Output
When running `demo_run.sql`, you should see output similar to the following in the **DBMS Output** panel:
`// TODO: picture here`
```text
Running demo...
Procedure executed successfully.
Function result: 42
Done.
``` 
-->

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
<p align="center"><img src="./phase2/E-R Model.png" width=100% height=100%></p><p align="right"><i>My Entity-Relationship Model for the request quoted below.<br>Entities (in squares), attributes (in ovals) and keys (underlined), and the relationships (in triangles) (including cardinality and participation) among the online retail store.</i></p>

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


### Phase 4:
<a id="phase-4"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 5:
<a id="phase-5"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 6:
<a id="phase-6"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 7:
<a id="phase-7"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 8:
<a id="phase-8"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 9:
<a id="phase-9"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>


### Phase 10:
<a id="phase-10"></a>
<!-- stuff -->
<p align="right"><i><a href="#readme-toc">(back to table of contents)</i></a></p>