function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "UnitedHealth" = "UnitedHealth Group, Inc.",
                   "Aetna" = "Aetna Inc.",
                   "Kaiser" = "Kaiser Foundation Health Plan, Inc.",
                   "Anthem" = "Anthem Inc.")
    
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
    
    sub <- county_choropleth(dset[dset$Parent_Organization == data, ],
                             title       = "Market Shares",
                             legend      = "Percent of MA Population",
                             num_colors  = 1,
                             state_zoom = zoom)
    sub + scale_fill_continuous(low="#eff3ff", high="#084594", na.value="white")
  })
}