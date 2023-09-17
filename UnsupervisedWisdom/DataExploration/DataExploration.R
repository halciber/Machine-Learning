#DataExploration.R



#Looking at the data to get a feel for it.

summary(df_primary)

library(corrplot)
corrplot(cor(df_numsubset), type= "upper")
#the corrplot shows correlation between
#age v sex, race,body part, disposition, location, alcohol, drugs
#sex v alcohol, drugs, product 1
#hispanic v drugs
#diagnosis v body part (no surprises here)
#location v product1
#product1 v product 2
#product2 v product 3

library(ggplot2)


#frequency of injuries by age
data <- df_numsubset[, c('age', 'sex')]
df_agefreq <- as.data.frame(table(data$age))
colnames(df_agefreq)[1] <- "age" 
colnames(df_agefreq)[2] <- "frequency" 
head(df_agefreq)
ggplot(df_agefreq) + 
    geom_count(mapping = aes(x=df_agefreq$age, y=df_agefreq$frequency)) + 
    labs(title = "Frequency of Injury By Age", x="Age", y="Count")

#frequency of each diagnosis
data2 <-df_numsubset[, c('diagnosis')]
df_diagnosisfreq <- as.data.frame(table(data2))
colnames(df_diagnosisfreq)[1] <- "diagnosis_code" 
colnames(df_diagnosisfreq)[2] <- "frequency" 
head(df_diagnosisfreq)

#sort the dataframe befor plotting the data
df_diagnosisfreqSorted <- df_diagnosisfreq[order(-df_diagnosisfreq$frequency), ]
head(df_diagnosisfreqSorted)
ggplot(df_diagnosisfreqSorted) + 
    geom_count(mapping = aes(x=diagnosis_code, y=frequency)) + 
    labs(title = "Frequency of Injury By Diagnosis", x="Diagnosis", y="Count")

#based on the frequency of this plot, we can see that the first 4 items represent the majority of the diagnosis
#lets look at the percentage of the cases
highest4diagnosis <- sum(df_diagnosisfreqSorted$frequency[1:4]) # This equals 99,868
percentoftop4diagnosis <- highest4diagnosis/115128 #86.7%

#frequency of each diagnosis by gender
data3 <-dfmapping[, c('diagnosis', 'sex')]
df_diagnosisfreqbygender <- as.data.frame(table(data3))
colnames(df_diagnosisfreqbygender)[1] <- "diagnosis_code" 
colnames(df_diagnosisfreqbygender)[2] <- "sex" 
colnames(df_diagnosisfreqbygender)[3] <- "frequency" 
head(df_diagnosisfreqbygender)
df_diagnosisfreqbygenderSorted <- df_diagnosisfreqbygender[order(-df_diagnosisfreqbygender$frequency), ]

#get the top 4 injuries, by gender and plot them
data4 <- df_diagnosisfreqbygenderSorted[df_diagnosisfreqbygenderSorted$frequency > 5000, ]
ggplot(data4) + 
    geom_count(mapping = aes(x=diagnosis_code, y=frequency, color=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis & Gender", x="Diagnosis", y="Count")

