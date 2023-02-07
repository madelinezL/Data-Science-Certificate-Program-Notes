#Install packages
library(dplyr)
library(ggplot2)
library(class)
library(MASS)
library(gamlr)
library(tree)

#Import Dataset
Your_Library = read.csv("~/Desktop/Your Library CS617-final.csv")
View(Your_Library)
Streaming_History = read.csv("~/Desktop/Streaming History CS617-final.csv")
View(Streaming_History)
Playlist = read.csv("~/Desktop/Playlist CS617-final.csv")
View(Playlist)

#Part I: Visualizations of my music taste

#1.My favorite artist
#1.1 My favorite artist based on the number of tracks in my library

My_Fav_Artist = count(Your_Library, Artist, sort=TRUE)
head(My_Fav_Artist, n=5)

#1.2 My favorite artist based on the streaming time of songs
Streaming_History %>%
  count(Artist, sort = TRUE) %>%
  top_n(5) %>%
  mutate(Artist = reorder(Artist, n)) %>%
  ggplot(aes(x = Artist, y = n)) +
  geom_bar(aes(fill=n),   
           stat="identity") +
  scale_fill_distiller(palette="ggplot default") +
  xlab(NULL) +
  coord_flip() +
  labs(x = "Artist",
       title = "Artists I listened most to",
       fill = "Count") +
  theme_minimal()

#2. My favorite playlist based on the streaming time 

#Get a sense of the playlist name and how many tracks are within each playlist
table(Playlist$Playlist)

aggregate(x=Streaming_History$Miliseconds_Played,
          by = list(Streaming_History$Playlist),
          FUN = sum
          )
#3. My favorite/on repeat track based on the streaming time 
Streaming_History %>%
  count(Track, sort = TRUE) %>%
  top_n(20) %>%
  mutate(Track = reorder(Track, n)) %>%
  ggplot(aes(x = Track, y = n)) +
  geom_bar(aes(fill=n),   
           stat="identity") +
  scale_fill_distiller(palette="ggplot default") +
  xlab(NULL) +
  coord_flip() +
  labs(x = "Track",
       title = "Track I listened most to",
       fill = "Count") +
  theme_minimal()


# Genre overview of my music library
Your_Library_Genre = count(Your_Library,Genre,sort=TRUE)
Your_Library_Genre

ggplot(Your_Library_Genre, aes(x=Genre, y=n)) +
  geom_segment(aes(x=Genre, xend=Genre, y=0, yend=n), color="#52854C") +
  geom_point(color="#52854C", size=4) +
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  xlab("") +
  ylab("Number of songs")

#Part II: Streaming Prediction Analysis
#maybe we can do a certain variables summary
summary(Your_Library)

#build the optimal regression model

Your_Library_2 = Your_Library[, -c(1,2,3,4,5,6,19)]
View(Your_Library_2)

Your_Library_2$danceability=as.numeric(Your_Library_2$danceability)
Your_Library_2$energy=as.numeric(Your_Library_2$energy)
Your_Library_2$key=as.numeric(Your_Library_2$key)
Your_Library_2$loudness=as.numeric(Your_Library_2$loudness)
Your_Library_2$mode=as.numeric(Your_Library_2$mode)
Your_Library_2$speechiness=as.numeric(Your_Library_2$speechiness)
Your_Library_2$acousticness=as.numeric(Your_Library_2$acousticness)
Your_Library_2$instrumentalness=as.numeric(Your_Library_2$instrumentalness)
Your_Library_2$liveness=as.numeric(Your_Library_2$liveness)
Your_Library_2$valence=as.numeric(Your_Library_2$valence)
Your_Library_2$tempo=as.numeric(Your_Library_2$tempo)
Your_Library_2$Miliseconds_Played=as.numeric(Your_Library_2$Miliseconds_Played)


#train test split
N=nrow(Your_Library_2)
train_frac=0.8
N_train=floor(train_frac*N)
N_test=N-N_train

train_ind = sample.int(N, N_train, replace=FALSE) 
Your_Library_train = Your_Library_2[train_ind,]
Your_Library_test = Your_Library_2[-train_ind,]

#linear model 1
lm1 = lm(formula = Miliseconds_Played ~ danceability + energy + key + loudness +mode + 
           speechiness + acousticness + instrumentalness + liveness + valence + tempo, data=Your_Library_train)

lm1_predict = predict(lm1, Your_Library_test)

rmse = function(y, yhat) {
  sqrt( mean( (y - yhat)^2 ) )
}

rmse(Your_Library_test$Miliseconds_Played, lm1_predict)



#model 2, add interaction
lm2 = lm(Miliseconds_Played ~ danceability + energy + key + loudness +mode + speechiness + acousticness 
         + instrumentalness + liveness + valence + tempo + danceability:energy + danceability:loudness 
         + danceability:liveness + danceability:valence  + loudness:liveness + loudness:energy 
         + speechiness:instrumentalness + energy:liveness + energy:valence 
         + instrumentalness:energy, data=Your_Library_train)

lm2_predict = predict(lm2, Your_Library_test)

rmse = function(y, yhat) {
  sqrt( mean( (y - yhat)^2 ) )
}

rmse(Your_Library_test$Miliseconds_Played, lm2_predict)

#model 3:stepwise forward model 
lm3 = lm(Miliseconds_Played~.-Miliseconds_Played, data=Your_Library_train)
forward <- step(lm3, direction='forward', scope=formula(lm3), trace=0)
forward$anova

lm3_predict = predict(lm3, Your_Library_test)

rmse = function(y, yhat) {
  sqrt( mean( (y - yhat)^2 ) )
}

rmse(Your_Library_test$Miliseconds_Played, lm3_predict)

#model 4: trees
lm4=tree(Miliseconds_Played~. -Miliseconds_Played, data = Your_Library_train)
lm4_predict = predict(lm4, newdata = Your_Library_test)

rmse = function(y, yhat) {
  sqrt( mean( (y - yhat)^2 ) )
}

rmse(Your_Library_test$Miliseconds_Played, lm4_predict)


Model = c("linear model 1","linear model 2","stepwise forward model","tree model")
RMSE = c(rmse(Your_Library_test$Miliseconds_Played, lm1_predict), 
         rmse(Your_Library_test$Miliseconds_Played, lm2_predict), 
         rmse(Your_Library_test$Miliseconds_Played, lm3_predict), 
         rmse(Your_Library_test$Miliseconds_Played, lm4_predict))
table = cbind(Model,RMSE)
table

#Choose the optimal linear model 2
lm1

#calculate the predicted streaming time in the dataset of the Global Weekly Top 100 popular songs
Top_100_Songs = read.csv("~/Desktop/Global Weekly-2022-07-21 Top 100 Songs-final.csv")
head(Top_100_Songs)
#select the top 20
Pred_Songs = Top_100_Songs[order(Top_100_Songs$Predicted.Miliseconds.Played),]
Pred_Songs$Track
head(Pred_Songs$Track, n=20)
