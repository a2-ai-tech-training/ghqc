#' ghqc_create_app
#' found in app_01_create.R
#'
#' @return NA
#'
#' @import shiny
#' @export
#'
#' @examples ghqc_create_app()
ghqc_create_app <- function() {
  app <- shinyApp(
    ui = ghqc_create_ui(
      id = "ghqc_create_app"
    ),
    server = function(input, output, session) {
      ghqc_create_server(
        id = "ghqc_create_app"
      )
    }
  )
  port <- as.numeric(Sys.getenv("GHQC_SHINY_PORT", 5254))
  runApp(app, port = port)
}
