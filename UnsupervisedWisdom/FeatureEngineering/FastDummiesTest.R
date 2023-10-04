#To install this package, use the code

if (system.file(package = "fastDummies") == "") {
  install.packages("fastDummies")
}


library(fastDummies)

#Kaplan, J. & Schlegel, B. (2023). fastDummies: Fast Creation of Dummy (Binary) Columns and Rows from 
#Categorical Variables. Version 1.7.1. 
#URL: https://github.com/jacobkap/fastDummies, https://jacobkap.github.io/fastDummies/.


customers <- data.frame(

  id=c(10, 20, 30, 40, 50),

  gender=c('male', 'female', 'female', 'male', 'female'),

  mood=c('happy', 'sad', 'happy', 'sad','happy')

)

fastDummies::dummy_cols(customers)

#need to see which column is throwing an error for fastDummies


casenumber <- df_modelingdata$cpsc_case_number



sex <- df_modelingdata$sex
df1 <- fastDummies::dummy_cols(as.data.frame(sex))
#add the case number, remove the sex column
df1$cpsc_case_number <- casenumber
df1 <- select(df1, -c(sex))

diagnosis <- df_modelingdata$diagnosis
df2 <- fastDummies::dummy_cols(as.data.frame(diagnosis))
df2$cpsc_case_number <- casenumber
df2 <- select(df2, -c(diagnosis))

bodypart <- df_modelingdata$body_part
df3 <- fastDummies::dummy_cols(as.data.frame(bodypart))
df3$cpsc_case_number <- casenumber
df3 <- select(df3, -c(bodypart))

location <- df_modelingdata$location
df4 <- fastDummies::dummy_cols(as.data.frame(location))
df4$cpsc_case_number <- casenumber
df4 <- select(df4, -c(location))

product <- df_modelingdata$product_1
df5 <- fastDummies::dummy_cols(as.data.frame(product))
df5$cpsc_case_number <- casenumber
df5 <- select(df5, -c(product))

rm(sex, diagnosis, bodypart, location, product)
rm(df1, df2, df3, df4, df5)





