library(shiny)
mybmi=function(x,y){x/((y/100)^2)}
eval<-function(x,y){ 
  bmi<-x/((y/100)^2)
  if (bmi<18.5) {"please visit doctor"}else if(bmi>24.9){"reduce diet"} else {"you are healthy"}}
body=matrix(c(18.5,6.4,15.1),nrow = 1,ncol = 3)
shinyServer(
  function(input,output)
  {
    output$myname <- renderText(input$name)
    output$myage <- renderText(input$age)
    output$mygender <- renderText(input$gender)
    output$myhobby <- renderText(input$hobby)
    output$mybmi <- renderText(mybmi(input$weight,input$height))
    output$eval<-renderText(eval(input$weight,input$height))
    
    output$mysubject <- renderPrint( input$subject)
    output$myplot<-renderPlot({barplot(as.matrix(body[1,]),ylab = "BMI",ylim = c(0,40),
    main = "BODY MASS INDEX",legend.text = c("under-weight","good","obese"),col = c("pink","green"," red")
     )
    lines(c(0,30),c(mybmi(input$weight,input$height),mybmi(input$weight,input$height)),col = "blue",lwd=5)})
    
  }
  )

