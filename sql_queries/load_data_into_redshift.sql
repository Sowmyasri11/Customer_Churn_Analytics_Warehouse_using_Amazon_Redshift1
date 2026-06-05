COPY telecom.stg_customer_churn
FROM 's3://telecom-redshift-sowmya/raw/telecom_customer_churn.csv'
IAM_ROLE 'arn:aws:iam::116584140802:role/RedshiftS3Role'
REGION 'ap-southeast-2'
CSV
IGNOREHEADER 1;


COPY telecom.stg_zip_population
FROM 's3://telecom-redshift-sowmya/raw/telecom_zipcode_population.csv'
IAM_ROLE 'arn:aws:iam::116584140802:role/RedshiftS3Role'
REGION 'ap-southeast-2'
CSV
IGNOREHEADER 1;


/*verify data loaded*/
SELECT COUNT(*)
FROM telecom.stg_customer_churn;


SELECT *
FROM telecom.stg_zip_population
LIMIT 5;


