-- Analyze inactivity

USE adashi_staging;

SELECT 
    sa.plan_id,
    sa.owner_id, 
    CASE 
        WHEN p.open_savings_plan = 1 OR p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_fixed_investment = 1 THEN 'Investment' 
        ELSE 'Unknown'
    END AS type,
    MAX(sa.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(sa.transaction_date)) AS inactivity_days
FROM savings_savingsaccount sa
JOIN plans_plan p ON sa.plan_id = p.id
WHERE 
    p.open_savings_plan = 1 OR 
    p.is_regular_savings = 1 OR 
    p.is_fixed_investment = 1
GROUP BY 
    sa.owner_id, type, sa.plan_id
HAVING 
    MAX(sa.transaction_date) < (CURDATE() - INTERVAL 1 YEAR)
ORDER BY inactivity_days DESC;