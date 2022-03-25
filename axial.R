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

axial_new = read.table("axial.txt", header = TRUE)
is.data.frame(axial_new)

#Change vectore value
axial_new[3,1] = 310.0

#'
# i <- 1
# while(i <= 35) {
#   #print(axial_new$asi[i]);
#   axial_new$asi[i] <- axial_new$asi[i] * 10
#   i <- i + 1
# }

axial_new[,1] = axial_new[,1] * 10

axial_new

axial_sub = subset(axial_new, axial_new$treatment == "4in" | axial_new$treatment == "6in")
axial_sub

# axial_sub = subset(axial_new, treatment %in% c("4in", "6in"))
# axial_sub

unique(axial_sub[,2])

write.table(axial_sub, file = "axial_sub.txt")

