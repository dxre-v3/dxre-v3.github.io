---
title: "R Tutorial: UFOs"
author: "Avriana Allen"
date: "Last Updated 11/21/2019"
output:
  html_document:
    toc: true
    toc_float: true
    collapse: true
---

<head>

<link rel="stylesheet" href="https://cdn.knightlab.com/libs/orangeline/0.1.1/css/orangeline.min.css">

<style>

@import url('https://fonts.googleapis.com/css?family=Montserrat&display=swap');

body{
font-family: Montserrat;
}

pre:not(.r) .hljs{
color: #484848;
}

ol > li::marker{
font-size: 0em;
}

.title{
width:100%;
font-size: 3em !important;
text-align: center;
}
.author {
font-family: Montserrat;
text-align: right;
}

.date {
font-family: Montserrat;
text-align: right;
}

h1 > .intro{
color: #df4e13;
}

img{
padding: 15px 0px 15px 0px;
}

</style>

</head>




# <span class = "intro"> Welcome to R! </span>

## Purpose of this tutorial 

R is a great resource that has extremely good documentation, including several free books that systematically teach users the basics and then some. This tutorial is not meant to replace any such resources but to provide an inital project to try out **R** and **R Studio**. As such, it will present a streamlined process with jumping off points. If you are interested in learning more **R** there will be a recommended booklist [at the end](#booklist). 

## RStudio Cloud

To complete this tutorial, you will need to create an account with [RStudio Cloud](https://rstudio.cloud/) so navigate to [their homepage ](https://rstudio.cloud/) and click *Get Started*.

Once you've made your account, you will be navigated to *Your Workspace*. Click the blue *New Project* button to the right of *Your Projects* and wait for the *Deploying Project* bubbles to dissappear.

## R Script

Under *File* highlight *New File* and select *R Script*. 

<img src="new_rfile.png">

Go ahead and save the file. This will be where we will be executing all our commands.

<img src="save_file.png">

## Set up the environment

Open *Tools* and click on *Global Options*. There will be four sections, *R Sessions*, *Workspace*, *History* and *Other*. Under *Workspace*, uncheck 
 `Restore .RData into workspace at startup` and change `Save workspace to .RData on exit` to `never`. Hit *Ok* to save and exit. 
 
<img src="enviroment.png">

By changing these options, we are making it a little harder to pick up where you left off in a project after you close it, but this will make your code reproducible, allowing you to get the same results every time you run your code. 

## Run some code

Speaking of running code, R is a language that runs only selected code. What does that mean? It means that if your cursor is on a specific line, everything on that line is selected, and will be run. If you hightlight some of your code, only what is highlighted is selected and will be run.

Try it out by typing `2 + 2` on the first line of your blank R script and `4 + 4` on the next one, Hit the *Run* button at the upper right corner of your R script and see what happens, (you can also use the keyboard shortcut *ctrl-enter*). 


<p class = "note"> All of the functions we will be using are well documented. If you ever have questions, run them in the console, (lower left pane) with a `?`in front, e.g. `?help()`</p>

# **R** and Data

## Load the Tidyverse 
<p class = "note"> This tutorial makes extensive use of the **Tidyverse**. </p>

If you have never used the **Tidyverse** before, you are about to meet one of the best packages in R. Or group of packages. The Tidyverse contains multiple packages designed to clean data, wrangle it and graph it. The packages are compatible with each other, so you can easily move through each stage of cleaning, plotting and presenting.

To install the **Tidyverse**, either click on the *Packages* tab in the lower right pane, then the *Install* button in the left corner. Type in `tidyverse` and click *Install*. It will take a moment to run and it will fill your console with red text. The installation will finish with <code>The downloaded source packages are in '/tmp/RtmpPmVnsD/downloaded_packages'</code>. Now we can load the package into R using `library()`. This code should go at the top of your R Script. 


```r
library(tidyverse)
```

```
## -- Attaching packages ------------------------------------------------------ tidyverse 1.2.1 --
```

```
## v ggplot2 3.2.1     v purrr   0.3.2
## v tibble  2.1.3     v dplyr   0.8.3
## v tidyr   1.0.0     v stringr 1.4.0
## v readr   1.3.1     v forcats 0.4.0
```

```
## -- Conflicts --------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

Let's install one more package, `maps`, beginning with the installation. 

<img src = "install_package.png">


```r
library(maps)
```

```
## 
## Attaching package: 'maps'
```

```
## The following object is masked from 'package:purrr':
## 
##     map
```

<p class = "note"> We only need to install packages once, after that we can always load them for use using the `library()` call. </p>

## Loading data 

We will be working with a semi-cleaned version of a UFO data set from [Kaggle](https://www.kaggle.com/camnugent/ufo-sightings-around-the-world). The original data set can be found [here](https://github.com/planetsig/ufo-reports). We will be only looking at data for the US. You can get the zipped file here: [ufos.zip](https://dxre-v3.github.io/data/ufos/ufos.zip). **R Studio Cloud** only takes data in a zipped format, so we will upload the dataset into our environment as a zip file.

Under the *Files* tab in the lower right pane, click on *Upload* button. Find
the zipped file called `ufos` on your computer and upload it. You should see `ufos.csv` appear in your files.

<img src = "upload_file.png">

Let's read in the csv as a tibble, which is a slightly more flexible version of a data frame and store it as a variable which we will use to call it for the rest of the lab. 


```r
ufos <- as_tibble(read_csv("ufos.csv"))
```

You will get a print out that looks similar to the one below. 

<img src = "error_data_load.png">

You can ignore it. 

You should see `ufos` show up as data set in your *Global Enviroment* on the upper right pane of your screen. If you click on it, you will open the data in a new tab.

## Look at our data

Let's take a quick look at our data.   


```r
glimpse(ufos)
```

```
## Observations: 65,114
## Variables: 14
## $ datetime             <dttm> 1949-10-10 20:30:00, 1956-10-10 21:00:00...
## $ city                 <chr> "san marcos", "edna", "kaneohe", "bristol...
## $ state                <chr> "tx", "tx", "hi", "tn", "ct", "al", "fl",...
## $ country              <chr> "us", "us", "us", "us", "us", "us", "us",...
## $ shape                <chr> "cylinder", "circle", "light", "sphere", ...
## $ duration..seconds.   <dbl> 2700, 20, 900, 300, 1200, 180, 120, 300, ...
## $ duration..hours.min. <chr> "45 minutes", "1/2 hour", "15 minutes", "...
## $ comments             <chr> "This event took place in early fall arou...
## $ date.posted          <date> 2004-04-27, 2004-01-17, 2004-01-22, 2007...
## $ latitude             <dbl> 29.88306, 28.97833, 21.41806, 36.59500, 4...
## $ longitude            <dbl> -97.94111, -96.64583, -157.80361, -82.188...
## $ year                 <dbl> 1949, 1956, 1960, 1961, 1965, 1966, 1966,...
## $ month                <dbl> 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1...
## $ day                  <dbl> 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1...
```

The `glimpse()` function gives us a compressed view of the data, but here's a few things we can gather from the print out. 

* We have 14 variables and 65,144 observations
* 7 variable names are related to time
* 5 variable names are related to place
* We have 2 variables in date format, 6 in character and 6 in numerical format. 

## Form some questions

Now that we've made some observations about our data, let's ask some questions: 

* Which state has the most sightings? 
* Have the number of sightings increased over time? 
* Which shapes are seen most commonly? 
* What's the average length of times each shape is seen? 
* Where are the ufos being spotted?
<br>

# Plotting

## Plot 1: Which state has the most sightings?

Let's start with the data. We want to know which state has seen the most ufos, which means we want the total number of observations for each state.

To do this, we're going to use the count function. We give it a column name, (a variable), and it will count the rows, (observations), according to each value in the column.

<p class = "note"> This works well with a discrete variable but would not work well with a [continuous variable](https://www.youtube.com/watch?v=_yAQb8gWBpU). </p>


```r
ufos %>% 
  count(state)
```

```
## # A tibble: 52 x 2
##    state     n
##    <chr> <int>
##  1 ak      319
##  2 al      642
##  3 ar      588
##  4 az     2414
##  5 ca     8912
##  6 co     1413
##  7 ct      892
##  8 dc        7
##  9 de      166
## 10 fl     3835
## # ... with 42 more rows
```

Throughout this tutorial we will be using what is called a pipe:` %>% `. When R runs a line of code with a pipe at the end, it takes that information and passes it on to the next line, which is also run.  If we were to write the function above without pipes, it would look like this `count(x = ufos, vars = state)`

However, R is a positional language  when it comes to functions, meaning we don't have to write out what each entry is in the count function, if we give it the correct pieces in order, i.e. `count(ufos, state)`.

<br>

Let's arrange the data so we can see which states have the most observations. We will use a pipe so we don't have to save our data in a variable. Since `arrange()` automatically sorts from least to greatest, we will use `desc()` to flip this.


```r
ufos %>% 
  count(state) %>% 
  arrange(desc(n))
```

```
## # A tibble: 52 x 2
##    state     n
##    <chr> <int>
##  1 ca     8912
##  2 wa     3966
##  3 fl     3835
##  4 tx     3447
##  5 ny     2980
##  6 il     2499
##  7 az     2414
##  8 pa     2366
##  9 oh     2275
## 10 mi     1836
## # ... with 42 more rows
```


If we want to see all the data, we can always pipe the data into a `view()`, but let's go even farther. Let's make a graph. We are going to use **ggplot2**, the part of the **Tidyverse** designed for graphing. There are three things you need to know immediately to use **ggplot**. 

1. To create a graph, you will always need to call `ggplot()` and then the type of chart you want, a `geom`. `ggplot()` creates the base layer that you will add plots to, the `geoms` are the charts you will be adding. 
2. There are two parts to each `ggplot()` or `geom` function, the `aes()` or aesthetics and the function itself. The data set, and anything you don't want to vary will be written the function, while any variables you want to vary per observation will be in the `aes()`.
3. **ggplot** takes information in order, which means that if you write your data in the right order you won't have to write out the full equality (like we do below). 
4. We use `+` as instead of `%>%` with **ggplot2**.


```r
ufos %>%
  count(state) %>% 
  ggplot(mapping = aes(x = state, y = n)) +
  geom_bar(stat = "identity") 
```

<img src="ufo_tutorial_files/figure-html/plot1.3-1.png" width="672" />



<span class = "note">

* We can pipe our data right into the plot. 
* `geom_bar()` requires `stat = 'identity'` to use `n` as the height of each bar. Use `?geom_bar()` to find out why.
</span>

It is pretty hard to read this chart, so let's filter our data to just look at which states had more than 1000 observations. We can just add the `filter()` between the `count()` and the plot. Let's also tack a `coord_flip()` on which renders x values along the y axis and y values along the x axis.
  

```r
ufos %>% 
  count(state) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes(state, n)) +
  geom_bar(stat = "identity") +
  coord_flip()
```

<img src="ufo_tutorial_files/figure-html/plot1.4-1.png" width="672" />

## Plot 2: How have sightings changed over time? 

California is by far winning for the amount of sightings, so let's see if there is a change over time. 

First, let's filter by state, and then count up the number of observations by year. We can pipe that data directly into a bar chart. 

```r
ufos %>% 
  filter(state == "ca") %>% 
  count(year) %>% 
  ggplot(aes(year, n)) +
  geom_bar(stat = "identity") 
```

<img src="ufo_tutorial_files/figure-html/plot2.1-1.png" width="672" />



**Try making some of these other plots:** 

<img src="ufo_tutorial_files/figure-html/plot2.2-1.png" width="672" /><img src="ufo_tutorial_files/figure-html/plot2.2-2.png" width="672" />



## Plot 3: Which shapes are seen most commonly? 

Take a moment to think about how to construct this before looking at the code.


```r
ufos %>% 
  count(shape) %>% 
  filter(n >= 1000) %>% 
  ggplot(aes(shape, n)) +
  geom_bar(stat = "identity") +
  coord_flip()
```

<img src="ufo_tutorial_files/figure-html/plot3-1.png" width="672" />

Note: 

* We added `coord_flip()` so that the terms would be readable. 
* Having trouble understanding how to use the functions? use `?filter()`, `?count()` or `?geom_bar()` to see what's tripping you up. 


# Appendix

<p class = "intro"> Congratulations on finishing the tutorial! Now see if you can think up and answer some of your own questions! </p>

## Download **R**
Did you love **R**? You can download it onto your computer for unlimited and offline use!

* **R** here: [https://cran.cnr.berkeley.edu/](https://cran.cnr.berkeley.edu/) 
* **R Studio** here: [https://rstudio.com/products/rstudio/](https://rstudio.com/products/rstudio/)

## Learn More **R**

Delve a little deeper into **R** with one of these books:

<span id = "booklist"></span>

* Hadley Wickham Books: 
  + [R for Data Science](https://r4ds.had.co.nz/)
  + [Advanced R](https://adv-r.hadley.nz/)
  + [ggplot2: Elegant Graphics for Data Analysis](https://ggplot2-book.org/index.html)
  
* [R for Journalists](https://learn.r-journalism.com/en/)
* [R Cookbook, 2nd Ed](https://rc2e.com/index.html) 
* [Another list of free online books about R](http://cmdlinetips.com/2018/01/free-online-resources-books-to-learn-r-and-data-science/)


