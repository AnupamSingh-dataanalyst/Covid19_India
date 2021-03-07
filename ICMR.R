#to get ICMR data on daily covid test done from  website and post on twitter app
library(twitteR)
library(stringr)
library(dplyr)
library(rvest)
library(xml2)
library(XML)
#Data Pull
icmr <- read_html("https://www.icmr.gov.in/")
icmr_test <- html_nodes(icmr,'.col-lg-4+ .col-lg-4 p , .scf-text h2')
ic <- html_text(icmr_test)
ic_f <-str_c("Testing Status:Daily",ic[2],".Testing Status Cumulative:",ic[1],ic[3],".ICMR.#IndiaFightsCorona",sep =" ")

#twitter app Auth
api_key="xxxxxxxxxxxxxxxxxxxxxxxxxxx"
api_secret="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
accesstoken="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
accesstokensecret="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
setup_twitter_oauth(api_key,api_secret,accesstoken,accesstokensecret)



#create tweet
tweet_text <-paste0( ic_f )

#send_tweet
tweet(tweet_text)


             