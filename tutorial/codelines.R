# Some code lines for running fieldTrip functions
# Change the input and output path and files C:/.../

help(package = fieldTRip)

library(fieldTRip)
prwater(20, 800, -0.4, 4000, 10000, 200)

library(fieldTRip)
data <- read.table("C:/.../infiltr.txt", header=T, check.names = F, stringsAsFactors = F)
i_f <- 10 
horton(data,i_f)
greenampt(data)

library(fieldTRip)
data <- read.table("C:/.../section.txt", header=T, check.names = F, stringsAsFactors = F)
gaugeph(data, 23.03, 0.015, 0.035)

