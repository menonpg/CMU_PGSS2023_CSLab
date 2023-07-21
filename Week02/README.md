# Week02 Content 

## 7/18/2023:
CMU_PGSS2023_CSLab/Week02/textanalysis_01.py:

This script is an example of text analysis and classification using Python. Here is a brief summary of the script:

The script imports the necessary libraries and mounts Google Drive to access the dataset.
The dataset is read into a pandas dataframe and the distribution of each type of review is checked.
The text data is cleansed to remove things that wouldn't have any bearing on sentiment, such as HTML tags, URLs, contractions, etc.
Word clouds are created to get a birds-eye view of the data given.
Bar plots and box plots are created to visualize the distribution of word counts in the reviews.
Sentence transformers are used to embed the text into fixed-length numerical representations.
A decision tree is created to classify sentiment using the remaining columns of the dataset.
The accuracy and classification report are printed.
Overall, this script provides a basic framework for text analysis and classification, which can be adapted and extended for other use cases.

