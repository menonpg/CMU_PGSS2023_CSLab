# Load the required packages
library(readr)

# Read the iris data from a CSV file
iris_df <- read_csv("iris.csv", col_names = c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species"))


# Make a model to relate sepal.length to petal.length
model = lm (Sepal.Length ~ Petal.Length, data = iris_df)

plot(iris_df$Petal.Length, iris_df$Sepal.Length)
abline(model)

par(mfrow=  c(2,2))
plot(model)


# Make a model to relate sepal.length to petal.length
model = lm (Sepal.Length ~ Petal.Length + Petal.Width + Sepal.Width, data = iris_df)

par(mfrow=  c(1,1))
plot(iris_df$Petal.Length, iris_df$Sepal.Length)
abline(model)

par(mfrow=  c(2,2))
plot(model)