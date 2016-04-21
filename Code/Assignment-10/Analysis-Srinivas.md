## Analysis Summary  - Srinivas

1. What analysis did you explore this week?
	a. Feature selection with univariate feature selection
    b. Mixing and matching data from last week
2. What sort of analysis did you do to corroborate last week's data?
	
	I ran the same analysis again on only rCBF and only disorder data. I found that the results of last week were high only because rCBF was corroborated by the disorder data. rCBF by itself does a fairly poor joob of classification. Howevr my teammate had some success with local linear embedding. Therfore this path maybe worth exploring.
    
3. What feature selection strategy did you use?
	I used univariate feature selection selecting the 5 best and most variant features from the data. I used an inbuilt routine to do this.

4. Did you process the data in any other manner?
	Yes. I carried out classification experiments on the reduced features with and without scaling.

5. What did you find?
	The classifiers were still no better than chance.

6. What are your next steps?
	Use LLE to establish a working result and then explore feature selection and engineering to see if performance can be improved