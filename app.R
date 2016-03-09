library(shiny)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, 
                     labels = c("Automatic", "Manual"))

ui <- fluidPage(
    navbarPage(
        title = "Superforecasting",
        tabPanel(
            title = "Forecast",
            sidebarLayout(
                sidebarPanel(
                    selectizeInput("name", 
                                   "First Name Last Name", 
                                   mtcars$mpg,
                                   selected = mtcars$mpg[1],
                                   options = list(create = TRUE,
                                                  selectOnTab = TRUE))
                ),
                mainPanel(
                    dataTableOutput("mtcar")
                )
            )
        ),
        tabPanel(
            title = "Betting Market"
        ),
        tabPanel(
            title = "Visualization"
        )
        
    )
)
server <- function(input, output){
    output$mtcar <- renderDataTable(
        mpgData
    )
}



shinyApp(ui = ui, server = server)
