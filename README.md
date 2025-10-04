# RetaillQ-E-Commerce-Analysis 📊

A comprehensive data warehouse and business intelligence project designed to extract actionable insights from sales data. This repository contains the SQL scripts to set up a data warehouse, perform advanced analytics, and generate reports on customer behavior, product performance, and overall sales trends.

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Data Model](#-data-model)
- [Key Features & Analytics](#-key-features--analytics)
- [Technology Stack](#-technology-stack)
- [Getting Started](#-getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation & Setup](#installation--setup)
- [File Structure](#-file-structure)
- [BI Dashboard Showcase](#-bi-dashboard-showcase)
- [License](#-license)

---

## 🚀 Project Overview

The SalesSphere Analytics Hub provides a robust framework for sales data analysis. By transforming raw sales data into structured reports and analytical views, this project empowers businesses to:

- Understand customer demographics and purchasing habits.
- Identify top-performing and underperforming products.
- Analyze sales performance over time with YoY comparisons and moving averages.
- Segment customers and products based on value and cost.

---

## 🗂️ Data Model

This project uses a classic **Star Schema**, which is optimized for querying and reporting. The model consists of one central fact table and two dimension tables.

- **`gold.fact_sales`**: Contains quantitative transactional data like `sales_amount`, `quantity`, and `price`. It connects to the dimension tables via foreign keys.
- **`gold.dim_customers`**: Contains descriptive attributes of the customers, such as name, country, gender, and age.
- **`gold.dim_products`**: Contains descriptive attributes of the products, such as name, category, subcategory, and cost.



---

## ✨ Key Features & Analytics

- **Customer Segmentation:** Dynamically segments customers into **VIP**, **Regular**, and **New** categories based on their lifespan and total spending.
- **Product Performance Analysis:** Classifies products as **High-Performer**, **Mid-Range**, and **Low-Performer** based on total sales revenue.
- **Time-Series Analysis:** Includes calculations for **Year-over-Year (YoY) growth**, monthly running totals, and moving averages to identify trends.
- **Demographic Reporting:** Generates insights based on customer age groups, marital status, and geographical location.
- **Advanced KPIs:** Calculates essential metrics like **Average Order Value (AOV)**, Customer Lifespan, and Recency.

---

## 🛠️ Technology Stack

- **Database:** Microsoft SQL Server
- **Language:** T-SQL (Transact-SQL)
- **BI/Visualization Tool (Recommended):** Power BI, Tableau, or any other BI tool that can connect to a SQL Server database.

---

## 🏁 Getting Started

Follow these instructions to get the project up and running on your local machine.

### Prerequisites

- Microsoft SQL Server (2017 or later)
- SQL Server Management Studio (SSMS)

### Installation & Setup

**1. Clone the repository:**
```bash
git clone [https://github.com/your-username/your-repository-name.git](https://github.com/your-username/your-repository-name.git)
