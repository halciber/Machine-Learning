#plotting the injury frequency by date. The 

ggplot (injuriesbydate, aes (x = treatment_date, y = frequency, group = diagnosis, color = diagnosis)) +
  geom_line () +
  labs (x = "Treatment Date", y = "Injury Frequency", color = "Diagnosis")