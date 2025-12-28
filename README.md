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

### 🔹 Bronze Layer (Raw Data)

* Stores source data **as-is**
* Data ingested from CSV files using bulk load operations
* No transformations applied
* Serves as an audit and traceability layer

### 🔹 Silver Layer (Cleaned & Standardized Data)

* Applies data cleansing, validation, and standardization
* Handles:

  * Duplicate records
  * Invalid and future dates
  * Inconsistent categorical values
  * Incorrect or missing sales values
* Enforces business rules and data quality logic

### 🔹 Gold Layer (Business-Ready Data)

* Analytics-ready **star schema**
* Fact and dimension views
* Optimized for BI tools, reporting, and ad-hoc SQL queries

---

## 🔁 Data Flow

```
Source CSV Files
   ↓
Bronze Layer (Raw Tables)
   ↓
Silver Layer (Cleaned & Standardized Tables)
   ↓
Gold Layer (Fact & Dimension Views)
   ↓
Analytics / Reporting / BI
```

---

## 🗃️ Data Model (Gold Layer)

### ⭐ Star Schema
<img width="1920" height="993" alt="Data_mart_(Warehouse_project)" src="https://github.com/user-attachments/assets/3a29de49-f340-441a-9bb2-1fb2a2f69b8a" />


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

### ✅ Why this README is strong

* Honest but confident
* Not labeled as a “tutorial project”
* Clear ownership of implementation
* Interview-ready narrative
* Recruiter-friendly language

If you want next, I can:

* review this once you push it live
* add diagrams directly into README
* write a **short recruiter-focused README**
* help you defend this project in **interviews**

This README is **final-grade and professional**.
