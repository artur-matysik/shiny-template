# Libraries ---------------------------------------------------------------
# shiny
library(shiny)
library(shinydashboard)
library(shinyjs)

# other
library(DT)         # table display

# Sources -----------------------------------------------------------------
# modules
source("mod-iris.R")
source("mod-mtcars.R")

# UI ----------------------------------------------------------------------
ui <- dashboardPage(
  ## Header ----
  dashboardHeader(title = "MyShinyApp",
                  tags$li(class = "dropdown",
                          style = "padding: 8px;")),
  ## Menu (to be rendered server-side) ----
  dashboardSidebar(collapsed = FALSE, sidebarMenuOutput("sidebar")),
  dashboardBody(shinyjs::useShinyjs(),
                tabItems(
                  tabItem("tab_iris", uiOutput("tab_iris")),
                  tabItem("tab_mtcars", uiOutput("tab_mtcars"))
                ))
)

# Server -----------------------------------------------------------------------
server <- function(input, output, session) {
  ## UI Outputs ----------------------------------------------------------------

  # Sidebar
  output$sidebar <- renderMenu({
    sidebarMenu(id = "tabs",
                menuItem(
                  "Datasets",
                  tabName = "datasets",
                  menuSubItem("Iris",
                              tabName = "tab_iris",
                              # search for free icons in older versions of Font Awesome
                              # many new icons are not compatible
                              # see e.g.: https://fontawesome.com/v5
                              icon = icon("spa")),
                  menuSubItem("MtCars",
                              tabName = "tab_mtcars",
                              icon = icon("car"))
                ))
  })

  # Iris
  output$tab_iris <- renderUI({
    tabItem(tabName = "tab_iris", tab_iris_ui("mod_iris"))
  })
  tab_iris_server("mod_iris")

  # MtCars
  output$tab_mtcars <- renderUI({
    tabItem(tabName = "tab_mtcars", tab_mtcars_ui("mod_mtcars"))
  })
  tab_mtcars_server("mod_mtcars")
}

shiny::shinyApp(ui, server)
