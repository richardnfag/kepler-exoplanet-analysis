import pandas as pd
import numpy as np
from pickle import load
from xgboost import XGBClassifier

model = load(open('model.dat', 'rb'))

X_eval = pd.read_csv('evaluate.csv')
y_eval = model.predict(X_eval)

y_eval = pd.DataFrame(y_eval)

y_eval.apply(lambda x: x.str.ljust(14)).to_csv('RESPONSE', index=False, header=False)
