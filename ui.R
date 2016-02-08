library(shiny)
shinyUI(fluidPage(
        titlePanel("Population Distribution Heat Map of USA Counties by Ethnicity"),
        br(),
        sidebarLayout(position="right",
                sidebarPanel(
                        br(),
                        br(),
                        
                        selectInput("var", 
                                    label = "Select an Ethinic Group :",
                                    choices = c("White", "Black",
                                                "Asian", "Hispanic"),
                                    selected = "White"),
                        br(),
                        br(),
                        
                        sliderInput("range", 
                                    label = "Select Population Density Range :",
                                    min = 0, max = 100, value = c(0, 100)),
                        br()
                ),
                
                mainPanel(
                        br(),
                        plotOutput("map"))
        )
))
