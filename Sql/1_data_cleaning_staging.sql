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




  