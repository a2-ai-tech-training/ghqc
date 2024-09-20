#' ghqc_report_app
#' found in app_03_report.R
#'
#' @return NA
#' @import shiny
#'
#' @export
#'
#' @examples ghqc_report_app()
ghqc_report_app <- function() {
  app <- shinyApp(
    ui = ghqc_report_ui(
      id = "ghqc_report_app"
    ),
    server = function(input, output, session) {
      ghqc_report_server(
        id = "ghqc_report_app"
      )
    }
  )
  port <- as.numeric(Sys.getenv("GHQC_SHINY_PORT", 5256))
  runApp(app, port = port)
}
