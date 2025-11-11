library(shiny)
library(randomForest)
library(bslib)

# Load model and genre levels ---------------------------------
model <- readRDS("model/model_rf.rds")
genre_levels <- readRDS("model/genre_levels.rds")

# THEME --------------------------------------------------------
theme <- bs_theme(
  version = 5,
  bootswatch = "cyborg",   # nowoczesny ciemny motyw; można zmienić
  base_font = font_google("Inter"),
  heading_font = font_google("Montserrat"),
  primary = "#ff9900"
)

ui <- fluidPage(
  theme = theme,
  
  # HEADER -----------------------------------------------------
  div(
    style = "
      text-align:center; 
      margin-bottom:25px; 
      padding-top:20px;
    ",
    h1("🎬 Movie Rating Predictor", style = "font-weight:600;"),
    p("Enter the movie details and check the predicted rating ⭐",
      style = "font-size:16px; opacity:0.8;")
  ),
  
  # CARD LAYOUT ------------------------------------------------
  fluidRow(
    column(
      width = 4,
      card(
        style="padding:20px;",
        h4("Input data", style="margin-bottom:20px;"),
        
        numericInput("budget", "💰 Budget ($):", 50000000, min = 0),
        numericInput("runtime", "⏱ Runtime (min):", 120, min = 1),
        numericInput("year", "📅 Release Year:", 2020, min = 1900, max = 2100),
        selectInput("genre", "🎭 Genre:", choices = genre_levels),
        numericInput("votes", "🗳 Number of Votes:", 100000, min = 1),
        
        div(style="text-align:center; margin-top:20px;",
            actionButton(
              "predict_btn", 
              "Predict Rating ⭐",
              class = "btn btn-lg btn-primary"
            )
        )
      )
    ),
    
    # RESULT CARD ---------------------------------------------
    column(
      width = 8,
      card(
        style="padding:30px; text-align:center; min-height:200px;",
        h3("Predicted Movie Rating", style="margin-bottom:20px;"),
        uiOutput("result_ui")
      )
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$predict_btn, {
    
    new_movie <- data.frame(
      budget = input$budget,
      runtime = input$runtime,
      year = input$year,
      genre = factor(input$genre, levels = genre_levels),
      votes = input$votes
    )
    
    pred <- predict(model, new_movie)
    pred <- max(min(pred, 10), 1)
    
    output$result_ui <- renderUI({
      tagList(
        h1(
          round(pred, 2),
          style="font-size:60px; font-weight:700; color:#ffcc00;"
        ),
        p("⭐ on a 1–10 scale", style="opacity:0.7; font-size:18px;")
      )
    })
  })
}

shinyApp(ui = ui, server = server)
