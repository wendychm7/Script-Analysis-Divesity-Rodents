##Analyze relationship between indices
##Load libriries required
library(nlme)
library(mgcv)

setwd("C:/Working Directory...")
##Load data base csv
data<- read.table("R_PD_PE_FD.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE)
attach(data)
data
str(data)
names(data)
##Analyze simple regression
R1<-lm(PD~R, data=data)
summary(R1)
plot (PD~R, pch=19, col="black", data=data)

R2<-lm(PE~R, data=data)
summary(R2)
plot (PE~R, pch=19, col="black", data=data)

R3<-lm(FDis~R, data=data)
summary(R3)
plot (FDis~R, pch=19, col="black", data=data)

R4<-lm(FDis~PD, data=data)
summary(R4)
plot (FDis~PD, pch=19, col="black", data=data)

R5<-lm(PE~PD, data=data)
summary(R5)
plot (PE~PD, pch=19, col="black", data=data)


