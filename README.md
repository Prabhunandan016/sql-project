# SQL Retail Sales Analysis - P1

This project performs **retail sales data analysis** using SQL. It involves data cleaning, exploration, and analysis to uncover meaningful business insights.

---

## 📁 Project Structure

- `sql_project_p2.sql` – SQL script containing:
  - Database and table creation
  - Data cleaning steps
  - Exploratory queries
  - Business problem-solving queries

---

## 🧹 Data Cleaning

The following NULL checks and clean-up operations were performed:

- Removed records with NULL values in:
  - `transaction_id`
  - `sale_date`
  - `sale_time`
  - `gender`
  - `category`
  - `quantity`
  - `cogs`
  - `total_sale`

---

## 🔍 Data Exploration

Basic questions answered:

- Total number of sales
- Number of unique customers
- List of distinct product categories

---

## 📊 Business Questions Answered

1. **Sales made on a specific date** (`2022-11-05`)
2. **High quantity clothing sales** in Nov-2022
3. **Total sales** for each category
4. **Average age** of customers who purchased beauty products
5. **Transactions with total sale > 1000**
6. **Number of transactions** by gender and category
7. **Average sale per month** and best selling month per year
8. **Top 5 customers** by total sales
9. **Unique customer count** per category
10. **Shift-based order analysis** (Morning, Afternoon, Evening)

---

## 🛠 Technologies Used

- PostgreSQL (or compatible SQL engine)
- SQL (DDL + DML + Aggregate functions + Window functions)

---

## 📌 How to Run

1. Run the SQL script (`sql_project_p1.sql`) in your SQL IDE.
2. Ensure your environment supports:
   - `TO_CHAR()`, `EXTRACT()`, `RANK() OVER()` – for date formatting and window functions.
3. Modify queries as needed based on your database system (PostgreSQL, MySQL, etc.).

---

## 📈 Future Enhancements

- Visualize insights using a BI tool (e.g., Power BI, Tableau)
- Connect with Python for automation
- Add user-defined functions for more customization

---

## 📧 Contact

**Author:** Nandan  
For questions or feedback, feel free to reach out!

