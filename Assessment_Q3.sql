
-- Question 3: Account Inactivity Alert
-- Identify active plans (savings or investments) with no transactions for over 365 days.

SELECT 
    p.id AS plan_id,
    p.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Other'
    END AS type,
    p.last_charge_date AS last_transaction_date,
    DATEDIFF(CURDATE(), p.last_charge_date) AS inactivity_days
FROM plans_plan p
WHERE p.status_id = 1 -- active
  AND p.last_charge_date IS NOT NULL
  AND DATEDIFF(CURDATE(), p.last_charge_date) > 365;
