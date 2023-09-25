#frequency of each diagnosis by gender & race

library(ggplot2)
library(sqldf)

data3 <-dfmapping[, c('diagnosis', 'sex', 'race', 'hispanic')]
#df_diagnosisfreqbygenderAndRace <- as.data.frame(table(data3))

dftemp <- as.data.frame(table(data3))

df_diagnosisfreqbygenderAndRace <- dftemp[dftemp$diagnosis %in% c("53 - CONTUSIONS, ABR.", "57 - FRACTURE", "59 - LACERATION", "62 - INTERNAL INJURY"),]
rm(dftemp)

colnames(df_diagnosisfreqbygenderAndRace)[5] <- "frequency" 



head(df_diagnosisfreqbygenderAndRace)

df_diagnosisfreqbygenderSorted <- df_diagnosisfreqbygender[order(-df_diagnosisfreqbygender$frequency), ]

#get the top 4 injuries, by gender and plot them
data5 <- df_diagnosisfreqbygenderAndRace[df_diagnosisfreqbygenderAndRace$frequency > 0, ]
ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <100", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(0, 99))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(100, 499))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <1000", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(500, 999))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <3500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(1000, 3499))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race >=3500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(3500, 7500))


#comparing injuries by sex & if hispanic
count <- sqldf('SELECT count(*)
                FROM dfmapping
                WHERE hispanic = "Yes"')
count #results = 3570, but this includes all diagnosis

count2 <- sum(df_primary$hispanic[df_primary$hispanic == 1])#results = 3570, but this includes all diagnosis
count3 <- sqldf('SELECT count(*)
                FROM dfmapping
                WHERE (hispanic = "Yes") AND (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")')
count3 #results = 3099, but this includes all diagnosis


results <- sqldf('SELECT diagnosis, sex, count(hispanic) AS "frequency"
                        FROM dfmapping
                        WHERE (hispanic = "Yes") AND (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY diagnosis, sex')
sum(results$frequency) #results = 3099

#This plot shows the hispanic numbers are relatively small compared to the whole dataset, however, it does confirm that
#females injuries appear in greate numbers than male
ggplot(results) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=sex, shape=sex)) +
    labs(title = "Frequency of Injury By Diagnosis, Gender where Hispanic = Yes", x="diagnosis", y="frequency")
    

