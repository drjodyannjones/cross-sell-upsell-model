# **Cross-Sell and Upsell Prediction Model**

## **🔍 Project Overview**

This project delivers a fully containerized, end-to-end machine learning solution to predict which products customers are most likely to buy next. It incorporates **Apache Airflow** for orchestration, **DBT** for transformations in **Azure Synapse**, and **Metabase** for interactive dashboards, all managed with modern tools like **Poetry** and **Make** to streamline development and testing.

### **Objective**

- Build a scalable, automated pipeline for ingestion, transformation, and predictions.
- Deploy actionable recommendations to improve cross-sell and upsell opportunities.
- Provide stakeholders with insights through an intuitive **Metabase dashboard**.

---

## **📌 Key Features**

1. **Modern Dependency Management**:
   - Use **Poetry** for package management and virtual environment handling.
2. **Scalable Pipeline**:
   - Orchestrate workflows with **Apache Airflow**, containerized for portability.
3. **Automated Testing**:
   - Use **Make** for automation and **pytest** for robust testing.
4. **Interactive Visualization**:
   - Deploy **Metabase** dashboards for exploring predictions and trends.

---

## **🗂️ Dataset**

### **Source**

[Instacart Market Basket Analysis Dataset](https://www.kaggle.com/c/instacart-market-basket-analysis/data), which includes:

- **Orders**: Historical purchase data.
- **Products**: Metadata like names, categories, and departments.
- **Users**: Anonymized customer IDs.
- **Order Products**: Links between orders and purchased items.

This dataset forms the foundation for predictive modeling and personalized recommendations.

---

## **🏗️ Architecture**

### **Pipeline Overview**

1. **Containerized Services**:
   - **Apache Airflow**: Orchestrates data pipelines and manages dependencies.
   - **PostgreSQL**: Stores metadata for Airflow.
   - **Metabase**: Provides business intelligence through dashboards.
2. **Data Transformation**:
   - **DBT**: Performs SQL-based transformations and creates feature-rich datasets in Azure Synapse.
3. **Feature Engineering & Model Training**:
   - Python scripts prepare data and train machine learning models (e.g., XGBoost).
4. **API Deployment**:
   - A Flask API serves recommendations for downstream integration.
5. **Visualization**:
   - **Metabase Dashboard** for real-time insights.

### **Tool Integration**

- **Poetry**: Handles package dependencies and creates isolated environments.
- **Make**: Automates workflows like testing and deployment.
- **pytest**: Ensures code quality with comprehensive test coverage.

---

## **💻 Technologies**

### **Core Services**

- **Apache Airflow**: Workflow orchestration.
- **PostgreSQL**: Backend for Airflow metadata.
- **DBT**: SQL-based transformations in Azure Synapse.
- **Metabase**: Business intelligence and dashboards.

### **Machine Learning**

- **Python**:
  - Data Manipulation: `pandas`, `numpy`
  - Modeling: `xgboost`, `scikit-learn`
  - Visualization: `matplotlib`, `seaborn`

### **Containerization and Management**

- **Docker**: Containerized Airflow, Metabase, PostgreSQL, and supporting services.
- **Poetry**: Simplifies dependency management and ensures reproducibility.

---

## **📊 Results**

- **Prediction Accuracy**:
  - Precision@K: 85% (example metric).
  - Recall@K: 72% (example metric).
- **Example Recommendations**:
  | **Customer ID** | **Recommended Products** |
  |------------------|--------------------------------|
  | 1001 | Yogurt, Bananas, Granola |
  | 1002 | Avocados, Spinach, Almond Milk|

- **Dashboard Insights**:
  - Segment customers by their likelihood to purchase specific product categories.
  - Explore high-demand product trends and seasonal variations.

_(Add final metrics and dashboard screenshots once available.)_

---

## **🚀 Development Workflow**

### **1. Clone the Repository**

```bash
git clone https://github.com/your-username/cross-sell-upsell-model.git
cd cross-sell-upsell-model
```

### **2. Install Dependencies**

Use **Poetry** to set up the environment and manage dependencies:

```bash
poetry install
poetry shell
```

### **3. Build and Deploy Containers**

Run all containerized services with Docker Compose:

```bash
docker-compose up --build
```

This will start:

- **Apache Airflow** (`http://localhost:8080`)
- **PostgreSQL** for Airflow metadata
- **Metabase** (`http://localhost:3000`)

### **4. Run Tests**

Use **Make** to run all tests with pytest:

```bash
make test
```

### **5. Execute Airflow DAGs**

1. Access the Airflow UI at `http://localhost:8080`.
2. Trigger the `cross_sell_dag` to run data ingestion, transformation, and prediction tasks.

### **6. Deploy DBT Models**

Run DBT transformations to prepare data in Azure Synapse:

```bash
dbt run
```

### **7. Visualize in Metabase**

Connect Metabase to Azure Synapse or PostgreSQL to explore predictions and trends.

---

## **📝 Folder Structure**

```
cross-sell-upsell-model/
│
├── dags/ # Airflow DAGs for orchestrating the pipeline
│ ├── ingestion_dag.py
│ ├── transformation_dag.py
│ ├── model_training_dag.py
│ ├── utils/
│ ├── gcs_utils.py
│ ├── bq_utils.py
│
├── terraform/ # Terraform configurations for GCP resources
│ ├── main.tf # Main Terraform configuration
│ ├── variables.tf # Input variables for Terraform
│ ├── terraform.tfvars # Environment-specific variable values
│ ├── outputs.tf # Output definitions
│
├── dbt/ # DBT project for BigQuery transformations
│ ├── models/
│ ├── staging/
│ ├── stg_orders.sql
│ ├── stg_products.sql
│ ├── marts/
│ ├── user_features.sql
│ ├── product_features.sql
│ ├── dbt_project.yml # DBT project configuration
│ ├── profiles.yml # DBT profiles for connecting to BigQuery
│
├── src/ # Source code for data processing and ML models
│ ├── preprocessing.py # Data cleaning and preprocessing scripts
│ ├── feature_engineering.py # Feature engineering logic
│ ├── train_model.py # Model training script
│ ├── serve_model.py # Flask API for serving predictions
│ ├── utils/
│ ├── logging_utils.py # Logging utilities
│ ├── config.py # Centralized configuration management
│
├── tests/ # Tests for pipeline, models, and infrastructure
│ ├── test_dags.py # Unit tests for Airflow DAGs
│ ├── test_transformations.py # Unit tests for DBT models
│ ├── test_model.py # Unit tests for ML models
│
├── docker/ # Docker configurations for containerized services
│ ├── Dockerfile # Dockerfile for Flask API
│ ├── docker-compose.yml # Docker Compose for local development
│
├── notebooks/ # Jupyter notebooks for exploration and prototyping
│ ├── data_exploration.ipynb # Initial dataset exploration
│ ├── feature_analysis.ipynb # Feature engineering analysis
│ ├── model_training.ipynb # Model development and experimentation
│
├── metabase/ # Metabase configurations for dashboard setup
│ ├── dashboard_config.json # Exported Metabase dashboard configuration
│ ├── queries/
│ ├── kpi_query.sql # SQL queries for key KPIs
│
├── ci_cd/ # CI/CD pipeline configurations
│ ├── github_actions.yml # GitHub Actions workflow for CI/CD
│ ├── cloudbuild.yaml # Cloud Build configuration
│
├── Makefile # Automation tasks (e.g., testing, deployment)
├── requirements.txt # Python dependencies
├── pyproject.toml # Poetry configuration for Python dependencies
├── README.md # Project documentation
├── .gitignore # Git ignore rules
├── LICENSE # Project license
```

---

## **📈 Future Enhancements**

1. **Real-Time Predictions**:
   - Add streaming pipelines with Kafka or Azure Event Hub for live inference.
2. **Advanced Modeling**:
   - Explore deep learning techniques for improved personalization.
3. **A/B Testing**:
   - Implement A/B testing to assess the impact of recommendations on sales.
4. **Data Enrichment**:
   - Integrate external data sources (e.g., customer demographics, marketing campaigns).

---

## **📬 Contact**

**Dr. Jody-Ann Jones**
📧 Email: [jody@thedatasensei.com](mailto:jody@thedatasensei.com)
🌐 Website: [The Data Sensei](https://www.thedatasensei.com)
👩‍💼 LinkedIn: [Dr. Jody-Ann Jones](https://www.linkedin.com/in/drjodyannjones)

---
