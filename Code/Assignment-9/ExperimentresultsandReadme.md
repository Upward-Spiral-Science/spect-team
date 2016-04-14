## Independent Analysis Summary - Srini Suresh

Over the past 2 weeks I've experimented with a few different things

1. Looking the GSC, BSC and LDS surveys and deciding how I can manually reduce dimensionality
2. Examining the results of clustering and classification of the data post manuak dimensionality reduction followed by traditional whitened PCA<br/>
This by and large proved unfruitful as the classifiers were terrible and did not do any better than chance <br/>
3. I then tried using a more advanced dimensionality reduction technique. I experimented with
	1. Isomaps
	2. Multidimensional Scaling
I decided to go with isomaps because they were faster and MDS did not offer any benefits.
4. The classifiers still did not do any better than chance. This led me to draw 2 conclusions
	1. Classifier performance can be tweaked by throwing out noisy records
	2. Classifier performance can be tweaked by reading SPECT literature and selecting features manually
5. Approach 1 highlighted above yielded fantastic results for gender, analysed extensively by my team mate and by existsing SPECT studies. My own analysis on race also yielded similar results.
6. Approach 2 so far has not yielded any positive results when I attempted to choose only the rCBF values corresponding to basal ganglia. 

These Analysis can be found here<br/>
1. [Analyis 1](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/Independent%20Analysis.ipynb)
2. [Analysis 2](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/Independent%20Analysis-2.ipynb)
3. [Analysis 3](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/Independent%20Analysis-3.ipynb)
4. [Subject Selection Analysis](https://github.com/Upward-Spiral-Science/spect-team/blob/master/Code/Assignment-9/SubjectSelectionExperiments.ipynb)

Todo
1. Look at feature selection algorithms and implement them
2. Learn more about SPECT literature and answer more questions