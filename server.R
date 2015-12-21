library(shiny)
library(RCurl)
library(maps)
library(mapproj)
source("helper/helpers.R")

x <- getURL("https://raw.githubusercontent.com/arpignotti/DevDataProduct/master/Data/dset.csv")
dset <- read.csv(text = x)

function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "UnitedHealth" = "UnitedHealth Group, Inc.",
                   "Aetna" = "Aetna Inc.",
                   "Kaiser" = "Kaiser Foundation Health Plan, Inc.",
                   "Anthem" = "Anthem Inc.",
                   'Humana'  = 'Humana Inc.',
                   'CIGNA'  = 'CIGNA',
                   'WellCare'  = 'WellCare Health Plans, Inc.',
                   'Health Net'  = 'Health Net, Inc.',
                   'Highmark'  = 'Highmark Health')
    zoom <- switch(input$zoom, 
                   "National" = c('wisconsin','indiana','ohio','michigan','illinois','missouri','iowa',
                                  'minnesota','north dakota','south dakota','nebraska','kansas','maine','vermont','new hampshire',
                                  'massachusetts','rhode island','connecticut','new york','new jersey','pennsylvania','virginia',
                                  'west virginia','maryland','delaware','florida','georgia','alabama','mississippi','louisiana',
                                  'arkansas','tennessee','kentucky','texas','oklahoma','new mexico','arizona','colorado','utah',
                                  'wyoming','nevada','montana','idaho','washington','oregon','california','north carolina',
                                  'south carolina','district of columbia'),
                   "Midwest" = c('wisconsin','indiana','ohio','michigan','illinois','missouri','iowa','minnesota','north dakota','south dakota','nebraska','kansas'),
                   'New England' = c('maine','vermont','new hampshire','massachusetts','rhode island','connecticut'),
                   "Mid-Atlantic" = c('district of columbia','new york','new jersey','pennsylvania','virginia','west virginia','maryland','delaware'),
                   "Southeast" = c('florida','georgia','alabama','mississippi','louisiana','arkansas','tennessee','kentucky','north carolina','south carolina'),
                   "Southwest" = c('texas','oklahoma','new mexico','arizona'),
                   "West" = c('colorado','utah','wyoming','nevada','montana','idaho','washington','oregon','california'))
    
    sub <- dset[dset$Parent_Organization == data, ]
    percent_map(sub$value, "darkgreen", "Market Share", regions = zoom)
  })
}