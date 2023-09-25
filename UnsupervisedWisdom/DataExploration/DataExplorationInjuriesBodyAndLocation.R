#DataExplorationInjuriesBodyAndLocation.r

#We know the major diagnosed injuries are
# 53 - Contusion, abr
# 57 - Fracture
# 59 - Laceration
# 62 - Internal Injury

#We also know females are the primary victims of these injuries

#I want to explore each of these 4 injuries by injury and location
locationresults <- sqldf('SELECT diagnosis, location, count(diagnosis) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY diagnosis, location')
sum(locationresults$frequency) #results = 99868

#look at the breakdown of injuries by location then injury then gender
locationresults2 <- sqldf('SELECT location, diagnosis, sex, count(sex) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY location, diagnosis, sex')
sum(locationresults2$frequency) #results = 99868

#look at the breakdown of injuries by location then injury
locationresults3 <- sqldf('SELECT location, count(location) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY location')
sum(locationresults3$frequency)

#look for a coorelation between injury type and location
library(corrplot)

#visualization matrix of the data, looking for correlations
#At HOME
ggplot(subset(locationresults2, location == "HOME"), aes(x = diagnosis, fill = sex,
                 y = ifelse(test = sex == "M",
                            yes = -frequency,
                            no = frequency))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs) +
  labs(title = "Injuries at location Home, by Injury and Gender",
       x = "Injury Type",
       y = "Population by Gender") +
  coord_flip()

#At Public
ggplot(subset(locationresults2, location == "PUBLIC"), aes(x = diagnosis, fill = sex,
                 y = ifelse(test = sex == "M",
                            yes = -frequency,
                            no = frequency))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs) +
  labs(title = "Injuries at location Public, by Injury and Gender",
       x = "Injury Type",
       y = "Population by Gender") +
  coord_flip()

#At Unknown
ggplot(subset(locationresults2, location == "UNK"), aes(x = diagnosis, fill = sex,
                 y = ifelse(test = sex == "M",
                            yes = -frequency,
                            no = frequency))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = abs) +
  labs(title = "Injuries at location Unknown, by Injury and Gender",
       x = "Injury Type",
       y = "Population by Gender") +
  coord_flip()
