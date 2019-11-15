# Welcome to R online! This is a great way to play with R without downloading.
# But, if you like it enough, download 
#         R here: https://cran.cnr.berkeley.edu/
#         R Studio here: https://rstudio.com/products/rstudio/
# Otherwise, let's get started!


# Purpose of this Tutorial ------------------------------------------------

# R is a great resource that has crazy good documentation including several
# free books that systematically teach users the basics and then some. This 
# tutorial is not meant to replace any such tutorials but instead to provide
# an inital project to try out R and R Studio. As such, it will present a 
# streamlined process with jumping off points. If you are interested in 
# learning more R there will be a recommended booklist at the end.




# Load the Tidyverse ------------------------------------------------------
# # This tutorial also makes extensive use of the Tidyverse.
# If you have never used the Tidyverse before, you are about to meet one 
# of the best packages in R. Or group of packages. The Tidyverse contains 
# multiple packages designed to clean data, wrangle it and graph it. 

# To install the Tidyverse, either click on the packages tab in the lower 
# right, then the install button and type tidyverse or run 
# install.packages("tidyverse")
# Next, we will load the package into R.

library(tidyverse)

# We will need two more packages usamap and skimr, so let's repeat the process.

library(usmap)
library(skimr)

# Loading data ------------------------------------------------------------

# We will be working with a semi-cleaned version of a UFO data set from 
# Kaggle (https://www.kaggle.com/camnugent/ufo-sightings-around-the-world).
# The original data set can be found here (https://github.com/planetsig/ufo-reports).
# We will be only looking at data for the US. You can get the zipped file here:
# ADD DATA LOCATION

# To get the data, you will need to upload it into your enviroment. 
# The upload button will be under the files tab on the lower right. Find
# the zip file called ufos on your computer and upload it. You should see
# ufos.csv appear in your files.

# Let's read in the csv as a tibble (https://tibble.tidyverse.org/) and store it
# as a variable which we will use to call it for the rest of the lab. 

ufos <- as_tibble(read_csv("ufos.csv"))

# You should see ufos show up as data set in your Global enviroment on the upper
# right of your screen. If you click on it, you can see the data.


# NOTE --------------------------------------------------------------------

# All of the functions we will be using are well documented. Either plug
# them into google with the letter r or run them in the console with a ?
# in front. (e.g. as_tibble r OR ?as_tibble() )


# Look at our data --------------------------------------------------------

# Let's take a look at our data. There are a couple ways to do this. 
# 1. Look at all the data in a table.

view(ufos)

# 2. Take a quick look at all the variables.

glimpse(ufos)

# 3. Do some summary statistics.

skim(ufos)

# Skim is a great function because it not only tells you statistics such
# as the mean and quartiles, but it tells you the total number of rows,
# if you're missing data and more!


# Form some questions -----------------------------------------------------

# Now that we've seen what the data looks like, we can start thinking up 
# some questions that we want to answer. Which state has the most
# sightings? Have the number of sightings increased overtime? Which shapes
# are seen most commonly? What are the average lengths of times each shape
# is seen? Where are the ufos being spotted?

# Plot 1: Who has the most sightings? -------------------------------------


ufos %>% 
  count(state) %>% 
  ggplot(aes(state, n)) +
  geom_bar(stat = "identity") +
  coord_flip()

ufos %>% 
  count(state) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes(state, n)) +
  geom_bar(stat = "identity") 


# Plot 2: How have sightings changed over time? ---------------------------

# Lets look at the largest sightings over time

ufos %>% 
  filter(state == "ca") %>% 
  count(year) %>% 
  ggplot(aes(year, n)) +
  geom_bar(stat = "identity") 

ufos %>% 
  filter(state == "il") %>% 
  count(year) %>% 
  ggplot(aes(year, n)) +
  geom_bar(stat = "identity") 

ufos %>% 
  count(year) %>% 
  ggplot(aes(year, n)) +
  geom_bar(stat = "identity") 

# Plot 4 ------------------------------------------------------------------

ufos %>% 
  count(shape) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes( shape, n)) +
  geom_bar(stat = "identity") +
  coord_flip()


# Plot 4 ------------------------------------------------------------------

ufos %>% 
  group_by(shape) %>% 
  summarise(average = mean(duration..seconds.)/60) %>% 
  arrange(desc(average)) %>%  
  filter(average >= 20) %>% 
  ggplot(aes( shape, average)) +
  geom_bar(stat = "identity") +
  coord_flip()


# Plot 3: Where are they being seen? --------------------------------------
library(maps)
ufos %>% 
  group_by(longitude, latitude, city) %>% 
  summarise(total = n()) %>% 
  filter(total >= 100) %>%
  # arrange(desc(total)) %>% 
  ggplot(aes(longitude, latitude)) +
  borders("state") +
  geom_point(aes(size = total, color = total), alpha = 0.7) +
  theme_void() +
  guides(size = FALSE) + 
  scale_color_gradient(low = "#20dba4", high = "#0c4655") +
  coord_quickmap() +
  labs(
    x = "",
    y = "",
    color = "Totals"
  ) +
  theme(
    legend.box.margin = margin(0,10,0,0)
  )

ufos %>% 
  group_by(longitude, latitude, city) %>% 
  summarise(total = n(),
            mean = mean(duration..seconds.)/60) %>% 
  # average = mean(duration..seconds.)/60) #%>%  
  filter(total >= 100, 
         mean < 100) %>%
  # arrange(desc(total)) #%>% 
  ggplot(aes(longitude, latitude)) +
  borders("state") +
  geom_point(aes(size = total, color = mean), alpha = 0.7) +
  theme_void() +
  # guides(size = FALSE) + 
  scale_color_gradient(low = "#20dba4", high = "#0c4655") +
  coord_quickmap() +
  labs(
    x = "",
    y = "",
    color = "Average Time
    in minutes"
  ) +
  theme(
    legend.box.margin = margin(0,10,0,0)
  )

library(usmap)

state_ufos<- ufos %>% 
  count(state) %>% 
  mutate(state = str_to_upper(state, locale = "en"),
         n = as.double(n))

plot_usmap(regions = "state", data = state_ufos, values = "n") +
  scale_fill_gradient(low = "#20dba4", high = "#0c4655") +
  theme(
    legend.position = "top"
  )

