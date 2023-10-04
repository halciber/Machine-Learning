#KMeansClustering.R

#Looking this algorithm.

library(factoextra)
library(cluster)

clusters <- 4
randomsets <- 25

model <- kmeans(df_modelingdata, centers = clusters, nstart = randomsets)
