library(shiny)
library(maps)
library(mapproj)
source("mapper.R",keep.source = TRUE) 
counties <- readRDS("population.rds")


shinyServer(
        function(input, output) {
                
                output$map <- renderPlot({
                        args <- switch(input$var,
                                       "White" = list(counties$white, "darkorange", "% White"),
                                       "Black" = list(counties$black, "black", "% Black"),
                                       "Hispanic" = list(counties$hispanic, "darkgreen", "% Hispanic"),
                                       "Asian" = list(counties$asian, "red", "% Asian"))
                        
                        args$min <- input$range[1]
                        args$max <- input$range[2]
                        
                        do.call(draw_map, args)
                })
        }
)

