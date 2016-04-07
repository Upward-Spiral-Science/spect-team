## Extended Summary - April 6th, 2016

### Data

Mutually exclusive ADHD and Bipolar samples are used for the prediction. I used the following two subjects:

1. Baseline rCBF values 
2. Concentration rCBF values


### Extended Analysis - LLE 

1. The PCA and Sparse PCA analysis I conducted during the first half of the semester was done without data scaling. The scaling preprocessing step is added to the dimensionality reduction step.

2. Explored Manifold Learning - Locally Linear Embedding prior to the predictive analysis. Prediction using LLE features is slightly more accurate than the prediction using PCA features.

	- Further parameter tuning is needed for LLE.
	

### Predictive Analysis

I used 10-fold cross validation to train nine different binary classifiers on the LLE reduced features. The performances are listed below:

| Classifier | Accuracy | Standard Deviation |
|------------|----------|--------------------|
|Logistic Regression  | 0.7585 | +/- 0.399 |
|KNN  | 0.6941 | +/- 0.345 |
|Linear SVM | 0.7585 | +/- 0.399 |
|LDA | 0.7513 | +/- 0.391 |
|QDA | 0.6599 | +/- 0.241 |
|Random Forest  | 0.7130 | +/- 0.357 |
|Gradient Boosting | 0.7534 | +/- 0.395 |
|Extra Trees | 0.7580 | +/- 0.398 |
|AdaBoost | 0.7431 | +/- 0.381 |

We have 1484 ADHD samples out of 1955 samples, so the chance is 75.9%. From above we can see that current prediction accuracies yielded by the above procedures are no better than chance.


### Next Steps

- Feature Selection.
- Tweak LLE parameters.
- Separate the genders.


### Code


| Question Type | Code |
|---------------|------|
| Descriptive, Exploratory, Inferential, Predictive | [**``extended_analysis_YatingJing.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/extended_analysis_YatingJing.ipynb) |
