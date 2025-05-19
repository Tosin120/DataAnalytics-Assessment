
# DataAnalytics-Assessment

## Overview
This repository contains SQL solutions for a data analytics assessment focused on customer behavior analysis, product usage, and business performance metrics.

## Questions & Approach

### Q1: High-Value Customers with Multiple Products
**Goal:** Identify users with both funded savings and investment plans.  
**Approach:** Aggregate counts using conditional `COUNT()` and sum up deposits. Filter using `HAVING` to ensure customers have both plan types.

### Q2: Transaction Frequency Analysis
**Goal:** Categorize customers by their average monthly transaction frequency.  
**Approach:** Calculate monthly averages and group into frequency buckets using `CASE WHEN`. Useful for customer segmentation.

### Q3: Account Inactivity Alert
**Goal:** Detect active accounts with no inflows for over 365 days.  
**Approach:** Use `DATEDIFF()` on the `last_charge_date` to compute inactivity days, and filter out inactive records.

### Q4: Customer Lifetime Value (CLV)
**Goal:** Estimate CLV using transaction volume and tenure.  
**Approach:** Derive tenure in months and calculate an estimated CLV using the formula provided in the question prompt.
