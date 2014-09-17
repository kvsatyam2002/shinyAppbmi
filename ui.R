library(shiny)
shinyUI
( fluidPage
  (
  titlePanel(title="Presonal details with shiny"),
  sidebarLayout
      (
                sidebarPanel(
                  h2('Enter your information'),
                
                  textInput("name",h5("please enter your name"),value = ""),
                
                  sliderInput("age",h5("please enter your Age"),min = 0,max = 80,step = 5,value = 35),
                
                  radioButtons (inputId = "gender",h5("please enter gender") ,choices = c("male","female"),inline = TRUE),
                
                  checkboxGroupInput( 'hobby',h5('Enter hobbies'),c('music','sports','drawing','reading'),inline = TRUE,selected = 'reading' )
                , numericInput(inputId = "weight",label = h5("your weight in kgs"),min = 0,max = 100,value = 50,step = 5)  
                ,numericInput("height",h5("height in cms "),min = 100,max = 200,step = 10,value = 155)
                
                ,selectInput("subject", h5("subject of intrest:"),c("Data Science","Web development","Java programming"))
                ,submitButton(text = "Apply Changes", icon = NULL)
                ),
                                 
                mainPanel (
                          h2("Personal information"),
                          h5("Your Name"),
                          verbatimTextOutput("myname"),
                          h5("Your Age"),
                          verbatimTextOutput("myage"),
                          
                          verbatimTextOutput("mygender"),
                          
                          h5("Your Hobbies are")
                          
                          ,verbatimTextOutput("myhobby")
                          
                          ,h5("Your BMI")
                          , verbatimTextOutput("mybmi")
                          , verbatimTextOutput("eval")
                          ,h5("Your Favourite Subject")
                          , textOutput("mysubject")
                         ,plotOutput("myplot" )
                        )
      )
  )
)