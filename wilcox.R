dietdat = read.table("diet.dat", header = TRUE)
head(dietdat)

wilcox.test(gain ~ diet, data = dietdat, exact = FALSE)

#lower test
wilcox.test(gain ~ diet, alternative = "less",
            data = dietdat, exact = FALSE)

#higher test
wilcox.test(gain ~ diet, alternative = "greater",
            data = dietdat, exact = FALSE)

means = aggregate(gain ~ diet, mean, data = dietdat)
means

diet1 = with(dietdat, gain[diet == "Diet1"])
diet2 = with(dietdat, gain[diet == "Diet2"])
qqnorm(diet1, main = "Diet1"); qqnorm(diet2, main = "Diet2")


t.test(gain ~ diet, data = dietdat, var.equal=TRUE)

pvcmed = with(pvcdat, tapply(PVC, Drug, median))
pvcmed

boxplot(PVC ~ Drug, data = pvcdat)

kruskal.test(PVC ~ Drug, data = pvcdat)

