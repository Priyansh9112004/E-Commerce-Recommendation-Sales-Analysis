create database Ecommerce_project;

-- E-Commerce Sales Analysis SQL Queries
-- Database: MySQL

CREATE DATABASE IF NOT EXISTS ecommerce_project;
USE ecommerce_project;

-- Import CSV using MySQL Workbench Table Data Import Wizard into table: ecommerce_sales

-- 1. Total Revenue
SELECT ROUND(SUM(Revenue),2) AS total_revenue FROM ecommerce_recommendation_sales_dataset;

-- 2. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS total_orders FROM ecommerce_recommendation_sales_dataset;

-- 3. Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS total_customers FROM ecommerce_recommendation_sales_dataset;

-- 4. Average Order Value
SELECT ROUND(SUM(Revenue) / COUNT(DISTINCT Order_ID),2) AS avg_order_value FROM ecommerce_recommendation_sales_dataset;

-- 5. Category-wise Revenue
SELECT Category, ROUND(SUM(Revenue),2) AS revenue
FROM ecommerce_recommendation_sales_dataset
GROUP BY Category
ORDER BY revenue DESC;

-- 6. Top 10 Products by Revenue
SELECT Product, ROUND(SUM(Revenue),2) AS revenue, SUM(Quantity) AS total_qty
FROM ecommerce_recommendation_sales_dataset
GROUP BY Product
ORDER BY revenue DESC
LIMIT 10;

-- 7. Monthly Revenue Trend
SELECT Year, Month, ROUND(SUM(Revenue),2) AS revenue
FROM ecommerce_recommendation_sales_dataset
GROUP BY Year, Month
ORDER BY Year, STR_TO_DATE(Month, '%b');

-- 8. City-wise Revenue
SELECT City, State, ROUND(SUM(Revenue),2) AS revenue
FROM ecommerce_recommendation_sales_dataset
GROUP BY City, State
ORDER BY revenue DESC;

-- 9. Payment Mode Analysis
SELECT Payment_Mode, COUNT(DISTINCT Order_ID) AS orders, ROUND(SUM(Revenue),2) AS revenue
FROM ecommerce_sales
GROUP BY Payment_Mode
ORDER BY revenue DESC;

-- 10. Repeat Customers
SELECT Customer_ID, COUNT(DISTINCT Order_ID) AS total_orders, ROUND(SUM(Revenue),2) AS customer_revenue
FROM ecommerce_recommendation_sales_dataset
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY customer_revenue DESC;

-- 11. Product pair raw data for basket analysis
SELECT Order_ID, Product, Quantity
FROM ecommerce_recommendation_sales_dataset
ORDER BY Order_ID;
