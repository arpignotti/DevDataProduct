library(shiny)
library(sqldf)
library(choroplethr)
library(choroplethrMaps)
library(ggplot2)



shinyUI(pageWithSidebar(
  headerPanel("Medicare Advantage Parent Organizations' MA Market Share"),
  sidebarPanel(
    selectInput("var", 
                label = "Parent Organization:",
                choices = c("UnitedHealth", "Aetna",
                            "Kaiser", "Anthem")),
    
    selectInput("zoom", 
                label = "Region:",
                choices = c("National", "Midwest","New England","Mid-Atlantic",
                            "Southeast","Southwest", "West"))
  ),
  mainPanel(
    plotOutput("map"))
))