## Progress Report - March 22nd, 2016
**Table of Contents:**
- [Overview](./progress_report.md#overview)
- [Scientific Questioning](./progress_report.md#scientific-questioning)
  - [Decriptive Analysis](./progress_report.md#descriptive-analysis)
  - [Exploratory Analysis](./progress_report.md#exploratory-analysis)
  - [Inferential Analysis](./progress_report.md#inferential-analysis)
  - [Predictive Analysis](./progress_report.md#predictive-analysis)
  - [Testing Assumptions](./progress_report.md#testing-assumptions)
  - [Next Steps](./progress_report.md#next-steps)
- [Methods](./progress_report.md#methods)
  - [Decriptive Analysis](./progress_report.md#descriptive-analysis-1)
  - [Exploratory Analysis](./progress_report.md#exploratory-analysis-1)
  - [Inferential Analysis](./progress_report.md#inferential-analysis-1)
  - [Predictive Analysis](./progress_report.md#predictive-analysis-1)
  - [Testing Assumptions](./progress_report.md#testing-assumptions-1)

----------

### Overview

Metal health problems have become an unneglectable issue affecting people's everyday life. Depression is as one of the most common mental disorders. Here we conducted various analysis on data extracted from brain SPECT images and diagnosis information, aiming to identify the depression based on observed symptoms.

### Scientific Questioning

Here we will discuss our analysis of this data, starting with exploratory and descriptive analysis, up to preliminary work on hypothesis testing and classification. The questions posed and their outcomes are described sequentially, with code and methods used to answer them described at the end of this report.


#### Descriptive Analysis

Our dataset consisted of approximately 7500 patient records and 754 features. However many patient records had missing or incomplete data. Once we dropped missing data and NaNs, our data was reduced to 2794 patient records. The features in the patient feature vectors can be broadly classified into four subjects:

1. Patient Information
2. Disorder diagnosis 
3. Questionnaire Responses
3. Baseline and Concentration rCBF values 

#### Exploratory Analysis

Our initial exploratory analysis consisted of just determining standard statistical values of different columns like the mean, max and min to see if there any obvious red flags. We also wanted to know the answers to questions that define significant populations in our data, like who are "healthy" people and just how many of them are there or who are the different types of people who participated in this study.<br/>

We found that there just about 50 healthy people out of the 7500 people who participated in the study. This is what we found: <br/>

 <img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/Studydata.png" />


Knowing that we have a large number of features (736), we want to find out if the features can be clustered.

We clustered all the raw features using K-Means clustering, no clear cluster boundaries showed up. But we are able to identify the existence of outliers, as shown in the figure below.

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/kmeans_all_samples.png" height="250" width="350" />

We reduce the dimension of the features by subjects. Specifically, we ran PCA on rCBF data and came up with 3 features that captures more than 99.9% variance. Then we ran Sparse PCA on disorder diagnosis and questionnaire data, reduce the number of features to 10 for both subjects. We kept four attributes for patient information. Therefore we end up with 27 features, which eliminates the dimensionality curse problem.


#### Inferential Analysis

We tried to find out if the features corresponding to depressed people and the features from people that do not have depression come from the same distribution. We use Kolmogorov-Smirnov Goodness-of-Fit Test on all 27 reduced features. The figure below is the plotted power curve on simulated data. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/inference_sim.png" width="300" />


#### Predictive Analysis

We used Leave-One-Out cross validation to train five different binary classifiers on the reduced features. We used Logistic Regression, K Nearest Neighbors, Support Vector Machine with Linear Kernel, Random Forest and Quadratic Discriminant Analysis. 

| Classifier | Accuracy | Standard Deviation |
|------------|----------|--------------------|
|Logistic Regression | 0.9653 | +/- 0.183 |
|K Nearest Neighbors | 0.5594 | +/- 0.496 |
|Support Vector Machine| 0.4882 | +/- 0.500 |
|Random Forest| 0.9649| +/- 0.184 |
|Quadratic Discriminant Analysis| 0.9624 | +/- 0.190|

We got very satisfying accuracy using LR, Random Forest and QDA classifiers. Further evaluation is conducted in the Methods section below.


#### Testing Assumptions

##### Independence 

The notion of independence of sampling for a dataset such as ours is a bit kludgy. Samples might not be independent if they have similar RCBF patterns or have similar disease profiles. Therefore in a set of mixed but reduced features we could reliably determine sample independence by examining the rows of the matrix formed by patient record.

By random sampling 27 patients around 1000 times and examining the rank of the matrix we can determine how many samples are not linearly independent of another sample. This can achieved by examining the rank of the matrix.

We found that less than 5% of our samples were not sampled independently.

##### Identical Test

For identical assumption test, we separate the positive (depressed) samples from the negative (non depressed) samples and analyze them independently.

We used Gaussian Mixture Model to test the identical assumption of the samples. The Bayesian information criterion scores are shown below. 
  
       Depressed BIC       |     Not Depressed BIC
:-------------------------:|:-------------------------:
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/BIC_depr.png" height="250" width="280" /> | <img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/BIC_not_depr.png" height="250" width="280" />

From the two figures above, we can see that the optimal numbers of clusters are 16 and 15 (at least), so our data may not have been sampled identically from one distribution. Therefore our identical sample assumption is false.


We used K-Means Clustering to test the identical assumption of the features. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/kmeans_reduced_feats.png" height="240" width="500" />

As shown in the figures above, the reduced depressed features and non-depressed features are not identical and both fall into four clusters, this is interesting since the features do have four semantically different subjects. Thus, we can conclude that our not identical features assumption is true.


#### Next Steps

We are going to look into the feature engineering step and see if we can come up with better features. We will also try to discover other interesting properties of data, for example, identify the underlying relationship between depression and other diseases.


### Methods


| Question Type | Code |
|---------------|------|
| Descriptive | [**``Descriptive_Exploratory_Answers.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/tree/master/Code/Assignment-3) |
| Exploratory | [**``Descriptive_Exploratory_Answers.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/tree/master/Code/Assignment-3) [**``Exploratory_Kmeans_PCA.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-3/Exploratory_Kmeans_PCA.ipynb)  |
| Inferential | [**``Inferential_Depressed.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-4/Inferential_Depressed.ipynb) |
| Predictive  | [**``PCA.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-5/PCA.ipynb)  [**``Classification_Simulation.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-5/Classification_Simulation.ipynb) | 
| Testing Assumptions | [**``test_assumptions.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-6/test_assumptions.ipynb) |


#### Descriptive Analysis
While answering Descriptive questions we were primarily trying to find out more about what our data even is. Since there were so many features and and so many clobbered patient records we had to clean our data before we started answering these questions. Once our data was cleaned and in the shape we need it to be we carried out basic exploratory analysis

#### Exploratory Analysis

Our exploratory analysis consisted of answering basic statistical questions about our data, this was invaluable in deciding what tests to use on our data and what paths to not explore when carrying out inferential and predictive analysis. The analysis is aimed to simplify the nature of data as to make the following advanced modeling procedure easier.


#### Inferential Analysis

Below is the result of Kolmogorov-Smirnov Goodness-of-Fit Test on our real data. All 27 features are tested. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/inference_pwrs.png" height="400" width="750" />

From the plotting above, null distribution and alternative distribution can be clearly identified on the real data. We can see that the 10 power curves corresponding to the 10 large p-values (> 0.05) have the shape of null distribution power curves, and for those features with small p-values, the power increases when more samples are used for the test.


#### Predictive Analysis

Below we compared the performance of five different classifiers on simulated data, where eventually all five models achieve high prediction accuracy. Note that SVM has the highest standard deviation. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_sim.png" height="250" width="450" />


When applied on the real data, the best classification accuracy on the test set is about 96.53%, yielded by the LR classifier. Random Forest and QDA classifier also give satisfying results, as shown in the figure below.

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf.png" height="250" width="300" />

In contrast to Random Forest and QDA, LR is intuitively simple while reasonably complex compared to some other naive or linear models, and most importantly it is robust to overfitting. 

KNN does not capture the importance of each feature, so its performance is expected.

For SVM, our data might be skewed, since it contains so much information, and can be divided into subsets and trained in parallel, SVM is inefficient in such scenario and thereby has the lowest classification accuracy.


#### Testing Assumptions

We made three types of assumptions here: samples are independent, samples are identical, features are not identical. For independence test, we examined sampled matrix rank, and the result suggests that our independent sample assumption is true.

For sample identical assumption, we used Gaussian Mixture Model and computed BIC scores. We chose spherical covariance type by computing BIC scores on simulated data. Then on the real data, we identified that the optimal numbers of clusters for positive and negative samples are both larger than one. So our samples are not identically distributed.

For feature not-identical assumption, we used K-Means clustering and end up with four clusters for both positive and negative sample sets. Therefore our features are not identically distributed.
