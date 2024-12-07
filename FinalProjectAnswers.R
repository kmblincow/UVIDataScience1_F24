#Final Exam Answers

library(tidyverse)
library(lubridate)

d <- read.csv("data/disney_plus.csv")


head(d)

####QUESTION 1####
genre <- d %>% select(genre1, genre2, genre3) %>% 
  pivot_longer(cols = 1:3, names_to = "genre number") %>% 
  group_by(value) %>% 
  summarize(n = n()) %>% 
  arrange(desc(n)) %>% 
  drop_na()

head(genre, 10)


genre2 <- d %>% select(genre1, genre2, genre3) %>% 
  pivot_longer(cols = 1:3, names_to = "genre number")

#some genres have extra space happening
for(i in 1:length(genre2$value)){
  genre2$value[i] <- gsub(" ", "", genre2$value[i], )
}

genre2 <- genre2 %>% group_by(value) %>% 
  summarize(n_progs = n())  %>% 
  arrange(desc(n_progs)) %>% 
  drop_na() %>% 
  slice_max(n_progs, n = 5)

#correct answer
ggplot(data = genre2, 
       aes(x = value, y = n_progs)) +
  geom_col()


####QUESTION 2####
d$date_added <- as.Date(d$date_added, format = "%m/%d/%Y")
q2 <- d %>% filter(date_added > as.Date("2019-11-12"))
q2$month <- month(q2$date_added)

ggplot(data = q2, aes(x = as.factor(month))) +
  geom_bar()

