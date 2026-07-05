-- ===============================================
-- BANKING CUSTOMER INTELLIGENCE PLATFORM
-- DATA VALIDATION
-- ===============================================

-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Check Duplicate Customer IDs
SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3. Missing Values
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE credit_score IS NULL) AS missing_credit_score,
    COUNT(*) FILTER (WHERE country IS NULL) AS missing_country,
    COUNT(*) FILTER (WHERE gender IS NULL) AS missing_gender,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE balance IS NULL) AS missing_balance,
    COUNT(*) FILTER (WHERE estimated_salary IS NULL) AS missing_salary,
    COUNT(*) FILTER (WHERE churn IS NULL) AS missing_churn
FROM customers;

-- 4. Credit Score Statistics
SELECT
    MIN(credit_score) AS min_credit_score,
    MAX(credit_score) AS max_credit_score,
    ROUND(AVG(credit_score),2) AS avg_credit_score
FROM customers;

-- 5. Age Statistics
SELECT
    MIN(age) AS youngest_customer,
    MAX(age) AS oldest_customer,
    ROUND(AVG(age),2) AS average_age
FROM customers;

-- 6. Balance Statistics
SELECT
    MIN(balance) AS minimum_balance,
    MAX(balance) AS maximum_balance,
    ROUND(AVG(balance),2) AS average_balance
FROM customers;

-- 7. Salary Statistics
SELECT
    MIN(estimated_salary) AS minimum_salary,
    MAX(estimated_salary) AS maximum_salary,
    ROUND(AVG(estimated_salary),2) AS average_salary
FROM customers;