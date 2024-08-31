# My try (1)
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA", DepTime > 1400)

#My Try (2):
head(data.frame(flights))
data.frame(select(flights, Year:ArrTime, contains("Cancel")))

#My try (3):
flights %>% 
  select(UniqueCarrier, DepTime, FlightNum) %>% 
  filter(UniqueCarrier == "UA", DepTime >1400)
#demonstrate ease of breaking up the code into chunks to test each line


#My Try (4):
flights %>% 
  filter(UniqueCarrier == "AA", Month==1, DayofMonth==1, DepTime > 1200) %>%
  arrange(DepTime)

#My Tr (5):
flights <- flights %>% 
  mutate(TotalDelay = ArrDelay + DepDelay)
names(flights)


#My Try (6):
flights %>% 
  group_by(Month) %>% 
  summarize(avg_delay = mean(ArrDelay, na.rm=TRUE))
