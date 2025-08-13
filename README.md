Indian Railways Fare & Route Analysis (SQL Project)

1. Project Overview
  This project uses Oracle SQL to analyze Indian Railways fare and route data.
  The goal is to extract actionable insights such as:

  . Identifying expensive and long-distance journeys
  . Finding routes with high fare variation
  . Detecting possible opportunities for dynamic pricing
  . Summarizing key travel patterns with SQL queries

2. Dataset
  . Source: Click here to download https://www.kaggle.com/datasets/bhavyarajdev/indian-railways-schedule-prices-availability-data/data
  . Note: Dataset is not uploaded to GitHub due to file size constraints.

3. Technologies Used
  . Database: Oracle SQL
  . Queries: Joins, Aggregations, Filtering, Grouping, UNION operations
  . Documentation: Query screenshots compiled into a PDF report

4. Repository Contents
  . indian_railways_analysis.sql → SQL script containing all queries
  . analysis_report.pdf → Queries with output screenshots and insights
  . README.md → Documentation of the project

5. Key Insights
  . Certain premium routes have >50% higher fares than the average
  . Long-distance journeys (>700 km) tend to fall into higher price bands.
  . Some zones show consistent pricing gaps, indicating opportunities for optimization.
  . Union queries were used to combine multiple result sets for richer analysis.
