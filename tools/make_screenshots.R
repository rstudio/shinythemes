#!/usr/bin/env Rscript
# This script can be sourced from RStudio, or run with Rscript.

# All the themes to make screenshots of
themes <- c("default", "cerulean", "cosmo", "flatly", "journal", "readable", "spacelab", "united")

# The application to use for screenshots
appDir <- "apps/081-widgets-gallery/"

# Returns the file currently being sourced or run with Rscript
thisFile <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  needle <- "--file="
  match <- grep(needle, cmdArgs)
  if (length(match) > 0) {
    # Rscript
    return(normalizePath(sub(needle, "", cmdArgs[match])))
  } else {
    # 'source'd via R console
    return(normalizePath(sys.frames()[[1]]$ofile))
  }
}


toolsDir <- dirname(thisFile())
appDir <- file.path(toolsDir, appDir)
imageDir <- file.path(dirname(dirname(thisFile())), 'images')

# Create destination dir if needed
dir.create(imageDir, showWarnings = FALSE)

# Take screenshot of each theme
for (theme in themes) {
  # Start a Shiny process in the background (the Shiny app has code to quit
  # automatically after a client disconnects)
  system2('Rscript',
    args = c(
      '-e',
      sprintf('"library(methods); theme <- \'%s\'; shiny::runApp(\'%s\', port=9000)"',
              theme, appDir)
    ),
    wait = FALSE
  )

  # Wait for app to start
  Sys.sleep(0.75)

  # Take screenshot
  system2('phantomjs',
    c(
      file.path(toolsDir, 'screenshot.js'),
      file.path(imageDir, paste0(theme, ".png"))
    )
  )
}
