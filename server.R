library(shiny)
library(leaflet)
library(htmltools)

shinyServer(function(input, output) {
  #http://rpubs.com/insight/leaflet
  color.vec = c("#8c510a",#workaround for making each taxonomic group a different color
                "#bf812d",
                "#dfc27d",
                "#f6e8c3",
                "#f5f5f5",
                "#c7eae5",
                "#80cdc1",
                "#35978f",
                "#01665e")
  
  output$mymap <- renderLeaflet({
    # define the leaflet map object
    leaflet() %>%
      addTiles() %>%
       setView(lng = mean(df$X.park), lat = mean(df$Y.park) , zoom =4) %>%
      addCircles(lng = df$X.park,
                       lat = df$Y.park,
                 color = color.vec[df$taxon_num],
                        label = htmlEscape(paste(df$organism_type, df$species)))#label appears on hover
  })
})