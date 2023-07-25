library(h2o)
h2o.init(max_mem_size = '2G')  # I'm using 3.36.0.2 H2o version 

df = read.csv('h2oTrainingDF.csv')
df = df[,c("R", "G", "B", "Color")]
df$Color <- as.factor(df$Color)

h2odf = as.h2o(df, destination_frame = "PurpleClassifier.hex")

# h2o.shutdown()

myModel = h2o.loadModel("models/GBM_grid_1_AutoML_1_20230725_155953_model_6") #StackedEnsemble_AllModels_5_AutoML_1_20230725_155953")

h2o.varimp_plot(myModel)
