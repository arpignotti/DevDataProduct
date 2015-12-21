library(shiny)
library(RCurl)
library(maps)
library(mapproj)
source("helper/helpers.R")


x <- getURL("https://raw.githubusercontent.com/arpignotti/DevDataProduct/master/Data/dset.csv")
dset <- read.csv(text = x)

shinyUI(pageWithSidebar(
  headerPanel("Medicare Advantage Parent Organizations' MA Market Share"),
  sidebarPanel(
    selectInput("var", 
                label = "Parent Organization:",
                choices = c("Aetna",
                            "Anthem",
                            'CIGNA',
                            'Health Net',
                            'Highmark',
                            'Humana',
                            "Kaiser",
                            "UnitedHealth",
                            'WellCare'),
                selected = "UnitedHealth"),
    
    selectInput("zoom", 
                label = "Region:",
                choices = c("National", "Midwest","New England","Mid-Atlantic",
                            "Southeast","Southwest", "West"))
  ),
  mainPanel(
    plotOutput("map"))
))