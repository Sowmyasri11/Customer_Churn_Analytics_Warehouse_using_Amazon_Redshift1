# Customer Churn Analytics Warehouse using Amazon Redshift

## Overview

This project builds a cloud-based data warehouse using **Amazon Redshift** to analyze telecom customer churn patterns. The pipeline ingests raw data from **Amazon S3**, transforms it using staging and analytical tables, and generates actionable business insights using SQL.

---

## Tech Stack

- Amazon S3
- Amazon Redshift
- SQL
- AWS IAM

---

## Dataset

- Telecom Customer Churn Dataset (7,043 records)
- Zip Code Population Dataset (California regions)

Source: https://www.kaggle.com/datasets/shilongzhuang/telecom-customer-churn-by-maven-analytics

---

## Architecture

S3 (Raw Data) → Redshift Staging Tables → Analytical Table → SQL Analytics → Business Insights

---

## Key Steps

### 1. Data Ingestion

- Uploaded CSV datasets into Amazon S3 raw bucket
- Loaded data into Redshift staging tables using COPY command

### 2. Data Modeling

- Created structured staging tables for customer and zip data
- Built final analytical table by joining datasets
- Applied Redshift optimization using DISTKEY and SORTKEY

### 3. Analytics

Performed SQL-based analysis to derive insights:

- Overall churn rate
- Top cities with highest churn
- Tenure-based churn distribution
- Revenue lost due to churn
- Population vs customer distribution

### 4. Optimization

- Used ANALYZE to update table statistics
- Used VACUUM to optimize storage and query performance

---

## Key Insights

- Identified high churn regions and customer segments
- Analyzed revenue impact due to churn
- Evaluated customer distribution across population density

---

## Resource Management

- Redshift cluster paused or deleted after execution
- S3 storage cleaned to minimize AWS cost

---

## Key Learnings

- Cloud data warehousing with Amazon Redshift
- ETL pipeline using S3 + COPY command
- Analytical data modeling
- Performance tuning using DISTKEY and SORTKEY
- Real-world churn analytics use case

---

## Project Status

✔ Completed end-to-end data warehouse pipeline  
✔ Ready for BI tools (Power BI / Tableau integration)

---

## Author

Built as part of AWS Redshift hands-on data engineering project.
