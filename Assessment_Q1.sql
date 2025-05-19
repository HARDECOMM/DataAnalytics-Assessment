-- Analyze savings and investment plans

USE adashi_staging;

SELECT
    p.owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(CASE WHEN p.open_savings_plan = 1 OR p.is_regular_savings = 1 THEN 1 END) AS savings_count,
    COUNT(CASE WHEN p.is_fixed_investment = 1 THEN 1 END) AS investment_count,
    FORMAT(SUM(sa.confirmed_amount), 2) AS total_deposits
FROM 
    savings_savingsaccount sa
    JOIN plans_plan p ON sa.plan_id = p.id
    JOIN users_customuser u ON p.owner_id = u.id
GROUP BY 
    p.owner_id,
    u.first_name,
    u.last_name
HAVING 
    COUNT(CASE WHEN p.open_savings_plan = 1 OR p.is_regular_savings = 1 THEN 1 END) > 0 AND 
    COUNT(CASE WHEN p.is_fixed_investment = 1 THEN 1 END) > 0 
ORDER BY total_deposits DESC;