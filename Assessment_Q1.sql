
-- Question 1: High-Value Customers with Multiple Products
-- Find customers with at least one funded savings plan AND one funded investment plan.
-- The output includes customer name, savings/investment count, and total deposits (in Naira).

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN p.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN p.id END) AS investment_count,
    ROUND(SUM(p.amount) / 100, 2) AS total_deposits
FROM users_customuser u
JOIN plans_plan p ON p.owner_id = u.id
WHERE p.amount > 0
GROUP BY u.id, u.first_name, u.last_name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;
