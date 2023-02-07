#!/usr/bin/env python
# coding: utf-8

# In[3]:


get_ipython().system('pip install pandas_profiling')


# In[5]:


import sys
import numpy
import pandas
import matplotlib
import seaborn
import scipy
import sklearn
import pandas_profiling

print ('Python: {}'.format(sys.version))
print ('Numpy: {}'.format(numpy.__version__))
print ('Pandas: {}'.format(pandas.__version__))
print ('Matplotlib: {}'.format(matplotlib.__version__))
print ('Seaborn: {}'.format(seaborn.__version__))
print ('Scipy: {}'.format(scipy.__version__))
print ('Sklearn: {}'.format(sklearn.__version__))

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os
import time
import scipy.signal as sg
from tqdm import tqdm_notebook

#Loading the dataset from downloads of my device
#path1 = r"C:\SDTPGMS\WN2021OOS\datasheet.csv"


# In[6]:


path1 = '/Users/madlin/Downloads/heartdisease.csv'
data=pd.read_csv(path1)
print(data.shape)


# In[10]:


data.head()

from pandas_profiling import ProfileReport
har = ProfileReport(data, title="Heart attack report")
har

data.dtypes

from sklearn.impute import SimpleImputer
imp_mean = SimpleImputer(missing_values=np.nan, strategy='mean')
imp_mean.fit(data)

data = pd.DataFrame(imp_mean.transform(data), columns=data.columns)
data = data.astype(int)
data.head()

plt.figure(figsize=(30,30))
for i in data.columns:
    plt.hist(data[i] , label=i )
    plt.legend(loc='upper right')


# In[9]:


data.head(5)


# In[17]:


plt.figure(figsize=(5,5))
plt.hist(data["TenYearCHD"], label=["0.No Heart Disease\n1.Heart Disease"])
plt.legend(loc='upper left')


# In[21]:


NoDisease = len(data[data.TenYearCHD == 0])
HaveDisease = len(data[data.TenYearCHD == 1])
print(f'Number of patients without disease: {NoDisease }',end=' ,')
print("No heart disease rate: {:f}%".format((NoDisease / (len(data.TenYearCHD))*100)))
print(f'Number of patients: {HaveDisease }',end=' ,')
print("The rate of heart disease: {:f}%".format((HaveDisease / (len(data.TenYearCHD))*100)))


# In[23]:


plt.scatter(x=data.age[data.TenYearCHD == 1], y=data.heartRate[(data.TenYearCHD == 1)], c="blue")
plt.scatter(x=data.age[data.TenYearCHD == 0], y=data.heartRate[(data.TenYearCHD == 0)], c ='red')
plt.legend(["Disease", "Not Disease"])
plt.xlabel("Age")
plt.ylabel("Maximum Heart Rate")
plt.show()


# In[39]:


def understand_numeric_column(DataFrame,Col):
    
    """Finds the Skewness,Distribution and statistics of the column"""
    
    print("------------------")
    print("printing the summary statistics ",format(Col))
    print("")
    print(DataFrame[Col].describe())
    print("--------------------")
    print("The Skewness of" ,format(Col))
    print("Skewness: %f" % data['heartRate'].skew())
    print("")
    print("--------------------")
    print("The distribution of ",format(Col))
    print("")
    print(sns.distplot(data["heartRate"]))
    print("")


# In[40]:


def find_top_N_Correlated_Feature(N,Col,DataFrame):
    
    """Prints the top N highly correlated feature matrix """
    
    corrmat = DataFrame.corr()
    cols = corrmat.nlargest(N, Col)[Col].index     
    cm = np.corrcoef(DataFrame[cols].values.T)
    sns.set(font_scale=1.25)
    hm = sns.heatmap(cm, cbar=True, annot=True, square=True, fmt='.2f', annot_kws={'size': 10}, yticklabels=cols.values, xticklabels=cols.values)
    plt.show()


# In[41]:


def Finding_Missing_Value(DataFrame): 
    
    """Find the Missing Value Percentage Column Wise"""
    
    total=DataFrame.isnull().sum().sort_values(ascending=False)
    percent=(DataFrame.isnull().sum()/DataFrame.isnull().count()).sort_values(ascending=False)
    missing_data=pd.concat([total,percent],axis=1, keys=["Total","Percent"])
    print("")
    print("--------------------")
    print("Column wise Percentage of Missing Values",format(DataFrame))
    print("")
    print(missing_data)


# In[42]:


def Drop_Col_Missing(N,DataFrame,missing_data):
    
    """Drop The Columns which has missing entries more than N"""
    
    #dealing with missing data
    print("--------------------")
    print("Deleting all the columns where missing entries is greater than ",format(N))
    print("")
    DataFrame = DataFrame.drop((missing_data[missing_data['Total'] > N]).index,1)
    print("The Shape after removing missing entries",DataFrame.shape)
    print("")


# In[43]:


def Fill_Col_Missing(DataFrame,ColList):

    """Fill The Columns which has missing entries"""
    
    print("--------------------")
    print("Filling all the columns having missing entries")
    print("")
    for i in ColList:
        DataFrame[i]=DataFrame[i].fillna(DataFrame[i].mean())
    print("")


# In[44]:


def Convert_Categorical_Numerical(DataFrame):  
    
    """Converts Categorical to Numerical"""
    # Categorical boolean mask
    categorical_feature_mask = DataFrame.dtypes==object
    # filter categorical columns using mask and turn it into alist
    categorical_cols = DataFrame.columns[categorical_feature_mask].tolist()
    
    labelencoder = LabelEncoder()
    DataFrame[categorical_cols] = DataFrame[categorical_cols].apply(lambda col: labelencoder.fit_transform(col.astype(str)))
    print("--------------------")
    print("Filling all the columns having missing entries completed")
    print("")
    print(DataFrame.info())


