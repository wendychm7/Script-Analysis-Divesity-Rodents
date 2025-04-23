##Build data matrix to analyze Phylogenetic Diversity (PD) and Phylogenetic Endemism (PE)
##Load required libraries
library(readxl)
library(tidyverse)

##Read the CSV file data contained in the cell ID by species
setwd("C:/Working Directory...")
matrix<-read.table("count_specie.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE)
str(matrix)

##Use the pivot_wider() function to transform the data
matrix1 <- matrix %>% pivot_wider(names_from = specie, values_from = count, values_fill = 0)

#save the matrix to csv file
write.csv2(matrix1, "matrix-presence-absence.csv", row.names = FALSE)
