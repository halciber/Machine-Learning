library(fmsb)
#create data
df <- data.frame (Mon=c (100, 0, 34),  Tue=c (100, 0, 48),  Wed=c (100, 0, 58),  Thu=c (100, 0, 67),  Fri=c (100, 0, 55),  Sat=c (100, 0, 29),  Sun=c (100, 0, 18))
#view data
df
#radar chart
radarchart(df)


# Create some sample data with 3 individuals and 9 variables
exam_scores <- data.frame(
  row.names = c("Student.1", "Student.2", "Student.3"),
  Biology = c(7.9, 3.9, 9.4),
  Physics = c(10, 20, 0),
  Maths = c(3.7, 11.5, 2.5),
  Sport = c(8.7, 20, 4),
  English = c(7.9, 7.2, 12.4),
  Geography = c(6.4, 10.5, 6.5),
  Art = c(2.4, 0.2, 9.8),
  Programming = c(0, 0, 20),
  Music = c(20, 20, 20)
)

# Define the variable ranges: maximum and minimum
max_min <- data.frame(
  Biology = c(20, 0),
  Physics = c(20, 0),
  Maths = c(20, 0),
  Sport = c(20, 0),
  English = c(20, 0),
  Geography = c(20, 0),
  Art = c(20, 0),
  Programming = c(20, 0),
  Music = c(20, 0)
)
rownames(max_min) <- c("Max", "Min")

# Bind the variable ranges to the data
df <- rbind(max_min, exam_scores)
radarchart(df)
