#  SQL Data Analysis Project – Online Bookstore

##  Project Overview
This project demonstrates end-to-end SQL-based data analysis using an online bookstore dataset. It covers database design, data import, and business-focused query analysis.

The goal is to extract meaningful insights that can support business decision-making.

---

##  Objectives
- Design a relational database (Books, Customers, Orders)
- Perform data analysis using SQL queries
- Solve real-world business problems using data
- Generate insights on sales, customers, and inventory

---

##  Tools & Technologies
- SQL (PostgreSQL / MySQL)
- Data Modeling
- Joins, Aggregations, Subqueries

---

##  Database Schema

###  Books Table
- Book_ID (Primary Key)
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

###  Customers Table
- Customer_ID (Primary Key)
- Name
- Email
- Phone
- City
- Country

###  Orders Table
- Order_ID (Primary Key)
- Customer_ID (Foreign Key)
- Book_ID (Foreign Key)
- Order_Date
- Quantity
- Total_Amount

---

##  Key Business Queries

###  Basic Analysis
- Retrieve books by genre
- Filter books based on year
- Identify customers by location
- Monthly order analysis

###  Intermediate Analysis
- Total stock available
- Most expensive book
- Orders above a certain amount
- Unique genres available

###  Advanced Analysis
-  Total revenue generated
-  Total books sold by genre
-  Most frequently ordered book
-  Customers with multiple orders
-  High-spending customers by city
-  Remaining stock after sales

---

##  Key Insights
- Certain genres contribute more to total sales
- A small group of customers generate higher revenue
- Popular books dominate order frequency
- Inventory levels can be optimized based on demand

---

##  Project Structure

---
sql-online-bookstore-analysis/

│── online-bookstore-analysis.sql         # Main SQL file (database + queries)

│── README.md                             # Project documentation

---

##  How to Use
1. Open your SQL environment (PostgreSQL / MySQL)
2. Run the SQL file: online-bookstore-analysis.sql
3. Explore queries and modify them for deeper insights

---

##  Learning Outcomes
- Strong understanding of SQL fundamentals
- Hands-on experience with real-world data problems
- Ability to write optimized queries
- Improved data analysis and problem-solving skills

---

##  Connect with Me
 LinkedIn: [Ambike Jaiswal](https://www.linkedin.com/in/ambikejaiswal)
