-- Create staging Table 

CREATE TABLE IF NOT EXISTS ecommerce_data (
    invoice_no VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INT,
    invoice_date TIMESTAMP,
    unit_price NUMERIC(10,2),
    customer_id VARCHAR(20),
    country VARCHAR(100)
);

-- Production Analytics View: Cleaned Data Strategy

CREATE OR REPLACE VIEW v_clean_ecommerce_transactions AS
SELECT 
    invoice_no,
    stock_code,
    description,
    quantity,
    invoice_date,
    unit_price,
    customer_id,
    country,
    (quantity * unit_price) AS revenue,
    DATE_TRUNC('month', invoice_date) AS activity_month
FROM ecommerce_data
WHERE customer_id IS NOT NULL 
  AND quantity > 0 
  AND unit_price > 0;


WITH cohort_items AS (
    -- Step 1: Subquery isolates the initial acquisition timestamp before truncation
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(invoice_date)) AS cohort_month
    FROM v_clean_ecommerce_transactions
    GROUP BY customer_id
),

monthly_activity AS (
    -- Step 2: Map all active transaction periods
    SELECT DISTINCT
        customer_id,
        activity_month
    FROM v_clean_ecommerce_transactions
),

cohort_retention_base AS (
    -- Step 3: Calculate the delta months (Cohort Index) between acquisition and transaction
    SELECT
        m.customer_id,
        c.cohort_month,
        m.activity_month,
        ((EXTRACT(YEAR FROM m.activity_month) - EXTRACT(YEAR FROM c.cohort_month)) * 12 +
         (EXTRACT(MONTH FROM m.activity_month) - EXTRACT(MONTH FROM c.cohort_month)))::INTEGER AS cohort_index
    FROM monthly_activity m
    JOIN cohort_items c ON m.customer_id = c.customer_id
),

cohort_sizes AS (
    -- Step 4: Extract total starting size per cohort
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_starting_users
    FROM cohort_items
    GROUP BY cohort_month
) -- <--- Fixed: Removed the breaking comma check errors here

-- Step 5: Final Consolidated Retention Matrix Preview Execution
SELECT
    r.cohort_month,
    s.total_starting_users,
    r.cohort_index,
    COUNT(DISTINCT r.customer_id) AS active_users,
    ROUND((COUNT(DISTINCT r.customer_id)::NUMERIC / s.total_starting_users) * 100, 2) AS retention_percentage
FROM cohort_retention_base r
JOIN cohort_sizes s ON r.cohort_month = s.cohort_month
GROUP BY r.cohort_month, s.total_starting_users, r.cohort_index
ORDER BY r.cohort_month, r.cohort_index;
