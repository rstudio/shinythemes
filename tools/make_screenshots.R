#!/usr/bin/env Rscript
# This script can be sourced from RStudio, or run with Rscript.
library(webshot)

# All the themes to make screenshots of
themes <- c("default", "cerulean", "cosmo", "cyborg", "darkly", "flatly",
            "journal", "lumen", "paper", "readable", "sandstone", "simplex",
            "slate", "spacelab", "superhero", "united", "yeti")

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
  message("Taking screenshot for ", theme)
  appshot(appDir, file.path(imageDir, paste0(theme, ".png")),
          vwidth = 800, vheight = 500, delay = 0.75,
          envvars = c(SHINY_THEME = theme)
  ) %>%
  shrink()
}
