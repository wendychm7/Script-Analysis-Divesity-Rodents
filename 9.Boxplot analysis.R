##Boxplot analysis 
##Load data base that contain indices and climate, ecoregions and protected terrestrial areas information by cell.
setwd("C:/Working directory...")
base<-read.table("data-base.csv", header = TRUE, sep = ';', stringsAsFactors = T)
names(base)
str(base)
summary(base)

##Converting variables to numbers or factors
base$ID<-factor(base$ID)
base$R<-as.numeric(base$R)
base$protected<-factor(base$protected)
base$codregion<-factor(base$codregion)
base$PP_MM<-as.numeric(base$PP_MM)
base$ALT_MIN<-as.numeric(base$ALT_MIN)
base$ALT_MAX<-as.numeric(base$ALT_MAX)
str(bas)
names(bas)

##Boxplot analysis. Replace R with PD, PE o FD
##Example: Richness according to climate
##Reorder the levels of climate variables
RClima <- factor(base$Clima, levels = c("Arid","Template", "Polar"))
##Create the boxplot with the new order and colors
boxplot(R ~ Climate, data = base,
        xlab = "Climate regions",
        ylab = "Richness",
        col = c("goldenrod1", "chartreuse1", "royalblue4"),
        names = c("Arid", "Template", "Polar"))

##Example: Richness acording to ecoregion
##Reorder the levels of climate variables
REcoregion <- factor(base$Ecoregion, levels = c("Dessert","Puna", "Chilean Matorral", "Andean Steppe", "Valdivian Forests", "Maguellanic Forests", "Patagonian Steppe"))
##Create the boxplot with the new order and colors
boxplot(R ~ Ecoregion, data = base,
        xlab = "Ecoregions",
        ylab = "Richness",
        col = c("goldenrod1", "chartreuse4", "goldenrod4", "violetred", "chartreuse", "turquoise2", "royalblue3"),
        names = c("D", "P", "CM", "AS", "VF", "MF", "PS"))

##Example: Richness according to Protected terrestrial areas
boxplot(R ~ protected, data = base,
        xlab = "Protection status",
        ylab = "Richness",
        col = c("lightgray", "chartreuse4"),
        names = c("Not Protected", "Protected"))


