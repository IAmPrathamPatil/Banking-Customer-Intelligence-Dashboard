-- =====================================================
-- Banking Customer Intelligence Platform
-- Dashboard Queries
-- Author: Pratham Patil
-- =====================================================

SELECT
    COUNT(*) AS total_customers
FROM customers;

SELECT
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers;

SELECT
    COUNT(*) AS active_customers
FROM customers
WHERE active_member = 1;

SELECT
    ROUND(AVG(balance),2) AS average_balance
FROM customers;

SELECT
    ROUND(AVG(credit_score),2) AS average_credit_score
FROM customers;

SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

SELECT
    country,
    ROUND(AVG(churn)*100,2) AS churn_rate
FROM customers
GROUP BY country
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN balance >= 150000 THEN 'VIP'
        WHEN balance >= 80000 THEN 'Premium'
        ELSE 'Regular'
    END AS customer_segment,
    COUNT(*) AS customers
FROM customers
GROUP BY customer_segment;

SELECT
    CASE
        WHEN age < 30 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customers
FROM customers
GROUP BY age_group
ORDER BY age_group;

SELECT
    products,
    ROUND(AVG(churn)*100,2) AS churn_rate
FROM customers
GROUP BY products
ORDER BY products;

SELECT
    gender,
    COUNT(*) AS customers
FROM customers
GROUP BY gender;

SELECT
    country,
    ROUND(AVG(balance),2) AS average_balance
FROM customers
GROUP BY country
ORDER BY average_balance DESC;

