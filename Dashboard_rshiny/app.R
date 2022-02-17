#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

## app.R ##
library(shinydashboard)

ui <- dashboardPage(
    skin = "red",
    dashboardHeader(title = "Aggie Reuse Store Dashboard"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Items", tabName = "dashboard", icon = icon("store")),
            menuItem("Social Media", tabName = "social", icon = icon("thumbs-up")),
            menuItem("Overview", tabName = "overview", icon = icon("user"))
        )
    ),
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    h2("Items Sold"),
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),
                        
                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                    )
            ),
            
            # Second tab content
            tabItem(tabName = "social",
                    h2("Social Media")
            ),
            
            #Third tab content
            tabItem(tabName = "overview",
                    h2("Overview")
            )
            
        )
    )
    

)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)