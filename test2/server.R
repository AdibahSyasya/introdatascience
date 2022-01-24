library(forecast)
attach(CaseState)
library(ggplot2)
library(dplyr)
library(tidyr)
p <- barplot(CaseState$cases_new, 
             main = "States Vs New Cases",
             xlab = "state",
             ylab = "cases_new",
             names = CaseState$state,
             col = "yellow",
             border = "blue")


function(input, output, session) {
  
  output$oconf <- renderText({
    d<-CaseState[CaseState$date==input$dt1 & CaseState$state==input$sta,]
    paste(d$cases_new)
    
  })
  
  output$mydates<-renderText({
    input$date1})
  
  output$ocur <- renderText({
    d<-CaseState[CaseState$date==input$dt1 & CaseState$state==input$sta,]
    paste(d$cases_recovered)
  })
  
  output$odet <- renderText({
    d<-CaseState[CaseState$date==input$dt1 & CaseState$state==input$sta,]
    paste(d$cases_active)
  })
  
  output$plot <- renderPlot({
    barplot(CaseState$cases_new, 
            main = "States Vs New Cases",
            xlab = "state",
            ylab = "cases_new",
            names = CaseState$state,
            col = "yellow",
            border = "blue")
    
  } 
  )
  
  
  
  output$table <- DT::renderDataTable(
    CaseState
  )
  
}