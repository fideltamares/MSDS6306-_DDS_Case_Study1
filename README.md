# MSDS6306-_DDS_Case_Study1

Purpose: 
Analyze brewery and beer data to determine useful information for the CEO and CFO of Budweiser. 

Approach Taken:
Analyze data for potential operational expansion into the craft beer segment.

Findings:
Based on the data set provided we found one state that could be considered oversaturated and highly competitive (Colorado). Our recommendation if you are planning to expand operations is to occupy a high growth and large market state such as Texas, California and Florida. A suitable strategy would be to focus can and bottle sales, but not to ignore onsight sconsumption sales. The location should focus on many styles to dominate the state and surrounding region starting with the most popular style, IPAs, followed by beers with higher than average IBU and ABV. 

Assumptions:
- Before we start had some assumptions as we conducted the analysis,
- 1005 beers removed due to missing IBU data
  - only removed when analyzing IBUs only
  - Most styles are consistent with beer associate beer guidelines, very few beers acted as outliers for each style 
- Beer sales are assumed to made within the borders of the state
- Breweries are analyzed as independent entities, does not factor sister breweries, parent companies
- 12oz beer sizes are Can and Bottle related while 16oz indicate pint glass size. We have not seen a 12oz pint glass, so our assumptions are based on experience and in-bar research
- Imported census data for additonal analysis

General environment: 
-	Our analysis was conducted on 558 breweries and 2410 beers
-	States averaged 11 per state
-	5 states had more than 28 breweries
-	Top 3 with most styles were Colorado, California and Minnesota
-	We learned here most states are dominated by a few breweries with many styles

Regional Preferances:
-	Region preferences centered around mid-high range for beers (35) which trends more towards the hoppier beers such as IPAs and strong Pale Ales.
- Highest IBU beer is made at Astoria Brewing in Oregon,  which centers around 40 IBU beers
- Region preferences centered around moderate ABV styles (5.6%) which trends more towards the bigger beers bodied beers
- Highest ABV beer is made at Upslope brewing in Colorado,  which centers around 6%+ ABV beers
- Our analysis supports the reasoning for the Top 3 overall styles are IPA, Pale Ale and Amber Ale
- Average ABV is 5.97%, slightly off from the center of the pack a 5.6%. This indicates there are higher abv beers in the top 50% than lower and a possible trend towards stronger beers.
- Most popular size is 12oz at (64%) but amount purchased at 16oz at (36%) not an insignificant number to ignore. The way this data was interpreted was based on serving unit, the normal pint glass is 16oz and cans were 12oz, this shows more of where people consume beer. There is a stronger preference for not at the establishment of purchase, most likely at home or a group gathering. 16oz 
- These charts show a positive relationship between ABV and IBU. As ABV moves up so does IBU
- This is potentially showing a trend in preference for current consumers 
- No region is in the session beer range (<5%, <40IBU)
- South and western regions have a higher correlation and may be the most likely states to experiment with newer big bodied beers,  north west and central are no too far behind but may not grow as fast
- This has significant impacts as these beers are typically more expensive to produce, they share a linear relationship, if you want more ABV you need more malt to create more sugar, if you want more IBU you will need more Hops.
- This can be offset by riding beer trends to enable us to charge more per ounce for bigger beers and also making sales through distribution with the 60%+ of purchases in can/bottle form
- The last slide it a market analysis, it shows the stats by population and breweries per 100k
- As you can see many that would be intuitively considered oversaturated by breweries like California and Texas are actually in line with many other states. Their large growing populations offset the number of breweries. This wont last forever as breweries can open faster than 100,000 reach drinking age or move to the state.













Supporting Documents:

MSDS 6306: Doing Data Science - Case Study 01

Description

The Beers dataset contains a list of 2410 US craft beers and Breweries dataset contains 558 US breweries. The datasets descriptions are as follows.

Beers.csv:

Name: Name of the beer.

Beer_ID: Unique identifier of the beer.

ABV: Alcohol by volume of the beer.

IBU: International Bitterness Units of the beer.

Brewery_ID: Brewery id associated with the beer.

Style: Style of the beer.

Ounces: Ounces of beer.

Breweries.csv:

Brew_ID: Unique identifier of the brewery.

Name: Name of the brewery.

City: City where the brewery is located.

State: U.S. State where the brewery is located.

Instructions

You can assume that your audience is the CEO and CFO of Budweiser (your client) and that they only have had one class in statistics and have indicated that you cannot take more than 7 minutes of their time. 20% of your grade will be based on the presentation. 

They have hired you to answer the 7 questions listed below and beyond those general questions you may speculate / anticipate what may be of interest to them.  


Deliverables: 