# In[48]:


understand_numeric_column(data,"heartRate")

find_top_N_Correlated_Feature(10,'heartRate',data)

find_top_N_Correlated_Feature(10,'TenYearCHD',data)

Finding_Missing_Value(data)

data.hist()

sns.set()
cols = ['TenYearCHD', 'male', 'age', 'education','currentSmoker','cigsPerDay','BPMeds', 'prevalentStroke', 'prevalentHyp', 'diabetes','totChol','sysBP','diaBP','BMI','heartRate','glucose']
sns.pairplot(data[cols], size = 2.5)
plt.show();


# In[50]:


from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(data.drop('TenYearCHD', axis=1), data['TenYearCHD'], test_size=0.2)

X_train.head()

X_test.head()

y_train.head()

y_test.head()

from sklearn.linear_model import LinearRegression
lm = LinearRegression()
lm.fit(X_train,y_train)
print(lm)

print(lm.intercept_)

print(lm.coef_)

predictions = lm.predict(X_test)
predictions= predictions.reshape(-1,1)

predictions

plt.figure(figsize=(16,8))
plt.plot(y_test,label ='Test')
plt.plot(predictions, label = 'predict')
plt.show()


# In[51]:


from sklearn import metrics
print('MAE:', metrics.mean_absolute_error(y_test, predictions))
print('MSE:', metrics.mean_squared_error(y_test, predictions))
print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions)))

from sklearn.tree import DecisionTreeRegressor
dtreg = DecisionTreeRegressor(random_state = 100)
dtreg.fit(X_train, y_train)
dtr_pred = dtreg.predict(X_test)
dtr_pred= dtr_pred.reshape(-1,1)
print('MAE:', metrics.mean_absolute_error(y_test, dtr_pred))
print('MSE:', metrics.mean_squared_error(y_test, dtr_pred))
print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, dtr_pred)))

plt.figure(figsize=(15,8))
plt.scatter(y_test,dtr_pred,c='green')
plt.xlabel('Y Test')
plt.ylabel('Predicted Y')
plt.show()

plt.figure(figsize=(16,8))
plt.plot(y_test,label ='Test')
plt.plot(predictions, label = 'predict')
plt.legend()
plt.show()


# In[52]:


from sklearn.ensemble import RandomForestRegressor
rfr = RandomForestRegressor(n_estimators = 500, random_state = 0)
rfr.fit(X_train, y_train)
rfr_pred= rfr.predict(X_test)
rfr_pred = rfr_pred.reshape(-1,1)

print('MAE:', metrics.mean_absolute_error(y_test, rfr_pred))
print('MSE:', metrics.mean_squared_error(y_test, rfr_pred))
print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, rfr_pred)))

plt.figure(figsize=(15,8))
plt.scatter(y_test,rfr_pred, c='orange')
plt.xlabel('Y Test')
plt.ylabel('Predicted Y')
plt.show()

plt.figure(figsize=(16,8))
plt.plot(y_test,label ='Test')
plt.plot(rfr_pred, label = 'predict')
plt.show()


# In[53]:


from sklearn.ensemble import RandomForestClassifier
model=RandomForestClassifier(n_estimators=10, criterion='entropy', random_state=1)
print(model.fit(X_train,y_train))

model.fit(X_test,y_test)
model.score(X_test,y_test)

model.predict(X_test)

from sklearn.naive_bayes import GaussianNB
clf = GaussianNB().fit(X_train,y_train)

predicted = clf.predict(X_test)
predicted

accuracy=sum(predicted==y_test)/len(y_test)*100
print(accuracy)


# In[59]:


from sklearn.neighbors import KNeighborsClassifier
from sklearn import svm, datasets
from sklearn.model_selection import KFold
neigh = KNeighborsClassifier(n_neighbors=13 )
neigh.fit(X_train, y_train)
KNNpredicted = neigh.predict(X_test)
accuracy=sum(KNNpredicted==y_test)/len(y_test)*100
print(accuracy)

svc = svm.SVC(kernel='linear').fit(X_train, y_train)
pred_TenYearCHD=svc.predict(X_test)
accuracy=sum(pred_TenYearCHD==y_test)/len(y_test)*100
print(accuracy)


# In[66]:


X = data.drop('TenYearCHD', axis=1)
X.head()
X.index

y = data.TenYearCHD
y.head()

predicted = {}
key =0
predicted[1]=[]
predicted[2]=[]
predicted[3]=[]
kfold = KFold(3)
for train, test in kfold.split(X):
    X_train, X_test = X.iloc[train], X.iloc[test]
    y_train, y_test = y[train], y[test]
    for k in range(1,20,2):    
        neigh = KNeighborsClassifier(n_neighbors=k )
        neigh.fit(X_train, y_train)
        KNNpredicted = neigh.predict(X_test)
        acc=sum(KNNpredicted==y_test)/len(y_test)*100
        key = key+1 if k==1 else key
        predicted[key].append(acc)

X = list(range(1,20,2))
plt.figure(figsize=(20,5))
plt.plot(X,predicted[1],label ="Findings 1")
plt.plot(X,predicted[2],label ="Findings 2")
plt.plot(X,predicted[3],label ="Findings 3")
plt.legend(loc="upper left")

