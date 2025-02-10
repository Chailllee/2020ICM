# **Environmental Displacement and Migration Policy Analysis**

This repository contains the code and analysis for a project focused on modeling and evaluating policies for environmentally displaced persons (EDPs) due to sea-level rise caused by global warming. The project uses various mathematical and statistical models, including Grey Prediction, Principal Component Analysis (PCA), Analytic Hierarchy Process (AHP), and Markov Chain, to predict migration trends and evaluate policy effectiveness.

---

## **Project Overview**

### **Problem Statement**
Due to rising sea levels caused by global warming, island nations such as the Maldives, Tuvalu, and Kiribati are at risk of becoming uninhabitable, leading to the displacement of their populations. This project aims to:
1. Predict the number of environmentally displaced persons (EDPs).
2. Identify countries most responsible for greenhouse gas emissions.
3. Propose and evaluate migration policies to ensure the resettlement and cultural preservation of EDPs.
4. Model migration routes and trends using Markov Chains.

---

## **Key Features**
1. **Grey Prediction Model**: Predicts the number of EDPs and sea-level rise rates.
2. **Principal Component Analysis (PCA)**: Identifies countries contributing most to greenhouse gas emissions.
3. **Analytic Hierarchy Process (AHP)**: Evaluates migration policies based on economic, political, and cultural factors.
4. **Markov Chain Model**: Simulates migration patterns of EDPs to destination countries.
5. **Entropy Weight Method**: Calculates weights for policy evaluation indices.

---

## **Repository Structure**
```
├── README.md
├── scripts/
│   ├── ahp_analysis.m           # AHP for policy evaluation
│   ├── gray_prediction.m        # Grey prediction model for EDPs and sea-level rise
│   ├── markov_chain_model.m     # Markov Chain for migration simulation
│   ├── pca_analysis.m           # PCA for greenhouse gas contribution analysis
│   ├── interpolation.m          # Data interpolation for missing values
│   ├── entropy_weight.m         # Entropy method for index weighting
│   ├── data_preprocessing.m     # Data cleaning and standardization
│   ├── visualization.m          # Data visualization scripts
│   ├── sensitivity_analysis.m   # Sensitivity analysis for model parameters
│   ├── validation.m             # Model validation and error calculation
│   ├── model_evaluation.m       # Policy evaluation using AHP
│   └── matrix_operations.m      # Matrix operations for PCA and Markov Chain
├── data/                        # Datasets used in the analysis
├── results/                     # Output files and visualizations
└── docs/                        # Documentation and references
```

---

## **Script Descriptions**

1. **`gray_prediction.m`**: Predicts the number of EDPs and sea-level rise rates using the Grey Prediction Model.
2. **`pca_analysis.m`**: Identifies countries with the highest greenhouse gas contributions using PCA.
3. **`ahp_analysis.m`**: Evaluates migration policies using the Analytic Hierarchy Process.
4. **`markov_chain_model.m`**: Simulates migration patterns of EDPs to destination countries using Markov Chains.



---

## **Key Findings**
1. **EDP Prediction**: The Grey Prediction Model estimates that by 2020, the number of EDPs will reach 1.61 billion.
2. **Sea-Level Rise**: By 2050, the sea-level rise rate is predicted to reach 4.69 mm/year.
3. **Top Contributors**: China, the United States, and Iran are identified as the top contributors to greenhouse gas emissions.
4. **Optimal Policy**: The proposed migration policy outperforms multiculturalism and non-intervention models in terms of economic, political, and cultural outcomes.
5. **Migration Routes**: The Markov Chain Model predicts migration patterns, with EDPs primarily moving to the United States, Germany, and Canada.


---

## **Dependencies**
- MATLAB (R2021a or later)
- Statistics and Machine Learning Toolbox
- Optimization Toolbox

