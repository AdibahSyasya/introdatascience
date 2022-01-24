CaseState <- read_csv("C:/Users/User/Documents/Lab/CaseState.csv")
CaseState$Date <- as.Date(CaseState$date,format = "%d/%m/%y")
library(shiny)
library(markdown)
library(dplyr)


navbarPage("OPTIONS",
           navbarMenu("MENU",
                      tabPanel("About Covid-19",
                               headerPanel(strong("Malaysia Covid-19 Tracker")),
                               fluidRow(
                                 column(6,
                                        h3(p(
                                          "This is a covid-19 tracker page.That shows",
                                          "the number of people who got this disease and places of Covid-19 throughout the states in Malaysia through predictive analytics.",
                                          "I hope people will be more carefull and safe. ",
                                          "Take care."
                                        ))
                                 ),
                                 column(8,
                                        img(src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOg9UycaaprPf-Q3U4khuNHFcsat38PMac4g&usqp=CAU',align = "right"
                                            
                                        )
                                 )
                               )
                               
                      ),
                      tabPanel("Covid-19 Table",
                               DT::dataTableOutput("table")
                      ),
                      tabPanel("Each State data",
                               headerPanel("Select The Dates To See What Happened On That Day In Any State"),
                               sidebarPanel(
                                 dateInput("dt1","DATE: ",
                                           min = "2020-01-25",
                                           max = "2022-01-20"),
                                 selectInput("sta", "STATE:",choices = unique(CaseState$state)),
                               ),
                               mainPanel(
                                 h2("New Case :",textOutput("oconf"),style="color:red"),
                                 h2("Recovered Case :",textOutput("ocur"),style="color:brown"),
                                 h2("Active Case :",textOutput("odet"),style="color:gold")
                               )
                               
                      )
                      
           ),
           tabPanel("EXPLORATORY DATA ANALYSIS",
                    sidebarLayout(
                      sidebarPanel(
                        radioButtons("plotType", "Plot type",
                                     c("Barplot"="b")
                        )
                      ),
                      mainPanel(
                        plotOutput("plot")
                      )
                    )
                    
           )

           
)

