# Some code lines for running fieldTrip functions
# Change the input and output path and files C:/.../

help(package = fieldTRip)

library(fieldTRip)
data <- read.table("C:/.../seccion.txt")
gauges(data, L=4)

library(fieldTRip)
data <- read.table("C:/.../section.txt")
gaugeph(data, L=23.03, S=0.015, n=0.035)

library(fieldTRip)
data <- read.table("C:/.../infiltr.txt")
i_f <- 10 
horton(data,i_f)
greenampt(data)

library(fieldTRip)
prwater(ts=20, ps=800, lr=-0.4, z0=4000, zf=10000, dz=200)

library(fieldTRip)
nival(hs=1, ds=600, ts=-5, Fn=125)

library(fieldTRip)
wblake(A=0.5, P=0, E=0.4, Qi=23, Qo=1, R=0, K=5, L=2, H=-1, dt=1)
