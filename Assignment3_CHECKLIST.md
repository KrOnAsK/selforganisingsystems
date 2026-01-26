# Assignment 3 SOM Checklist (credit_risk_china / OpenML 46444)

Status reflects the current notebook state in `Assignment3.ipynb`.

## A) Toolbox + Provenance Setup
- [x] PySOMVis/MiniSom imported and used
- [x] PROV logging infrastructure wired via Starvers
- [ ] PROV logging for all analysis/visualization outputs (only runs + dataset/preprocessing logged so far)

## B) Dataset
### Selection/Registration
- [x] OpenML dataset selected (id 46444, `credit_risk_china`)
- [x] TUWEL registration (user confirmed)

### Machine-Actionable Description
- [x] OpenML metadata snapshot embedded in notebook
- [x] Dataset entity logged to KG with Schema.org + Croissant types
- [ ] Full Croissant/Schema.org field-level schema (feature list, types, distribution) in KG

### Dataset Characterization
- [x] Size, numeric/categorical counts
- [x] Missing values (counts + %)
- [x] Outliers (IQR)
- [x] Correlation matrix (numeric)
- [x] Class distribution + hypotheses logged to KG
- [ ] Sparsity description beyond missingness (e.g., % of zero values) if required
- [ ] Document interpretations in report text

### Preprocessing
- [x] Bytes decoding + missing marker normalization
- [x] Numeric imputation (median)
- [x] One-hot encoding for categoricals
- [x] Scaling numeric features
- [x] Preprocessing steps logged to KG
- [ ] Explicit rationale text for each preprocessing step (report/prov notes)

## C) SOM Training and Analysis
### Task C1: Regular SOM
- [x] Regular SOM trained
- [x] U-Matrix, hits, class map, class proportions
- [x] QE map + TE map
- [x] Border/magnification summary helper (edge vs inner)
- [x] Written interpretation of cluster structure, class overlap, border effect, magnification factors

### Task C2: Different seed
- [x] Second seed trained
- [x] Comparative visuals (U, QE, TE)
- [x] Written comparison of stability/changes

### Task C3: Map sizes
- [x] Small + regular + large trained
- [x] Comparative visuals (U, QE, TE)
- [x] Written comparison (under/overfitting)

### Task C4: Sigma
- [x] Too-small sigma trained
- [x] Comparative visuals (U, QE, TE)
- [x] Written analysis of topology violations / failure mode

### Task C5: Learning rate
- [x] High + low LR trained
- [x] Comparative visuals (U, QE, TE)
- [x] Written analysis of instability vs slow convergence

### Task C6: Iterations
- [x] Iteration sweep trained (2..10000)
- [x] Comparative visuals (U, QE, TE)
- [x] Written analysis of emergence + stabilization

### Task C7: Optimal SOM
- [x] Select optimal parameters based on C1-C6
- [x] Train optimal SOM
- [x] MLSO model description in KG
- [x] Detailed interpretation: density, hierarchy, topology, class distribution, QE/TE
- [] Hierarchical cluster analysis (unit dendrogram added, needs interpretation)

## D) Report / Submission
- [ ] Report structure follows assignment sections
- [ ] Figures labeled + described
- [ ] Tables summarizing comparisons
- [ ] Final summary (parameters, sensitivity, useful visualizations)
- [ ] PDF export of notebook (if required)
- [ ] Zip submission naming convention

