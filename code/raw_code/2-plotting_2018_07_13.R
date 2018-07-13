source("/cloud/project/code/raw_code/1-tidying_2018_07_13.R")

# make a word cloud
wc_data = tidy_txt %>% group_by(author) %>%
  count(word) %>% spread(author,n) %>% 
  select(word,jeff,rafa,roger) %>% 
  filter(!is.na(jeff) & !is.na(rafa) & !is.na(roger))
rn = wc_data$word
wc_mat = wc_data %>% select(jeff,rafa,roger) %>%
  data.matrix()
rownames(wc_mat) = rn
library(wordcloud)
comparison.cloud(wc_mat)
