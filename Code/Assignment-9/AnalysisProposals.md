### Proposals for further analysis
Application of traditional dimensionality reduction techniques like PCA, did not yield data that could be classified easily. Therefore we attempted manifold techniques like Isomaps and Multi-dimensional scaling. This resulted in data that had a lot fewer dimensions but was still pretty noisy. I did not have nay better results after throwing out the eyeballed rCBF scores and the survey responses.

This has led me to conclude that the rCBF values are just way too noisy for any classifier to work significantly better than chance.

Therefore I decided I need to look up medical literature on how certain disorders affect different portions of the brain. This would enable me to drop columns that do not really serve any purpose at all and are only noise

1. Going through [This Paper](http://www.amenclinics.com/the-science/spect-gallery/attention-deficit-disorder-addadhd/) it became apparent that SPECT data only identified ADHD patients when they performed a concentration task, therefore the baseline baseline values treat them as healthy individual. Therefore I propose analysis after throwing out the baseline values

2. A section of the brain, the basal ganglia, in various clinical studies, like the one [here](http://ajp.psychiatryonline.org/doi/pdf/10.1176/appi.ajp.163.2.276) and [here](http://www.amenclinics.com/the-science/spect-gallery/attention-deficit-disorder-addadhd/), is inflamed in people with Bipolar disorder but experiences reduced blood flow in people with ADHD. Therefore I propose throwing out concentration values that do not pertain to the sections of the brain that constitute the basal ganglia

3. Carry out clustering and classification experiments on the reduced data, examine the outcome

4. This confirmatory analysis will then allow us to now mix and match new columns to see what other potential differentiators of ADHD and Bipolar disorder exist in the concentration values

5. Based on what we find we can then draw conclusions about whether SPECT can be used to differentiate ADHD and Bipolar