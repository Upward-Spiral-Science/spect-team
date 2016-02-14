## Questions About Our Project

Srinivas Suresh, Yating Jing, Katie Ross


### Assumptions and Notations

Each patient record is preprocessed into a numerical format (a 1-D vector), denoted by X<sub>i</sub> (i = 1, 2, ..., n), the corresponding record of each patient consists of m features, X<sub>ij</sub> (j = 1, 2, ..., m). These vectors contain information about individual patient and details, results of clinical diagnosis, baseline and concentration task SPECT values for different parts of the brain.

We can extract a label (symptom or certain conclusion) for each patient record, denoted by y<sub>i</sub> (i = 1, 2, ..., n). 


### Descriptive

- What do the features in the vector indicate? What are they for? How are the feature values arrived at?
- What is the size of our training data? What is n, m?
- What kind of labels are we going to extract? What will be y<sub>i</sub>?
- What does the presence of null values in the feature vectors indicate? How should they be dealt with?
- Why are certain types of baseline values not applicable to certain individuals (NaN values)?


### Exploratory

- What is the mean, maximum and minimum for the various numerical features? Also how do these features scale?
- What is the range of values nominal features can take?
- Are the features correlated? 
- What is the sole metric that can be used to separate healthy people from unhealthy people?
- Are we able to identify outliers at this point?
 

### Inferential

- Can we learn the distribution of the features?
	
	*H<sub>A</sub> : x ~ N (μ, σ2) (assume Gaussian)*

	
	*H<sub>0</sub> : The density function f(x) cannot be identified.*

- Should we divide the features into groups and analyze their distributions separately?
  
  	*H<sub>A</sub> : The features can be clustered.*
  		
	*H<sub>0</sub> : The features cannot be clustered.*

- What degree of independence can we assume?
	
	*H<sub>A</sub> : P(x<sub>ij</sub>x<sub>ik</sub>) = P(x<sub>ij</sub>)P(x<sub>ij</sub>), j <> k, i = 1,...,n*
	
	*H<sub>0</sub> : P(x<sub>ij</sub>x<sub>ik</sub>) <> P(x<sub>ij</sub>)P(x<sub>ij</sub>), j <> k, i = 1,...,n*

- Can we reduce the dimensionality of each record X<sub>i</sub> (reduce m)? 
	- Can we find k most important features to construct our training data, where k is significantly smaller than m?
	
		*H<sub>A</sub> : ∃ k ∈ ℕ : k ≪ m*
	
		*H<sub>0</sub> : { ∃! k ∈ ℕ } ∪ { ∃ k ∈ ℕ : k ≈ m }*
	
- Can we identify features that correlate with incidence of mental illness in some samples but not in others?

	*H<sub>A</sub> : There exists features that correlate with incidence of mental illness in some samples.*
	
	*H<sub>0</sub> : The features do not correlate with illness incidence in any subset of our samples.*

	

### Predictive

- What are our prediction goals? What patterns do we want to learn from the data?
- Should we employ supervised or unsupervised learning in the initial stage?
- Can we build a classifier h to predict diseases given a feature vector that maps on to a patient record X<sub>i</sub>?

<p align="center">
<img src="https://github.com/Upward-Spiral-Science/spect-team/blob/master/Draft/equation.png" width="300" height="65"/>
</p>

- Can this classifier be used to predict the degree of unhealthiness? Or the nature of the disorder (eg: ADHD)?
- Can SPECT data also be used to discern if a particular method of medical treatment is effective and has an apparent effect on the RCBF values of an individual?


### Causal

- How does gender influence the probability of developing different disorders?
- How do factors like age and location influence the occurrence of mental illness? 


### Mechanistic

- How do the reactions observed in different areas of the brain influence the probability of developing different diseases?
- How does the probability of developing a disorder change if the patient is already diagnosed with other disorders?
