# 🛒 Zepto Inventory Data Analysis using MySQL

## 📌 Project Overview
This project is a real-world SQL Data Analysis project built using an e-commerce inventory dataset scraped from Zepto, one of India’s fastest-growing quick-commerce startups.

The project demonstrates how data analysts work with raw business data using MySQL Workbench to perform:
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Business Insight Generation
- Inventory & Pricing Analysis

The goal of this project is to analyze inventory data and extract meaningful insights that can support business decisions in the e-commerce domain.

---

# 🚀 Tools & Technologies
- MySQL Workbench
- SQL
- CSV Dataset
- E-commerce Inventory Data

---

# 📂 Dataset Information
The dataset contains inventory and pricing details of products listed on Zepto.

### Dataset Columns
- `sku_id` → Unique product identifier
- `name` → Product name
- `category` → Product category
- `mrp` → Original product price
- `discountPercent` → Discount percentage
- `discountedSellingPrice` → Final selling price
- `availableQuantity` → Available stock quantity
- `weightInGms` → Product weight
- `outOfStock` → Stock availability status
- `quantity` → Product quantity/package size

---

# 🔧 Project Workflow

## 1️⃣ Database Creation
Created a database and table structure in MySQL Workbench using appropriate data types.

```sql
CREATE DATABASE zepto_analysis;
USE zepto_analysis;
```

---

## 2️⃣ Data Import
- Imported the CSV dataset into MySQL Workbench
- Verified column formats and data types
- Handled import and formatting issues

---

## 3️⃣ Data Exploration
Performed exploratory analysis to understand the dataset.

### Analysis Performed
- Total number of products
- Distinct product categories
- In-stock vs out-of-stock products
- Duplicate product entries
- Null value checking
- Product pricing distribution

---

## 4️⃣ Data Cleaning
Cleaned and prepared the dataset for analysis.

### Cleaning Steps
- Removed invalid records
- Checked missing values
- Standardized pricing values
- Verified stock availability data
- Improved data consistency

---

## 5️⃣ Business Analysis
Used SQL queries to generate business insights.

### Key Insights
- Top discounted products
- High-priced out-of-stock products
- Category-wise inventory analysis
- Products with low discounts and high prices
- Average discounts by category
- Revenue estimation by category
- Value-for-money product analysis

---

# 📊 Example Business Questions Solved
- Which product categories offer the highest discounts?
- Which expensive products are currently out of stock?
- Which categories generate the highest potential revenue?
- Which products provide the best value based on price per gram?
- Which categories maintain the highest inventory levels?

---

# 🛠️ How to Run This Project

## Step 1: Clone the Repository
```bash
git clone <your-repository-link>
```

## Step 2: Open MySQL Workbench
- Create a new database
- Run the SQL script file

## Step 3: Import Dataset
- Import the CSV dataset into the created table
- Verify successful data loading

## Step 4: Execute SQL Queries
Run all analysis queries from the SQL script file to generate insights.

---

# 📁 Project Structure
```bash
├── dataset/
│   └── zepto_inventory.csv
├── sql/
│   └── zepto_sql_analysis.sql
├── README.md
```

---

# 🎯 Skills Demonstrated
- SQL Query Writing
- Data Cleaning
- Exploratory Data Analysis
- Business Problem Solving
- Inventory Analysis
- Data Interpretation
- MySQL Workbench Usage

---

# 📚 What I Learned
- Working with real-world messy datasets
- Writing optimized SQL queries
- Performing business-focused analysis
- Extracting actionable insights from data
- Improving SQL problem-solving skills

---

# 🔮 Future Improvements
- Build interactive dashboards using Power BI or Tableau
- Automate data loading process
- Add advanced SQL analytics
- Perform customer and sales analysis

---

# ✅ Conclusion
This project showcases practical SQL and data analysis skills using a real-world e-commerce inventory dataset. It demonstrates the ability to clean, analyze, and extract business insights using MySQL Workbench.

The project is portfolio-ready and suitable for Data Analyst interview preparation and resume projects.
