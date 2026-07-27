import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import shap
import matplotlib.pyplot as plt

# Load genomic features (TE density, SV proximity, expression)
df = pd.read_csv('nbs_lrr_evolutionary_features.csv')
X = df[['te_density', 'sv_proximity', 'gene_length', 'gc_content', 'expression_tpm']]
y = df['dn_ds_ratio']

# Train Random Forest
rf = RandomForestRegressor(n_estimators=500, max_depth=10, random_state=42)
rf.fit(X, y)

# SHAP Interpretation
explainer = shap.TreeExplainer(rf)
shap_values = explainer.shap_values(X)
shap.summary_plot(shap_values, X, show=False)
plt.savefig('shap_feature_importance.png')