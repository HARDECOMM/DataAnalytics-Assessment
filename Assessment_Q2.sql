-- Analyze transaction frequency

USE adashi_staging;

WITH monthly_transactions AS (
    SELECT
        sa.owner_id AS customer_id, 
        EXTRACT(YEAR FROM 

sa.transaction_date) AS transaction_year,
        EXTRACT(MONTH FROM sa.transaction_date) AS transaction_month,
     

   COUNT(sa.id) AS transaction_count
    FROM 
        savings_savingsaccount sa
    GROUP BY 
        sa.owner_id,
    

    EXTRACT(YEAR FROM sa.transaction_date),
        EXTRACT(MONTH FROM sa.transaction_date)
),
avg_transactions AS (
  

  SELECT
        customer_id,
        AVG(transaction_count) AS avg_monthly_transactions
    FROM 
        

monthly_transactions
    GROUP BY
        customer_id  
)

SELECT 
    CASE
        WHEN avg_monthly_transactions >= 10 

THEN 'High Frequency'
        WHEN avg_monthly_transactions BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 

'Low Frequency'
    END AS frequency_category, 
    COUNT(customer_id) AS customer_count,
    ROUND(AVG

(avg_monthly_transactions), 1) AS avg_transactions_per_month
FROM avg_transactions
GROUP BY frequency_category
ORDER 

BY avg_transactions_per_month DESC;