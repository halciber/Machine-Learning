#ReadData.R
#Open data files and place code into a data frame.

df_primary <- read.csv("c:\\_working\\Machine-Learning\\UnsupervisedWisdom\\Data\\primary_data.csv")

# Print the first few rows of the data frame to verify the import

head(df_primary)

df_numsubset<- df_primary[, c(4:6, 8:9, 13, 15:22)]

head(df_numsubset)
colnames(df_numsubset)



