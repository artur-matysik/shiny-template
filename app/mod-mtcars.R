# UI ----------------------------------------------------------------------
tab_mtcars_ui <- function(id) {
  fluidPage(DTOutput(NS(id, "mtcars_table")))
}

# Server ------------------------------------------------------------------
tab_mtcars_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # UI Outputs --------------------------------------------------------------

    ## Render table ----
    output$mtcars_table <- DT::renderDT({
      table <- datatable(mtcars)
    })
  }) # End of module server
} # End of server
