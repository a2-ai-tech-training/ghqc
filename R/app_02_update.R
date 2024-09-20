#' ghqc_update_app
#' found in app_02_update.R
#'
#' @return NA
#' @import shiny
#'
#' @export
#'
#' @examples ghqc_update_app()
ghqc_update_app <- function() {
  app <- shinyApp(
    ui = ghqc_update_ui(
      id = "ghqc_update_app"
    ),
    server = function(input, output, session) {
      ghqc_update_server(
        id = "ghqc_update_app"
      )
    }
  )
  port <- as.numeric(Sys.getenv("GHQC_SHINY_PORT", 5454))
  runApp(app, port = port)
}
