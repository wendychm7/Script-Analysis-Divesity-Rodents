##GLMMPQL Analysis
##Load libraries required
library(MASS)
library(ape)
library(ncf)
library(spdep)
library(nlme)
library(sf)
library(lme4)
##Load database with information on indeces and environmental variables for each cell. 
setwd("C:/Working Directory...")
base<- read.table("base_categorias.csv", header = TRUE, sep = ';', stringsAsFactors=FALSE)
str(base)
##Converting variables to numbers or factors
base$ID<-factor(base$ID)
base$R<-as.numeric(base$R)
base$Protected<-factor(base$Protected)
base$Climate<-factor(base$Climate)
base$Ecoregion<-factor(base$Ecoregion)
base$CodRegion<-factor(base$CodRegion)
base$PP_MM<-as.numeric(base$PP_MM)
base$ALT_MIN<-as.numeric(base$ALT_MIN)
base$ALT_MAX<-as.numeric(base$ALT_MAX)
str(base)
##interaction model
##Richness species, family=poisson
modelR<-glmmPQL(R ~ PP_MM * TMED,random = list(~1|CodRegion),correlation=corExp(form=~center_lat+center_long),family = poisson, data= base)
summary(modelR)
##Phylogenetic Diversity, family=gaussian. Replace the index (PD, PE or FD) you want to evaluate.
modelPD<-glmmPQL(PD ~ PP_MM * TMED,random = list(~1|CodRegion),correlation=corExp(form=~center_lat+center_long),family = gaussian, data= base)
summary(modelPD)

##Generalized analysis of variance
##Load libraries requires
library(car)
##ANOVA of the coefficients of the models. Replace the model you want to evaluate. 
Anova(modelR, type = "II", test.statistic = "Chisq") ##Replace the model your want to evaluate (PD, PE, FD). 
Anova(modelR)

##Three-dimensional graphic
##Load libraries required
library(lattice)
##Create a value grid
PP_MM_seq <- seq(min(base$PP_MM), max(base$PP_MM), length.out = 100)
TMED_seq <- seq(min(base$TMED), max(base$TMED), length.out = 100)
##Create all possible combinations of PP_MM and TMED
grid <- expand.grid(PP_MM = PP_MM_seq, TMED = TMED_seq)
#Predict values using the model R, PD, PE or FD
grid$predicted_R <- predict(modelR, newdata = grid, level = 0)
wireframe(predicted_R ~ PP_MM * TMED, data = grid, 
          scales = list(arrows = FALSE),
          drape = TRUE, colorkey = TRUE,
          screen = list(z = -60, x = -60),
          xlab = list(expression("PP MM"), rot = 0, x = 0.4, y = 0.55),
          ylab = "TMED",
          zlab = list(expression("R"), rot = 0, x = 0.5, y = 0.48))

