load("/cloud/project/data/tidy_data/simply_data_before_processing_07-13-2018.rda")
library(tibble)
library(tidytext)
library(dplyr)
tidy_txt = txt %>% as_tibble() %>% 
  unnest_tokens(word,text) %>% 
  select(doc_id,word)
glimpse(tidy_txt)

# get the date
library(tidyr)
tidy_txt = tidy_txt %>% 
  separate(doc_id,into=c("date","title"),
           sep="-[a-z]")

# convert the date to date class
library(lubridate)
tidy_txt = tidy_txt %>% mutate(date = ymd(date))

# get the author
library(stringr)
tidy_txt =tidy_txt  %>% group_by(title) %>%
  mutate(author = first(str_subset(word,"roger|jeff|rafa")))
