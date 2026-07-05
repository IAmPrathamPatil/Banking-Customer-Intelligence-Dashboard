SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

SELECT
    gender,
    COUNT(*) AS total_customers
FROM customers
GROUP BY gender
ORDER BY total_customers DESC;

SELECT
    ROUND(AVG(age),2) AS average_age
FROM customers;

SELECT
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers;

SELECT
    country,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY country
ORDER BY churn_rate DESC;

SELECT
    gender,
    COUNT(*) AS customers,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY gender;

SELECT
    ROUND(AVG(credit_score),2) AS average_credit_score
FROM customers;

SELECT
    country,
    ROUND(AVG(credit_score),2) AS average_credit_score
FROM customers
GROUP BY country
ORDER BY average_credit_score DESC;

SELECT
    country,
    ROUND(AVG(balance),2) AS average_balance
FROM customers
GROUP BY country
ORDER BY average_balance DESC;

SELECT
    customer_id,
    country,
    balance
FROM customers
ORDER BY balance DESC
LIMIT 10;

SELECT
    country,
    ROUND(AVG(estimated_salary),2) AS average_salary
FROM customers
GROUP BY country
ORDER BY average_salary DESC;   