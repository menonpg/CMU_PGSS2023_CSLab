# Load the required packages
library(readr)
library(dplyr)
library(ggplot2)
library(car)
library(rstatix)
library(rpart)
library(rpart.plot)
library(caret)

# Read the iris data from a CSV file
iris_df <- read_csv("iris.csv", col_names = c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species"))

# Convert Species to a factor
iris_df$Species <- as.factor(iris_df$Species)

# Build a regression model for Sepal.Length based on the other variables
model_regression <- rpart(Sepal.Length ~ Petal.Length + Petal.Width + Sepal.Width + Species, data=iris_df, method="anova")

print(rpart.plot(model_regression))

# VALIDATION:
# Create 5-fold cross-validation indices
folds <- createFolds(iris_df$Sepal.Length, k = 5)

# 5-fold cross-validation
cv_results_regression <- lapply(folds, function(x) {
  train_fold <- iris_df[-x, ]
  test_fold  <- iris_df[x, ]
  
  model <- rpart(Sepal.Length ~ Petal.Length + Petal.Width + Sepal.Width + Species, data=train_fold, method="anova")
  predictions <- predict(model, test_fold)
  
  print(rpart.plot(model))
  
  # Compute RMSE (root mean squared error) for each fold
  rmse <- sqrt(mean((predictions - test_fold$Sepal.Length)^2))
  
  print(rmse)
  
  return(rmse)
})

# Compute the mean RMSE
mean_rmse <- mean(unlist(cv_results_regression))
print(mean_rmse)
