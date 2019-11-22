ufos %>% 
  # count(
  #   duration..hours.min.
  # ) %>% 
  # arrange(desc(n))
  filter(
  duration..hours.min. == "5 minutes",
  shape == "light" | 
    shape == "triangle" | 
    shape == "circle" |
    shape == "fireball" |
    shape == "sphere",
  year >= 1990
  ) %>% 
  # count(state) %>% arrange(desc(n))
  ggplot(aes(year)) +
  geom_bar(aes(fill = shape), alpha = 0.95) +
  theme_minimal() +
  scale_fill_brewer(type = "qual")
glimpse(ufos)
