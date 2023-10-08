# Load the cluster library

library(factoextra)
library(cluster)
library(NbClust)

 

# Load the iris dataset
data(iris)
head(iris)

# Select the first four columns of the iris dataset
iris_data <- iris[,1:4]

res.nb <- NbClust(iris_data, diss = NULL, distance = "euclidean", min.nc = 2, max.nc = 10, method = "centroid")
fviz_nbclust(res.nb)

# Set the number of clusters to 2 based on output from fviz_nbclust
kz <- 5

# Run PAM algorithm on iris_data with k clusters
pam_resulti <- pam(iris_data, kz)

# Print the cluster medoids
print(pam_resulti$medoids)

# Generate a silhouette plot
silResulti <- silhouette(pam_resulti)

plot(silResulti)

#this produces a great plot
fviz_silhouette(silResulti)

print(silResulti)

#attaches the record to the dataset.
dd <- cbind(iris, cluster = pam_resulti$clustering)
head(dd, n = 50)