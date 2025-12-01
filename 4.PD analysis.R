#Load libraries requried
library(ape)
library(picante)
library(writexl)

#Working directory
setwd("C:/Working Directory...")

#Load phylogenetic tree
tree <- read.tree("treePD.nwk")
plot(tree)
is.rooted(tree)

#Load matriz data
matriz <- read.table("matriz1.csv", header = TRUE, sep = ";",
                     stringsAsFactors = FALSE, row.names = 1)

#Phylogenetic diversity (PD) observed
pd.obs <- pd(matriz, tree, include.root=TRUE)

#Null model:  Standard Effect Size (SES) of PD 
set.seed(123)
n.perm <- 999
pd.null <- matrix(NA, nrow = nrow(matriz), ncol = n.perm)

for (i in 1:n.perm) {
  matriz.perm <- matriz
  colnames(matriz.perm) <- sample(colnames(matriz.perm))
  
  pd.iter <- numeric(nrow(matriz))
  
  for (j in 1:nrow(matriz)) {
    especies_pres <- colnames(matriz.perm)[matriz.perm[j, ] > 0]
    
    if (length(especies_pres) > 0) {
      sub.arbol <- drop.tip(tree, setdiff(tree$tip.label, especies_pres))
      pd.iter[j] <- sum(sub.arbol$edge.length, na.rm = TRUE)
    } else {
      pd.iter[j] <- NA
    }
  }
  pd.null[, i] <- pd.iter
}

#SES.PD
pd.mean <- apply(pd.null, 1, mean, na.rm = TRUE)
pd.sd   <- apply(pd.null, 1, sd, na.rm = TRUE)
ses.pd  <- (pd.obs$PD - pd.mean) / pd.sd

#P-value unilateral
p.valor <- rep(NA, nrow(pd.null))
for (i in 1:nrow(pd.null)) {
  null_dist <- sort(pd.null[i, ]) 
  obs <- pd.obs$PD[i]
  rank.obs <- sum(null_dist <= obs, na.rm = TRUE)
# p-value unilateral
  p.valor[i] <- rank.obs / (length(null_dist) + 1)
}

#Final table
resultado <- data.frame(PD.obs = pd.obs$PD,
                        PD.rand.mean = pd.mean,
                        PD.rand.sd = pd.sd,
                        ses.PD = ses.pd,
                        Pvalor = p.valor)





