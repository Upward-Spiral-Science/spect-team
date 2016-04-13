## Extended Summary - April 12th, 2016

### Data

Mutually exclusive ADHD and Bipolar samples are used for the prediction. I used the following two subjects:

1. Baseline rCBF values 
2. Concentration rCBF values

I separated the genders and build predictive models for the two different genders respectively. Number of samples for different categories are:

| Disorder/Gender | Gender 1 | Gender 2 |
|------------|----------|--------------------|
|ADHD (without Bipolar) | 1017 | 467 |
|Bipolar (without ADHD) | 242 | 228 |
|Chance | 0.808 | 0.672 |

### Predictive Analysis

I used 10-fold cross validation to train nine different binary classifiers on both PCA and LLE reduced features. 

Prediction on PCA features does no better than chance, whereas prediction using QDA on LLE features does much better than chance. 

       On PCA Features      |     On LLE Features
:-------------------------:|:-------------------------:
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_g1_pca.png" width="350" /> | <img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_g1_lle.png" width="350" />
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_g2_pca.png" width="350" /> | <img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_g2_lle.png" width="350" />


Detailed classification performance for Gender 1 using LLE features:

| Classifier for Gender 1 | Accuracy | Standard Deviation |
|------------|----------|--------------------|
| Logistic Regression | 0.8071 | +/- 0.386 |
| KNN | 0.7746 | +/- 0.370 |
| Linear SVM | 0.8071 | +/- 0.386 |
| LDA | 0.8095 | +/- 0.379 |
| QDA | 0.9793 | +/- 0.037 |
| Random Forest | 0.8032 | +/- 0.382 |
| Gradient Boosting | 0.8040 | +/- 0.381 |
| Extra Trees | 0.8024 | +/- 0.382 |
| AdaBoost | 0.8056 | +/- 0.379 |


Detailed classification performance for Gender 2 using LLE features:

| Classifier for Gender 2 | Accuracy | Standard Deviation |
|------------|----------|--------------------|
| Logistic Regression | 0.6696 | +/- 0.447| 
| KNN | 0.5523 | +/- 0.320| 
| Linear SVM | 0.6681 | +/- 0.446| 
| LDA | 0.6610 | +/- 0.433| 
| QDA | 0.7638 | +/- 0.392| 
| Random Forest | 0.5965 | +/- 0.376| 
| Gradient Boosting | 0.6581 | +/- 0.438| 
| Extra Trees | 0.6754 | +/- 0.435| 
| AdaBoost | 0.5565 | +/- 0.340| 


### Next Steps

- Look into the warning for gender 1 classification.
- The accuracy for gender 1 is suspiciously high, need to check each step to make sure there is no mistakes.
- Tune parameters for existing classifiers.
- Try new methods for both feature construction and classification.
- I have some doubts about the dimensionality reduction and train-test procedure.


### Code

| Question Type | Code |
|---------------|------|
| Exploratory, Predictive | [**``GenderDistinguished_ADHD_Bipolar_YatingJing.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/GenderDistinguished_ADHD_Bipolar_YatingJing.ipynb) |
