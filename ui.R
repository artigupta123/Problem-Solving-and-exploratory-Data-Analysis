library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)
library(acepack)

ui <- fluidPage(
  # Set theme
  theme = shinytheme("spacelab"),
  
  # Some help text
  
  # h2 (
  #  font-family: "US Presidential Election 2016", cursive,
  #  font-weight: 500,
  # line-height: 1.1,
  #  color: #48ca3b,
  #),
  h2("US Presidential Election 2016"),
  h4("This UI will illustrate the Daily/Weekly trend for US President Elections"),
  tags$hr(),
  tags$blockquote("Weekly Summarization over Tweets"),

        fluidRow(
        column(7, plotlyOutput(outputId = "timeseries2", height = "400px", width = "700px"))),
        
  
  # Vertical space
 
  tags$hr(),
  tags$blockquote("Polls/Voting per day (No. of Tweets about respective Candidate)"),
  # Plotly Chart Area
  fluidRow(
    column(6, plotlyOutput(outputId = "timeseries1", height = "500px", width = "800px"))),
  
  tags$hr(),
  tags$blockquote("")
  
 
)

