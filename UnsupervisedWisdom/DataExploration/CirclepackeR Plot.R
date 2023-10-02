head(mtcars)

if (system.file(package = "ggdendro") == "") {
  install.packages("ggdendro")
}


library("ggplot2")
library("ggdendro")

# Load or create a data frame
data(mtcars) # Load the built-in mtcars data frame

# Compute the distance matrix
d <- dist(locationresults, method = "euclidean") # Use euclidean distance

# Perform hierarchical clustering
hc <- hclust(d, method = "ward.D2") # Use Ward's method

# Convert to a dendrogram object
hcd <- as.dendrogram(hc)

# Plot the dendrogram
#plot(hcd, type = "rectangle", horiz = FALSE) # Use a triangular and horizontal plot

# Convert to dendrogram object
dend <- as.dendrogram (hc)

# Plot the dendrogram
plot (dend, main = "Dendrogram example")



# Load libraries
library (tidyverse)
library (dendextend)

# Create a sample dataframe with your columns
df <- tibble (
  sex = c ("M", "F", "F", "M", "M", "F", "M", "F", "F", "M"),
  location = c ("NY", "LA", "LA", "NY", "NY", "LA", "LA", "NY", "LA", "NY"),
  diagnosis = c ("flu", "covid", "covid", "flu", "flu", "covid", "covid", "flu", "covid", "flu"),
  body_part = c ("head", "chest", "chest", "head", "head", "chest", "chest", "head", "chest", "head"),
  frequency = c (3, 5, 4, 2, 3, 6, 5, 2, 4, 3)
)

df <- locationresults

# Define a function to create custom labels for each cluster
label_func <- function (id) {
  # If id is less than the number of rows, it is a leaf node
  if (id < nrow (df)) {
    # Return a label with the values of the columns for that row
    return (paste0 (df$sex [id], ", ", df$location [id], ", ", df$diagnosis [id], ", ", df$body_part [id], ", ", df$frequency [id]))
  }
  # Otherwise, it is a non-leaf node
  else {
    # Return an empty label
    return ("")
  }
}

# Perform hierarchical clustering using average linkage and Euclidean distance
hc <- hclust (dist (df$frequency), method = "complete")

# Convert to dendrogram object
dend <- as.dendrogram (hc)

# Set the custom labels for the leaves
dend <- set (dend, value = label_func)

# Plot the dendrogram
par (mar = c (5, 4, 1, 2))
plot (dend,
      main = paste0 ("Dendrogram with custom labels and counts for ", df$diagnosis [1]),
      xlab = "",
      ylab = "",
      horiz = TRUE,
      labels = TRUE,
      nodePar = list (lab.cex = 0.8),
      #edgePar = list (col = ifelse (attr (dend, \"height\") < 0.5, \"blue\", \"black\")),
      #leaflab = \"none\"
      )

