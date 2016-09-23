shinythemes
===========

See the documentation at http://rstudio.github.io/shinythemes/.

The shinythemes package provides some Bootstrap themes for use with Shiny. The themes are from from http://bootswatch.com/:

* [cerulean](http://bootswatch.com/cerulean/)
* [cosmo](http://bootswatch.com/cosmo/)
* [cyborg](http://bootswatch.com/cyborg/)
* [darkly](http://bootswatch.com/darkly/)
* [flatly](http://bootswatch.com/flatly/)
* [journal](http://bootswatch.com/journal/)
* [lumen](http://bootswatch.com/lumen/)
* [paper](http://bootswatch.com/paper/)
* [readable](http://bootswatch.com/readable/)
* [sandstone](http://bootswatch.com/sandstone/)
* [simplex](http://bootswatch.com/simplex/)
* [slate](http://bootswatch.com/slate/)
* [spacelab](http://bootswatch.com/spacelab/)
* [superhero](http://bootswatch.com/superhero/)
* [united](http://bootswatch.com/united/)
* [yeti](http://bootswatch.com/yeti/)

## Using themes

Using the themes is simple. Use the `theme` argument to `bootstrapPage`, `fluidPage`, `navbarPage`, or `fixedPage`. The value should be `shinytheme("<theme>")`; for example, `shinytheme("cerulean")`.

For example, a ui.R file might look something like this:

```R
library(shinythemes)

navbarPage("United",
  theme = shinytheme("cerulean"),
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
    theme = shinytheme("united"),
    tabPanel("Plot", "Plot tab contents..."),
    navbarMenu("More",
      tabPanel("Summary", "Summary tab contents..."),
      tabPanel("Table", "Table tab contents...")
    )
  ),
  server = function(input, output) { }
)
```
