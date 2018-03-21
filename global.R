library(shiny)
library(leaflet)
library(readr)

#read in data
df=read_csv("https://rawgit.com/fischhoff/biodiversity/master/inat.park.csv")
#columns needed
keep.col = c("park",
             "organism_type",
             "X.park",
             "Y.park",
             "species")
df = df[,keep.col]
#make field with taxon as number for plotting color
df$taxon_num = as.numeric(factor(df$organism_type))

#jitter location for plotting
df$X.park <- jitter(df$X.park, factor = 20)
df$Y.park <- jitter(df$Y.park, factor = 20)
