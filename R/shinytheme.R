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
shinytheme <- function(theme) {
  # Check that theme exists
  filePath <- system.file("shinythemes/css", paste0(theme, ".min.css"),
                          package = "shinythemes")
  if (!file.exists(filePath)) {
    themes <- dir(system.file("shinythemes/css", package = "shinythemes"),
                  "*.min.css")
    themes <- sub(".min.css", "", themes)

    stop(theme, " is not an available theme. Valid themes are: ",
      paste(themes, collapse = ", "), ".")
  }


  paste0("shinythemes/css/", theme, ".min.css")
}
