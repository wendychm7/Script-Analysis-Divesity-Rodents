##Analyze Phylogenetic Endemism (PE)
##Load libraries required
library(phyloregion)
library(picante)
library(ape)

setwd("C:/Working directory...") 

##Load phylogenetic tree
tree<- read.tree("tree.nwk")
plot(tree)
names(tree)

##Load matrix data frame
matrix1<- read.table("matrix1.csv", header = TRUE, sep = ';', stringsAsFactors = FALSE,row.names=1)
matrix1
names(matrix1)

#PE Observed
pe_obs <- phylo_endemism(matrix1, tree)
pe_obs_vector <- as.numeric(pe_obs)

##Null Model: Standard Effect Size (SES) of PE
set.seed(123)
n.perm <- 999
pe.null <- matrix(NA, nrow = nrow(matrix1), ncol = n.perm)

for (i in 1:n.perm) {
  matriz.perm <- matrix1
  colnames(matriz.perm) <- sample(colnames(matriz.perm))  # Permutar identidad
  
  # Calculate PE with all the cells
  pe_null_i <- tryCatch({
    phylo_endemism(matriz.perm, tree)
  }, error = function(e) rep(NA, nrow(matrix1)))
  
  pe.null[, i] <- as.numeric(pe_null_i)
  
  cat("Iteración", i, "completada. NA en", sum(is.na(pe_null_i)), "celdas\n")
}
  
 
#SES.PE
pe.mean <- apply(pe.null, 1, mean, na.rm = TRUE)
pe.sd <- apply(pe.null, 1, sd, na.rm = TRUE)
ses.pe <- (as.numeric(pe_obs) - pe.mean) / pe.sd

# p-valor unilateral
p.valor <- sapply(1:nrow(matrix1), function(i) {
  null_dist <- pe.null[i, ]
  obs <- as.numeric(pe_obs)[i]
  mean(null_dist >= obs, na.rm = TRUE)
})

# Final table
resultado <- data.frame(
  ID_celda = rownames(matrix1),
  PE_obs = as.numeric(pe_obs),
  PE_rand_mean = pe.mean,
  PE_rand_sd = pe.sd,
  SES_PE = ses.pe,
  Pvalor = p.valor
)








