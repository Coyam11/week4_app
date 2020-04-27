library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

nba1819<- read.csv("nba1819.csv")


shinyUI(fluidPage(

    titlePanel("Select Variables"),
    sidebarLayout(
        sidebarPanel(
            selectInput("X", "Select x variable(horizontal):", colnames(nba1819), selected="Asists"),
            selectInput("Y", "Select y variable (vertical):", colnames(nba1819), selected = "Points"),
            selectInput("S", "Select variable for size points:", colnames(nba1819), selected="Minutes.Played"),
            checkboxInput("fit", "Linear fitting of y ~ x?")
            ),
        mainPanel(
            tabsetPanel(type = "tab",
                tabPanel("Plot", h3("Scatter plot of NBA stats 2018-19"),plotlyOutput("Scatplot")),
                tabPanel("Table", h3("Table of selected variable NBA stats 2018-19"), tableOutput("tabla1")),
                tabPanel("Documentation", 
                         h3("Documentation"),
                         h4("In this app, we can explore the stats of the NBA player that average more than 30 minutes per
                            game in the season 2018-19"),
                         h4("There are three tabs in the main panel. Plot, table and documentation"),
                         h4("The plot is interactive, so you can select some rectangules from the plot and zoom in"),
                         h4("In the second tab, 'Table', you can see the data that has been selected"),
                         h4("1. In the sidebar panel select the variable for plot in the x axis"),
                         h4("2. In the sidebar panel select the variable for plot in the y axis"),
                         h4("3. In the sidebar panel select the variable for the sizes of the points in the plot"),
                         h4("4. Finally, you can fit a linear model for the y variable as output and x as predictor. If you want to see this in the plot, check the corresponding box")
                
                         
                         )
            )
            
                    )
    )
))

(nba1819)
