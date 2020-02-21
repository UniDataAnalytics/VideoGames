library(tidyverse)
#library(xlsx)
#library(readxl)
library(readr)
#library(dplyr)
#library(zoo)

vgsales <- read.csv("vgsales.csv")  #load the original dataset
vgsales <- filter(vgsales, Year !="N/A") #remove row which contain "N/A" in Year column
vgsales <- filter(vgsales, Publisher != "N/A") #remove row which contain "N/A" in Publisher column
vgsales <- filter(vgsales, Publisher != "Unknown") #remove row which contain "Unknown" in Publisher column 
vgsales$Publisher <- as.character(as.factor(vgsales$Publisher))
write.csv(vgsales, file = 'vgSales(Cleaned).csv')

vgPub <- group_by(vgsales, Publisher)
vgPub <- summarise(vgPub, Global_Sales = sum(Global_Sales))
vgPub <- ungroup(vgPub)  

vgPlat <- group_by(vgsales, Platform)
vgPlat <- summarise(vgPlat, Global_Sales = sum(Global_Sales))  
vgPlat <- ungroup(vgPlat)

vgGenre <- group_by(vgsales, Genre)
vgGenre <- summarise(vgGenre, Global_Sales = sum(Global_Sales))
vgGenre <- ungroup(vgGenre)



#vgsales$Year <- as.numeric(as.factor(vgsales$Year))
#vgsales <- na.omit(vgsales)
#vgsales$Year <- na.locf(vgsales$Year)
#vg <- vgsales[!is.na(vgsales$Year),]
