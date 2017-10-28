library(ggplot2)
library(gcookbook) # for the data set

#bar graph
ggplot(pg_mean, aes(x=group, y=weight)) + geom_bar(stat="identity")

#convert the continuous variable to discreate; 6 time is missing
#when x is continuous there is a bar at each actual x value
#when x is discrete there is a bar at each possible x value between min and max, factor
ggplot(BOD, aes(x=Time, y=demand)) + geom_bar(stat="identity", fill="lightblue", colour="black")
ggplot(BOD, aes(x=factor(Time), y=demand)) + geom_bar(stat="identity")

#3.2 - first lets just take a look at the data set
cabbage_exp

#Stacked
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat="identity")
#side by side
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + geom_bar(stat="identity", position = "dodge")

#no y axis var will just be a count of x
ggplot(diamonds, aes(x=cut)) + geom_bar() #equivent to using geom_bar(stat="bin")
ggplot(diamonds, aes(x=carat)) + geom_bar()
#could also plot using histogram
ggplot(diamonds, aes(x=carat)) + geom_histogram()

#let's create a subset of our data
upc <- subset(uspopchange, rank(Change) > 10) #note: is taking the top to states (n=50)
upc
#now let's make a color bar chart by region
ggplot(upc, aes(x=Abb, y=Change, fill=Region)) + geom_bar(stat="identity")
#let's set our own colors
ggplot(upc, aes(x=reorder(Abb, Change), y=Change, fill=Region)) + geom_bar(stat="identity", colour="black") + scale_fill_manual(values=c("#FF5733", "#DAF7A6", "#5499C7", "#FFA07A")) + xlab("State")

library(gcookbook)
csub <- subset(climate, Source=="Berkeley" & Year >= 1900)
csub$pos <- csub$Anomaly10y >= 0
csub
ggplot(csub, aes(x=Year, y=Anomaly10y, fill=pos)) + geom_bar(stat="identity", position="identity")

