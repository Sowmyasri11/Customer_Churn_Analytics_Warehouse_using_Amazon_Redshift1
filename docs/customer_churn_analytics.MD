# Customer Churn Analytics Warehouse using Amazon Redshift

## Objective

Build a small data warehouse in Amazon Redshift to analyze customer churn patterns for a telecom company using a structured ETL pipeline from Amazon S3 to Redshift.

The project focuses on:

- Data ingestion from S3
- Data warehousing design
- Analytical modeling
- Business insights generation
- Performance optimization
- Cloud resource management

---

## Dataset Used

Source: Kaggle Telecom Customer Churn Dataset  
Link: https://www.kaggle.com/datasets/shilongzhuang/telecom-customer-churn-by-maven-analytics

### Dataset Files:

1. telecom_customer_churn.csv  
   Contains customer-level information such as:
   - Demographics (age, gender, city)
   - Services subscribed
   - Tenure and billing details
   - Churn status

2. zip_code_population.csv  
   Contains:
   - Zip code
   - Population data for each region

---

## Environment Setup Constraints

To optimize cost and performance:

- Single-node Redshift cluster (dc2.large)
- One S3 bucket for raw data
- Minimal data storage usage
- Cluster deleted or paused after completion

---

# Task 1 — Dataset Download

- Download dataset from Kaggle
- Extract required CSV files:
  - telecom_customer_churn.csv
  - zip_code_population.csv
- Store files locally for upload to AWS

---

# Task 2 — Create S3 Storage

## Steps:

- Create an Amazon S3 bucket for raw data storage
- Define folder structure inside the bucket:

telecom-redshift-assignment/
raw/
telecom_customer_churn.csv
zip_code_population.csv

## Purpose:

- Acts as the staging location for Redshift ingestion
- Central storage for raw datasets

---

# Task 3 — Create Amazon Redshift Cluster

## Configuration:

- Cluster Type: Single node
- Node Type: dc2.large
- Database Name: telecom_dw
- IAM Role: Attached to allow S3 access

## Purpose:

- Provides data warehouse compute environment
- Executes SQL queries and analytics

---

# Task 4 — Create Database Tables

## Steps:

- Create a schema for organizing telecom data
- Create staging tables for raw ingestion

### Tables Created:

### 1. Customer Churn Staging Table

Stores full customer dataset including:

- Personal details
- Service usage
- Billing information
- Churn status

### 2. Zip Population Table

Stores:

- Zip code
- Population values

## Purpose:

- Staging layer isolates raw data before transformation
- Ensures data quality and structure consistency

---

# Task 5 — Load Data into Redshift

## Steps:

- Use Amazon Redshift COPY command to load data from S3
- Load data into staging tables

## Best Practices Followed:

- CSV format used
- Header rows ignored
- Proper delimiter handling ensured
- IAM role used for secure S3 access

## Purpose:

- Efficient bulk data ingestion into Redshift
- Faster than manual inserts

---

# Task 6 — Create Analytical Table

## Steps:

- Join customer churn data with zip code population data
- Create a final analytics-ready table

## Key Fields Included:

- Customer ID
- City
- Zip code
- Population
- Tenure
- Monthly charges
- Total charges
- Customer status

## Design Decisions:

- DISTKEY chosen to distribute data evenly across nodes
- SORTKEY applied to optimize query performance for:
  - Geography-based analysis
  - Customer churn segmentation

## Purpose:

- Single source of truth for analytics
- Optimized for reporting and BI queries

---

# Task 7 — Data Analysis

## Steps:

- Perform SQL-based analytics on final table
- Generate business insights related to churn behavior

## Key Analyses Performed:

### 1. Churn Rate Analysis

Measures overall percentage of customers who left the service.

### 2. City-wise Churn Analysis

Identifies cities with highest customer churn.

### 3. Tenure-based Churn Analysis

Groups customers based on service duration to understand churn trends.

### 4. Revenue Loss Analysis

Estimates total revenue lost due to churned customers.

### 5. Population vs Customer Distribution

Compares customer distribution with population across zip codes.

## Purpose:

- Understand churn behavior patterns
- Identify high-risk regions and customer segments
- Support business decision-making

---

# Task 8 — Redshift Performance Optimization

## Operations Performed:

### 1. ANALYZE

- Updates table statistics
- Helps query optimizer generate efficient execution plans

### 2. VACUUM

- Reorganizes data storage based on SORTKEY
- Removes deleted row fragments
- Improves query performance

## Purpose:

- Maintains optimal query execution speed
- Ensures data storage efficiency in Redshift

---

# Task 9 — Clean Up Resources

## Steps:

- Delete or pause Redshift cluster to avoid cost
- Empty S3 bucket after data ingestion
- Ensure no unnecessary storage remains active

## Purpose:

- Prevent unnecessary AWS charges
- Follow cloud cost optimization best practices

---

# Deliverables

The project includes the following outputs:

## AWS Resources:

- S3 bucket with raw data
- Redshift cluster configuration

## SQL Artifacts:

- Table creation scripts
- Data loading (COPY) scripts
- Analytical query scripts

## Analysis Outputs:

- Churn insights results
- Revenue loss calculations
- Customer segmentation outputs

## Documentation:

- Project architecture explanation
- Redshift optimization explanation
- Data warehousing design explanation

---

# Key Learnings

- Designing a cloud data warehouse using Amazon Redshift
- ETL pipeline using S3 and COPY command
- Staging vs analytical data modeling
- SQL-based business intelligence analysis
- Performance tuning using DISTKEY and SORTKEY
- AWS cost management and cleanup practices
