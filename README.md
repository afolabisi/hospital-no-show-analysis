# Hospital Appointment No-Show Analysis

## Introduction

This project investigates why patients miss scheduled hospital appointments and what hospitals can do to reduce no-shows.  

As a Biochemistry graduate transitioning into Data Science with a focus on health, I wanted to work on a real-world healthcare problem that combines data cleaning, exploratory analysis, SQL, visualisation, and machine learning. The goal was not only to find patterns but also to turn those patterns into clear, actionable recommendations.

---

## Background

This project was driven by the following core questions:

1. What is the overall no-show rate and how does it vary across different patient groups?
2. Which factor has the strongest influence on whether a patient shows up or not?
3. Does sending an SMS reminder actually help reduce no-shows?
4. Are there specific high-risk segments (waiting time + age + SMS) that hospitals should prioritise?
5. Can we build a machine learning model that flags high-risk appointments in advance?

### Data Source
The dataset used is the **Medical Appointment No Shows** dataset (Brazilian public hospitals, 2016). It contains over 110,000 appointment records with information on patients, scheduling dates, medical conditions, and whether the patient attended or not.

---

## Tools Used

- **Python** (Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn, XGBoost)
- **Jupyter Notebooks** – for exploration, cleaning, analysis, and modelling
- **SQL Server + SSMS** – for business-oriented queries and risk segmentation
- **Power BI** – for interactive dashboards
- **Git & GitHub** – for version control and project documentation

---

## Project Pipeline

1. **Data Understanding** – Explored structure, missing values, data types, and target distribution  
2. **Data Cleaning & Feature Engineering** – Removed invalid ages, created `Waiting_Days`, `Timing`, `Age_Group`, and `Risk_Segment`  
3. **Exploratory Data Analysis** – Identified key patterns and relationships  
4. **Business Insights & Recommendations** – Translated findings into practical hospital actions  
5. **SQL Analysis** – Wrote business queries and created risk segments  
6. **Power BI Dashboard** – Built interactive visuals for stakeholders  
7. **Predictive Modelling** – Trained Logistic Regression, Random Forest, and XGBoost models  

---

## Key Findings

### 1. Waiting Time is the Dominant Driver
Patients who missed their appointments waited almost twice as long on average (14.8 days vs 7.8 days).  
No-show rate rises steadily with waiting time:
- Same Day → 21.4%
- 1–7 days → 25.0%
- Within 30 days → 32.0%
- More than 30 days → **33.0%**

### 2. SMS Reminders Help — Especially on Long Waits
After controlling for waiting time, SMS reduced no-show rates by 6–7 percentage points for patients waiting more than 7 days.

### 3. Age Matters
- Elderly patients: **15.3%** no-show rate  
- Adults: 21.1%  
- Children: 21.9%  

Elderly patients are meaningfully more reliable.

### 4. Other Notable Patterns
- Patients on Scholarship (Bolsa Família) have higher no-show rates.
- Gender shows almost no difference.
- Saturday has the highest no-show rate among weekdays.

---

## Machine Learning Results

Three models were trained to predict no-shows:

| Model                  | ROC-AUC | Notes                              |
|------------------------|---------|------------------------------------|
| Logistic Regression    | 0.676   | Interpretable baseline             |
| **Random Forest**      | **0.726** | Best overall performance         |
| XGBoost                | 0.725   | Nearly identical to Random Forest  |

**Feature Importance** (both Random Forest and XGBoost agreed):
1. Waiting_Days / Timing (by far the strongest)
2. Age / Age_Group
3. SMS_received

The models confirm the same story found in the exploratory analysis: **waiting time is the most important factor**.

---

## Recommendations for Hospitals

1. **Reduce maximum waiting time** — Aim to schedule most appointments within 7–14 days.
2. **Strengthen SMS strategy** — Prioritise reminders for patients with longer waits.
3. **Focus on higher-risk groups** — Children, adults, and Scholarship recipients need more attention.
4. **Monitor weekly** — Track no-show rates by waiting-time band and age group.

---

## What I Learned

- How to clean and engineer features from messy real-world healthcare data
- The importance of controlling for confounding variables (e.g., SMS vs waiting time)
- Translating technical findings into clear business recommendations
- Building a full pipeline: Python → SQL → Power BI → Machine Learning
- Communicating results through both technical notebooks and stakeholder-friendly dashboards

---
## Project Structure

Hospital_Appointment_Analysis/
├── data/
│ ├── raw/
│ └── processed/
├── notebooks/
│ ├── 01_data_understanding.ipynb
│ ├── 02_data_cleaning.ipynb
│ ├── 03_eda.ipynb
│ ├── 04_visuals_and_insights.ipynb
│ └── 05_predictive_modelling.ipynb
├── sql/
├── powerbi/
├── visuals/
└── README.md

---

## Conclusion

This project showed that long waiting times are the single biggest driver of missed appointments. By combining exploratory analysis, SQL, interactive dashboards, and machine learning, I was able to move from raw data to clear, actionable insights.

For my own transition from Biochemistry into Health Data Science, this project reinforced the value of end-to-end work — not just building models, but understanding the problem, communicating findings, and thinking about real-world impact.

---

**Author:** Sunday Israel Afolabi 
Biochemistry graduate transitioning into Health Data Science & Machine Learning  

[LinkedIn](https://www.linkedin.com/in/afolabi-sunday-israel) • [GitHub](https://github.com/afolabisi)

## Project Structure
