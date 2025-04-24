##Centroid Analysis
##Load libraries 
library(openxlsx)
##Load data base with coordinates information of every cell.
setwd("C:/Working Directory")
data<- read.table("coordinates.csv", header = TRUE, sep = ';', stringsAsFactors=FALSE)
data
head(data)
##Calculate the centroid of the data frame 'data' with the columns: left, top, right, bottom
data$center_x <- (data$left + data$right) / 2
data$center_y <- (data$top + data$bottom) / 2
#Check the results
print(data)
#Save the data frame to an Excel file
write.xlsx(data, "centroid_cordinates.xlsx")

##Moran I Test Analysis
##Load libraries required
library(spData)
library(spdep)
##Load data base with centroid coordinate and indices information of every cell. 
setwd("C:/Working Directory...")
data<- read.table("base_categorias.csv", header = TRUE, sep = ';', stringsAsFactors=FALSE)
head(data)
##Moran I Test
##Example: Richness (R)
#Create the neighbor matrix using the centroid coordinates
coord <- cbind(data$center_long, data$center_lat)
vecino <- knearneigh(coord, k = 4)
W <- nb2listw(knn2nb(vecino))
#Perform the Moran's I test
moran_result <- moran.test(data$R, W) ##Replace the index (R, PD, PE, FD) information you want to evaluate.
#View the test result
print(moran_result)