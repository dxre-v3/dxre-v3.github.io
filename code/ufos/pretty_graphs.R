ufos %>% 
  filter(
  duration..hours.min. == "5 minutes",
  shape == "light" | 
    shape == "triangle" | 
    shape == "circle" |
    shape == "fireball" |
    shape == "sphere",
  year >= 1990
  ) %>% 
  ggplot(aes(year)) +
  geom_bar(aes(fill = shape), alpha = 0.95) +
  theme_minimal() +
  scale_fill_brewer(type = "qual")
