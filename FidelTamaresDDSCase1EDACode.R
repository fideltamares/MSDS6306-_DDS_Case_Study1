library(ggplot2)
library(tidyverse)                                                                                                                                                                                            
library(dplyr)
library(maps)
library(stringr)
library(e1071)
library(class)
library(caret)
library(mapdata)

#importing CVS Files
beers = read.csv(file.choose(),header = TRUE)
breweries = read.csv(file.choose(),header = TRUE)
USPop2019OnlyStates3yrGrowth = read.csv(file.choose(),header = TRUE)
USPop2019OnlyStates3yrGrowth$X2019pop <- as.numeric((gsub(",","",USPop2019OnlyStates3yrGrowth$X2019pop)))

#USPop2019OnlyStates3yrGrowth$X2019pop <- as.numeric(USPop2019OnlyStates3yrGrowth$X2019pop)

#file imported USPop2019OnlyStatesd3yrGrowth.CSV pulled from Kaggle


#1 How many breweries are present in each state?

breweries %>% ggplot(aes(y=reorder(State,State, length), fill = State)) + geom_bar() + ggtitle("Breweries per State") + labs(y="States", x="Number of Breweries")
#verify that chart matches the data
table(breweries$State)

#tallying up breweries and finding the average of each state
statecount<- breweries %>% group_by(State) %>% tally
statecount$State <- trimws(statecount$State, which = c("left"))
ColMeans(Statecount$n, na.rm = TRUE)
mean(statecount$n) #10.9 breweries per state



#2 Merge beer data with the breweries data.
# Print the first 6 observations and the last six observations to check the merged file. 
# (RMD only, this does not need to be included in the presentation or the deck.)

#changing columns with the shared data I need with names names to match in each data frame
colnames(breweries)[colnames(breweries)=="Brew_ID"] <- "Brewery_id"
completebrewerylist <- merge(beers, breweries, by = "Brewery_id")

#stripping left space
completebrewerylist$State <- trimws(completebrewerylist$State, which = c("left"))

#adding additional columns to add fidelity to locality analysis
stateinfo = data.frame(state.abb, tolower(state.name), state.region, state.division)

#updating column names to prep for merging

names(stateinfo)[1] = "State"
names(stateinfo)[2] = "State_Name"
names(stateinfo)[3] = "Region"
names(stateinfo)[4] = "Division"

#combining with completebrewerylist
completebrewerylist1 = merge(completebrewerylist, stateinfo, by= "State", all.x=TRUE)

headlist <- completebrewerylist1 %>% head()
headlist

taillist <- completebrewerylist1 %>% tail()
taillist

#adding state population and 3 yr growth

completebrewerylist2 = merge(completebrewerylist1, USPop2019OnlyStates3yrGrowth, by="State", all=TRUE)

#3 Address the missing values in each column.

#Checking for missing values
colSums(is.na(completebrewerylist2))

# option 1 omitting NA
#na.omit() used

#option 2 replacing NA values to average of IBU 
#average IBU for IPA Is: 71.82 (See question 8)
#average IBU for Ale is: 34.59 (See question 8)

#4 Compute the median alcohol content and international bitterness unit for each state.
# Plot a bar chart to compare.

#switch to region vs division, chart was too busy with 9 colors
completebrewerylist2 %>%
  na.omit() %>%
  ggplot(aes(x = State, y = ABV, fill= Region)) +
  geom_bar(stat="summary", fun="median") +
  ggtitle("Median ABV by State") +
  labs(x="State",y="ABV")

#Numeric details
summary(completebrewerylist2$ABV) #Overall ABV Median is .056

completebrewerylist2 %>%
  na.omit() %>%
  ggplot(aes(x = State, y = IBU, fill= Region)) +
  geom_bar(stat="summary", fun="median") +
  ggtitle("Median IBU by State") +
  labs(x="State",y="IBU")

#Numeric details
summary(completebrewerylist2$IBU) #Overall IBU Median is 35

#5 Which state has the maximum alcoholic (ABV) beer? 
# Which state has the most bitter (IBU) beer?

completebrewerylist2[which.max(completebrewerylist2$ABV),]
#CO, Upslope Brewing at 12.8%, Belgian Style Quad

