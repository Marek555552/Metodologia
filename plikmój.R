library(modelr)
library(kableExtra)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(knitr)
library(nycflights13)
library(forcats)
library(tidyverse)

smallpox <- read.csv ("m23t1/globalSmallpoxCases.csv",
                      header = TRUE)

head(smallpox)

names(smallpox)[4] <- "cases"

names(smallpox)

smallpox <- smallpox [,-2]

names (smallpox)

mean (smallpox$cases)

median (smallpox$cases)

mean(smallpox$cases [smallpox$Year >= 1920 & smallpox$Year <= 1930])

median(smallpox$cases [smallpox$Year >=1920 & smallpox$Year <=1930])

mean(smallpox$cases [smallpox$Year >= 1930 & smallpox$Year <= 1950])

median(smallpox$cases [smallpox$Year >=1930 & smallpox$Year <=1950])

mean(smallpox$cases [smallpox$Year >= 1950 & smallpox$Year <= 1970])

median(smallpox$cases [smallpox$Year >=1950 & smallpox$Year <=1970])


