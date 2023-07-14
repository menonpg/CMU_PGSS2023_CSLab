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

# Use all 4 variables as predictors
model_all <- rpart(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, data=iris_df, method="class")

print(rpart.plot(model_all))


# VALIDATION:
# 5-fold cross-validation with all predictors
cv_results_all <- lapply(folds, function(x) {
  train_fold <- iris_df[-x, ]
  test_fold  <- iris_df[x, ]
  
  model <- rpart(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, data=train_fold, method="class")
  predictions <- predict(model, test_fold, type = "class")
  
  # Classification report per species with all predictors
  print(confusionMatrix(predictions, test_fold$Species))
  
  print(rpart.plot(model))
  
  accuracy <- sum(predictions == test_fold$Species) / nrow(test_fold)
  return(accuracy)
})

# Compute the mean accuracy with all predictors
mean_accuracy_all <- mean(unlist(cv_results_all))
print(mean_accuracy_all)
