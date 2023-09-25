#DataExplorationGenderBreakdown.R

#looking at the breakdown by gender
#this plot shows 63% of the injured are female. The rest are male
#unknowns and non-binaries were not reported in this dataset

#other parts of the project explore the injuries by gender and race

library(sqldf)
library(plyr)
library(dplyr)
#gender
#non-binary counts
rm(countGender)
countGender <- sqldf('SELECT count(sex)
                FROM dfmapping
                WHERE (sex = "NON-BINARY/OTHER") or (sex = "UNKNOWN")')
countGender #results = 3570, but this includes all diagnosis

#"sex": {"0": "UNKNOWN", "1": "MALE", "2": "FEMALE", "3": "NON-BINARY/OTHER"}
genderlabels <- c("Male", "Female")
rm(gender)
gender <- as.vector(df_primary[ ,'sex'])
gentable <- as.data.frame(table(gender))

gentable$gender <- mapvalues(gentable$gender, c( "1", "2"), genderlabels)

#63% of the injuries are to women
percentoffemales <- (gentable[2, 'Freq']/115128)*100

print(pie(gentable$Freq, labels = genderlabels, main="Gender Breakdown"))