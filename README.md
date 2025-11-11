# 🎬 Movie Rating Predictor

**Live Demo:** 👉 [https://jszamik.shinyapps.io/MoviesRatingPrediction](https://jszamik.shinyapps.io/MoviesRatingPrediction)

An interactive **Shiny web application** that predicts a movie’s rating based on features such as budget, runtime, year, genre, and number of votes.  
The predictive model is built using a **Random Forest** algorithm in R.

---

## 🌟 Features

- 🎯 Real-time movie rating predictions  
- 🧠 Machine learning model (Random Forest)  
- 💡 User-friendly Shiny interface with a modern dark theme  
- 📊 Model evaluation metrics (RMSE, MAE) available in the training script  
- ⚙️ Clean modular project structure (training + app separated)

---

## 🖼️ Screenshots

### Main App View
![Movie Rating Predictor UI](images/screenshot_app.png)

### Model Training Example
![Random Forest Evaluation](images/training_results.png)


---

## 🧩 Tech Stack

- **R + Shiny** — interactive web app framework  
- **randomForest** — machine learning model  
- **bslib** — UI theming with Bootswatch  
- **dplyr, Metrics** — data cleaning and evaluation utilities  

---

## 📂 Project Structure

```
project/
├── app.R              # Shiny app for movie rating prediction
├── train_model.R      # Script for training and saving the Random Forest model
├── model/             # Saved model files (.rds)
│   ├── model_rf.rds
│   └── genre_levels.rds
├── images/            # Screenshots used in README
└── .gitignore
```

---

## ⚙️ Installation & Setup

### 1️⃣ Clone the repository
```bash
git clone https://github.com/<your-username>/MoviesRatingPrediction.git
cd MoviesRatingPrediction
```

### 2️⃣ Install required R packages
```r
install.packages(c("shiny", "randomForest", "bslib", "dplyr", "Metrics"))
```

### 3️⃣ Train the model
If you don’t have the model yet, run:
```r
source("train_model.R")
```
This will:
- Load and clean your dataset  
- Train a Random Forest model  
- Save the model and genre levels to the `model/` folder

### 4️⃣ Run the Shiny app locally
```r
shiny::runApp("app.R")
```
The app will open automatically in your browser.

---

## 🧠 Model Information

The Random Forest model was trained and tested on the **[Movies Dataset by Daniel Grijalva](https://www.kaggle.com/datasets/danielgrijalvas/movies)** available on Kaggle.  
This dataset contains metadata about thousands of movies, including their ratings, budgets, genres, and popularity metrics.

### 📊 Dataset Overview
| Column | Description |
|---------|-------------|
| `name` | Movie title |
| `rating` | IMDB-like score (target variable) |
| `genre` | Movie genre |
| `year` | Release year |
| `released` | Release date |
| `score` | Average rating (used as `score` in training) |
| `votes` | Number of votes |
| `budget` | Production budget (USD) |
| `gross` | Worldwide gross revenue (USD) |
| `runtime` | Duration in minutes |

For model training, only the following columns were used:
score, budget, runtime, year, genre, votes
The dataset was split into:
- **80% training set**
- **20% test set**

Evaluation metrics on the test set:
- **RMSE** (Root Mean Squared Error)  
- **MAE** (Mean Absolute Error)

---

Predictions are bounded between **1 and 10** to match the movie rating scale.

---

## 🚀 Deployment

The application is deployed on **[shinyapps.io](https://www.shinyapps.io/)** (Posit Cloud).  
You can access it here:  
👉 [https://jszamik.shinyapps.io/MoviesRatingPrediction](https://jszamik.shinyapps.io/MoviesRatingPrediction)

---

## 🗂️ .gitignore Highlights

```gitignore
.Rhistory
.Rapp.history

# R data files
.RData
.Ruserdata

# RStudio files
.Rproj.user/
*.Rproj

# Shiny / Posit deployment folder
rsconnect/

# Logs
*.log

# System files
.DS_Store
Thumbs.db

# Temporary files
*.tmp
*.swp
*.bak

```

---

## 🧭 Future Improvements

- 📈 Add feature importance visualization from Random Forest  
- 💬 Include model diagnostics (residuals, variable importance)  
- 📁 Add option to upload user datasets for prediction  
- 🌍 Add multilingual support (English / Polish)

---

## 🏷️ License

This project is released under the **MIT License**.  
You are free to use, modify, and distribute it for educational or research purposes.

---

## 👨‍💻 Author

Developed by **Jakub Szamik**  
📧 [szamikjakub@gmail.com]  
🌐 [https://jszamik.shinyapps.io/MoviesRatingPrediction](https://jszamik.shinyapps.io/MoviesRatingPrediction)
