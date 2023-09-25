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
sum(bpresults$frequency) #results = 99868