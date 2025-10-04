# 🌐 SalesSphere Analytics Hub  

![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)  
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)  
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)  
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)  

> 🚀 A **comprehensive Data Warehouse & Business Intelligence solution** designed to transform raw sales data into **actionable insights** with advanced SQL analytics and BI dashboards.  

---

## 📑 Table of Contents  

- [Overview](#-overview)  
- [Data Model](#-data-model)  
- [Key Analytics](#-key-analytics)  
- [Tech Stack](#-tech-stack)  
- [Setup Guide](#-setup-guide)  
- [Repository Structure](#-repository-structure)  
- [BI Dashboard Showcase](#-bi-dashboard-showcase)  
- [License](#-license)  

---

## 🔎 Overview  

The **SalesSphere Analytics Hub** empowers businesses to **leverage sales data** for strategic decision-making.  
It provides a **scalable SQL-based data warehouse** and **BI-ready reporting views** that help in:  

- ✅ Understanding **customer behavior & demographics**  
- ✅ Tracking **product performance & profitability**  
- ✅ Monitoring **sales trends** with advanced time-series analytics  
- ✅ Creating **data-driven KPIs & dashboards** for stakeholders  

---

## 🗂️ Data Model  

This project follows a **Star Schema** for optimized reporting:  

- **`gold.fact_sales`** → Transactional data (sales_amount, quantity, price)  
- **`gold.dim_customers`** → Customer attributes (name, country, gender, age)  
- **`gold.dim_products`** → Product attributes (name, category, subcategory, cost)  

📌 **Fact Table** = Sales Transactions  
📌 **Dimension Tables** = Customers, Products  

---

## ✨ Key Analytics  

- 🔹 **Customer Segmentation** → VIP, Regular, New  
- 🔹 **Product Performance Analysis** → High, Mid, Low Performer  
- 🔹 **Time-Series Analysis** → YoY Growth, Running Totals, Moving Averages  
- 🔹 **Demographic Reports** → Age, Gender, Country, Marital Status  
- 🔹 **Advanced KPIs** → Average Order Value, Customer Lifespan, Recency  

---

## 🛠 Tech Stack  

- **Database** → Microsoft SQL Server  
- **Query Language** → T-SQL (Transact-SQL)  
- **BI Tools** → Power BI / Tableau (recommended)  
- **Version Control** → Git & GitHub  

---

## ⚡ Setup Guide  

### Prerequisites  
- Microsoft SQL Server (2017 or later)  
- SQL Server Management Studio (SSMS)  

### Installation  
```bash
# Clone this repository
git clone https://github.com/your-username/SalesSphere-Analytics-Hub.git

# Open the SQL files in SSMS and execute them
# Load CSV files into corresponding tables