completebrewerylist2[which.max(completebrewerylist2$IBU),]
#OR, Astoria Brewing at 138 IBU, American Double/ Imperial IPA

#6 Comment on the summary statistics and distribution of the ABV variable
summary(completebrewerylist1$ABV)
ggplot(data=completebrewerylist1,aes(x=ABV)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white") + 
  geom_density(colour="red", size=1) +
  labs(title="ABV Distribution")

#7 Is there an apparent relationship between the bitterness of the beer and its alcoholic content? Draw a scatter plot.
#Make your best judgment of a relationship and EXPLAIN your answer.
completebrewerylist2 %>% 
  na.omit() %>%
  ggplot(aes(x=ABV,y=IBU, color = Region)) +
  geom_point() +
  geom_smooth(method=lm) +
  facet_wrap(~Region) +
  ggtitle("Relationship between bitterness and alcohol content") +
  labs(y="IBU",x="ABV")

#8 Budweiser would also like to investigate the difference with respect to IBU and ABV between IPAs (India Pale Ales) and
# other types of Ale (any beer with "Ale" in its name other than IPA).
# You decide to use KNN classification to investigate this relationship.
# Provide statistical evidence one way or the other.
# You can of course assume your audience is comfortable with percentages . KNN is very easy to understand conceptually. 


beeripa1 <- completebrewerylist2 %>%
  filter(grepl("\\bIPA\\b",Style,ignore.case = TRUE ))


beerale1 <- completebrewerylist2 %>%
  filter(grepl("\\bAle\\b",Style,ignore.case = TRUE ))


beeripabeeripa1 <- completebrewerylist2 %>% 
  select("ABV","IBU","Style")
  
  beerale2 <- beerale1 %>% select("ABV","IBU","Style") %>% na.omit()
summary(beerale2)

beeripa2 <- beeripa1 %>% select("ABV","IBU","Style") %>% na.omit()
summary(beeripa2)

beeripaale1 <- rbind(beeripa1, beerale1)

beeripaaleknn1 <- beeripaale1[c(5,6,7)] %>% na.omit()

print(beeripaaleknn1)

#add column to determine to classify as IPA or Ale (based on style)
beeripaaleknn1$ipaale = as.factor(ifelse(grepl('\\bIPA\\b', beeripaaleknn1$Style,ignore.case = TRUE),'IPA','Ale'))

#observation check
dim(beeripaale1[1])

splitperc = .7

beerindices1 = sample(1:dim(beeripaaleknn1)[1], round(splitperc*dim(beeripaaleknn1)[1]))

beertrain1 = beeripaaleknn1[beerindices1,]
beertest1 =  beeripaaleknn1[-beerindices1,]
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
confusionMatrix(table(beerclass1, beertest1$ipaale))

#82.8 % Accuracy to classify beers by IBU and ABV


#top 5 beer styles 

topstyle1 = aggregate(completebrewerylist2$Style,by=list(completebrewerylist2$Style),length)
head(topstyle1[order(topstyle1$x,decreasing = TRUE),],5)

#TOP 5 breweries with most styles
completebrewerylist3 = aggregate(completebrewerylist2$Name.y,by=list(completebrewerylist2$Name.y),length)
head(completebrewerylist3[order(completebrewerylist3$x,decreasing = TRUE),],5)

#needs work
#top 5 states with the most beer styles
completebrewerylist4 = aggregate(completebrewerylist2$Name.y,by=list(completebrewerylist2$Name.y),length)
head(completebrewerylist4[order(completebrewerylist3$x,decreasing = TRUE),],5)

#top 5 State with the most beer styles
statebeers1 = aggregate(completebrewerylist2$State,by=list(completebrewerylist2$State),length)
head(statebeers1[order(statebeers1$x,decreasing = TRUE),],5)

#ABV v  Volume

abvvolume1 = aggregate(completebrewerylist2$Ounces,by=list(completebrewerylist2$Ounces),length)
head(abvvolume1[order(abvvolume1$x,decreasing = TRUE),],5)
#CHART 1
completebrewerylist2 %>%
  na.omit() %>%
  ggplot(aes(x = Ounces, y = ABV, color= Region)) +
  geom_jitter(width=1) +
  ggtitle("ABV vs Volume") +
  labs(x="Ounces",y="ABV")

#CHART 2 sizes by regions
completebrewerylist2 %>%
  na.omit() %>%
  count(Ounces = factor(Ounces), Region=factor(Region)) %>%
  mutate(abvbysize = prop.table(n)) %>%
  ggplot(aes(x = Ounces, y=abvbysize, fill = Region, label = scales::percent(abvbysize))) +
  geom_col(position="dodge") +
  geom_text(position=position_dodge(width=.9), vjust = -.5, size=3) + 
  scale_y_continuous(labels = scales::percent_format(accuracy=1L)) +
  ggtitle("Beer Sizes by Region") +
  labs(x="Ounces",y="Total % of Market")


# Breweries by state (% overall)

ggplot(completebrewerylist2,aes(x=reorder(State,State,length),fill = State)) + geom_bar(stat = "count") + coord_flip() + 
  geom_text(aes(label = scales::percent((..count..)/sum(..count..))),stat = "count",position = "stack",vjust= .5,hjust=-0.1, size=3) +
  labs(x="State",y="% of total Breweries", title="Breweries per State")


#renames columns for heatmap prep     
statecount1 = aggregate(completebrewerylist2$State,by=list(completebrewerylist2$State),length)
colnames(statecount1) = c("region","count")
statecount1$region = tolower(state.name[match(trimws(as.character(statecount1$region)),state.abb)])

states_map = map_data("state")


ggplot(statecount1, aes(map_id = region))+
  geom_map(aes(fill = count), color="black", map = states_map) +
  expand_limits(x = states_map$long, y = states_map$lat) +
  scale_fill_gradient(high = "red", low = "yellow", guide = "colorbar") +
  labs(title="Number of Breweries In Each State") 


# States by Population  
#calculating breweries per capita


#change first character from numberic to char
USPop2019OnlyStates3yrGrowth1 <- USPop2019OnlyStates3yrGrowth
names(USPop2019OnlyStates3yrGrowth1)[1] = "sabb"
names(USPop2019OnlyStates3yrGrowth1)[2] = "pop2019"
names(USPop2019OnlyStates3yrGrowth1)[3] = "g2019"

#updating dataset to include per capita

statecount2 <- statecount
names(statecount2)[1] = "State"
statecount3 = merge(statecount2, stateinfo, by= "State", all.x=TRUE)
statecount4 = merge(statecount3, USPop2019OnlyStates3yrGrowth, by="State", all.x=TRUE)

statecount5 = statecount4
statecount5$X2019pop <- as.numeric((gsub(",","",statecount5$X2019pop)))

#population by state
USPop2019OnlyStates3yrGrowth1 %>%
  na.omit() %>%
  ggplot(aes(x=reorder(sabb,pop2019), y=pop2019, fill = sabb)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  ggtitle("Population by State") +
  labs(x="Population", y="State", colour="States") +
  theme(legend.title=element_blank())

statecount5["BP100K"] = round(((statecount5["n"]/statecount5["X2019pop"]) * 100000), digits = 1)

#adjusting variable names
USPop2019OnlyStates3yrGrowth2 <- USPop2019OnlyStates3yrGrowth
USPop2019OnlyStates3yrGrowth3 = merge(USPop2019OnlyStates3yrGrowth2, statecount5, by="State", all.x=TRUE)
names(USPop2019OnlyStates3yrGrowth3)[1] = "sabb"
names(USPop2019OnlyStates3yrGrowth3)[2] = "pop2019"
names(USPop2019OnlyStates3yrGrowth3)[3] = "g2019"

USPop2019OnlyStates3yrGrowth3 %>% slice(-8)
USPop2019OnlyStates3yrGrowth3$pop2019 <- as.numeric((gsub(",","",USPop2019OnlyStates3yrGrowth3$pop2019)))

#Plotting brewers per capita (100k)
USPop2019OnlyStates3yrGrowth3 %>%
  select (BP100K, sabb) %>%
  ggplot(aes(x=reorder(sabb, BP100K), y=BP100K, fill = sabb)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label=BP100K), position=position_stack(vjust=0.5), size=3) +
  coord_flip() +
  ggtitle("Breweries per 100k") +
  labs(x="State", y="Breweries per 100k", colour="States") +
  theme(legend.title=element_blank())
