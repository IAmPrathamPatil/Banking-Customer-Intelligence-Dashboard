WITH average_balance AS (
    SELECT AVG(balance) AS avg_balance
    FROM customers
)

SELECT
    customer_id,
    country,
    balance
FROM customers, average_balance
WHERE balance > avg_balance
ORDER BY balance DESC;

SELECT

    customer_id,

    country,

    balance,

    RANK() OVER(
        ORDER BY balance DESC
    ) AS customer_rank

FROM customers;

WITH ranked_customers AS (

SELECT

customer_id,

country,

balance,

ROW_NUMBER() OVER(

PARTITION BY country

ORDER BY balance DESC

) AS rn

FROM customers

)

SELECT *

FROM ranked_customers

WHERE rn = 1;

SELECT

country,

ROUND(AVG(balance),2) AS avg_balance,

ROUND(

AVG(balance)

OVER(),

2

) AS global_average

FROM customers

GROUP BY country;

SELECT

customer_id,

country,

balance,

CASE

WHEN balance >= 150000 THEN 'VIP'

WHEN balance >= 80000 THEN 'Premium'

ELSE 'Regular'

END AS customer_segment

FROM customers;

SELECT

country,

ROUND(AVG(churn)*100,2) AS churn_rate,

RANK()

OVER(

ORDER BY AVG(churn) DESC

) AS churn_rank

FROM customers

GROUP BY country;

SELECT

customer_id,

balance,

SUM(balance)

OVER(

ORDER BY balance DESC

) AS cumulative_balance

FROM customers;

SELECT

customer_id,

balance,

NTILE(4)

OVER(

ORDER BY balance DESC

) AS quartile

FROM customers;

