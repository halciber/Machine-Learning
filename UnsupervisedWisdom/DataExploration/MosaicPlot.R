library(sqldf)

#
locationresults <- sqldf('select sex, location, diagnosis, body_part, frequency
                        from(
                            SELECT sex, location, diagnosis, body_part, count(*) AS "frequency"
                            FROM df_mapped
                            WHERE (diagnosis = "53 - CONTUSIONS, ABR." or diagnosis = "57 - FRACTURE" or diagnosis = "59 - LACERATION" or diagnosis = "62 - INTERNAL INJURY")
                                  
                            GROUP BY sex, location, diagnosis, body_part
                            ORDER BY sex, location, diagnosis, body_part
                        ) as t
                        WHERE frequency > 500
                        ORDER BY frequency DESC
                        ')

ggplot(data = locationresults) +
  geom_mosaic(aes(x = product(sex, location), fill = diagnosis), 
              na.rm = TRUE,
              offset = 0.03) +
  facet_wrap(~ body_part) +
  labs(title = "Mosaic plot using ggmosaic",
       x = "Sex and Location",
       y = NULL,
       fill = "Diagnosis")


mosaicplot(xtabs(frequency ~ sex + location + diagnosis + body_part, data = locationresults),
           main = "Mosaic plot using base R",
           shade = TRUE)

#winner
mosaicplot(xtabs(frequency ~ sex + diagnosis + location +  body_part, data = locationresults),
           main = "Mosaic plot using base R",
           shade = TRUE)


mosaicplot(xtabs(frequency ~ sex + diagnosis + location +  body_part, data = locationresults),
           main = "Combination of All Major Injury Factors",
           shade = TRUE)