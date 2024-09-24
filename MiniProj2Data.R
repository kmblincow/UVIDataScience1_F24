#Kayla Blincow
#9/24/2024

#Wrangling Data for Mini-Project 2

#Students have the option to choose from 3 different Tidy Tuesday datasets:
#1. 2020-07-21 - Australian Pets
#2. 2023-11-14 - Diwali Sales Data


#clear my workspace
rm(list = ls())

#load packages
library(tidyverse)

#load data (Australian Pets)
animal_outcomes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-21/animal_outcomes.csv')


animal_outcomes <- animal_outcomes %>% select(-Total) %>% 
  pivot_longer(cols = 4:11, names_to = "state_territory", values_to = "count")

ggplot(animal_outcomes, aes(x = year, y = count, fill = outcome)) +
  geom_col()

ggplot(animal_outcomes, aes(x = animal_type, y = count, fill = outcome)) +
  geom_col()

write.csv(animal_outcomes, "data/RSPCA_Outcomes.csv")


#load data (Diwali Sales)
house <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-11-14/diwali_sales_data.csv')

house$Marital_Status1 <- "Married"
house[house$Marital_Status == 0,]$Marital_Status1 <- "Single"

house <- select(house, -Marital_Status)

names(house) <- c("User_ID", "Cust_name", "Product_ID", "Gender", "Age_Group", "Age", "State", "Zone", "Occupation", "Product_Category", "Orders", "Amount", "Marital_Status")

house <- house %>% na.omit()



ggplot(house, aes(x = Marital_Status, y = Amount)) + geom_boxplot()

write.csv(house, "data/Diwali_Sales.csv")

#load data (Psychology)
tuesdata <- tidytuesdayR::tt_load(2022, week = 33)

psych <- tuesdata$psych_stats

questions <- c(2, 5, 9, 12, 18, 21, 28, 33, 34, 36, 42, 47, 62, 66, 95)

questions <- unique(psych$question)[questions]
psych2 <- psych %>% filter(question %in% questions)
psych3 <- psych2 %>% filter(uni_name == "Avatar: The Last Airbender") %>% select(-rank)

write.csv(psych3, "data/Avatar_Personalities.csv")
