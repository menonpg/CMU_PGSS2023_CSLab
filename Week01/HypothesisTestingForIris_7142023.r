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

# Display the first few rows of the DataFrame
head(iris_df)

# Display basic statistics
iris_df$Species <- as.factor(iris_df$Species)
summary(iris_df)

# Count the number of instances for each species
table(iris_df$Species)

# Create pairplot to visualize the distributions and relationships between different features for each species
pairs(iris_df[1:4], main = "Iris Data", pch = 21, bg = c("red", "green3", "blue")[unclass(iris_df$Species)])

# Check normality
shapiro.test(iris_df$Petal.Length[iris_df$Species == "Iris-setosa"])
shapiro.test(iris_df$Petal.Length[iris_df$Species == "Iris-versicolor"])
shapiro.test(iris_df$Petal.Length[iris_df$Species == "Iris-virginica"])

# Log transform the continuous variable to help ensure homoscedasticity
# iris_df <- iris_df %>% mutate(Petal.Length.Log = log(Petal.Length))

# Check homogeneity of variances
leveneTest(Petal.Length ~ Species, data = iris_df)

# Perform ANOVA
aov(Petal.Length ~ Species, data = iris_df)

# Perform Mann-Whitney U test for each pair of species
wilcox.test(iris_df$Petal.Length[iris_df$Species == "Iris-setosa"], iris_df$Petal.Length[iris_df$Species == "Iris-setosa"])
wilcox.test(iris_df$Petal.Length[iris_df$Species == "Iris-virginica"], iris_df$Petal.Length[iris_df$Species == "Iris-virginica"])
wilcox.test(iris_df$Petal.Length[iris_df$Species == "Iris-versicolor"], iris_df$Petal.Length[iris_df$Species == "Iris-virginica"])

# Build a decision tree classifier for Species using Petal.Length as a feature
iris_df$Species <- as.factor(iris_df$Species)
model <- rpart(Species ~ Petal.Length, data=iris_df, method="class")

# Visualize the decision tree
rpart.plot(model)

# 5-fold cross-validation
folds <- createFolds(iris_df$Species, k = 5)
cv_results <- lapply(folds, function(x) {
  train_fold <- iris_df[-x, ]
  test_fold  <- iris_df[x, ]
  
  model <- rpart(Species ~ Petal.Length, data=train_fold, method="class")
  predictions <- predict(model, test_fold, type = "class")
  
  # Classification report per species
  print(confusionMatrix(predictions, test_fold$Species))
  
  accuracy <- sum(predictions == test_fold$Species) / nrow(test_fold)
  return(accuracy)
})

# Compute the mean accuracy
mean_accuracy <- mean(unlist(cv_results))
print(mean_accuracy)


# Use all 4 variables as predictors
model_all <- rpart(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, data=iris_df, method="class")

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

# Classification report per species with all predictors
confusionMatrix(predictions, test_fold$Species)
