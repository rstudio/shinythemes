.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath("shinythemes",
    system.file("shinythemes", package = "shinythemes")
  )
}
