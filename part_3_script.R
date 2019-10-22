
# Ashley Stroud

library(tidyverse)
library(here)
library(janitor)


#wrangling

db <- read_csv(here("data", "disease_burden.csv")) %>% 
  clean_names() +
  rename(death_per_100k =  death_rate_per_100_000)


db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

ggplot(data = db_sub, aes(x = year, y = death_rate_per_100_000)) +
  geom_line(aes(color = country_name))

ggsave(here::here("Graphs", "disease_graph.png"))
