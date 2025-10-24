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
   - Core differential equation:   $\frac{dx^{(1)}}{dt} + a x^{(1)} = b$
   - Forecasted value:  $\hat{x}^{(0)}(k+1) = \hat{x}^{(1)}(k+1) - \hat{x}^{(1)}(k)$
2. **Principal Component Analysis (PCA)**: Identifies countries contributing most to greenhouse gas emissions.
   - Eigen decomposition: $Cv = \lambda v$
   - Weighted score: $S_i = \sum_j c_j x'_{ij}$
3. **Analytic Hierarchy Process (AHP)**: Evaluates migration policies based on economic, political, and cultural factors.
   - Consistency ratio:  
$$CR = \frac{CI}{RI}, \quad CI = \frac{\lambda_{\text{max}} - n}{n - 1}$$
4. **Markov Chain Model**: Simulates migration patterns of EDPs to destination countries.
   - Indicator weight:  $w_j = \frac{1 - e_j}{\sum (1 - e_j)}$
5. **Entropy Weight Method**: Calculates weights for policy evaluation indices.
   - State transition:   $X^{(t)} = X^{(0)} P^t$
---

## **Repository Structure**
```
├── README.md
├── team_co_edit/
│   └── (additional files related to team collaboration)
├── Certificate.pdf
├── ICM_Paper_2000865.pdf
└── scripts/
├── ahp_analysis.m           # AHP implementation for policy comparison and evaluation model
├── gray_prediction.m        # Grey prediction model for risk population forecasting
├── markov_chain_model.m     # Markov chain model for population migration trend prediction
└── pca_analysis.m           # PCA for analyzing the contribution of greenhouse gases by various countries
```

---

## **Script Descriptions**

1. **ahp_analysis.m**
    - *Functionality*: Implementation of the Analytic Hierarchy Process (AHP) for policy evaluation and comparison.
    - *Content*: Construction of criteria matrix, computation of weights, consistency check, etc.

2. **gray_prediction.m**
    - *Functionality*: Grey prediction model for forecasting risk populations.
    - *Content*: Data accumulation, parameter estimation, prediction calculation, etc.

3. **markov_chain_model.m**
    - *Functionality*: Markov chain model for predicting population migration trends.
    - *Content*: Construction of transition probability matrix, state prediction, etc.

4. **pca_analysis.m**
    - *Functionality*: Principal Component Analysis (PCA) for analyzing the contribution to greenhouse gases by different countries.
    - *Content*: Data standardization, covariance matrix computation, eigenvalue extraction, etc.



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

