##GLMM analyses
##Load libraries required
library(glmm)
library(lme4)
library(lmerTest)
library(AICcmodavg)

##Load data base 
setwd("C:/Working Directory...")
base1<-read.table("base_categorias.csv", header = TRUE, sep = ';', stringsAsFactors = T)
names(base1)
str(base1)
summary(base1)

##Converting variables to factors
base1$ID<-factor(base1$ID)
base1$R<-as.numeric(base1$R)
base1$Protected<-factor(base1$Protegido)
base1$Climate<-factor(base1$Clima)
base1$Ecoregion<-factor(base1$Ecorregion)
base1$CodRegion<-factor(base1$CodRegion)
base1$PP_MM<-as.numeric(base1$PP_MM)
base1$ALT_MIN<-as.numeric(base1$ALT_MIN)
base1$ALT_MAX<-as.numeric(base1$ALT_MAX)
base1$CodRegion<-factor(base1$CodRegion)
str(base1)
names(base1)

##GLMM
##Richness Global Model
Rglobal <- glmer(R ~ Protected + Climate + Ecoregion + (1 | CodRegion), data = base1, family = poisson)
summary(Rglobal)
##By variable
##Protection status
Rprotection<- glmer(R ~ Protected + (1 | CodRegion), data = base1, family = poisson)
summary(Rprotection)
##climate region
Rclimate<- glmer(R ~ Climate + (1 | CodRegion), data = base1, family = poisson)
summary(Rclimate)
##ecoregion
Recoregion<- glmer(R ~ Ecoregion + (1 | CodRegion), data = base1, family = poisson)
summary(Recoregion)
##Akaike information criterion (AIC) to evaluate the best model. Replace the model you want to evaluated.
DeltaAIC<- as.data.frame(cbind("Model"= c("Rglobal","Rprotection", "Rclimate", "Recoregion"),"Delta.AIC"= c(0, AICc(Rprotection) - AICc(Rglobal), AICc(Rclimate) - AICc(Rglobal), AICc(Recoregion) - AICc(Rglobal))))
DeltaAIC$Delta.AIC <- as.numeric(DeltaAIC$Delta.AIC)
DeltaAIC$Delta.AIC <- round(DeltaAIC$Delta.AIC,2)                           
DeltaAIC

##Phylogenetic Diversity (PD). Replace PD with PE o FD
##Example: PD Global Model
##The Gaussian family is implicit in lmer function
PDgloba<- lmer(PD ~ Protected + Climate + Ecoregion + (1 | CodRegion), data = base1)
summary(PDglobal)
##By variable
##Protection status
PDprotection<- lmer(PD ~ Protected + (1 | CodRegion), data = base1)
summary(PDprotection)
##Clima region
PDclimate<- lmer(PD ~ Climate + (1 | CodRegion), data = base1)
summary(PDclimate)
##Ecoregion
PDecoregion<- lmer(PD ~ Ecoregion + (1 | CodRegion), data = base1)
summary(PDecoregion)
##Akaike information criterion (AIC) to evaluate the best model. Replace the model you want to evaluated.
AICPD <-as.data.frame(cbind("Model"= c("PDglobal","PDprotection", "PDclimate", "PDecoregion"),"Delta.AIC"= c(0, AICc(PDprotection) - AICc(PDglobal), AICc(PDclimate) - AICc(PDglobal), AICc(PDecoregion) - AICc(PDglobal))))
AICPD$Delta.AIC <- as.numeric(AICPD$Delta.AIC)
AICPD$Delta.AIC <- round(AICPD$Delta.AIC,2)                           
AICPD

##Generalized analysis of variance
##Load libraries requires
library(car)
##ANOVA of the coefficients of the models. Replace the model you want to evaluate. 
Anova(Rglobal, type = "II", test.statistic = "Chisq")
Anova(Rglobal)

