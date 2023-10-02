# DataExplorationByHispanicAndRace.R
#
# This file looks at the breakdown of the hispanic and racial parts of the dataset.
require(ggplot2)
require(moonBook)


library(moonBook)
library(ggplot2)
library(webr)
library(dplyr)


rhcounts <- as.data.frame(table(df_mapped$hispanic, df_mapped$race))
colnames(rhcounts)[1]<-"hispanic"
colnames(rhcounts)[2]<-"race"
colnames(rhcounts)[3]<-"frequency"

head(rhcounts)

webr::PieDonut(rhcounts, aes(hispanic, race, count=frequency), 
               r0 = 0.3, #hides the center
               r1 = 0.7,
               explode = 3,
               explodeDonut = TRUE,
               pieLabelSize = 3,
               donutLabelSize = 4,
               title = "Hispanic and Racial Breakdown")

webr::PieDonut(rhcounts, aes(race, hispanic, count=frequency), title = "Hispanic and Racial Breakdown")

# Asia
#sunburst(data = data.frame(xtabs(V2~path, asia_name)), legend = FALSE,
#         colors = c("#e6e0ae", "#dfbc5e", "#ee6146", "#d73c37", "#b51f09"))

#sunburst(data = rhcounts, legend = FALSE,
#          colors = c("#E59866", "#FCF3CF", "#AF601A", "#AED6F1", "#BD0026", "#27AE60", "#FAD7AD"))  

data <- as.data.frame(Titanic)
PD = data %>% group_by(Class, Survived) %>% summarize(n=sum(Freq))
print(PD)