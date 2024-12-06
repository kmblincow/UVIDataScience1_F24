tidy_anime <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-23/tidy_anime.csv")

anime <- tidy_anime[!is.na(tidy_anime$title_english),]
anime <- anime %>% select(-title_japanese, -title_synonyms, -synopsis, -background,
                          -related, -broadcast)
write.csv(anime, "data/anime.csv")
names(anime)

d <- data.frame(odds = rnorm(10, 1, 0.1),
                CIlow = rnorm(10, 0, .005),
                gender = rep(c("M","F"), 5),
                EnvironmentalFactor = c(rep("Income", 2),
                                        rep("Age", 2),
                                        rep("Depression", 2),
                                        rep("Anxiety", 2),
                                        rep("Low Self Control", 2))
                )
d$CIhigh <- d$odds + abs(d$CIlow)
d$CIlow <- d$odds - abs(d$CIlow)

ggplot(data = d, aes(x = EnvironmentalFactor, y = odds, color = gender)) +
  geom_point(size = 2) +
  scale_color_manual(values = c("#4c508a", "#d95830")) +
  geom_errorbar(aes(ymin = CIlow, ymax = CIhigh), width = 0.2) +
  geom_hline(yintercept = 1, linewidth = 2) +
  labs(y = "Odds of Delinquency", x = "Environmental Factor", 
       color = "Gender") +
  theme_bw()
  
  
  
sample(1:18, 18, replace = FALSE)
