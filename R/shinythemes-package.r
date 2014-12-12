#' Themes for Shiny
#'
#' This package contains Bootstrap themes from http://bootswatch.com/, which are
#' packaged for use with Shiny applications. The themes included are:
#'
#' \itemize{ \item \href{http://bootswatch.com/cerulean/}{cerulean} \item
#' \href{http://bootswatch.com/cosmo/}{cosmo} \item
#' \href{http://bootswatch.com/flatly/}{flatly} \item
#' \href{http://bootswatch.com/journal/}{journal} \item
#' \href{http://bootswatch.com/readable/}{readable} \item
#' \href{http://bootswatch.com/spacelab/}{spacelab} \item
#' \href{http://bootswatch.com/united/}{united} }
#'
#' To use the themes, use the \code{theme} argument to
#' \code{\link[shiny]{bootstrapPage}}, \code{\link[shiny]{fluidPage}},
#' \code{\link[shiny]{navbarPage}}, or \code{\link[shiny]{fixedPage}}. The value
#' should be \code{shinytheme("cerulean")}, where the theme name takes the place
#' of \code{"cerulean"}.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#' library(shinythemes)
#'
#' # A very basic navbar page with different themes
#' shinyApp(
#'   ui = navbarPage("Default theme",
#'     tabPanel("Plot", "Plot tab contents..."),
#'     navbarMenu("More",
#'       tabPanel("Summary", "Summary tab contents..."),
#'       tabPanel("Table", "Table tab contents...")
#'     )
#'   ),
#'   server = function(input, output) { }
#' )
#'
#' shinyApp(
#'   ui = navbarPage("United",
#'     theme = shinytheme("united"),
#'     tabPanel("Plot", "Plot tab contents..."),
#'     navbarMenu("More",
#'       tabPanel("Summary", "Summary tab contents..."),
#'       tabPanel("Table", "Table tab contents...")
#'     )
#'   ),
#'   server = function(input, output) { }
#' )
#'
#' shinyApp(
#'   ui = navbarPage("Cerulean",
#'     theme = shinytheme("cerulean"),
#'     tabPanel("Plot", "Plot tab contents..."),
#'     navbarMenu("More",
#'       tabPanel("Summary", "Summary tab contents..."),
#'       tabPanel("Table", "Table tab contents...")
#'     )
#'   ),
#'   server = function(input, output) { }
#' )
#'
#'
#' # A more complicated app with the flatly theme
#' shinyApp(
#'   ui = fluidPage(
#'     theme = shinytheme("flatly"),
#'     titlePanel("Tabsets"),
#'     sidebarLayout(
#'       sidebarPanel(
#'         radioButtons("dist", "Distribution type:",
#'                      c("Normal" = "norm",
#'                        "Uniform" = "unif",
#'                        "Log-normal" = "lnorm",
#'                        "Exponential" = "exp")),
#'         br(),
#'         sliderInput("n", "Number of observations:",
#'                      value = 500, min = 1, max = 1000)
#'       ),
#'       mainPanel(
#'         tabsetPanel(type = "tabs",
#'           tabPanel("Plot", plotOutput("plot")),
#'           tabPanel("Summary", verbatimTextOutput("summary")),
#'           tabPanel("Table", tableOutput("table"))
#'         )
#'       )
#'     )
#'   ),
#'   server = function(input, output) {
#'     data <- reactive({
#'       dist <- switch(input$dist,
#'                      norm = rnorm,
#'                      unif = runif,
#'                      lnorm = rlnorm,
#'                      exp = rexp,
#'                      rnorm)
#'       dist(input$n)
#'     })
#'
#'     output$plot <- renderPlot({
#'       dist <- input$dist
#'       n <- input$n
#'       hist(data(), main=paste('r', dist, '(', n, ')', sep=''))
#'     })
#'
#'     output$summary <- renderPrint({
#'       summary(data())
#'     })
#'
#'     output$table <- renderTable({
#'       data.frame(x=data())
#'     })
#'   }
#' )
#' }
#' @name shinythemes
#' @docType package
NULL
