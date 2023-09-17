#frequency of each diagnosis by gender & race

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
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <3500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(0, 999))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race <3500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(1000, 3499))

ggplot(data5) + 
    geom_point(mapping = aes(x=diagnosis, y=frequency, color=race, alpha=race, shape=sex)) + 
    labs(title = "Frequency of Injury By Diagnosis, Gender, & race >=3500", x="Diagnosis", y="Count") +
    scale_y_continuous(limits = c(3500, 7500))

data5ordered <- data5[order(-data5$frequency), ]
