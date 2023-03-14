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


ggplot(smallpox, aes(x = Year, y = cases))+
  stat_summary(fun=mean, colour="skyblue", geom="line", aes(group = 1))+
  theme_tufte()

ggplot(heights, aes(x= education, y = income))+
  geom_point(width = 0.5, alpha = 0.2)+
  stat_summary(fun=mean, colour="red", geom="line", aes(group = 1))+
  theme_tufte()

ggplot(heights, aes(x= education, y = income, aes,colour=sex))+
  geom_point()+
  stat_summary(fun=median, geom="line", size=2) +
  facet_wrap(~ marital, nrow = 2) + theme_tufte()

ggplot(heights,aes(x = education, y = income, aes,colour=sex)) +
  geom_smooth(size=0.2)+geom_point()+theme_tufte()

head(faithful)

ggplot(faithful, aes(x = waiting, y = eruptions)) + 
  geom_point()



ggplot(heights, aes(x = sex, y = income)) +
  geom_boxplot(size=0.2,alpha=0.2,outlier.size = 0.1) +
  theme_tufte() +
  theme(text = element_text(size=14))

twoLast <- filter(flights, month == 11| month == 12)


twoLast <- arrange(dep_delay)


byDay <- group_by(flights,year, month,day)
delayByDay<- summarize(byDay, delay = mean(dep_delay, na.rm = TRUE))
head(delayByDay)
length(delayByDay)

ggplot()+ geom_line(aes(y = delayByDay$delay, x = 1:365), alpha = .4)+theme_tufte()

byDest <- group_by(flights,dest)

delay <- summarize(byDest,count=n(),
                   dist=mean(distance,na.rm=TRUE),
                   delay = mean(arr_delay,na.rm=TRUE))
delay <- filter(delay, count >20, dest != "HNL")

head(delay)

ggplot(delay, aes( y = delay, x = dist, size = count)) + geom_point() + geom_smooth(size= 0.2, se= FALSE, color="skyblue")  

ggplot(gss_cat) +
  geom_bar(aes(x = race))

head(gss_cat)

relig <- gss_cat %>%
  group_by(relig) %>%
  summarise(count=n(), meanage = mean(age), meantvhours = mean(tvhours, na.rm=TRUE))

ggplot(relig, aes(y = relig , x = meantvhours)) + geom_point()

incomehours <- gss_cat %>%
  group_by(rincome) %>%
  summarise(count = n(), meantvhours = mean(tvhours, na.rm=TRUE))

ggplot(incomehours, aes(y = rincome , x = meantvhours)) + geom_point()


  

