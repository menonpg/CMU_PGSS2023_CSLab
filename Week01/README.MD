# Week01 Notes (7/7/2023)

# Python Exercises:

# CMU_PGSS2023_CSLab/Week01/MyFirstLocalPythonNotebook.ipynb
This code is a Python notebook that demonstrates how to mount Google Drive, read and manipulate data using Pandas and visualize data using Seaborn. It also shows how to authenticate and read data from Google Sheets using gspread. Specifically, the code reads a CSV file containing data on iris flowers from a Google Drive folder, creates a Pandas dataframe, and visualizes the average sepal length of each species of iris using a boxplot. Additionally, the code demonstrates how to read data from a Google Sheet and convert it into a Pandas dataframe.


# CMU_PGSS2023_CSLab/Week01/MyFirstColabNotebook01.ipynb
This notebook is an equivalent of the above Colab notebook, written to be run on a local Conda environment, using VSCode as an IDE. 


# R Exercises:

## iris.R

This code is written in the R programming language and performs several operations on the famous iris dataset.

First, it reads the dataset from a CSV file located at "/Users/pgmenon/Documents/CMU/PGSS2023/CMU_PGSS2023_CSLab/Week01/iris.csv" using the read_csv function from the readr package. It specifies that the first row of the CSV file does not contain column names using col_names = FALSE, and sets the data type of the first column to double using col_types = cols(X1 = col_double()).

Next, it renames the columns of the data frame to "Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", and "Species" using colnames(iris) <- c("Petal.Length", "Petal.Width", "Sepal.Length", "Sepal.Width", "Species").

Then, it converts the "Species" column to a factor using iris$Species <- as.factor(iris$Species).

After that, it prints the class of each column of the data frame using print(sapply(iris, class)).

It then visualizes the distribution of Species in a frequency table using print(table(iris$Species)).

Finally, it generates a ggplot diagram to visualize a boxplot of Sepal.Width by Species and writes this plot out to an image file located at "/Users/pgmenon/Documents/CMU/PGSS2023/CMU_PGSS2023_CSLab/Week01/iris.png" using ggplot2 and cowplot packages. The plot is saved using save_plot function with base height and width set to 4 and limitsize set to FALSE.



# Week01 Notes (7/11/2023)

Re-run of Week01, 7/7/2023 content + New Content identified below.

Today we explored the use of OpenAI's CodeInterpreter and Monica (leveraging GPT3.5 via OpenAI API endpoints) to analyse the Iris dataset.  The code for the same was transcribed into CMU_PGSS2023_CSLab/Week01/CodeInterpreter_ChatGPT_IRIS_Explore.ipynb. 

This Python code additionally performs exploratory data analysis and hypothesis testing on the Iris dataset. The code is divided into several sections, each of which performs a specific task.

The first section loads the Iris dataset from Google Drive using pandas. The dataset contains four continuous independent variables (petal length, petal width, sepal length, and sepal width) and one categorical dependent variable (species).

The second section performs exploratory data analysis (EDA) on the dataset. It displays basic statistics and visualizes the distributions and relationships between different features for each species using a pairplot.

The third section explores a hypothesis using statistical testing. The hypothesis is that the average petal length differs significantly between the species. The code checks normality, homogeneity of variances, and performs ANOVA and Mann-Whitney U tests to test the hypothesis. The results show that the petal length is significantly different between the species.

The fourth section builds a decision tree classifier for the species using petal length as a feature. It uses the decision tree to visualize the decision rules embodied by the classifier and calculates the accuracy of the classifier. The code also performs 5-fold cross-validation and generates cross-validated predictions for each data point. Finally, it prints a classification report showing precision, recall, and F1-score per class.

The fifth section explores how the classification report looks like for other continuous dependent variables predicting the species response.

The final section explores how the classification report looks like if all four independent variables are used to predict the species response.