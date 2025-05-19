
-- Question 2: Transaction Frequency Analysis
-- Classify customers into frequency categories based on average monthly transactions.

WITH txn_per_customer_month AS (
    SELECT 
        sa.owner_id,
        COUNT(*) / TIMESTAMPDIFF(MONTH, MIN(sa.created_on), NOW()) AS avg_txn_per_month
    FROM savings_savingsaccount sa
    WHERE sa.confirmed_amount > 0
    GROUP BY sa.owner_id
),
categorized AS (
    SELECT 
        CASE
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_txn_per_month
    FROM txn_per_customer_month
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category;
