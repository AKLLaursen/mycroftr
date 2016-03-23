#' Function generating a Highstocks candlestick chart with corresponding volume
#' bar plot. Essentially a wrapper of the Highcharter library.
#'
#' @param in_data A named list element containing a data frame.
#'
#' @return A Highcharter object
#'
#' @export
#'
plot_candlestick <- function(in_data) {

  highchart() %>%
    hc_yAxis(
      list(
        labels = list(
          align = "right",
          x = -3
        ),
        title = list(
          text = "OHLC"
        ),
        height = "60%",
        lineWidth = 2
      ),
      list(
        labels = list(
          align = "right",
          x = -3
        ),
        title = list(
          text = "Volume"
        ),
        top = "65%",
        height = "35%",
        offset = 0,
        lineWidth = 2
      )
    ) %>%
    hc_title(text = in_data %>% names()) %>%
    hc_rangeSelector(selected = 1) %>%
    hc_add_series_ohlc(in_data[[1]],
                       type = "candlestick",
                       name = in_data %>% names()) %>%
    hc_add_series_xts(in_data[[1]] %>% `$`(Volume),
                      type = "column",
                      name = "Volume",
                      yAxis = 1)
}

#' Function generating a Highstocks line chart. Essentially a wrapper of the
#' Highcharter library.
#'
#' @param in_data A named list element containing a data frame.
#'
#' @return A Highcharter object
#'
#' @export
#'
plot_line <- function(in_data) {

  highchart(type = "stock") %>%
    hc_title(text = in_data %>% names()) %>%
    hc_rangeSelector(selected = 1) %>%
    hc_add_series_xts(in_data[[1]] %>% `$`(Close),
                      name = in_data %>% names())

}
