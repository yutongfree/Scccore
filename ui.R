library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("The Score Analytics"), 
  
  sidebarPanel(
    
    
    checkboxInput(inputId = "smoother",
                  label = "Add line of regression?",
                  value = FALSE),
    
    checkboxGroupInput(inputId = "domainShow",
                       label = "Show chinese and other domain (defaults to all)?",
                       choices = list("Chinese" = "语文",
                                      "Math" = "数学","English"="英语","Physics"="物理","Chemistry"="化学","Biology"="生物",
                                      "Geography"="地理","History"="历史","Politics"="政治")
    ),
    radioButtons(inputId = "outputType",
                 label = "Output required",
                 choices = list("Mean_Mes_Score" = "mean_mes_Score",
                                "Mean_Mes_Z_Score" = "mean_mes_Z_Score",
                                "Mean_Mes_T_Score" = "mean_mes_T_Score",
                                "Median_Mes_Score" = "median_mes_Score",
                                "Median_Mes_Z_Score" = "median_mes_Z_Score",
                                "Median_Mes_T_Score" = "median_mes_T_Score"))
  ),
  mainPanel(
    tabsetPanel( 
      tabPanel("Mean_score", plotOutput("The_mean_mes_score")),
      tabPanel("Median_score", plotOutput("The_median_mes_score")))
    
  ))
)
