##Analyze Phylogenetic Diversity (PD)
##Load libraries required
library(phytools)
library(maps)
library(ape)
library(picante)
library(xlsx)
setwd("C:/Working Directory...")
##Load phylogenetic tree
tree<-read.tree("TreePD.nwk")
plot(tree1)
#Load matrix data
X2<- read.table("matriz1.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE,row.names=1)
X2
summary(X2)
##Determine Phylogenetic diversity (PE)
pd.result <- pd(X2, tree, include.root=TRUE)
pd.result
##Extract data of richness and PD
write.xlsx(pd.result, "PD_R.xlsx")




