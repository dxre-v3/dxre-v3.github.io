# Barcharts: Challenge ----------------------------------------------------

# Libraries for these challenges
library(tidyverse)
library(ggthemes)
library(ggstance)

# Load data
ufos <- as_tibble(read_csv("ufos.csv"))

# Look at the data
glimpse(ufos) 


# Time series:  -----------------------------------------------------------
# Working with time is pretty important in data and with barcharts. The plots
# below will start with some basic graphs over time and move into some more 
# specific filtering. These plots will be using some styling elements. 
# for reference, every plot will have a theme. 

# Observations by year
ufos %>% 
  ggplot(aes(year)) +
  geom_bar(fill = "steelblue") +
  theme_clean() +
  labs(
    subtitle = "Observations by year",
    caption = "Theme: theme_clean"
  )

# Observations since 1975
ufos %>% 
  filter(
    year >= 1975
  ) %>% 
  ggplot(aes(year)) +
  geom_bar(fill = "steelblue") +
  theme_clean() +
  labs(
    subtitle = "Observations since 1975",
    caption = "Theme: theme_clean"
  )

# Observations between 1975 and 2000
ufos %>% 
  filter(
    between(year, 1975, 2000)
  ) %>% 
  ggplot(aes(year)) +
  geom_bar(fill = "steelblue") +
  theme_clean() +
  labs(
    subtitle = "Observations between 1975 and 2000",
    caption = "Theme: theme_clean"
  )

# Observations since 1975 for Colorado (co)
ufos %>% 
  filter(
    year >= 1975,
    state == "co"
  ) %>% 
  ggplot(aes(year)) +
  geom_bar(fill = "steelblue") +
  theme_clean() +
  labs(
    subtitle = "Observations since 1975 for Colorado (co)",
    caption = "Theme: theme_clean"
  )

# By Month
ufos %>% 
  ggplot(aes(as.factor(month))) +
  geom_bar(fill = "steelblue") +
  theme_clean() +
  labs(
    subtitle = "Observations by month",
    caption = "Theme: theme_clean"
  )

# By Month
ufos %>% 
  filter(
    between(year, 2000, 2005)
  ) %>% 
  ggplot(aes(as.factor(month))) +
  geom_bar(aes(fill = as.factor(year))) +
  theme_fivethirtyeight() +
  labs(
    subtitle = "Observations by Month betweeen 2000 and 2005",
    caption = "Theme: theme_fivethirtyeight, fill: scale_fill_brewer(type = 'qual')"
  ) +
  scale_fill_brewer(type = "qual")

# State and Shape  -----------------------------------------------------------
# Another common plot you will come across, which we tried out in the last plot 
# is two variables, colored by a third variable. The folllowing plots will be doing
# a lot of counting and filtering. They will also be using the `geom_barh()` from the 
# **ggstance** package.

# States with more than 1K UFO sightings
ufos %>% 
  count(state) %>% 
  filter(n > 1000) %>% 
  ggplot(aes(n, reorder(state, n))) +
  geom_barh(stat = "identity", 
            fill = "indianred4",
            color = "black") +
  labs(
    subtitle = "States with more than 1K UFO sightings",
    caption = "Theme: theme_gdocs"
  ) +
  theme_gdocs()

# States with less than 500 UFO sightings
ufos %>% 
  count(state) %>% 
  filter(n < 500) %>% 
  ggplot(aes(n, reorder(state, n))) +
  geom_barh(stat = "identity",
            fill = "indianred4",
            color = "black") +
  labs(
    subtitle = "States with less than 500 UFO sightings",
    caption = "Theme: theme_gdocs"
  ) +
  theme_gdocs()

# count with two things 
ufos %>%  count(shape) %>% arrange(desc(n))

ufos_shapes <- ufos %>%  
  filter(  shape == "light" | 
    shape == "triangle" | 
    shape == "circle" |
    shape == "fireball" |
    shape == "sphere") %>% 
  group_by(state) %>% 
  mutate(n = n()) %>% 
  ungroup()


ufos_shapes %>%  
  filter(n > 1000) %>% 
  ggplot(aes(reorder(state, n))) +
  geom_bar(aes(fill = shape))+
  labs(
    subtitle = "States with more than 1K UFO sightings",
    caption = "Theme: theme_gdocs"
  ) +
  theme_gdocs() +
  scale_fill_gdocs()+
  coord_flip()
# Colored by shapes
ufos_shapes %>% 
  filter(n < 500) %>% 
  ggplot(aes(reorder(state, n))) +
  geom_bar(aes(fill = shape)) +
  labs(
    subtitle = "States with less than 500 UFO sightings",
    caption = "Theme: theme_gdocs"
  ) +
  theme_gdocs() +
  scale_fill_gdocs()
  coord_flip()

# Colored by shapes
ufos_shapes %>% 
  filter(  shape == "light" | 
    shape == "triangle" | 
    shape == "circle" ) %>% 
  filter(n < 500) %>% 
  ggplot(aes(reorder(state, n))) +
  geom_bar(aes(fill = shape)) +
  labs(
    subtitle = "States with less than 500 UFO sightings",
    caption = "Theme: theme_tufte",
    x = "State",
    y = "Observations"
  ) +
  theme_tufte() +
  theme(legend.position = "none") +
  facet_wrap(~shape) +
  scale_fill_brewer(type = "qual") +
  coord_flip()



# Calculations ------------------------------------------------------------
# Another type of graph you will want to use is had calculated values. The 
# best way to do this is with summarize:

ufos_shapes %>% 
  group_by(shape) %>% 
  summarise(average_min = mean(duration..seconds./60)) %>% 
  ungroup() %>%
  ggplot(aes(shape, average_min)) +
  geom_bar(fill = "lavenderblush4",
           color ="grey9",
           stat = "identity") +
  theme_fivethirtyeight() +
  labs(
    title = "Average minutes per shape",
    caption = "Calculated with duration..seconds. using ufo_shapes
    theme: theme_fivethirtyeight
    fill: lavenderblush4
    color: grey9"
  )

