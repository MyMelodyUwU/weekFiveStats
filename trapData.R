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

trap.dat = read.table("trap.dat", header = TRUE)
str(trap.dat)

boxplot(counts ~ trap, data = trap.dat)

# Apply the analysis of variance on it
trap.aov <- aov(counts ~ trap, data = trap.dat)

anova(trap.aov)

summary(trap.aov)

plot(trap.aov)

hist(resid(trap.aov))

# apply the transformation shere

#ok fuck yh

boxplot(log2(counts) ~ trap, data = trap.dat)
head(trap.dat, n = 4)

# adding a 3rd column

trap.dat$log.counts = log2(trap.dat$counts)
head(trap.dat, n = 4)


# mean of log counts by trap
with(trap.dat, tapply(log.counts, trap, mean))

#this si to make a comparision of this shit
# standard deviation of log counts by trap
with(trap.dat, tapply(log.counts, trap, sd))

logtrap.aov <- aov(log.counts ~ trap, data = trap.dat)

plot(logtrap.aov)

# sample sizes of log counts by trap
with(trap.dat, tapply(log.counts, trap, length))

trap.aov = aov(counts ~ trap, data = trap.dat)
logtrap.aov = aov(log2(counts) ~ trap, data = trap.dat)
qqnorm(resid(trap.aov), main = "Regular ANOVA")
qqline(resid(trap.aov))
qqnorm(resid(logtrap.aov), main = "Log transformed ANOVA")
qqline(resid(logtrap.aov))

logaov = aov(log2(counts) ~ trap, data = trap.dat)
plot(logaov, which = 2)

anova(logaov)

head(trap.dat, n = 2)

# remove sqrt.counts
trap.dat$sqrt.counts = NULL
head(trap.dat, n = 2)

