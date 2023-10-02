if (system.file(package = "tidyr") == "") {
  install.packages("tidyr")
}

if (system.file(package = "circlepacketR") == "") {
  install.packages("circlepacketR")
}

# load the packages
library(tidyr)
library(circlepacketR)

# create a sample dataframe with the same columns as yours
data <- data.frame(
  sex = c(rep("male", 10), rep("female", 10)),
  location = c(rep(c("USA", "UK", "Canada"), length.out = 20)),
  diagnosis = c(rep(c("flu", "covid", "allergy"), length.out = 20)),
  body_part = c(rep(c("head", "chest", "stomach"), length.out = 20)),
  frequency = sample(1:100, 20)
)

# create a nested dataframe by grouping by sex, location, diagnosis, and body_part
nested_data <- nest(data, data = -c(sex, location, diagnosis, body_part))

# create a path string column that represents the hierarchy
nested_data$pathString <- paste(
  "root",
  nested_data$sex,
  nested_data$location,
  nested_data$diagnosis,
  nested_data$body_part,
  sep = "/"
)

# convert the nested dataframe to a node object
population <- as.Node(nested_data)

# create the circlepackeR plot
circlepackeR(population, size = "frequency")