library(shinythemes)

theme <- Sys.getenv("SHINY_THEME")
theme <- tolower(theme)

# If no theme was set externally, or if "" or "default", use NULL;
# otherwise use appropriate theme
if (theme == "" || theme == "default") {
  title <- "Default"
  theme <- NULL
} else {
  # Capitalize first letter for title
  title <- paste0(toupper(substring(theme, 1, 1)), substring(theme, 2))
  theme <-shinytheme(theme)
}


shinyApp(
  ui = navbarPage(theme = theme,
    title,
    tabPanel("Navbar 1",
      sidebarPanel(
        fileInput("file", "File input:"),
        textInput("txt", "Text input:", "general"),
        sliderInput("slider", "Slider input:", 1, 100, 30),
        tags$h5("Deafult actionButton:"),
        actionButton("action", "Search"),

        tags$h5("actionButton with CSS class:"),
        actionButton("action2", "Action button", class = "btn-primary")
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Tab 1",
            h4("Table"),
            tableOutput("table"),
            h4("Verbatim text output"),
            verbatimTextOutput("txtout"),
            h1("Header 1"),
            h2("Header 2"),
            h3("Header 3"),
            h4("Header 4"),
            h5("Header 5")
          ),
          tabPanel("Tab 2"),
          tabPanel("Tab 3")
        )
      )
    ),
    tabPanel("Plot"),
    tabPanel("Table")
  ),
  server = function(input, output) {
    output$txtout <- renderText({
      paste(input$txt, input$slider, format(input$date), sep = ", ")
    })
    output$table <- renderTable({
      head(cars, 4)
    })

  }
)
