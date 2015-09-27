shinyUI(fluidPage(
      
      # Application title
      titlePanel("Estimate Your MPG!"),
      
      # Sidebar with inputs
      sidebarLayout(
            sidebarPanel(
                  helpText("Insert your car's information and get an 
                           estimate of it's fuel consumption. 
                           The graphs allow you to compare it to other 
                           models. The estimation is based on the 
                           mtcars dataset and linear regression."),
                  sliderInput("hp",
                              "Horsepower:",
                              min = 50,
                              max = 300,
                              value = 150),
                  sliderInput("wt", 
                               "Weight (lbs):", 
                              min = 1000, 
                              max = 4000, 
                              value = 3000),
                  radioButtons("am", 
                               "Transmission type:",
                               choices = list(
                                     "Automatic" = 0, 
                                     "Manual" = 1), 
                                     selected = 1)
            ),
            
            # Show the results
            mainPanel(
                  h3( textOutput( "mpg" ) ),
                  plotOutput("hpPlot"), 
                  plotOutput("wtPlot")
            )
      )
)
)
