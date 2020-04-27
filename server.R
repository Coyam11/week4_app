library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

nba1819<- read.csv("nba1819.csv")

shinyServer(function(input, output) {
    
    
    dataInput <- reactive({
        nba1819[,c("Player", input$X, input$Y, input$S)]
        })
    
    output$tabla1 <- renderTable({dataInput()})

     output$Scatplot <- renderPlotly({
            
         
          g<- ggplot(dataInput(), aes(dataInput()[,2], dataInput()[,3]))
          g <- g + geom_point(aes(size=dataInput()[,4], label_value=Player), colour="darkgreen", alpha=0.7)
          g <- g + labs(x=colnames(dataInput())[2], y=colnames(dataInput()[3]))  
          
          if(input$fit){
           g <- g + geom_smooth(method='lm', col="blue")
           }
         ggplotly(g)
         })

})

