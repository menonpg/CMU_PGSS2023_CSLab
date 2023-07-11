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

