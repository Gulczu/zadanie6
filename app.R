library(shiny)
library(shinythemes)
ui <- fluidPage(theme=shinytheme('superhero'),
  titlePanel('Zadanie 5'),
  
  sidebarLayout(
    sidebarPanel(
      textInput("mojTekst", 'Wpisz tekst poniżej:'),
        numericInput('mojnumer', 'Wybierz numer od 0 do 100:', value=50, min=0, max=100, step=1),
    selectInput('mojalitera', 'Wybierz literę od A do K:', choices=LETTERS[1:11])
  ),
    mainPanel(h3('Poniżej wpisany tekst, wybrany numer i litera'),
      code(textOutput('wyjsciowyTekst')),
      strong(textOutput('Wyjsciowynumer')),
      em(textOutput('Wyjsciowalitera'))
      
    )
  )
)
server <- function(input,output) {
  output$wyjsciowyTekst <-
    renderText(paste('Wybrany tekst:', input$mojTekst))
  
  output$Wyjsciowynumer <-
    renderText(paste('Wybrany numer:', input$mojnumer))
  
  output$Wyjsciowalitera <-
    renderText(paste('Wybrana litera:', input$mojalitera))
  }

shinyApp(ui,server)