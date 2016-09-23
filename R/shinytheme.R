#' Return the URL for a Shiny theme
#'
#' The result of this function should be used as the \code{theme} argument for
#' \code{\link[shiny]{bootstrapPage}}, \code{\link[shiny]{fluidPage}},
#' \code{\link[shiny]{navbarPage}}, or \code{\link[shiny]{fixedPage}}.
#'
#'
#' @param theme Name of a theme.
#'
#' @examples
#' \dontrun{
#' shinyApp(
#'   ui = fluidPage(theme = shinytheme("united"),
#'     ...
#'   ),
#'   server = function(input, output) { }
#' )
#' }
#' @seealso The main \link{shinythemes} page for information about available
#'   themes and more detailed examples.
#' @export
shinytheme <- function(theme = NULL) {
  # Check that theme exists
  if (is.null(theme) || !theme %in% allThemes()) {
    stop(theme, " is not an available theme. Valid themes are: ",
      paste(allThemes(), collapse = ", "), ".")
  }

  paste0("shinythemes/css/", theme, ".min.css")
}


allThemes <- function() {
  themes <- dir(system.file("shinythemes/css", package = "shinythemes"),
                "*.min.css")
  sub(".min.css", "", themes)
}

#' Add a theme selector widget in a floating panel
#'
#' This adds a widget for selecting the theme, in a floating panel. It is meant
#' for use during the development phase of a Shiny application.
#'
#' This can be inserted anywhere inside of the application, although if it is
#' put inside a tab, it will be visible only when that tab is showing. For it to
#' show at all times, it must be used outside a tab.
#'
#' @examples
#'
#' if (interactive()) {
#' # themeSelector can be inserted anywhere in the app.
#' shinyApp(
#'   ui = fluidPage(
#'     shinythemes::themeSelector(),
#'     sidebarPanel(
#'       textInput("txt", "Text input:", "text here"),
#'       sliderInput("slider", "Slider input:", 1, 100, 30),
#'       actionButton("action", "Button"),
#'       actionButton("action2", "Button2", class = "btn-primary")
#'     ),
#'     mainPanel(
#'       tabsetPanel(
#'         tabPanel("Tab 1"),
#'         tabPanel("Tab 2")
#'       )
#'     )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#'
#' # If this is used with a navbarPage() or other type of page where there is not a
#' # good place to put it where it is outside of all tabs, you can wrap the entire
#' # page in tagList() and make the themeSelector a sibling of the page.
#' shinyApp(
#'   ui = tagList(
#'     shinythemes::themeSelector(),
#'     navbarPage(
#'       "Theme test",
#'       tabPanel("Navbar 1",
#'         sidebarPanel(
#'           textInput("txt", "Text input:", "text here"),
#'           sliderInput("slider", "Slider input:", 1, 100, 30),
#'           actionButton("action", "Button"),
#'           actionButton("action2", "Button2", class = "btn-primary")
#'         ),
#'         mainPanel(
#'           tabsetPanel(
#'             tabPanel("Tab 1"),
#'             tabPanel("Tab 2")
#'           )
#'         )
#'       ),
#'       tabPanel("Navbar 2")
#'     )
#'   ),
#'   server = function(input, output) {}
#' )
#' }
#' @importFrom shiny div tags selectInput
#' @export
themeSelector <- function() {
  shiny::fixedPanel(
    top = "15px",
    right = "15px",
    draggable = TRUE,
    style = "width: 250px; z-index: 100000;",
    div(class = "panel panel-danger",
      style = "box-shadow: 5px 5px 15px -5px rgba(0, 0, 0, 0.3);",
      div(class = "panel-heading", "Select theme:"),
      div(class = "panel-body",
        selectInput("shinytheme-selector", NULL,
          c("default", allThemes()),
          selectize = FALSE
        )
      )
    ),
    tags$script(
"$('#shinytheme-selector')
  .on('change', function(el) {
    var allThemes = $(this).find('option').map(function() {
      if ($(this).val() === 'default')
        return 'bootstrap';
      else
        return $(this).val();
    });

    // Find the current theme
    var curTheme = el.target.value;
    if (curTheme === 'default') {
      curTheme = 'bootstrap';
      curThemePath = 'shared/bootstrap/css/bootstrap.min.css';
    } else {
      curThemePath = 'shinythemes/css/' + curTheme + '.min.css';
    }

    // Find the <link> element with that has the bootstrap.css
    var $link = $('link').filter(function() {
      var theme = $(this).attr('href');
      theme = theme.replace(/^.*\\//, '').replace(/(\\.min)?\\.css$/, '');
      return $.inArray(theme, allThemes) !== -1;
    });

    // Set it to the correct path
    $link.attr('href', curThemePath);
  });"
    )
  )
}
