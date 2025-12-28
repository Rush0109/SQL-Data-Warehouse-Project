# 📊 SQL Data Warehouse Project

**End-to-End Data Warehouse using Medallion Architecture (Bronze, Silver, Gold)**

---

## 📌 Overview

This project demonstrates the design and implementation of a **SQL Server–based Data Warehouse** that integrates data from multiple source systems (CRM and ERP) and transforms it into **analytics-ready datasets** for reporting and decision-making.

The solution follows **Medallion Architecture** principles to clearly separate raw data ingestion, data cleansing, and business-ready analytics layers.
The project focuses on **data quality, transformation logic, and dimensional modeling**, reflecting real-world data engineering and analytics practices.

---

## 🎯 Business Problem

Operational data was available as **raw CSV files** from different systems:

* **CRM system**: customer, product, and sales transactions
* **ERP system**: customer demographics, locations, and product categories

Key challenges:

* Duplicate and inconsistent customer records
* Invalid or missing dates
* Incorrect or inconsistent sales values
* No unified data model for analytics
* Manual and repetitive data preparation for reporting

The objective was to **centralize, clean, and structure the data** into a trusted data warehouse that supports fast, consistent, and reliable analytics.

---

## 🏗️ Architecture Overview

The warehouse is designed using a **three-layer Medallion Architecture**:

<img width="1920" height="989" alt="Data_Architecture_(Warehouse_project)" src="https://github.com/user-attachments/assets/370622d8-a5f9-468b-8602-40b37de299af" />

---

## 🔁 Data Flow
<img width="1920" height="991" alt="Data_flow_(Warehouse_project)" src="https://github.com/user-attachments/assets/6d16b935-6269-4b36-94b4-1ce9a64e6e82" />

---

## 🗃️ Data Mart (⭐ Star Schema)

<img width="1920" height="993" alt="Data_mart_(Warehouse_project)" src="https://github.com/user-attachments/assets/3a29de49-f340-441a-9bb2-1fb2a2f69b8a" />

---

## 🔄 CRM–ERP Data Integration

<img width="1920" height="992" alt="Data_Integration_(Warehouse_project)" src="https://github.com/user-attachments/assets/385c115b-0bb0-4a88-b43f-8fda593a4c09" />

---

## ⚙️ Key Transformations & Logic

### 🧹 Data Cleansing

* Standardized gender, marital status, and country values
* Converted invalid date formats to `NULL`
* Removed future birthdates

### 🔁 Deduplication

* Used `ROW_NUMBER()` window function to retain the latest customer records

### 📦 Product Lifecycle Handling

* Used `LEAD()` window function to manage product history
* Filtered only active products in the Gold layer

### 💰 Sales Validation

* Recalculated sales when values were missing or inconsistent

  ```
  sales = quantity × price
  ```

---

## 🧠 SQL Concepts Used

* Stored Procedures
* Window Functions (`ROW_NUMBER`, `LEAD`)
* Common Table Expressions (CTEs)
* Conditional Logic (`CASE`)
* Data Type Casting & Validation
* Joins (LEFT JOIN)
* Star Schema Modeling
* ETL Design Patterns

---

## 🛠️ Tools & Technologies

* **Database:** SQL Server
* **Language:** T-SQL
* **IDE:** SQL Server Management Studio (SSMS)
* **Data Sources:** CSV Files
* **Version Control:** GitHub

---

## 📈 Outcomes & Impact

* Eliminated repetitive manual data cleaning
* Created a single source of truth for analytics
* Improved data consistency and reporting reliability
* Enabled faster, cleaner, and scalable analytics queries
* Built a solid foundation for BI tools and future enhancements

---

## 🚀 How to Run the Project

1. Create the database and schemas (`Bronze`, `Silver`, `Gold`)
2. Load source CSV files into the Bronze layer
3. Execute Silver layer transformation stored procedure
4. Query Gold layer views for analytics and reporting

---

## 🔮 Future Improvements

* Implement incremental loading (CDC / watermark logic)
* Add indexes for performance optimization
* Introduce automated data quality tests
* Integrate BI tools (Power BI / Tableau)
* Add orchestration using SQL Agent or external schedulers

---

## 🙌 Credits

This project was inspired by learning resources from **DataWithBaraa**.
While the initial architectural concepts were referenced for learning, the **data model, SQL transformations, validation logic, and overall implementation were redesigned and implemented independently**.

---

## 👤 Author

**Rushikesh Sawant**
SQL | Data Analysis | Data Warehousing

🔗 GitHub: [https://github.com/Rush0109](https://github.com/Rush0109)

---

