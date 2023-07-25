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


## 7/21/2023:

We used Python and various libraries such as pandas, BeautifulSoup, wordcloud, seaborn, scikit-learn, tensorflow, and sentence-transformers. We demonstrated how to preprocess text data, visualize it, and build classifiers to predict sentiment. The lecture also covered how to save the trained models and datasets for future use. To summarize this lecture, we covered the following topics:

Importing a dataset and exploring it using pandas
- Cleaning text data using Beautiful soup and regular expressions
- Creating word clouds and bar plots to visualize the data
- Using sentence transformers to embed text into fixed-length numerical representations
- Classifying text using decision trees and fully-connected neural networks
- Saving the trained models and datasets for future use

Fianlly, we compared the performance of a decision tree and a fully-connected neural network for classifying sentiment in a dataset of movie reviews. The decision tree achieved an accuracy of around 76%, while the neural network achieved an accuracy of around 88%.

One key finding was that the neural network outperformed the decision tree by a significant margin. This is likely due to the neural network's ability to learn more complex relationships between the features and the target variable. The decision tree, on the other hand, relied on simple if-then rules to make predictions.

Another finding was that the neural network required more data to achieve its high accuracy. In the lecture, we used only 10,000 samples for training and testing. However, the neural network performed significantly better when trained on a larger dataset of 50,000 samples. This suggests that the neural network requires more data to learn the complex relationships between the features and the target variable.

In summary, the fully-connected neural network outperformed the decision tree in classifying sentiment in the movie review dataset. However, it required more data to achieve its high accuracy.

During this lecture , we also explored the value of single shot learning and few-shot learning to classify text for sentiment using pre-trained large language models (LLMs), including using OpenAI's GPT3.5 for this task, through a programmatic API. 
