shinyServer(function(input, output, session) {

  data_stock <- reactive({

    # Get data from Quandl based on security type and geographic
    lapply(get_stock_list() %>% `[[`(input$stock_geography), function(x) {

      cat(paste("Getting", x, "data", sep = " "))
      Quandl(x, type = "xts")

    })
  })

  output$plots <- renderUI({

    # Generate list of Highcharts outputs - kind of hacky, as the plots have to
    # have the exact same name here and in the observer, where the plot is
    # being rendered.
    plot_output_list <- lapply(1:(data_stock() %>% length), function(x) {

      plotname <- paste("plot", x, sep = "_")
      highchartOutput(plotname, height = 500)

    })

    # Convert the list to a tagList - this is necessary for the list of items
    # to display properly.
    do.call(tagList, plot_output_list)
  })

  # Call renderPlot for each plot. Plots are only actually generated when they
  # are visible on the web page.
  observe({

    for (x in 1:(data_stock() %>% length)) {

      # Need local so that each item gets its own number. Without it, the value
      # of i in the renderPlot() will be the same across all instances, because
      # of when the expression is evaluated.
      local({
        x_local <- x

        plotname <- paste("plot", x_local, sep = "_")

        output[[plotname]] <- renderHighchart({

          if (input$stock_type == "Candlestick") {

            plot_candlestick(data_stock()[x_local])

          } else if (input$stock_type == "Line Plot") {

            plot_line(data_stock()[x_local])

          }

        })
      })
    }
  })

})
