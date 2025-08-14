Amazon Product Analysis using SQL

Project Overview :

The objective of this project is to analyze Amazon product data to gain insights about:
Top brands and products by rating and review count
Products with highest discounts
Price distribution across categories and brands
Premium vs budget products in top brands
This project demonstrates end-to-end SQL data analysis, including data cleaning, transformation, and advanced querying.

Dataset:

Source: Amazon product dataset (CSV)
Size: 339 rows × 19 columns

Key Columns:
product_name – full product description
actual_price / discounted_price – stored as text (converted to numeric)
rating and rating_count – product performance indicators
category – product classification
Data Cleaning & Transformation
Converted price columns from VARCHAR2 to NUMBER using TO_NUMBER() after removing currency symbols and commas.
Extracted brand names from product titles using regex and stored in a new brand column.
Verified data integrity by checking for nulls and invalid values.

SQL Queries Performed:

Top 10 products by rating (≥ 4.5 with ≥ 5000 reviews)
Products with highest discount percentage
Maximum vs minimum product price in marketplace
Top 10 expensive products with highest ratings (union query)
Top 10 brands by rating count and average rating
Categories with most customer activity (using rating count as sales proxy)
Most expensive vs cheapest products within Electronics → Headphones
Most expensive vs cheapest products within the top brand (advanced nested query)

Key Findings:

High-rating products (≥4.5) with thousands of reviews were easily identified.
Several products had discounts exceeding 50%, which may indicate aggressive pricing strategies.
Top brands stood out by both rating count and average rating, showing customer trust.
Categories like Electronics and Headphones dominate customer interest based on review volume.
Using advanced SQL, we could pinpoint price extremes in leading brands to understand market positioning.

Conclusion:

This project highlights:

Strong SQL cleaning and transformation skills (ALTER, UPDATE, REGEXP).
Analytical querying skills using aggregation, filtering, nested subqueries, and union.
The ability to turn raw e-commerce data into business insights.

These insights can help e-commerce teams:

Identify best brands and products to promote.
Understand price sensitivity and premium positioning.
