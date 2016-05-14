#' Function calling a list of stocks for which to call data
#'
#' @return A list with the stock identifiers for Quandl
#'
#' @export
#'
get_stock_list <- function() {

  list(
    America = list(
      `Dow Jones Industrial Average` = "YAHOO/INDEX_DJI",
      `S&P 500 Index` = "YAHOO/INDEX_GSPC",
      `Bovespa index` = "YAHOO/INDEX_BVSP"
      #`NASDAQ Composite Index` = "NASDAQOMX/COMP"
      #`MERVAL Index` = "YAHOO/INDEX_MERV"
    ),
    Europe = list(
      #`FTSE 100 Index` = "",
      `EURO STOXX 50` = "YAHOO/INDEX_STOXX50E",
      `DAX` = "YAHOO/INDEX_GDAXI"
      #`CAC 40 Index` = "YAHOO/INDEX_FCHI",
      #`RTSI Index` = "YAHOO/INDEX_RTS_RS",
      #`OMX Copenhagen 20` = "NASDAQOMX/OMXC20"
    ),
    Asia = list(
      `Nikkei 225` = "YAHOO/INDEX_N225",
      `Hong Kong Hang Seng Index` = "YAHOO/INDEX_HSI",
      `Shanghai Shenzhen CSI 300 Index` = "YAHOO/INDEX_SSEC"
      #`KOSPI Composite Index` = "YAHOO/INDEX_KS11",
      #`Straits Times Index` = "YAHOO/INDEX_STI",
      #`Taiwan Weighted Index` = "YAHOO/INDEX_TWII",
      #`SENSEX` = "YAHOO/INDEX_BSESN",
      #`All Ordinaries Index` = "YAHOO/INDEX_AORD"
    )
  )

}