A.  A GitHub repository (Due Saturday Oct 26th 11:59pm CST 

The GitHub repo should contain the following items and a link to the GitHub repo should be placed on a Word Doc (or PDF) and submitted to 2DS for Unit 8.  


The final repo which will be checked after 11:59pm CST Oct 26th should contain: 	

1.  An RMarkdown file containing the following:


a.	The introduction needs to be written as if you are presenting the work to the CEO and CFO of Budweiser (your client) and that they only have had one class in statistics.  If it sounds like a student presentation, that is not acceptable.  You may assume that the CEO and CFO gave you the data and gave you the directive to report any interesting finding that you may uncover through your analysis.

b.	Briefly explain the purpose of the code. The explanations should appear as a sentence or two before or after the code chunk. Even though you will not be hiding the code chunks (so that I can see the code), you need to assume that the client can’t see them.

c.	Use R to code answers concerning the seven questions below.

Analysis Questions:

1.   How many breweries are present in each state?

2.   Merge beer data with the breweries data. Print the first 6 observations and the last six observations to check the merged file.  (RMD only, this does not need to be included in the presentation or the deck.)

3.   Address the missing values in each column.

4.   Compute the median alcohol content and international bitterness unit for each state. Plot a bar chart to compare.

5.   Which state has the maximum alcoholic (ABV) beer? Which state has the most bitter (IBU) beer?

6.   Comment on the summary statistics and distribution of the ABV variable.

7.   Is there an apparent relationship between the bitterness of the beer and its alcoholic content? Draw a scatter plot.  Make your best judgment of a relationship and EXPLAIN your answer.

8.  Budweiser would also like to investigate the difference with respect to IBU and ABV between IPAs (India Pale Ales) and other types of Ale (any beer with “Ale” in its name other than IPA).  You decide to use KNN classification to investigate this relationship.  Provide statistical evidence one way or the other. You can of course assume your audience is comfortable with percentages … KNN is very easy to understand conceptually.

In addition, while you have decided to use KNN to investigate this relationship (KNN is required) you may also feel free to supplement your response to this question with any other methods or techniques you have learned.  Creativity and alternative solutions are always encouraged.  

9. Knock their socks off!  Find one other useful inference from the data that you feel Budweiser may be able to find value in.  You must convince them why it is important and back up your conviction with appropriate statistical evidence. 



Directives on RMD File: 

i. 	Give clear, explicit answers to the questions. Just the code to answer the questions is not enough, even if the code is correct and gives the correct answer. You must state the answer in a complete sentence outside the code chunk.

ii.	Conclusion to the project. Summarize your findings from this exercise. The file must be readable in GitHub. In other words, don’t forget to keep the md file!!

2. Knit HTML file.  
In fact, you will also upload the knit html file to GitHub as well.  This will allow for plots and tables to supplement your answers (part e) to the 7 questions below.  You are already making an Rmd file, we should take advantage of it and knit a nice presentation of the project!  

3. Codebook, Both CSV files and a ReadMe.md
The Readme file describes the purpose of the project and codebook. The repo can be structured however you like, but it should make sense and be easily navigated.


4. PPT Slides 
Described more below and should have the link to your You Tube presentation … described further below as well.) 


B. UNIT 8 Live Session: EDA

Each team will need to meet with the professor and present their EDA in Unit 8.  It is up to the teams and the professor when and how to set up these meetings.  They may be during the schedule live session time, but given time constraints, some teams will need to schedule times outside of their scheduled live session time.  With that said, these are one on one meetings between each team and the professor.  Your only scheduled time commitment in Unit 8 is to attend this 10ish minute meeting with your professor.  The rest of the time is reserved to work on your project with your partner. 
Your goal is to present your EDA (Answers to Questions 1,3,4,5,6,7).  At this point, teams should have presentation quality slides and presentation prepared.  Responses to each of the questions listed above should be prepared and addressed in this meeting.  

The grade for this portion is based on the slide deck and the presentation.  If the team is prepared and delivers a well-practiced presentation it should be easy to earn close to a 100% here.  


B.  Unit 9 Live Session: Q & A.  

During Live Session for Unit 9, the professor will be available for a live Q & A about the project / presentation.  Attendance at this live session is not required (attendance is optional).  NOTE ABOUT POWERPOINT …   You may use the same powerpoint or develop them separately.  I would imagine that even if you develop the powerpoint together that each student’s final powerpoint will be a little different just based on individual presentation style.  Everyone has their own unique style and delivery.  



C. Final YouTube Video

Each team member will need to record and upload to YouTube a 7-minute or less presentation of your findings.   At this point you should know your presentation backwards and forwards.  If you trip up too much in your recording, you should start over until you have a very polished presentation that does not exceed 7 minutes.  

