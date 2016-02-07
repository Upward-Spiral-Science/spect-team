## Insights from SPECT Imaging

Srinivas Suresh, Yating Jing


### Opportunity

SPECT imaging is an invaluable new tool for psychiatry and medical assessment of mental illness that would enable psychiatrists to give a more precise diagnosis about what mental conditions a patient suffers from and recommend the best treatment<sup>\[1\]</sup>

SPECT has clinical value in the diagnosis, therapeutic management, and follow-up of patients. The diversity of central nervous system diseases and the still incomplete knowledge of the mechanisms that underlie them have contributed to the success of brain perfusion SPECT as a research tool in neurosciences<sup>[2]</sup>.

To study and draw conclusions about a mental health of a patient from SPECT data would allow doctors to more speedily diagnose a patient and not subject them to individual clinical tests for various mental illnesses.


### Significance

Approximately 1 in 5 adults in the U.S.—43.8 million, or 18.5%—experiences mental illness in a given year<sup>[3]</sup>. Approximately 1 in 25 adults in the U.S.—10 million, or 4.2%—experiences a serious mental illness in a given year that substantially interferes with or limits one or more major life activities<sup>[4]</sup>. The regional Cerebral Blood Flow(rCBF) patterns in the brain's Regions of Interest(ROI) are often key factors when it comes to assessing how normallly the brain is functioning and this data will help treat patients of a mental illness or traumatic brain injury.

SPECT imaging is a useful technique for observing rCBF patterns and studying the relation between various factors (e.g. gender and age) and different disorders. Accurate knowledge of the physiologic and pathophysiologic basis of brain perfusion SPECT, together with the appropriate technique and careful interpretation of images and reporting, will enhance the clinical use of brain SPECT<sup>[2]</sup>.

Many studies<sup>[5]</sup> show that SPECT differences are identified between individuals with varying levels of anxiety, mania severity, aggression level, dementia differences and so forth. 


### Feasibility

SPECT heart dataset<sup>[6]</sup> is available online and several machine learning algorithms<sup>[7]</sup> have been explored on this dataset. We have open source libraries available: scikit-learn for machine learning and OpenCV for computer vision, so we can handle both the original scans and preprocessed numerical data.


### Innovation

Most of the case studies are based on small sets of patient records, such as the SPECT heart dataset. For this project, we have access to several thousands of high resolution SPECT scan images, as well as their preprocessed numerical data. Compared with many latest experiments, the abundant, well preprocessed and organized data gives us more options of machine learning algorithms to consider. Additionally, given the large dimension of each patient record, we can consider experimenting with different types of dimensionality reduction methods such as PCA, LLE, etc.


### Reference

[1] [Why Psychiatry Needs to Add Brain SPECT Imaging, Especially in Complex Cases](http://articles.mercola.com/sites/articles/archive/2012/10/28/psychiatry-needs-spect-imaging.aspx)

[2] [Brain SPECT in Clinical Practice. Part I: Perfusion*](http://jnm.snmjournals.org/content/42/2/259.full)

[3] [National Alliance on Mental Illness](https://www.nami.org/Learn-More/Mental-Health-By-the-Numbers)

[4] [National Institute of Mental Health](http://www.nimh.nih.gov/health/statistics/prevalence/any-mental-illness-ami-among-us-adults.shtml)

[5] [A Collection of SPECT Research by Dr. Amen](http://danielamenmd.amenclinics.com/spect-research-introduction/spect-abstracts/peer-reviewed-scientific-papers-and-book-chapters/)

[6] [SPECT Heart Data Set](https://archive.ics.uci.edu/ml/machine-learning-databases/spect/SPECT.names)

[7] [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/support/SPECT+Heart)
