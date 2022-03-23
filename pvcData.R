library("tidyverse")
library("devtools")
library("glue")
library("dplyr")
library("stringr")
library("ggplot2")
library("knitr")
library("ggrepel")
library("patchwork")
library("janitor")
library("usethis")
library("roxygen2")
library("testthat")

pvcdat = read.csv("pvc.csv", header = TRUE)
str(pvcdat)
head(pvcdat)

boxplot(PVC ~ Drug, data = pvcdat, horizontal = TRUE,
        ylab = "Drug", main = "Number of PVC events in 24hours")

#check sd
sds <-  with(pvcdat, tapply(PVC, Drug, sd))


#Create anova table

pvc.aov <- aov(PVC ~ Drug, data = pvcdat)

plot(pvc.aov, which = 1:2)

means = with(pvcdat, tapply(PVC, Drug, mean))
points(means, 1:3, pch = 4) # Add means to plot

means = with(pvcdat, tapply(PVC, Drug, mean))
ns = with(pvcdat, tapply(PVC, Drug, length))
pvcsummary = data.frame(n = ns, mean = means, sd = sds)
pvcsummary

pvc.aov = aov(PVC ~ Drug, data = pvcdat)
plot(pvc.aov, which = 1)

boxplot(log(PVC + 0.01) ~ Drug, data = pvcdat, horizontal = TRUE,
        ylab = "Drug", main = "Number of log(PVC + 0.01) events in 24hours")
logmeans = with(pvcdat, tapply(log(PVC + 0.01), Drug, mean))
points(logmeans, 1:3, pch = 4) # Add means to plot)


logpvc.aov = aov(log(PVC + 0.01) ~ Drug, data = pvcdat)
plot(logpvc.aov, which = 1:2)
