# Zepto SQL Data Analysis Project

SQL data analysis project exploring pricing, discounts, and inventory insights from a Zepto-inspired dataset.

---

## 📌 Overview

This project is an end-to-end **SQL data analysis case study** using a dataset inspired by **Zepto**, a quick-commerce grocery platform.

The analysis focuses on:
- Product pricing
- Discounts
- Inventory availability
- Category-level performance

The goal is to extract **actionable business insights** using SQL.

This project is part of my **SQL portfolio** and demonstrates practical skills in **data exploration, data cleaning, and analysis**.

---

##  Database Schema

### Database

```sql
CREATE DATABASE sql_project;
USE sql_project;

### Table: `zepto`

| Column Name | Description |
|------------|------------|
| sku_id | Unique product identifier |
| category | Product category |
| name | Product name |
| mrp | Maximum Retail Price |
| discountPercent | Discount percentage |
| discountSellingPrice | Selling price after discount |
| weightInGrams | Product weight |
| availableQuantity | Units available |
| outofstock | Stock indicator (1 = Out of stock) |
| quantity | Unit quantity |

---

##  Data Exploration

The following checks were performed to understand the dataset:

- Total number of records  
- Sample data inspection  
- NULL value detection  
- Identification of unique product categories  
- In-stock vs out-of-stock comparison  
- Detection of duplicate product names  

---

##  Data Cleaning

Key data-cleaning steps:

- Removed products with **MRP or selling price equal to 0**
- Converted prices from **paise to rupees**
- Ensured realistic pricing using conditional updates

These steps improved data consistency and reliability for analysis.

---

## 📊 Data Analysis & Insights

### 1️⃣ Top Discounted Products
Identified the top 10 products offering the highest discount percentages.

### 2️⃣ High-Value Products Out of Stock
Found premium-priced products that are currently unavailable, highlighting potential revenue loss.

### 3️⃣ Revenue by Category
Calculated estimated revenue using:

discountSellingPrice × availableQuantity


to identify top-performing categories.

### 4️⃣ Expensive Products with Low Discounts
Flagged products priced above ₹500 with discounts below 10%.

### 5️⃣ Categories with Highest Average Discounts
Ranked product categories by average discount percentage.

### 6️⃣ Best Value by Price per Gram
Computed price per gram for products above 100g to determine the best value options.

### 7️⃣ Weight-Based Product Segmentation
Classified products into:
- Low  
- Medium  
- Bulk  

### 8️⃣ Inventory Weight by Category
Calculated total inventory weight per category to support inventory planning.

---

## 🛠️ Tools Used

- SQL (MySQL)
- Aggregate functions
- CASE statements
- Data cleaning & transformation

---

##  How to Use

1. Clone the repository  
2. Run the SQL script in MySQL or PostgreSQL  
3. Explore and modify queries for deeper insights  

---

## 📌 Key Skills Demonstrated

- SQL querying & optimization  
- Data cleaning  
- Business-focused data analysis  
- Inventory & pricing insights  
