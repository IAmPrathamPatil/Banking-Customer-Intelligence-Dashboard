SELECT
    CASE
        WHEN age < 30 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers
FROM customers
GROUP BY age_group
ORDER BY total_customers DESC;

SELECT
    CASE
        WHEN age < 30 THEN '18-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY age_group
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance < 50000 THEN 'Low Balance'
        WHEN balance < 100000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_category,
    COUNT(*) AS customers
FROM customers
GROUP BY balance_category
ORDER BY customers DESC;

SELECT
    CASE
        WHEN estimated_salary < 50000 THEN 'Low Income'
        WHEN estimated_salary < 100000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS customers,
    ROUND(AVG(balance),2) AS average_balance
FROM customers
GROUP BY income_group
ORDER BY average_balance DESC;

SELECT
    products,
    COUNT(*) AS total_customers,
    ROUND(AVG(balance),2) AS average_balance,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY products
ORDER BY products;

SELECT
    active_member,
    COUNT(*) AS customers,
    ROUND(AVG(balance),2) AS average_balance,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY active_member;

SELECT
    credit_card,
    COUNT(*) AS customers,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY credit_card;