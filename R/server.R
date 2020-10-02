#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    iter <- reactiveVal(0)
    output$letter_plot <- renderPlot({
        library(tidyverse)
        
        # generate bins based on input$bins from ui.R
       
        invalidateLater(60/input$bpm*1000)
        #drumr::beat(1,1)
        beepr::beep(sound = 1)
        #for (i in 1:(input$bpm*3)){  sample(LETTERS,1)
        isolate({iter(iter()+1)})
            tibble(x=iter()%%2,y=1,
                   label= sample(LETTERS,1)) %>%
                   # label= iter_prog) %>% 
                ggplot(aes(x,y)) +
                geom_text(aes(label = label), 
                          fontface= "bold",
                          size = 18) + 
                xlim(0,1) + 
                theme_void()
        #}

    })
   
})
