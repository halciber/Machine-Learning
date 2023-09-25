#ChatGPT.R

#Code for using ChatGPT
library(openai)
library(httr)
library(jsonlite)


Sys.setenv(OPENAI_API_KEY="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")

OPENAI_API_KEY='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'

rm(response)
response <- create_completion(
    model = "davinci",
    prompt = "Generate a question and an answer",
    temperature = 2
)
response$choices$text

response
answer <- trimws(response$choices[[1]]$message$content)



rm(responseX)
responseX <- create_chat_completion(
    model = "gpt-3.5-turbo",
     messages = list(
       list(
           "role" = "system",
           "content" = "You are a helpful assistant."
       ),
       list(
           "role" = "user",
           "content" = "Who won the world series in 2020?"
       ),
       list(
           "role" = "assistant",
           "content" = "The Los Angeles Dodgers won the World Series in 2020."
       ),
       list(
           "role" = "user",
           "content" = "Where was it played?"
       )
   )
)
content(responseX)
responseX$choices$text
answer <- trimws(responseX$choices[[1]]$message$content)


response <- create_embedding(
    model = "text-embedding-ada-002",
    input = c(
        "Ah, it is so boring to write documentation",
        "But examples are really crucial"
    )
)


response <- create_completion(
    model = "davinci",
    prompt = "give me a summary of the following text '86YOM FELL IN THE SHOWER AT HOME AND SUSTAINED A CLOSED HEAD INJURY'")

response

prompt <- "r code to remove duplicates using dplyr. Do not explainations on repllies"
response2 <- POST(
  url = "https://api.openai.com/v1/chat/completions", 
  add_headers(Authorization = paste("Bearer", OPENAI_API_KEY)),
  content_type_json(),
  encode = "json",
  body = list(
    model = "gpt-3.5-turbo",
    temperature = 1,
    messages = list(list(
      role = "user", 
      content = prompt
    ))
  )#body
)#post

content(response2)
response2$choices[[1]]$message$content
answer <- trimws(response2$choices[[1]]$message$content)




# Replace with your OpenAI GPT-3 API key
api_key <- "YOUR_API_KEY"

# Create an empty vector to store summaries
summaries <- character(0)


#for (row in 1:nrow(dfmapping)) {
for (row in 1:3) {
  narrative <- as.character( dfmapping[row, "narrative"])

  # Make a request to OpenAI GPT-3 for summarization
  create_completion(
    model = "gpt-3.5-turbo",
    prompt = "tell me the meaning of life")
  
  response3 <- POST(
    url = "https://api.openai.com/v1/engines/davinci/completions",
    add_headers(Authorization = paste("Bearer", OPENAI_API_KEY)),
    content_type("application/json"),
    body = jsonlite::toJSON(list(prompt = narrative, max_tokens = 50)) # Adjust parameters as needed
  )

  # Extract the summary from the API response
  summary <- content(response3, "parsed")$choices[[1]]$text

  # Append the summary to the vector
  summaries <- c(summaries, summary)
}

summaries

as.character(dfmapping[2, "narrative"])
