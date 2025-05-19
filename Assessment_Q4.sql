-- Estimate customer lifetime value (CLV)

USE adashi_staging;

SELECT 
    u.id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    ROUND((COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * (SUM(s.confirmed_amount) * 0.001), 2) AS estimated_clv
FROM 
    users_customuser u 
JOIN 
    savings_savingsaccount s ON u.id = s.owner_id
WHERE 
    s.plan_id IN (SELECT id FROM plans_plan WHERE is_regular_savings = 1)
GROUP BY 
    u.id, u.first_name, u.last_name, u.date_joined
ORDER BY 
    estimated_clv DESC;