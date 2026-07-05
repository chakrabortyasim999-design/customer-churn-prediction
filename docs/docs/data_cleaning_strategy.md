Data Cleaning Strategy:
The raw dataset contained several quality issues:
•	Missing Customer IDs
•	Negative quantities indicating refunds
•	Duplicate invoice records
•	Incorrect data formatting
•	Null product descriptions
Cleaning decisions:
•	Removed records with null Customer IDs
•	Excluded refund transactions for retention analysis
•	Standardized date formats
•	Removed duplicate records
•	Validated revenue calculations
Reasoning:
Retention analysis depends on identifying unique customer purchasing behavior. Missing customer identifiers and refund transactions distort retention metrics and customer lifetime calculations.

