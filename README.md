shinythemes
===========

The shinythemes package provides some Bootstrap themes for use with Shiny. The themes are from from http://bootswatch.com/:

* [cerulean](http://bootswatch.com/cerulean/)
* [cosmo](http://bootswatch.com/cosmo/)
* [flatly](http://bootswatch.com/flatly/)
* [journal](http://bootswatch.com/journal/)
* [readable](http://bootswatch.com/readable/)
* [spacelab](http://bootswatch.com/spacelab/)
* [united](http://bootswatch.com/united/)


## Using themes

Using the themes is simple. Use the `theme` argument to `bootstrapPage`, `fluidPage`, `navbarPage`, or `fixedPage`. The value should be `"<theme>.min.css"`; for example, `"cerulean.min.css"`.

For example, a ui.R file might look something like this:

```R
library(shinythemes)

navbarPage("United",
  theme = "shinythemes/united.min.css",
  tabPanel("Plot", "Plot tab contents..."),
  navbarMenu("More",
    tabPanel("Summary", "Summary tab contents..."),
    tabPanel("Table", "Table tab contents...")
  )
)
```


An example single-file app might look like this:

```R
library(shinythemes)

shinyApp(
  ui = navbarPage("United",
    theme = "shinythemes/united.min.css",
    tabPanel("Plot", "Plot tab contents..."),
    navbarMenu("More",
      tabPanel("Summary", "Summary tab contents..."),
      tabPanel("Table", "Table tab contents...")
    )
  ),
  server = function(input, output) { }
)
```
