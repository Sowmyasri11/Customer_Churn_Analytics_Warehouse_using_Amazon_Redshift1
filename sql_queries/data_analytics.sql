/*Churn Rate Across All Customers*/

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telecom.customer_churn_analytics;


/*Top Cities with Highest Churned Customers*/

SELECT
    city,
    COUNT(*) AS churned_customers
FROM telecom.customer_churn_analytics
WHERE customer_status = 'Churned'
GROUP BY city
ORDER BY churned_customers DESC
LIMIT 10;


/*Customer Churn Distribution by Tenure Group*/

SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 Months'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS churned_customers
FROM telecom.customer_churn_analytics
WHERE customer_status = 'Churned'
GROUP BY 1
ORDER BY churned_customers DESC;


/*Total Revenue Lost Due to Churn*/

SELECT
    ROUND(SUM(total_charges), 2) AS total_revenue_lost
FROM telecom.customer_churn_analytics
WHERE customer_status = 'Churned';

/*Population vs Customer Count by Zip Code*/

SELECT
    zip_code,
    MAX(population) AS population,
    COUNT(customer_id) AS customer_count
FROM telecom.customer_churn_analytics
GROUP BY zip_code
ORDER BY customer_count DESC;

