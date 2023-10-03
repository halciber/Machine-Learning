#To install this package, use the code
if
install.packages("fastDummies")


# The development version is available on Github.
# install.packages("devtools")
devtools::install_github("jacobkap/fastDummies")


customers <- data.frame(

  id=c(10, 20, 30, 40, 50),

  gender=c('male', 'female', 'female', 'male', 'female'),

  mood=c('happy', 'sad', 'happy', 'sad','happy')

)

 

fastDummies::dummy_cols(customers)