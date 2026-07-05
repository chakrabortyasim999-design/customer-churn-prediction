# E-Commerce Customer Lifecycle & Cohort Analytics Engine

## 📌 Executive Summary
This analytics system implements a scalable data engineering pipeline and relational analytics model to analyze transaction data, tracking user retention and customer lifecycle behavior. By structuring raw transaction layers into standardized transactional cohorts, this project uncovers structural churn trends and optimizes long-term customer retention strategies.

### 📊 Quantified Business Impact & Discoveries:
* **Identification of Critical Churn Thresholds:** Pinpointed a severe drop-off pattern immediately following Month 1 across all baseline customer segments.
* **Revenue Concentration Metrics:** Confirmed that structural repeat-purchasers generate the baseline majority of aggregate organizational income, providing data-backed proof for a re-allocation of marketing spend from acquisition to retention.

---

## 🛠️ Data Infrastructure & Tech Stack
* **Database & Relational Analytics:** PostgreSQL / MySQL (CTEs, Multi-stage Join Matrices, Automated Analytical Schema Layouts)
* **Data Pipelines & Ingestion:** Python 3 (Pandas vectorization engines, clean OOP pipeline structuring)
* **Statistical Visualization:** Seaborn, Matplotlib data visualization modules
* **Enterprise Reporting:** Power BI / Tableau Lifecycle Reporting Ledger

---

## 📈 Key Strategic Insights Uncovered

### 1. The Month-1 Retention Drop-off
Across all monitored operational periods, user retention decreases immediately following the second transaction month. This points to a weak onboarding experience or a lack of post-purchase marketing re-engagement.
* **Strategic Playbook Recommendation:** Deploy an automated email/SMS win-back campaign on day 45 targeting high-intent cohorts to slow down this drop-off.

### 2. High-Value Onboarding Triggers
Data mapping confirms that specific acquisition cohorts exhibit significantly higher lifetime values (LTV) than others, correlating with seasonal promotion events.

---

## 🗂️ Dynamic Retention Visual Ledger
*Paste your cohort heatmap image into the repository and render it directly below:*






[Enterprise Customer Cohort Retention Matrix Heatmap] <img width="962" height="577" alt="notebookscohort_heatmap_preview" src="https://github.com/user-attachments/assets/a705d444-9764-418a-a3ee-0d66eb935989" />

[Enterprise Customer Cohort monthly revenue trend] 
---
<img width="951" height="456" alt="monthly revenue trend" src="https://github.com/user-attachments/assets/db3980e0-9a2f-4ef7-a7cb-2f4ed4a96e0d" />

## 🚀 How To Initialize and Run Locally

1. **Clone the Pipeline Infrastructure:**
   ```bash
   git clone https://github.com
   cd Ecom-Customer-Lifecycle-Cohort-Engine
   ```

2. **Trigger Automated ETL pipelines:**
   ```bash
   python src/pipeline.py
   ```

3. **Deploy PostgreSQL Analytics Logic:**
   Run scripts located inside `/sql` sequentially to initialize transactional views and compute the dynamic cohort matrices.
