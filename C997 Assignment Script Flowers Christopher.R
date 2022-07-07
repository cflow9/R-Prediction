library(tidyverse)
library(readr)
library(dplyr)
alabamaRaw <- read.csv(file = "C:/Users/chris/Google Drive/C997 Assignment Flowers Christopher/C997 Cleaned Data.csv",header=TRUE,sep=",")
colnames(alabamaRaw)<- c("Year","Population")
alabamaRaw
df<- as.data.frame(alabamaRaw)
df
df1 <- lm(Population~Year, data =df)
glimpse(df)
with(df1,plot(Year, Population))
abline(df1)
summary(df1)
predictYears <- predict(df1,data.frame("Year" = c(2020,2021,2022,2023,2024)))
predictYears
pd <- data.frame( "Year" = 2020:2024,"Population" = predictYears[1:5])
pd
newdata <- rbind(df,pd)#dplyr::bind_rows(df,pd)
newdata
with(newdata,plot(Year, Population))
newdatalm<-lm(Population~Year,data=newdata)
abline(newdatalm)