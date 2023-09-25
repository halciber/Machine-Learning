#SummarizeNarratives.R
#
#Pulling the data out of the dfmapping$narrative column
#Sending to ChatGPT to summarize 

library(openai)
library(httr)
library(jsonlite)


#build a list of the narrative fields from dfmapping
rm(response)
narrativelist <- c()

#for (row in 1:nrow(dfmapping))
for (row in 1)
{
#   nextnarr <- c(sprintf("list(%s = %s, %s = %s)", "role", "user", "content", as.character( dfmapping[row, "narrative"])))
#   narrativelist <- c(narrativelist, nextnarr)
    
    
    response <- create_chat_completion(
                                        model = "gpt-3.5-turbo",
                                        messages = list(
                                                        list(
                                                                "role" = "assistant",
                                                                "content" = as.character( dfmapping[row, "narrative"])
                                                            ),
                                                        list(
                                                                "role" = "user",
                                                                "content" = "What caused the injury?"
                                                            )
                                                        )
                                        )#end of create_chat_completion
    narrativelist <- c(narrativelist, response$choices$message.content)
    
}#end of for loop

narrativelist[1]
#narrativelist[2]
#narrativelist[3]
#narrativelist[4]





rm(responseX)
responseX <- create_chat_completion(
    model = "gpt-3.5-turbo",
     messages = list(
         narrativelist)
)
content(responseX)
responseX$choices$text
answer <- trimws(responseX$choices[[1]]$message$content)

