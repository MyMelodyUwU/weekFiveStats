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

axial.dat = read.table("axial.txt", header = TRUE)
str(axial.dat)

boxplot(axial.dat$asi ~ axial.dat$treatment)

tapply(axial.dat$asi, axial.dat$treatment, sd)
# Finds all sd
# its bigger than 2
# the equal variance assumption is not satisfied


# Apply the analysis of variance on it
axial.aov <- aov(axial.dat$asi ~ axial.dat$treatment, data = axial.dat)

anova(axial.aov)

summary(axial.aov)

plot(axial.aov)

hist(resid(axial.aov))

# Nessary parameters

# H0 = when all means are equal || h1 == when all means are not equal

# F stat = 10.424

# We need to find the critical value

# Null dist F 4,30 NULL distribtuion

# Find p value From summary

# COnclusion F crit 2.68962757 <= F obs 10.424

# reject

TukeyHSD(axial.aov)


pV <- TukeyHSD(axial.aov)
pV

tquant = qt(1-0.005, 34);

tquant

