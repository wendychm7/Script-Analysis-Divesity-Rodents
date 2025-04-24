##Fix spatial and administrative shapefiles: climatic regions, ecoregions, protected terrestrial areas 
##Load libraries required
##If required: install.packages('')
library(sp)
library(sf)
library(raster)
##Load climatic regions, ecoregions or protected terrestrial areas SHAPEFILES (SHP)
SHP <- st_read("C:/Working Directory...document.shp")
##Check the coordinate system of the SHP
print(st_crs(SHP))
##If necessary,transform the coordinate system to WGS 84 (EPSG: 4326) or the appropriate coordinate system
polygon <- st_transform(SHP, crs = 4326)
##Check the validity of the geometries
print(st_is_valid(polygon))
##Alternatively, you can use st_make_valid
polygon_fix <- st_make_valid(polygon)
##Check the validity again
print(st_is_valid(polygon_fix))
#Save repaired geometries if necessary
st_write(polygon_fix, "C:/Working Directory...polygon_fix.shp")
