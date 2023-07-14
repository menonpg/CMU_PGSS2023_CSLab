# Load the required packages
library(readr)
library(dplyr)
library(tidyr)
library(glmnet)

# Read the iris data from a CSV file
iris_df <- read_csv("iris.csv", col_names = c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species"))

# Create a new binary column indicating whether the Species is setosa or not
iris_df <- iris_df %>%
  mutate(setosa = ifelse(Species == "Iris-setosa", 1, 0))

iris_df$setosa <- as.factor(iris_df$setosa)

# Split the data into training and testing sets
set.seed(123)
train_index <- sample(nrow(iris_df), 0.5 * nrow(iris_df))
train_data <- iris_df[train_index, ]
test_data <- iris_df[-train_index, ]

# Fit a logistic regression model to the training data
logit_model <- glm(setosa ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, family = binomial(link = "logit"), data = train_data)

# Make predictions on the testing data
test_data$predicted_setosa <- predict(logit_model, newdata = test_data, type = "response")

# Evaluate the model performance on the testing data
confusion_matrix <- table(test_data$setosa, ifelse(test_data$predicted_setosa > 0.5, 1, 0))
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

print(confusion_matrix)

print(accuracy)
