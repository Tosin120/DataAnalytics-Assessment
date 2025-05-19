
-- Question 4: Customer Lifetime Value (CLV) Estimation
-- Estimate CLV using account tenure, transaction volume, and profit assumptions.

WITH customer_summary AS (
    SELECT 
        u.id AS customer_id,
        CONCAT(u.first_name, ' ', u.last_name) AS name,
        TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
        SUM(s.confirmed_amount) / 100.0 AS total_transaction_value,
        COUNT(*) AS total_transactions
    FROM users_customuser u
    JOIN savings_savingsaccount s ON s.owner_id = u.id
    WHERE s.confirmed_amount > 0
    GROUP BY u.id, u.first_name, u.last_name, u.date_joined
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / tenure_months) * 12 * (total_transaction_value / total_transactions * 0.001), 2) AS estimated_clv
FROM customer_summary
WHERE tenure_months > 0
ORDER BY estimated_clv DESC;
