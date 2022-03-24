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

# Apply the analysis of variance on it
axial.aov <- aov(axial.dat$asi ~ axial.dat$treatment, data = axial.dat)

anova(axial.aov)

summary(axial.aov)

plot(axial.aov)

hist(resid(trap.aov))
