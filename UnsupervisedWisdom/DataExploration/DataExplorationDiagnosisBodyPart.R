#DataExplorationDiagnosisBodyPart.r

#looking for connections between the top 4 diagnosis and where the patient was injured

#this query shows the top 4 body part injuries are: HEAD, Lower Trunk, face, upper trunk
bpresultstotal <- sqldf('SELECT body_part, count(body_part) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY body_part
                        ORDER BY frequency DESC')

sum(bpresultstotal$frequency) #results = 99868

bpresults <- sqldf('SELECT body_part, diagnosis, count(body_part) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                        GROUP BY body_part, diagnosis')
bpresults[order(-bpresults$frequency), ]
sum(bpresults$frequency) #results = 99868

#The worst single combination is the internal injury to the head. There are 30303 instances of this
#dealing with this one problem, takes care of 26% r of the falling injuries
InternalHeadInjuryPercent <- (30303/115128)*100
InternalHeadInjuryPercent

#looking at the Internal Injury - Head by Gender and Location
InternalHeadInjuryResults <- sqldf('SELECT body_part, diagnosis, location, sex, count(body_part) AS "frequency"
                        FROM dfmapping
                        WHERE (diagnosis = "62 - INTERNAL INJURY") AND (body_part = "75 - HEAD")
                        GROUP BY body_part, diagnosis, location, sex')
InternalHeadInjuryTotals <- 17913 + 6756 + 5202 + 340 +68 + 24
InternalHeadInjuryTop3LocationsTotals <- 17913 + 6756 + 5202 # =29871

library(plotly)
# Convert the dataframe to a sunburst format

