## Extended Progress Report - March 31st, 2016
**Table of Contents:**
- [Summary](./extended_progress_report_yatbear.md#summary)
- [Descriptive Analysis](./extended_progress_report_yatbear.md#descriptive-analysis)
- [Exploratory Analysis](./extended_progress_report_yatbear.md#exploratory-analysis)
- [Inferential Analysis](./extended_progress_report_yatbear.md#inferential-analysis)
- [Predictive Analysis](./extended_progress_report_yatbear.md#predictive-analysis)
- [Next Steps](./extended_progress_report_yatbear.md#next-steps)
- [Code](./extended_progress_report_yatbear.md#code)

----------

### Summary

We are working on a completed different task this week - ADHD and Bipolar Disorder Identification. So several old analyses I conducted before for the depression prediction (e.g. PCA, K-S test, five classification methods) are reapplied on the ADHD and Bipolar Identification problem. New classification analyses are also explored.


### Descriptive Analysis

Mutually exclusive ADHD and Bipolar samples are used for the prediction. I used the following three subjects:

1. Individual Patient Information
3. 'Learning Disability Screening' Questionnaire Responses
3. Baseline rCBF values 
4. Concentration rCBF values

### Exploratory Analysis

I reduced the dimensions of the features by subjects. 

For patient information, only 'Age', 'Gender_id', 'race_id', 'location_id' are kept.

For the LDS questionnaire responses, I used Sparse PCA and reconstructed 10 features. 

I ran PCA on baseline and concentration rCBF values separately and kept 3 features that captures more than 99.9% variance for both of them. 


### Inferential Analysis

I used Kolmogorov-Smirnov Goodness-of-Fit Test on all 20 features after dimensionality reduction to check if the ADHD features and Bipolar features are sampled from the same distribution. The figure below are the plotted power curves on the 20 features, marked with their corresponding p-values. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/extended_pwr_curves.png" width="300" />

As shown in the power curves above, ten features (with large p-values) obviously follow the null distribution. For those whose p-values are slightly smaller than the alpha power(0.05), it is hard to be tell whether the corresponding powers will eventually approximate 1.0 due to the lack of data, but we can still see the trend of increasing.


### Predictive Analysis

I used 10-fold cross validation to train five different binary classifiers on the reduced features. The performances are listed below:

| Classifier | Accuracy | Standard Deviation |
|------------|----------|--------------------|
|Logistic Regression Classifier| 0.7664 | +/- 0.393 |
|K Nearest Neighbors Classifier| 0.7191 | +/- 0.352 |
|Support Vector Machine| 0.6534 | +/- 0.217 |
|Linear Discriminant Analysis| 0.7524 | +/- 0.378 |
|Quadratic Discriminant Analysis| 0.7126 | +/- 0.302 |
|Random Forest Classifier| 0.7502 | +/- 0.379 |
|Gradient Boosting Classifier| 0.7657 | +/- 0.382 |
|Extra Trees Classifier| 0.7709 | +/- 0.395 |
|AdaBoost Classifier (base: decision tree)| 0.7214 | +/- 0.323 |


We have 1040 ADHD samples out of 1347 samples, so the chance is 77.2%. From above we can see that current prediction accuracies yielded by the above procedures are no better than chance.


### Next Steps

Reflection: I probably should not have conducted PCA on the baseline and concentration rCBF values separately, since they are supposed to be associated. Reduce dimensions of the features from these two subjects individually might have broken some dependence that is supposed to be learned. 

- Analyze domain-specific (brain SPECT) information.
- Get more data samples.
- Use more features (perhaps disorder diagnosis).
- Look into the feature engineering step (especially PCA).
- Separate the genders.


### Code


| Question Type | Code |
|---------------|------|
| Descriptive, Exploratory, Inferential, Predictive | [**``extended_analysis_ADHD_Bipolar_yatbear.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-8/extended_analysis_ADHD_Bipolar_yatbear.ipynb) |
