library(dplyr)
library(sf)
library(leaflet)

renv::restore()


# 1. import data
url_list <- yaml::read_yaml("sources.yml")

airports <- readr::read_delim(unlist(url_list$airports))
compagnies <- readr::read_delim(unlist(url_list$compagnies))
liaisons <- readr::read_delim(unlist(url_list$liaisons))

airports_location <- st_read(urls$geojson$airport)

leaflet(airports_location) %>%
  addTiles() %>%
  addMarkers(popup = ~Nom)
