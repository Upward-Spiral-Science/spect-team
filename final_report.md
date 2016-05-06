### Insights from SPECT Imaging
***Srini Suresh*** <br/>
***Yating Jing*** <br/>
May 5<sup>th</sup>, 2016

-------

**Table of Contents:**
- [Overview](./final_report.md#overview)
- [Scientific Questioning](./final_report.md#scientific-questioning)
  - [Decriptive Analysis](./final_report.md#descriptive-analysis)
  - [Exploratory Analysis](./final_report.md#exploratory-analysis)
  - [Inferential Analysis](./final_report.md#inferential-analysis)
  - [Predictive Analysis](./final_report.md#predictive-analysis)
  - [Testing Assumptions](./final_report.md#testing-assumptions)
  - [Extended Exploratory Analysis](./final_report.md#extended-exploratory-analysis)
  - [Dimensionality Reduction](./final_report.md#dimensionality-reduction)
- [Methods](./final_report.md#methods)
  - [Decriptive Analysis](./final_report.md#descriptive-analysis-1)
  - [Exploratory Analysis](./final_report.md#exploratory-analysis-1)
  - [Inferential Analysis](./final_report.md#inferential-analysis-1)
  - [Predictive Analysis](./final_report.md#predictive-analysis-1)
  - [Testing Assumptions](./final_report.md#testing-assumptions-1)
  - [Extended Exploratory Analysis](./final_report.md#extended-exploratory-analysis-1)
  - [Dimensionality Reduction](./final_report.md#dimensionality-reduction-1)

----------

### Overview
Diagnosing a mental illness is difficult and often many illnesses are misdiagnosed causing further mental anguish to people with mental illness. SPECT -Single Photon Emission Computed Tomography provides a possible solution. By injecting a radioiotope into the brain's bloodstream, the diffusion patterns can help diagnose mental illness

### Scientific Questioning
Here we will discuss our analysis of this data, starting with exploratory and descriptive analysis, up to preliminary work on hypothesis testing and classification. The questions posed and their outcomes are described sequentially, with code and methods used to answer them described at the end of this report.<br/>
Our scientific questioning consisted of answering two questions<br/>

1. Can Depressed people be separated from not non depressed people?
2. Can ADHD patients be separated from people who have Bipolar disorder?

Since 2 separate studies werre carries out, each study has its own section in each analysis.

#### Descriptive Analysis
##### Common to both studies
Our dataset consisted of approximately 7500 patient records and 754 features. However many patient records had missing or incomplete data. Once we dropped missing data and NaNs, our data was reduced to 2794 patient records. The features in the patient feature vectors can be broadly classified into four subjects:

1. Patient Information
2. Disorder diagnosis
3. Questionnaire Responses
3. Baseline and Concentration rCBF values

##### ADHD vs Bipolar
For individual studies about ADHD and Bipolar patients, we threw out the disorder data and a lot of Questionnaire responses. This in conjunction with various feature selection strategies resulted in approximately 1000 ADHD patients to compare against approximately 300 Bipolar patients.

#### Exploratory Analysis
##### Depressed vs Not Depressed
Our initial exploratory analysis consisted of just determining standard statistical values of different columns like the mean, max and min to see if there any obvious red flags. We also wanted to know the answers to questions that define significant populations in our data, like who are "healthy" people and just how many of them are there or who are the different types of people who participated in this study.<br/>

We found that there just about 50 healthy people out of the 7500 people who participated in the study. This is what we found: <br/>

 <img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/Studydata.png" />

 Knowing that we have a large number of features (736), we want to find out if the features can be clustered.

We clustered all the raw features using K-Means clustering, no clear cluster boundaries showed up. But we are able to identify the existence of outliers, as shown in the figure below.

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/kmeans_all_samples.png" height="250" width="350" />

We reduce the dimension of the features by subjects. Specifically, we ran PCA on rCBF data and came up with 3 features that captures more than 99.9% variance. Then we ran Sparse PCA on disorder diagnosis and questionnaire data, reduce the number of features to 10 for both subjects. We kept four attributes for patient information. Therefore we end up with 27 features, which eliminates the dimensionality curse problem.

##### ADHD vs Bipolar
Based on how initially cleaned the data and how we performed dimensionality reduction we had a varying number of samples with varying feature vector length.

1. Separating ADHD and Bipolar patients from everyone else, throwing out NA values and performing PCA after whitening the data - **1430(1101 ADHD, 329 Bipolar) samples with 25 features**
2. Separating ADHD and Bipolar patients, throwing out the survey responses and NA values, performing Multi dimensional scaling and ISOMAP reduction - **1823(1383 ADHD, 440 Bipolar) with 20 features**
3. Performing Feature Engineering throwing all features except that of the Basal ganglia - **3163(2370 ADHD, 793 Bipolar) with 6 features**
4a. Performing Subject Engineering throwing out all women from the mix and retaining disorder diagnosis booleans with ISOMAP reduction - **1313 (1056 ADHD, 257 Bipolar) with  20 features**
4b. Performing Subject Engineering by throwing out all non Caucasians from the mix and retaining disorder diagnosis booleans with ISOMAP reduction - **1433(1110 ADHD, 323 Bipolar) with 20 features**
5. Performing univariate feature selection techniques after throwing out everything but rCBF values - **1169(946 ADHD, 223 Bipolar) with the 5 most varying features**
6. Performing more powerful feature eleimination in the form of recursive cross validated feature eleimination - **1169(946 ADHD, 223 Bipolar) with just 1 feature capturing most of the variance**

No real clustering was apparaent under any form of clustering technique we tried - Mean Shift, and K-Means
#### Inferential Analysis
##### Depressed vs Not Depressed
We tried to find out if the features corresponding to depressed people and the features from people that do not have depression come from the same distribution. We use Kolmogorov-Smirnov Goodness-of-Fit Test on all 27 reduced features. The figure below is the plotted power curve on simulated data. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/inference_sim.png" width="300" />

##### ADHD vs Bipolar
We tried to corroborate existing literature about ADHD and Bipolar studies with SPECT and try to find out if we can infer the same findings from the SPECT data. Our experiments were by and large incocnlusive.

#### Predictive Analysis
##### Depressed vs Not Depressed
We used Leave-One-Out cross validation to train five different binary classifiers on the reduced features. We used Logistic Regression, K Nearest Neighbors, Support Vector Machine with Linear Kernel, Random Forest and Quadratic Discriminant Analysis. 

| Classifier | Accuracy | Standard Deviation |
|------------|----------|--------------------|
|Logistic Regression | 0.9653 | +/- 0.183 |
|K Nearest Neighbors | 0.5594 | +/- 0.496 |
|Support Vector Machine| 0.4882 | +/- 0.500 |
|Random Forest| 0.9649| +/- 0.184 |
|Quadratic Discriminant Analysis| 0.9624 | +/- 0.190|

We got very satisfying accuracy using LR, Random Forest and QDA classifiers. Further evaluation is conducted in the Methods section below.

##### ADHD vs Bipolar
We again used Leave One Out Cross validation for some of our studies.
But unfortunately most of the time our classifiers performed hardly bettere than chance when tested on only the rCBF data.

We did however see phenomenal increases in classifier performance when including the disorder diagnosis booleans

**Chance value is approximately 75%**<br/>
*There is a little space above the second plot on purpose to not let the bar plots fill the whole graph*<br/>

**Without including disorder booleans**<br/>
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/Classifier_Sample1.png"/><br/>
**Including disorder booleans**<br/>
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/Classifier_sample2.png"/><br/>

#### Testing Assumptions
##### Depressed vs Not Depressed
##### Independence test
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

##### ADHD vs Bipolar
We have not yet tested assumptions for ADHD vs Bipolar experiments.

#### Next Steps
We implemented the next steps we suggested in our project's interim report. However we were unable to find anything substantial which strongly leads us to believe that there is no corellation betweeen SPECT data and metnal diagnosis. 

### Methods

##### Depressed vs Not Depressed
| Question Type | Code |
|---------------|------|
| Descriptive | [**``Descriptive_Exploratory_Answers.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/tree/master/Code/Assignment-3) |
| Exploratory | [**``Descriptive_Exploratory_Answers.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/tree/master/Code/Assignment-3) [**``Exploratory_Kmeans_PCA.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-3/Exploratory_Kmeans_PCA.ipynb)  |
| Inferential | [**``Inferential_Depressed.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-4/Inferential_Depressed.ipynb) |
| Predictive  | [**``PCA.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-5/PCA.ipynb)  [**``Classification_Simulation.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-5/Classification_Simulation.ipynb) | 
| Testing Assumptions | [**``test_assumptions.ipynb``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-6/test_assumptions.ipynb) |

##### ADHD vs Bipolar
#### Depressed vs Not Depressed
Our studies for ADHD vs Bipolar were a  set of independent experiments over 6 weeks

| Question Type | Code |
|---------------|------|
| Initial Experiments | [**``Independent Analysis-1``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-8/Independent%20Analysis.ipynb) [**``Independent Analysis-2``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-8/extended_analysis_ADHD_Bipolar_yatbear.ipynb)|
| Advanced Dimensionality reduction | [**``Independent-Analysis-3``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/Independent%20Analysis.ipynb) [**``Independent-Analysis-4``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/GenderDistinguished_ADHD_Bipolar_YatingJing.ipynb)|
| Feature Engineering | [**``Feature-Engineering``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/Independent%20Analysis-3.ipynb) |
| Subject Selection | [**``Subject-Selection``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/SubjectSelectionExperiments.ipynb) |
| Feature Selection | [**``Feature Selection-1``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-10/FeatureSelection_SubjectSelectionExperiments.ipynb) [**``Feature Selection-2``**](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-11/AdvancedFeatureSelection.ipynb)|
#### Descriptive Analysis
While answering Descriptive questions we were primarily trying to find out more about what our data even is. Since there were so many features and and so many clobbered patient records we had to clean our data before we started answering these questions. Once our data was cleaned and in the shape we need it to be we carried out basic exploratory analysis

#### Exploratory Analysis

Our exploratory analysis consisted of answering basic statistical questions about our data, this was invaluable in deciding what tests to use on our data and what paths to not explore when carrying out inferential and predictive analysis. The analysis is aimed to simplify the nature of data as to make the following advanced modeling procedure easier.

Additionally we also explored different forms of dimensionality reduction,clustering, feature selection and enginnering.

#### Inferential Analysis
##### Depressed vs Not Depressed
Below is the result of Kolmogorov-Smirnov Goodness-of-Fit Test on our real data. All 27 features are tested. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/inference_pwrs.png" height="400" width="750" />

From the plotting above, null distribution and alternative distribution can be clearly identified on the real data. We can see that the 10 power curves corresponding to the 10 large p-values (> 0.05) have the shape of null distribution power curves, and for those features with small p-values, the power increases when more samples are used for the test.

##### ADHD vs Bipolar
Since our other inferential experiments were going noweher we attempted to find out if we could infer well known data about ADHD and Bipolar disorder from existsing SPECT studies. The details of this confirmatory inferential analysis are detailed [here](https://raw.githubusercontent.com/Upward-Spiral-Science/spect-team/master/Code/Assignment-9/AnalysisProposals.md)

#### Predictive Analysis
#### Depressed vs Not Depressed
Below we compared the performance of five different classifiers on simulated data, where eventually all five models achieve high prediction accuracy. Note that SVM has the highest standard deviation. 

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf_sim.png" height="250" width="450" />


When applied on the real data, the best classification accuracy on the test set is about 96.53%, yielded by the LR classifier. Random Forest and QDA classifier also give satisfying results, as shown in the figure below.

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/clf.png" height="250" width="300" />

In contrast to Random Forest and QDA, LR is intuitively simple while reasonably complex compared to some other naive or linear models, and most importantly it is robust to overfitting. 

KNN does not capture the importance of each feature, so its performance is expected.

For SVM, our data might be skewed, since it contains so much information, and can be divided into subsets and trained in parallel, SVM is inefficient in such scenario and thereby has the lowest classification accuracy.

##### ADHD vs Bipolar
There exists a silver lining. When we ran our classifiers after dimensionality reduction with locally linear embedding in an attempt to separate ADHD and Bipolar patiensts after separating them on the basis of gender we saw that QDA performs significantly well!<br/>

<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/figs/Classifier_Sample3.png"/><br/>

This would have to be further investigated.

#### Testing Assumptions
##### Depressed vs Not Depressed
We made three types of assumptions here: samples are independent, samples are identical, features are not identical. For independence test, we examined sampled matrix rank, and the result suggests that our independent sample assumption is true.

For sample identical assumption, we used Gaussian Mixture Model and computed BIC scores. We chose spherical covariance type by computing BIC scores on simulated data. Then on the real data, we identified that the optimal numbers of clusters for positive and negative samples are both larger than one. So our samples are not identically distributed.

For feature not-identical assumption, we used K-Means clustering and end up with four clusters for both positive and negative sample sets. Therefore our features are not identically distributed.