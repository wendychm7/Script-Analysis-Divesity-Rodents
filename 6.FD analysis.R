##Analyze Functional Diversity (FD)
##Load libraries required
library(FD)
library(xlsx)
setwd("C:/Working Directory...") 
#Load traits csv file
trait<- read.table("traits.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE)
trait 
names(trait)
data<-trait[,2:4]
data
##Euclidian distance between pairs of species
ztrait<-scale(data, center=TRUE, scale= TRUE)
trait_distance=as.matrix(dist(ztrait))
ztrait
##Save data trait Euclidian distance
write.xlsx(ztrait, "ztrait.xlsx")
##Load ztrait data csv
traitFD<- read.table("ztrait.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE,row.names=1)
names(traitFD)
traitFD
##load matrix wihtout cero 
matriz<- read.table("matrixwithoutcero.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE,row.names=1)
names(matriz)
matriz
##FD##
FD<-dbFD(traitFD, matriz)
FD
#Save FD data excel
write.xlsx(FD, "FD.xlsx")








