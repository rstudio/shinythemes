shinythemes
===========

> NOTE: This package has been superseded by the [`{bslib}` package](https://rstudio.github.io/bslib/), which provides Bootswatch (and as well as custom) themes for both Bootstrap 3 and 4.

See the documentation at https://rstudio.github.io/shinythemes/.

The shinythemes package provides some Bootstrap themes for use with Shiny. The themes are from from https://bootswatch.com/:

* [cerulean](https://bootswatch.com/3/cerulean/)
* [cosmo](https://bootswatch.com/3/cosmo/)
* [cyborg](https://bootswatch.com/3/cyborg/)
* [darkly](https://bootswatch.com/3/darkly/)
* [flatly](https://bootswatch.com/3/flatly/)
* [journal](https://bootswatch.com/3/journal/)
* [lumen](https://bootswatch.com/3/lumen/)
* [paper](https://bootswatch.com/3/paper/)
* [readable](https://bootswatch.com/3/readable/)
* [sandstone](https://bootswatch.com/3/sandstone/)
* [simplex](https://bootswatch.com/3/simplex/)
* [slate](https://bootswatch.com/3/slate/)
* [spacelab](https://bootswatch.com/3/spacelab/)
* [superhero](https://bootswatch.com/3/superhero/)
* [united](https://bootswatch.com/3/united/)
* [yeti](https://bootswatch.com/3/yeti/)

## Using themes

Using the themes is simple. Use the `theme` argument to `bootstrapPage`, `fluidPage`, `navbarPage`, or `fixedPage`. The value should be `shinytheme("<theme>")`; for example, `shinytheme("cerulean")`.

For example, a single-file app might look like this:

```R
shinyApp(
  ui = navbarPage("United",
    theme = shinythemes::shinytheme("united"),  # <--- Specify theme here
    tabPanel("Plot", "Plot tab contents..."),
    navbarMenu("More",
      tabPanel("Summary", "Summary tab contents..."),
      tabPanel("Table", "Table tab contents...")
    )
  ),
  server = function(input, output) { }
)
```

## Live theme selector

If you want to quickly test out different themes with an application, you can simply add `themeSelector()` somewhere to the UI. This will add a select box which lets you choose the theme. It will change the theme without having to reload or restart your app. You can see the theme selector in action [here](https://gallery.shinyapps.io/117-shinythemes/).

The theme selector is only meant to be used while developing an application. Once you've decided on which theme to use, pass it to the `theme` argument as described earlier.

Here's an example app with the theme selector:

```R
shinyApp(
  ui = fluidPage(
    shinythemes::themeSelector(),  # <--- Add this somewhere in the UI
    sidebarPanel(
      textInput("txt", "Text input:", "text here"),
      sliderInput("slider", "Slider input:", 1, 100, 30),
      actionButton("action", "Button"),
      actionButton("action2", "Button2", class = "btn-primary")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Tab 1"),
        tabPanel("Tab 2")
      )
    )
  ),
  server = function(input, output) {}
)
```

Once you've found a theme that you like, use it in the page as shown above, with `theme = shinythemes::shinytheme(<theme here>)`.