To record you can download Camtasia (free trial) which is a video software available at https://www.techsmith.com/video-editor.html
or use your preferred screen capture software (like QuickTime if you have a Mac.) The presentation slides that include a link to your video should be in the Case Study Github repo as well as on the Google Doc provided by your professor. The goal is to communicate the findings of the project in a clear, concise and scientific manner.  Also, uploading to YouTube is not difficult.  Here is a YouTube video to help:  https://www.youtube.com/watch?v=VtF2AgFSLAw
Your professor will make the Google Doc link available to everyone in the class so that your peers can benefit from your work and so that you can benefit from theirs.  Student’s presentation links will be available for a week at which time you may take your video off of YouTube if you wish.



Collaboration and Peer Review

This will be a team project. We expect that all team members will do equal work and give their best to advance the knowledge of both themselves and their teammate.   All members will need to push, add, commit, and pull to GitHub.  This is a collaborative project, be sure and communicate early and often; mutual respect is key. 

You will be providing two peer reviews that will be submitted to 2DS in Unit 8 and Unit 9 under:   Project 1: EDA and Peer Review (by Saturday Oct 19 11:59pm / Unit 8) and Project 1: Final Documentation, Presentation and Peer Review Assignment (by Saturday Oct 26 11:59pm / Unit 9) .  See the Rubric for detailed information on the peer review.  






Rubric – Case Study 1

Initial EDA (Overall 5% of DDS Grade)
•	The initial EDA presentation should be well polished as should the visual aids (example: PowerPoint deck)
o	Plots and Charts should be mentioned and/or referred to in the verbal presentation or they should not be in the deck.
o	Refrain from writing too much on the slides and / or overloading with information. 
o	Use the information on the slides as an aid not a script.  Points will be deducted for reading too much off of the slides.  
o	Plots and Charts should be well labeled. 
o	No code or screen shots of output.
o	Questions 1,3,4,5,6 and 7 should be fully addressed. 
o	In general, points will be deducted for sloppiness and /or incompleteness.  
o	Efforts that completely address each analysis question in an organized, clear and well supported manner will receive all or very near full credit.  
o	Keep the presentation under 5 min. 
•	The Initial EDA and Presentation is graded more on completeness rather than correctness.  Your professor may give some direction or correction that they will look for in the final presentation.  

Final Analysis (Overall 20% of DDS Grade)
•	The final analysis / presentation includes the EDA (6 questions) plus the additional analysis and polished presentation. 
•	All %s below are of the overall 20% grade. 
RMD/ Answer to Analysis Questions – 60%
•	Each team member will receive the same grade for the analysis / RMD and possibly analysis on PowerPoint deck (if same deck is used.)  If there is division of labor, it is assume that the each team member is double checking and is very familiar with the response to every analysis question.  
•	9 Analysis Questions: not equally weighted.  The harder questions are worth more points.  
•	Taking off for cumulative errors will not be a thing, provided the answer is well-reasoned based on prior questions’ answers.
•	Documentation: Answers should be in a well commented and explained RMarkdown file. 
YouTube Presentation – 20%	
•	Communication and presentation of your findings are critical to being a successful data scientist.  You will be graded on:
o	Voice inflection
o	Content Knowledge
o	Slide Organization / Content
o	Visualization 
o	Periodic eye contact and general interest in your audience. (Your face must be visible during the presentation.)
o	Composure: This will be mostly not reading off of the slides.  
o	Pace: Not going a second over 7 minutes.  The CEO and CFO are very strict on this point.  
Note: While each member of the team will receive the same grade on the RMD / Answer to the analysis questions, they will receive a different grade on their presentation.  One member’s presentation will not affect anyone else’s presentation grade. Each member of the team should present solutions to all 9 questions.  You may develop the slides for the presentation together and use the same deck or you may make your own slides, but each team member must make their own video (7 minutes or less) and post it to YouTube separately (unique URL).       
GitHub – 10%
•	Sensible structuring (location) of files in repository
•	Presence of Powerpoint, Rmd and knit files in the repo.  
•	Readme/Codebook
Peer Grading – 10% 
•	Send a review of your performance and your teammate’s performance to 2DS.  You will do this twice during the project: one will be turned in to 2DS Unit 8 and again in Unit 9.  Honest (but not rude) appraisal is fair game.  Your review will not be shared with your teammate.  Give them a score from 0 to 10.  Most people should fall between a 6 to 10 (D to A) range.  5 or lower (F) is reserved for particularly difficult teammates.  Grade your own effort on this metric as well.
o	This metric should not be a measure of your partner’s coding ability, but the amount of effort they put in.  If they are well-meaning but make mistakes, that is not cause to dock them points.  It should be reserved for no-shows, careless work, or laziness.  
o	Make yourself available and accountable.  By signing up for this course, you committed and will need to make time to work on the project.  We are all busy adults; you must manage your time well and meet halfway on your partner’s schedule.
o	Failure to turn in a review will result in a zero for this section.






