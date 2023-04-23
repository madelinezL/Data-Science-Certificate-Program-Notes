#!/usr/bin/env python
# coding: utf-8

# In[5]:


#Impoart Datasets
import pandas as pd
gt100=pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Global Weekly Top 100 Songs\CS703 Global Weekly Top 100 Songs.csv')


# In[29]:


# define the variables used in the formula
a = 4131844
b = 105326200
c = 298014
d = -2343501
e = -548063
f = -10475390
g = -904630
h = -2069824
i = 819883
j = -5897379
k = 9139
l = -3775279

# calculate the predicted msPlayed using the formula and variables
gt100 ['pred_msPlayed'] = l + (a * gt100['danceability']) + (b * gt100['energy']) + (c * gt100['key']) + (d * gt100['loudness']) + (e * gt100['mode']) + (f * gt100['speechiness']) + (g * gt100['acousticness']) + (h * gt100['instrumentalness']) + (i * gt100['liveness']) + (j * gt100['valence']) + (k * gt100['tempo'])

# print the updated DataFrame to verify the new column and values
print(gt100)


# In[31]:


# sort the DataFrame by pred_msPlayed in descending order
gt100_sorted = gt100.sort_values ('pred_msPlayed', ascending = False)

# show the top 21 (20) songs by pred_msPlayed
top20_songs = gt100_sorted.head(21)

# print the top 21 (20) songs
print(top20_songs[['track', 'artist']])


# In[23]:


#Retrieve the year information of the 10 songs
genl=pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Generalized Dataset\CS703 Generalized Dataset.csv')

songs = ['Hong Kong', 'Mongoloid - 2009 Remaster', 'Bad Habits - uncut', 'Stepping Into Tomorrow', 'This Town (feat. Sasha Sloan)', 'Citgo', 'Hello, Dolly!', 'Love, Life And Money', 'Tadow', 'Good Vibrations - Remastered']

filtered_genl = genl.loc[genl['track'].isin(songs)]

track_and_year = filtered_genl.groupby('track')['year'].min().reset_index()

print(track_and_year)


# In[32]:


#Review the process

#Content-based filtering method

import pandas as pd

#try using generalized dataset for the optimal model
genl=pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Generalized Dataset\CS703 Generalized Dataset.csv')

# Create a boolean mask to filter the rows based on the "year" variable
mask = (genl["release_date"] >= '2011') & (genl["release_date"] <= '2020')

# Apply the boolean mask to retrieve the subset of the dataset
genl_sub = genl.loc[mask]

print()

# define the variables used in the formula
a = 4131844
b = 105326200
c = 298014
d = -2343501
e = -548063
f = -10475390
g = -904630
h = -2069824
i = 819883
j = -5897379
k = 9139
l = -3775279

# calculate the predicted msPlayed using the formula and variables
genl_sub['pred_msPlayed'] = l + (a * genl_sub['danceability']) + (b * genl_sub['energy']) + (c * genl_sub['key']) + (d * genl_sub['loudness']) + (e * genl_sub['mode']) + (f * genl_sub['speechiness']) + (g * genl_sub['acousticness']) + (h * genl_sub['instrumentalness']) + (i * genl_sub['liveness']) + (j * genl_sub['valence']) + (k * genl_sub['tempo'])

# sort the DataFrame by pred_msPlayed in descending order
genl_sub_sorted = genl_sub.sort_values ('pred_msPlayed', ascending = False)

# show the top 20 songs by pred_msPlayed
top20_songs = genl_sub_sorted.head(20)

# print the top 20 songs
print(top20_songs[['track', 'artist']])

#print the observations of the sub generalized dataset
print(genl_sub.shape[0])


# In[12]:


#Review the process

#Collaborative filtering method

#Euclidean Distance

import pandas as pd
import numpy as np

# Load the individual dataset
indiv = pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Individual Dataset\CS703 Individual Dataset.csv')

# Load the generalized dataset
genl = pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Generalized Dataset\CS703 Generalized Dataset.csv')

# Define the set of target songs
target_songs = ['Soft', 'Polaroid', 'Vacance in September', 'Soothe (feat. Junmo)', 'bath']

# Filter the individual dataset based on the target songs
target_indiv = indiv[indiv['track'].isin(target_songs)]

# Compute the average feature values for the target songs
target_features = target_indiv.iloc[:, 4:15].mean()

# Extract the relevant audio features from the generalized dataset
genl_features = genl.iloc[:, 5:16].values

# Calculate the Euclidean distances between the target features and all other tracks
distances = np.sqrt(np.sum(np.square(genl_features - target_features.values), axis=1))

# Find the indices of 5 tracks with the smallest distance (i.e., the 5 most similar tracks)
most_similar_indices = np.argsort(distances)[:6]

# Extract the information of the most similar tracks
most_similar_features = genl.iloc[most_similar_indices, 5:16]
most_similar_track_names = genl.iloc[most_similar_indices, 2]
most_similar_artists = genl.iloc[most_similar_indices, 1]

# Get the names of the audio feature coefficients
feature_names = list(genl.columns[5:16])

# Display the most similar tracks and their features
print(f'The 5 most similar tracks to the target set {target_songs} are:')
for i in range(5):
    print(f'{most_similar_track_names.iloc[i]} by {most_similar_artists.iloc[i]}:')
    for j in range(len(feature_names)):
        print(f'{feature_names[j]}: {most_similar_features.iloc[i, j]}')
    print()


# In[11]:


import pandas as pd
import numpy as np

#Cosine Similarity 

# Load the individual dataset
indiv = pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Individual Dataset\CS703 Individual Dataset.csv')

# Load the generalized dataset
genl = pd.read_csv(r'C:\Users\madlin\Desktop\les notes de madeline\mademoiselle madeline stuff boooom\DS\Applied DS Project\Data\Generalized Dataset\CS703 Generalized Dataset.csv')

# Define the set of target songs
target_songs = ['Soft', 'Polaroid', 'Vacance in September', 'Soothe (feat. Junmo)', 'bath']

# Filter the individual dataset based on the target songs
target_indiv = indiv[indiv['track'].isin(target_songs)]

# Compute the average feature values for the target songs
target_features = target_indiv.iloc[:, 4:15].mean()

# Extract the relevant audio features from the generalized dataset
genl_features = genl.iloc[:, 5:16].values

# Calculate the Cosine Similarities between the target features and all other tracks
similarities = np.dot(genl_features, target_features.values) / (np.sqrt(np.sum(np.square(genl_features), axis=1)) * np.sqrt(np.sum(np.square(target_features.values))))

# Find the indices of 5 tracks with the highest similarity (i.e., the 5 most similar tracks)
most_similar_indices = np.argsort(similarities)[::-1][:5]

# Extract the information of the most similar tracks
most_similar_features = genl.iloc[most_similar_indices, 5:16]
most_similar_track_names = genl.iloc[most_similar_indices, 2]
most_similar_artists = genl.iloc[most_similar_indices, 1]

# Get the names of the audio feature coefficients
feature_names = list(genl.columns[5:16])

# Display the most similar tracks and their features
print(f'The 5 most similar tracks to the target set {target_songs} are:')
for i in range(5):
    print(f'{most_similar_track_names.iloc[i]} by {most_similar_artists.iloc[i]}:')
    for j in range(len(feature_names)):
        print(f'{feature_names[j]}: {most_similar_features.iloc[i, j]}')
    print()

