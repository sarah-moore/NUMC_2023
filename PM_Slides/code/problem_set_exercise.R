library(tidyverse)

base_df <- read.csv("https://raw.githubusercontent.com/sarah-moore/NUMC_2023/main/PM_Slides/code/data/base_df.csv") 

names(base_df)

glimpse(base_df)

base_df %>% 
  mutate(new_var = rowSums(base_df[,c(2,3)], na.rm = T))  %>% 
  group_by(unit) %>% 
  summarize(avg_cost = mean(new_var, na.rm = T))-> summary_df 
            
summary_df %>% 
  count(count_above450 = avg_cost > 450)
            
            