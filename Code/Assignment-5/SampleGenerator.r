file = data.frame(read.csv("not_depressed.csv"))
n = 5000
sample = sample(file[,1], 5000, replace=TRUE)
val = 0
for (name in names(file)[-1]) {		
	x = sample(file[, name], n, replace=TRUE)
	sample = cbind(sample, x)
}
sample = rbind(names(file), sample)
write.csv(sample, "haha.csv")