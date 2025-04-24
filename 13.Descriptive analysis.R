##Analyze parameters: Maximum, minimum, mean, median by indice and region
##Load the variable data base 
setwd("C:/Working directory...")
base<-read.table("data-base.csv", header = TRUE, sep = ';', stringsAsFactors = T)
##Load libraries
library(dplyr)

##Parameters according to Climate
stats_climate <- base %>%
  group_by(Climate) %>%
  summarise(
    R_max = max(R, na.rm = TRUE),
    R_min = min(R, na.rm = TRUE),
    R_mean = mean(R, na.rm = TRUE),
    R_median = median(R, na.rm = TRUE),
    PD_max = max(PD, na.rm = TRUE),
    PD_min = min(PD, na.rm = TRUE),
    PD_mean = mean(PD, na.rm = TRUE),
    PD_median = median(PD, na.rm = TRUE),
    PE_max = max(PE, na.rm = TRUE),
    PE_min = min(PE, na.rm = TRUE),
    PE_mean = mean(PE, na.rm = TRUE),
    PE_median = median(PE, na.rm = TRUE),
    FD_max = max(FD, na.rm = TRUE),
    FD_min = min(FD, na.rm = TRUE),
    FD_mean = mean(FD, na.rm = TRUE),
    FD_median = median(FD, na.rm = TRUE))
##View statistics by climate
print(stats_climate)

##Parameters according to Protected Terrestrial Areas
stats_protected <- base %>%
  group_by(Protected) %>%
  summarise(
    R_max = max(R, na.rm = TRUE),
    R_min = min(R, na.rm = TRUE),
    R_mean = mean(R, na.rm = TRUE),
    R_median = median(R, na.rm = TRUE),
    PD_max = max(PD, na.rm = TRUE),
    PD_min = min(PD, na.rm = TRUE),
    PD_mean = mean(PD, na.rm = TRUE),
    PD_median = median(PD, na.rm = TRUE),
    PE_max = max(PE, na.rm = TRUE),
    PE_min = min(PE, na.rm = TRUE),
    PE_mean = mean(PE, na.rm = TRUE),
    PE_median = median(PE, na.rm = TRUE),
    FD_max = max(FD, na.rm = TRUE),
    FD_min = min(FD, na.rm = TRUE),
    FD_mean = mean(FD, na.rm = TRUE),
    FD_median = median(FD, na.rm = TRUE))
##View statistics by Protection Status
print(stats_protected)

##Parameters according to ecoregions
stats_ecoregion <- base %>%
  group_by(Ecoregion) %>%
  summarise(
    R_max = max(R, na.rm = TRUE),
    R_min = min(R, na.rm = TRUE),
    R_mean = mean(R, na.rm = TRUE),
    R_median = median(R, na.rm = TRUE),
    PD_max = max(PD, na.rm = TRUE),
    PD_min = min(PD, na.rm = TRUE),
    PD_mean = mean(PD, na.rm = TRUE),
    PD_median = median(PD, na.rm = TRUE),
    PE_max = max(PE, na.rm = TRUE),
    PE_min = min(PE, na.rm = TRUE),
    PE_mean = mean(PE, na.rm = TRUE),
    PE_median = median(PE, na.rm = TRUE),
    FD_max = max(FD, na.rm = TRUE),
    FD_min = min(FD, na.rm = TRUE),
    FD_mean = mean(FD, na.rm = TRUE),
    FD_median = median(FD, na.rm = TRUE))
##View statistics by ecoregions
print(stats_ecoregion)
