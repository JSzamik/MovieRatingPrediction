# train_model.R
library(dplyr)
library(randomForest)
library(Metrics)   # for RMSE, MAE

# Load your dataset -------------------------------------------
# Replace this with your actual data loading method
# Example: movies <- read.csv("data/movies.csv")
# movies must contain: score, budget, runtime, year, genre, votes

# movies <- ...  # <--- YOUR DATA HERE

movies_clean <- movies %>%
  filter(!is.na(score),
         !is.na(budget),
         !is.na(runtime),
         !is.na(year),
         !is.na(genre),
         !is.na(votes)) %>%
  mutate(genre = factor(genre))

set.seed(123)
train_index <- sample(nrow(movies_clean), 0.8 * nrow(movies_clean))
train_data <- movies_clean[train_index, ]
test_data  <- movies_clean[-train_index, ]

# Train Random Forest Model ------------------------------------
set.seed(123)
model_rf <- randomForest(
  score ~ budget + runtime + year + genre + votes,
  data = train_data,
  ntree = 500,
  mtry = 3,
  importance = TRUE
)

# Evaluate model ------------------------------------------------
pred_rf <- predict(model_rf, newdata = test_data)

rmse_value <- rmse(test_data$score, pred_rf)
mae_value  <- mae(test_data$score, pred_rf)

cat("RMSE:", rmse_value, "\n")
cat("MAE :", mae_value, "\n")

# Save model + genre levels ------------------------------------
dir.create("model", showWarnings = FALSE)
saveRDS(model_rf, "model/model_rf.rds")
saveRDS(levels(train_data$genre), "model/genre_levels.rds")

