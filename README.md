## Retail Sales Analysis using SQL  
End-to-End SQL Exploration, and Business Query Project

## Project Overview
This project focuses on analyzing retail sales data using SQL. It covers the complete workflow from database creation cleaning to performing detailed exploratory analysis and answering real business questions using advanced SQL queries.

The goal is to understand sales patterns, customer behavior, category performance, and time-based trends.

---

## Dataset
- Retail sales dataset containing daily transactions  
- Includes columns like: `transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale`
- Source: GitHub dataset (public)

---

## Tools & Technologies Used
- **SQL**
- **Window Functions**
- **CTEs**
- **Aggregations**
- **Date & Time Functions**

## Key Insights
- Identified top-performing categories
- Found high-value customer segments
- Determined best-selling month per year
- Analyzed shift-wise sales performance
- Discovered top 5 revenue-generating customers

## Conclusion
This project demonstrates strong SQL skills, including:
- Database creation
- Analytical querying
- Business-focused insights
- Window functions & CTEs
- It showcases the ability to solve real-world business problems using SQL efficiently.



A relational database has been created according to the ERD.  The tables
are as follows:
•	Theatre(Theatre#, Name, Address, MainTel);
•	Production(P#, Title, ProductionDirector, PlayAuthor);
•	Performance(Per#, P#, Theatre#, pDate, pHour, pMinute, Comments);
•	Client(Client#, Title, Name, Street, Town, County, telNo, e-mail);
•	TicketPurchase(Purchase#, Client#, Per#, PaymentMethod, DeliveryMethod, TotalAmount).



QUERY 1
	The total sale value of each production. 

QUERY 2
  Monthly sale value of each theatre.

QUERY 3
	The theatre name (for each theatre) and the names of clients who have the highest spending in that theatre.
