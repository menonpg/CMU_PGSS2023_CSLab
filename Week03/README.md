# Week03 Content 

## 7/25/2023:

CMU_PGSS2023_CSLab/Week03/ColorPurple_Ensembles.ipynb:

This script is an example of tabular data analysis using a competition of models. We explore a dataset containing RGB values for different colors, with the goal of building models to classify the color purple. We use pandas and seaborn to visualize the distribution of RGB values for purple and non-purple colors. We also use LazyClassifier to quickly evaluate the performance of various machine learning models on the dataset.

One key finding was that there was a clear difference in the distribution of RGB values between purple and non-purple colors. Purple colors tended to have higher values of R and B, while non-purple colors tended to have more uniform distributions across all three channels.

We also found that LazyClassifier was able to quickly evaluate the performance of various machine learning models on the dataset, without requiring significant amounts of code. However, the performance of the models was generally not very high, with accuracy scores ranging from around 60% to 70%. This suggests that more sophisticated models or more data may be needed to achieve better performance on this task, and the possibility of a non-linear decision boundary needing to be captured.

In addition to using LazyClassifier, we also explored the use of H2O's Flow interface to rapidly train ensemble models made of XGBoost, GBM, and other model types including distributed random forests and GLMs. Ensembles are machine learning models that combine the predictions of multiple individual models to improve overall performance. The idea is that by combining the predictions of multiple models, the ensemble can capture a wider range of patterns in the data, leading to better predictions.

In our exploration of H2O's Flow interface, we found that it provided an easy-to-use interface for rapidly training and evaluating ensemble models. We were able to experiment with various model types and hyperparameters, and quickly evaluate the performance of the resulting ensembles. We also found that the ensemble models generally outperformed the individual models, achieving accuracy scores in the range of 80% to 90%. This suggests that ensembles can be an effective approach for improving the performance of machine learning models on complex tasks.
