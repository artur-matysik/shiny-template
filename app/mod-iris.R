# UI ----------------------------------------------------------------------
tab_iris_ui <- function(id) {
  fluidPage(DTOutput(NS(id, "iris_table")))
}

# Server ------------------------------------------------------------------
tab_iris_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # UI Outputs --------------------------------------------------------------

    ## Render table ----
    output$iris_table <- DT::renderDT({
      table <- datatable(iris)
    })
  }) # End of module server
} # End of server
