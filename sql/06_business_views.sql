-- ============================================
-- BUSINESS VIEWS
-- ============================================

CREATE OR REPLACE VIEW vw_customer_summary AS
SELECT
    customer_id,
    country,
    gender,
    age,
    credit_score,
    balance,
    estimated_salary,
    products,
    active_member,
    churn
FROM customers;

CREATE OR REPLACE VIEW vw_high_value_customers AS
SELECT
    customer_id,
    country,
    balance,
    estimated_salary,
    credit_score
FROM customers
WHERE balance > 100000;

CREATE OR REPLACE VIEW vw_churn_analysis AS
SELECT
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100,2) AS churn_rate
FROM customers
GROUP BY country;

CREATE OR REPLACE VIEW vw_active_customers AS
SELECT
    customer_id,
    country,
    balance,
    estimated_salary,
    products
FROM customers
WHERE active_member = 1;

CREATE OR REPLACE VIEW vw_vip_customers AS
SELECT
    customer_id,
    country,
    balance,
    estimated_salary,
    credit_score
FROM customers
WHERE balance >= 150000
AND credit_score >= 700;

CREATE OR REPLACE VIEW vw_customer_segments AS
SELECT
    customer_id,
    country,
    balance,
    estimated_salary,
    CASE
        WHEN balance >= 150000 THEN 'VIP'
        WHEN balance >= 80000 THEN 'Premium'
        ELSE 'Regular'
    END AS customer_segment
FROM customers;

