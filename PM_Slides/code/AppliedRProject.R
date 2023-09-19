library(tidyverse)

#1) 
childcare_costs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/childcare_costs.csv')
counties <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-05-09/counties.csv')

#2) 
childcare_costs <- left_join(childcare_costs, counties, by = "county_fips_code")

#3) county-year

#4) 34,567 total . by year:
childcare_costs %>% count(study_year)

#5) 
childcare_costs <- childcare_costs %>% mutate(county_size = case_when(
  total_pop <99999 ~ "Small",
  total_pop >99999 & total_pop <499999 ~ "Medium",
  total_pop >500000 & total_pop <999999 ~ "Large",
  total_pop >1000000 ~ "Very Large",
))

#6) 
childcare_costs <- childcare_costs %>% mutate(mc_infant_annual = mc_infant * 52)

#7) 
childcare_costs %>% filter(study_year==2018) %>% group_by(county_size) %>% 
  summarize(med_cost = median(mc_infant_annual, na.rm = TRUE)) 


#8) 
reg_poverty_toddler <- lm(mc_infant_annual~funr_16, data = childcare_costs)
summary(reg_poverty_toddler)

#9) 
childcare_costs %>% filter(study_year == 2018) %>% 
  ggplot(aes(x= funr_16, y = mc_infant_annual)) + 
  geom_point() +
  theme_minimal()


#10) not a good comparison bc prices are not adjusted for inflation!

childcare_costs %>% 
  group_by(study_year) %>% 
  summarise(cost_median = median(mfccsa, na.rm =TRUE)) %>%
  ggplot(aes(x = study_year, y = cost_median)) +
  geom_line(size = 1)


