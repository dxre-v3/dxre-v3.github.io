ufos %>% 
  count(shape) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes(shape, n)) +
  geom_bar( stat = "identity") +
  coord_flip()


ufos %>% 
  count(shape) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes(reorder(shape, n), n)) +
  geom_bar( stat = "identity", 
           color = "black",
           fill = "springgreen3",
           alpha = 0.8) +
  coord_flip() +
  theme_minimal() + 
  labs(
    x = "Shape",
    y = "Quantity of observations", 
    title = "UFO Shapes",
    caption = "Observations beginning in the 1940s. Data set from Kaggle"  )
