library(shiny)
library(ggplot2)
a<-read.csv("data/01.csv",header = T,sep = ",")
shinyServer(function(input, output) { 
  
  passData <- reactive({
    
    if(class(input$domainShow)=="character"){
      
      a <- a[a$mes_sub_name %in% unlist(input$domainShow),]
    }
    a
  })
  
  output$The_mean_mes_score <- renderPlot({
    graphData =  passData()
    if(input$outputType == "mean_mes_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = mean_mes_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_mean_mes_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
    }
    if(input$outputType == "mean_mes_Z_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = mean_mes_Z_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_mean_mes_Z_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
    }
    if(input$outputType == "mean_mes_T_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = mean_mes_T_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_mean_mes_T_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
    }
    if(input$smoother){
      theGraph <- theGraph + geom_smooth(method = lm,se=FALSE)
      
    }
    print(theGraph)
  })
  
  output$The_median_mes_score <- renderPlot({
    
    graphData =  passData()
    
    if(input$outputType == "median_mes_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = median_mes_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_median_mes_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
      
    }
    if(input$outputType == "median_mes_Z_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = median_mes_Z_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_median_mes_Z_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
    }
    if(input$outputType == "median_mes_T_Score"){
      
      theGraph <- ggplot(graphData, aes(x = exam_sdate, y = median_mes_T_Score, group = mes_sub_name, colour = mes_sub_name)) + geom_line(size=1) +
        ylab("the_median_mes_T_Score")+theme(legend.position = "top",panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.title = element_text(size = 20,face = "italic"))
      
    }
    if(input$smoother){
      theGraph <- theGraph + geom_smooth(method=lm,se=FALSE)
      
    }
    print(theGraph)
  })
})
