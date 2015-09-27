data <- mtcars
fit = lm( mpg ~ wt + hp + am, data = mtcars )

# Define server logic
shinyServer(function(input, output) {
      
      output$mpg <- renderText({ 
            inputPoint <- data.frame( input$hp, input$wt/1000, as.numeric( input$am ) )
            names( inputPoint )  <- c("hp", "wt", "am")
            paste( 'The estimated MPG is: ', 
                   round( predict( fit, newdata = inputPoint ), 2 ) ) 
      })
      
      output$hpPlot <- renderPlot({
            plot( data$hp, data$mpg, 
                  xlab = "Horsepower", 
                  ylab = "MPG" )
            inputPoint <- data.frame( input$hp, input$wt/1000, as.numeric( input$am ) )
            names( inputPoint )  <- c("hp", "wt", "am")
            points( input$hp, predict( fit, newdata = inputPoint ), 
                    col = "red", lwd = 10 )
      })

      output$wtPlot <- renderPlot({
            plot( 1000*data$wt, data$mpg, 
                  xlab = "Weight", 
                  ylab = "MPG" )
            inputPoint <- data.frame( input$hp, input$wt/1000, as.numeric( input$am ) )
            names( inputPoint )  <- c("hp", "wt", "am")
            points( input$wt, predict( fit, newdata = inputPoint ), 
                    col = "red", lwd = 10 )
      })      
})
