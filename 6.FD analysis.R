##Analyze Functional Diversity (FD)
##Load libraries required
library(FD)
library(picante)
library(writexl)

setwd("C:/Working Directory...") 
# Load community matrix
comm <- read.csv2("Matrix.csv", header = TRUE, row.names = 1, check.names = FALSE)
str(comm)

#Load traits csv file
traits<- read.table("traits.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE, row.names = 1)
str(traits)
# Selecc only traits 
traits_fd <- traits[, c("Diet", "Habitat", "Behavior", "Body_mass", "Gestation_length", "Litter_size")]
# Convert categorical variables to factor
traits_fd$Diet <- factor(traits_fd$Diet)
traits_fd$Habitat <- factor(traits_fd$Habitat)
traits_fd$Behavior <- factor(traits_fd$Behavior)

##Nul model: Standard Effect Size (SES) of FD
distance.matrix<-gowdis(traits, asym.bin=NULL, ord="classic")
h<-hclust(distance.matrix)
func.tree<-as.phylo(h)
dis<-cophenetic(func.tree)
ses.fd.results<-ses.pd(comm,func.tree,null.model="independentswap",runs=999,iterations=1000)
ses.fd<-as.data.frame(ses.fd.results)

#Save results of ses.fd
write_xlsx(ses.fd, path = "SES.FD1.xlsx")











