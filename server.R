library(reshape)

server <- function(input, output){
  

  election_Data <- read.csv("tweets_final.csv")
  
  election_Data1 <- read.csv("tweets1.csv")
  
  
  # Create dates
  election_Data$Date <- as.Date(election_Data$Date)
  
 
  # Reshape
  ds <- melt(election_Data, id = "Date")
  
  
  # Plot time series chart 
  output$timeseries1 <- renderPlotly({
   
    p <- ds %>% 
      filter(variable != "GSPC") %>% 
      plot_ly(x = Date, y = c("Trump", "Rubio", "Cruz", "Kashich", "Carson", "Clinton"), color = variable, mode = "lines", line = list(width = 5), width = "400px", align = "right",  hovermode = "closest", source = "source")
    
    # Add SP500
    p <- add_trace(p, data = election_Data, x = Date, y = NULL, mode = "lines", yaxis = "y2", name = "Presidential Polls", opacity = 0.5,
                   line = list(width = 5)) %>% 
      layout(title = "People talking about Candidates: Weekly Data",
             xaxis = list(title = "Dates", gridcolor = "#bfbfbf", domain = c(0, 0.98)),
             yaxis = list(title = "Candidates", gridcolor = "#bfbfbf"), 
             plot_bgcolor = "#F5F1DA",
             paper_bgcolor = "#E3DFC8", 
             yaxis2 = list(title = "Presidential Polls", side = "right", overlaying = "n"))
    p
  })
  
  output$timeseries2 <- renderPlotly({
   
    p <- ds %>% 
      filter(variable != "GSPC") %>% 
      plot_ly(x = Date, y = value, color = variable, mode = "lines", line = list(width = 3), hovermode = "closest", source = "source")
    
    # Add SP500
    p <- add_trace(p, data = election_Data1, x = Date, y = NULL, mode = "lines", yaxis = "y2", name = "Election in US", opacity = 0.3,
                   line = list(width = 5)) %>% 
      layout(title = "Trend for Presidential Election 2016 in US",
             xaxis = list(title = "Dates", gridcolor = "#bfbfbf", domain = c(0, 0.98)),
             yaxis = list(title = "", gridcolor = "#bfbfbf"), 
             plot_bgcolor = "#8DD3C7",
             paper_bgcolor = "#FFFFB3", 
             yaxis2 = list(title = "Election in US", side = "right", overlaying = "y"))
    p
  })
  
  
}

