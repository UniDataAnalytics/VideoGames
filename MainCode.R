library(tidyverse)
#library(xlsx)
#library(readxl)
library(readr)
#library(dplyr)
#library(zoo)

#Dataset Cleaning
vgsales <- read.csv("vgsales.csv")  #load the original dataset
vgsales <- filter(vgsales, Year !="N/A") #remove row which contain "N/A" in Year column
vgsales <- filter(vgsales, Publisher != "N/A") #remove row which contain "N/A" in Publisher column
vgsales <- filter(vgsales, Publisher != "Unknown") #remove row which contain "Unknown" in Publisher column 
vgsales$Publisher <- as.character(as.factor(vgsales$Publisher))
write.csv(vgsales, file = 'vgSales(Cleaned).csv')

#Video Games Publisher with Global Sales
vgPub <- group_by(vgsales, Publisher)
vgPub <- summarise(vgPub, Global_Sales = sum(Global_Sales))
vgPub <- ungroup(vgPub) 
vgPub <- vgPub[with(vgPub, order(-Global_Sales)),]
write.csv(vgPub, file = 'Publisher_Global_Sales.csv')

#Video Games Platfor with Global Sales
vgPlat <- group_by(vgsales, Platform)
vgPlat <- summarise(vgPlat, Global_Sales = sum(Global_Sales))  
vgPlat <- ungroup(vgPlat)
vgPlat <- vgPlat[with(vgPlat, order(-Global_Sales)),]
write.csv(vgPlat, file = 'Platform_Global_Sales.csv')

#Video Games Genre with Global Sales
vgGenre <- group_by(vgsales, Genre)
vgGenre <- summarise(vgGenre, Global_Sales = sum(Global_Sales))
vgGenre <- ungroup(vgGenre)
vgGenre <- vgGenre[with(vgGenre, order(-Global_Sales)),]
write.csv(vgGenre, file = 'Genre_Global_Sales.csv')

#Filter only Nintendo Publisher
Nintendo <- filter(vgsales, Publisher == "Nintendo")

#Nintendo Genre with Global Sales
NintendoGenre <- group_by(Nintendo, Genre)
NintendoGenre <- summarise(NintendoGenre, Global_Sales = sum(Global_Sales))
NintendoGenre <- ungroup(NintendoGenre)
write.csv(NintendoGenre, file = 'Nintendo_Genre_GlobalSales.csv')

#Nintendo Platform with Global Sales
NintendoPlat <- group_by(Nintendo, Platform)
NintendoPlat <- summarise(NintendoPlat, Global_Sales = sum(Global_Sales))
NintendoPlat <- ungroup(NintendoPlat)
write.csv(NintendoPlat, file = 'NintendoPlat.csv')

#Nintendo Sales by Year
NintendoYear <- group_by(Nintendo, Year)
NintendoYear <- summarise(NintendoYear, Global_Sales = sum(Global_Sales))
NintendoYear <- ungroup(NintendoYear)
write.csv(NintendoYear, file = 'NintendoYear.csv')

OnlyGenre <- group_by(vgsales, Genre)

#Sports top 10 in list
SportsG <- filter(OnlyGenre, Genre == "Sports")
SportsG <- group_by(SportsG, Name, Genre)
SportsG <- summarise(SportsG, Global_Sales = sum(Global_Sales))
SportsG <- SportsG[with(SportsG, order(-Global_Sales)),]
SportsG <- SportsG[c(1,2,3,4,5,6,7,8,9,10),]
SportsG <- ungroup(SportsG)
write.csv(SportsG, file = 'SportsGenreTop10.csv')

#Action top 10 in list
ActionG <- filter(OnlyGenre, Genre == "Action")
ActionG <- group_by(ActionG, Name, Genre)
ActionG <- summarise(ActionG, Global_Sales = sum(Global_Sales))
ActionG <- ActionG[with(ActionG, order(-Global_Sales)),]
ActionG <- ActionG[c(1,2,3,4,5,6,7,8,9,10),]
ActionG <- ungroup(ActionG)
write.csv(ActionG, file = 'ActionGenreTop10.csv')

#Adventure top 10 in list
AdventureG <- filter(OnlyGenre, Genre == "Adventure")
AdventureG <- group_by(AdventureG, Name, Genre)
AdventureG <- summarise(AdventureG, Global_Sales = sum(Global_Sales))
AdventureG <- AdventureG[with(AdventureG, order(-Global_Sales)),]
AdventureG <- AdventureG[c(1,2,3,4,5,6,7,8,9,10),]
AdventureG <- ungroup(AdventureG)
write.csv(AdventureG, file = 'AdventureTop10.csv')

#Role-Playing top 10 in list
RPG <- filter(OnlyGenre, Genre == "Role-Playing")
RPG <- group_by(RPG, Name, Genre)
RPG <- summarise(RPG, Global_Sales = sum(Global_Sales))
RPG <- RPG[with(RPG, order(-Global_Sales)),]
RPG <- RPG[c(1,2,3,4,5,6,7,8,9,10),]
RPG <- ungroup(RPG)
write.csv(RPG, file = 'RPGTop10.csv')

#Shooting top 10 in list
ShootG <- filter(OnlyGenre, Genre == "Shooter")
ShootG <- group_by(ShootG, Name, Genre)
ShootG <- summarise(ShootG, Global_Sales = sum(Global_Sales))
ShootG <- ShootG[with(ShootG, order(-Global_Sales)),]
ShootG <- ShootG[c(1,2,3,4,5,6,7,8,9,10),]
ShootG <- ungroup(ShootG)
write.csv(ShootG, file = 'ShootingTop10.csv')

#vgsales$Year <- as.numeric(as.factor(vgsales$Year))
#vgsales <- na.omit(vgsales)
#vgsales$Year <- na.locf(vgsales$Year)
#vg <- vgsales[!is.na(vgsales$Year),]
