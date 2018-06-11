#Start of the Script

#Loading required packages

library(ggplot2)

#Loading the Data
dfhm<- read.csv("Section5-Homework-Data.csv")
source("Section5-Homework-Vectors.R",echo = TRUE)

#We have also been given separate vectors which have related information in them. 
#We are going to combine those vectors into a dataframe (and merge them into the main dataframe later)

lifeExpentancy1960 <- data.frame(Country_Code,Life_Expectancy_At_Birth_1960)

lifeExpectancy2013 <- data.frame(Country_Code,Life_Expectancy_At_Birth_2013)

#The above vectors contain lifeExpentancy based on country code and year.

#Exploring the Data

head(dfhm)

tail(dfhm)

str(dfhm)

summary(dfhm)

head(lifeExpentancy1960)

head(lifeExpectancy2013)

#Here observe that there are 2 years in the dataset : 1960 and 2013

#Separating the two years into separated dataframes

dfhm1960 <- dfhm[dfhm$Year== 1960,]
summary(dfhm1960)

dfhm2013 <- dfhm[dfhm$Year==2013,]
summary(dfhm2013)

#Merging the data

dfhm1960 <- merge(dfhm1960,lifeExpentancy1960, by.x ="Country.Code", 
                  by.y = "Country_Code")

head(dfhm1960)

dfhm2013<- merge(dfhm2013,lifeExpectancy2013, by.x = "Country.Code", 
                 by.y = "Country_Code")

head(dfhm2013)

#Visualizing the Data for year 1960
qplot(data= dfhm1960, x =Fertility.Rate , y= Life_Expectancy_At_Birth_1960, 
      colour= Region, shape= I(15), alpha= I(0.7),
      main = "Fertility Rate vs Life Expectancy (1960)")

#Visualizing the Data for year 2013
qplot(data= dfhm2013, x =Fertility.Rate , y= Life_Expectancy_At_Birth_2013, 
      colour= Region, shape= I(15), alpha= I(0.7),
      main = "Fertility Rate vs Life Expectancy (2013)")


##Conclusion

#Life expectancy of a lot of Countries have increased over the years from 40 - 60 years to 65 - 75 years.

#Fertility rate has decreased over the years

##Reference

# Please note that the above datasets have been obtained from 
# https://www.superdatascience.com/, 
# obtained while pursuing a course by Kirill Eremenko
