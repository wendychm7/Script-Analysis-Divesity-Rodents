##Shapefiles union and species counting per cell (species richness - R)
##Load required libraries
library(sf)
library(dplyr)

##Read the Shapefile that contains the union of all species polygons
species<- st_read("C:/Working Directory...UnionPolygons.shp")

##Read the Shapefile of the grid map
grid<- st_read("C:/Working Directory...Grid_Chile.shp")

##Perform spatial join to associate each grid cell with species 
join<- st_join(grid, species)

##Group by grid cell and species, and count the number of records
count_records<- join %>% group_by(id, specie) %>% summarise(count = sum(!is.na(specie)))
#save shp
st_write(count_records, "count_records.shp")

##Richness = count the number of species by id by grid cell
count_species<- join%>% group_by(id) %>% summarise(count = sum(!is.na(specie)))

#Save shp
st_write(count_species, "count_species.shp")
