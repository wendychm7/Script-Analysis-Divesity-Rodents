##Download the SHP Species Polygon in IUCN and Map of life
##IUCN: https://www.iucnredlist.org/
##Map of life: https://mol.org/

##FIX GEOMETRY
##install.packages('')
library(sp)
library(sf)
library(raster)
##Loads the specie polygon shp you need fix
##Example
specie<-st_read("C:/Working Directory...polygon1.shp")
#verify the validity of the geometry
st_is_valid(specie)
##Fix invalid geometries
fix_specie <- st_make_valid(specie)
##Verify the validity of the repaired geometries
st_is_valid(fix_specie)
##save fix_specie (polygon repaired)
specie_repaired <- "fix_specie.shp"

##CUT POLYGON
##install.packages('')
library(sf)
library(ggplot2)
##Example 
##polygon1
poly <- st_read("C:/Working Directory...polygon1.shp")
st_crs(poly)
polygon <- st_transform(poly, crs = st_crs("+proj=longlat +datum=WGS84"))
st_is_valid(polygon())
head(polygon)
ggplot() + geom_sf(data = polygon, fill="darkseagreen")

##download map of Chile
##https://www.bcn.cl/siit/mapas_vectoriales/index_html
chl<-st_read("C:/Working Directory/CHL_adm.shp")
head(chl)
st_crs(chil)
chile<- st_transform(chil, crs = st_crs("+proj=longlat +datum=WGS84"))
st_is_valid(chile)
head(chile)
ggplot() + geom_sf(data = chile, fill="darkseagreen")

##polygon intersection and map of Chile
polygon_chile <- st_intersection(st_geometry(polygon), st_geometry(chl))
polygon_chile <- st_intersection(polygon, chile)
polygon_chile
ggplot()+geom_sf(data = polygon_chile)+labs(title = "Distribution of the specie in Chile")

##Save SHP
shp<-"CutPolygon.shp"









