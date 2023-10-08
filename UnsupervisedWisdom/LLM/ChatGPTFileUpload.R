#ChatGPTFileUpload.r

#Uploading data for query to ChatGPT

library(openai)
library(jsonlite)
library(dplyr)
library(readr)


rm(narratives, json_data)

#just a quick and dirty method to build the json
buildjson <- function(x)
{
    
}#end buildjson




narratives <- df_original[1:5, c("narrative")]
# Convert the "narrative" column to a JSON array
json_data <- toJSON(list(narrative = narratives), auto_unbox = FALSE) 
print(json_data)             

myfile <- "C:\\_working\\Machine-Learning\\UnsupervisedWisdom\\Data\\test.json"

#write csv file out
#write_json(as.data.frame(json_dict), myfile, ascii = FALSE, pretty = TRUE)

jsonstring <- sprintf("[\n\r{%s:%s}\n\r]", "\"narrative\"", "\"94YOM FELL TO THE FLOOR AT THE NURSING HOME ONTO BACK OF HEAD SUSTAINED A SUBDURAL HEMATOMA\"")
print(jsonstring)
writeLines(jsonstring, myfile)

#upload this to OpenAI
ret <-upload_file(  myfile,
                    purpose = c("fine-tune"),
                    openai_api_key = Sys.getenv("OPENAI_API_KEY"),
                    openai_organization = NULL
                )

xfile <- system.file(myfile, "classification-file.jsonl", package = "openai")
ret <- upload_file(file = xfile, purpose = "classification")



print(ret)



