#' Widget indicating when data in the Shiny session is being loaded, (typically
#' data being fetched from a webservice). Heavily based on the busy-indicator
#' function implemented in the ShinySky package.
#'
#' @param wait_text A character string with the text to be displayed while
#' loading.
#' @param gif path to the gif that is to be diaplayed.
#' @param wait_time The amount of time to wait before showing the loading
#' indicator. The default time is 500 corresponding to 0.5 second.
#'
#' @export
#'
loading_indicator <- function(wait_text = "Data is being loaded",
                          gif = "mycroftr/loading-indicator/loading-indicator.gif",
                          wait_time = 1000) {

  addResourcePath("mycroftr",
                  system.file("www", package = "mycroftr"))

  tagList(
    singleton(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css",
                  href = "mycroftr/loading-indicator/loading-indicator.css")
        )
      ),
    div(class = "loading-indicator", p(wait_text), img(src = gif)),
    tags$script(
      sprintf("setInterval(function(){
  		 	         if ($('html').hasClass('shiny-busy')) {
  		             setTimeout(function() {
  		               if ($('html').hasClass('shiny-busy')) {
  		                 $('div.loading-indicator').show()
  		               }
  		             }, %d)
  		           } else {
  		             $('div.loading-indicator').hide()
  		           }
  		         }, 100)", wait_time)
      )
  )
}
