#India Covid19 Updates
#Covid_Tweet App FInal Script
#library
library(twitteR)
library(stringr)
library(dplyr)
library(rvest)
library(xml2)
library(XML)
#Data Pull
india <- read_html("https://www.mohfw.gov.in/")
#individual row from MOHFW
tablecovid <- html_nodes(india,'tr:nth-child(36) td')
covid.state <- html_text(tablecovid)
covid_india <- gsub(pattern = "\n\t", replacement = "", x = covid.state)
Covid_Update <-str_c("Now #India stand at",covid_india[6],"Confirm cases,",covid_india[3],"Active cases and",covid_india[5],"deceased in Last 24 hrs.Source:MOHFW #Corona",sep = " ")

#twitter app Auth
api_key="xxxxxxxxxxxxxxxxxxxxxxxx"
api_secret="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
accesstoken="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
accesstokensecret="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
setup_twitter_oauth(api_key,api_secret,accesstoken,accesstokensecret)

#create tweet

tweet_text <-paste0( Covid_Update )
#send_tweet

tweet(tweet_text)