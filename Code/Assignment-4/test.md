
Q1: State assumptions about your data

A1: We separated our data into healthy people and people with a single disorder (bu no other disorders) so we could examine if each disorder affect brain activity. We chose to examine healthy people and those with anxiety disorders, denoted as group A and group B respectively.

We use deltas of brain measurements (concentration values - baseline values) to represent physical properties of group A and group B.

We assume group A and group B are independent, and that the samples of group A and group B are representative of the greater population of healthy people and those with anxiety disorders. We do not assume either group necessarily follow a normal distribution.

Q2: formally define statistical test

A2: We define our null hypothesis as the statistical equality of the means of the two groups. The means are denoted as \mu_A and \mu_B respectively. We accept the null hypothesis when p-value is larger than 0.05.

H<sub>A</sub>: \mu_A != \mu_B

H<sub>O</sub>: \mu_A = \mu_B 


Q3: provide algorithm for implementing test

A3: We use Wilcoxon-Mann-Whitney test to compare the means of group A and group B. 

`for (i in names(healthy[-1])) {`<br/>`
	col1 = as.vector(healthy[,i])`<br/>`
    col2 = as.vector(anxious[,i])`<br/>`
    ans = wilcox.test(col1, col2, alternative="two.sided")`<br/>`
	p_vector = cbind(p_vector, ans[3])`<br/>`
}`



Q4. sample data from an element of the null model, and plot power vs. n (power should be at alpha) && Q5:sample data from an element of the alternative model, and plot power vs. n (power should increase to 1)

To plot these graphs we need a greater number of samples for each of the scenarios we wish to analyse. eg: Healthy people vs People with anxiety disorder etc. We would need some guidance on how to visualize power when n is so small




Q6: compute p-value on your real data

A6: Since the p-value for Cerebellum 7b = .02 < 0.05, we can interpret the result as the inequality of the means of group A and group B. In other words, healthy people and people with anxiety disorders come from distributions with different mean values for change in left cerebellum 7b activity between baseline and concentration values.


Q7: explain the degree to which you believe the result and why

A7: We must be aware that the result is based on a relatively small sample size (only 15 samples). We considered comparing people with only brain trauma, which had a larger sample size (36 samples), but decided to use anxiety disorders as group B because we do not know what part of the brain was affected during the trauma, and thus what delta values would be affected from the disorder or the trauma itself. We do know that people with anxiety disorders have abnormal blood flow in the basal ganglia (http://www.amenclinics.com/the-science/spect-gallery/anxiety/), which is responsible for movement and coordination, just as is the cerebellum. Because the Wilcoxon-Mann-Whitney test is more robust, it is less likely to falsely report significance than would be the t-test. Thus, we can be fairly certain our results reflect a true difference in delta values for healthy people and those with anxiety disorders.
