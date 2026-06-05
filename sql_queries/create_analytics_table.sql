CREATE TABLE telecom.customer_churn_analytics
DISTKEY (customer_id)
SORTKEY (zip_code, customer_status)
AS
SELECT
    c.customer_id,
    c.city,
    c.zip_code,
    z.population,
    c.tenure_in_months AS tenure,
    c.monthly_charge,
    c.total_charges,
    c.customer_status
FROM telecom.stg_customer_churn c
LEFT JOIN telecom.stg_zip_population z
    ON c.zip_code = z.zip_code;



SELECT * 
FROM telecom.customer_churn_analytics
LIMIT 10;