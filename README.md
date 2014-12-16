shinythemes web site
====================

## Building

Requirements for building the site:

* R with rmarkdown for page rendering
* PhantomJS (for app screenshots)
* Jekyll (optional)

The entire site can be built by running `make`. This will:

* Use rmarkdown to convert `index.Rmd` to `index.html`.

* Create screenshots using `tools/make_screenshots.R`. This repeatedly runs a Shiny app with different themes, and uses PhantomJS to take a screenshot of the app.


## Deploying

To deploy, simply push the site to GitHub. The web pages will automatically be available at http://rstudio.github.io/shinythemes/.
