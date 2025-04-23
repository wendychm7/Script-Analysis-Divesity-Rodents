##Analyze Phylogenetic Endemism (PE)
##Load libraries required
library(phytools)
library(maps)
library(ape)
library(phyloregion)
library(xlsx)

setwd("C:/Working directory...") 
##Load phylogenetic tree
tree<- read.tree("tree.nwk")
plot(tree)
names(tree)
##Load matrix data frame
matrix1<- read.table("matrix1.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE,row.names=1)
matrix1
names(matrix1)
##Convert to numeric matrix##
matrix<-as.matrix(matrix1)
summary(matrix)
names(matrix)
##Analize Phylogenetic Endemism (PE)
PE<- phylo_endemism(matrix, tree, weighted=TRUE)
PE
##Extrac data of PE
write.xlsx(PE, "pe.result.xlsx")






