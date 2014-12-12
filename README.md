shinythemes web site
====================

Requirements for building the site:

* R with rmarkdown for page rendering
* PhantomJS (for app screenshots)
* Jekyll (optional)

To make screenshots run `tools/make_screenshots.R`. This will repeatedly run a Shiny app with different themes, and use PhantomJS to take a screenshot of the app.

When pushed to github, the web pages are automatically made available at http://rstudio.github.io/shinythemes/
