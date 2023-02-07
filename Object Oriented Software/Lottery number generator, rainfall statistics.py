#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jun 18 20:12:54 2022

@author: madeline
"""

#Question 1 Lottery Number Generator
import random
lottery = [0]*7
for i in range (len(lottery)):
    lottery[i]=random.randint(0,9)
    print(lottery[i],end=' ')


#Question 2 Rainfall Statistics
import pandas as pd

rainfall_Jan = float(input("Enter the rainfall for January: "))
rainfall_Feb = float(input("Enter the rainfall for February: "))
rainfall_Mar = float(input("Enter the rainfall for March: "))
rainfall_Apr = float(input("Enter the rainfall for April: "))
rainfall_May = float(input("Enter the rainfall for May: "))
rainfall_Jun = float(input("Enter the rainfall for June: "))
rainfall_Jul = float(input("Enter the rainfall for July: "))
rainfall_Aug = float(input("Enter the rainfall for August: "))
rainfall_Sept = float(input("Enter the rainfall for September: "))
rainfall_Oct = float(input("Enter the rainfall for October: "))
rainfall_Nov = float(input("Enter the rainfall for November: "))
rainfall_Dec = float(input("Enter the rainfall for December: "))

v1=rainfall_Jan
v2=rainfall_Feb
v3=rainfall_Mar
v4=rainfall_Apr
v5=rainfall_May
v6=rainfall_Jun
v7=rainfall_Jul
v8=rainfall_Aug
v9=rainfall_Sept
v10=rainfall_Oct
v11=rainfall_Nov
v12=rainfall_Dec

rainfall_mon = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec']
rainfall_amt = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12]
rainfall_table = {'rainfall_mon':['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug',\
                                  'Sept','Oct','Nov','Dec'],
                  'rainfall_amt':[v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12]}

df=pd.DataFrame(rainfall_table)    
print(df)            

total_rainfall = sum(rainfall_amt)
print("Total rainfall for the year is: ", total_rainfall)
average_rainfall=sum(rainfall_amt)/len(rainfall_amt)
print("Average monthly rainfall for the year is: ", average_rainfall)
max_rainfall=max(df.rainfall_amt)
max_month = df[df['rainfall_amt']==max_rainfall]
print("The month with the highest rainfall is indiacted in the below table: ")
print(max_month)
min_rainfall=min(df.rainfall_amt)
min_month = df[df['rainfall_amt']==min_rainfall]
print("The month with the lowest rainfall is indiacted in the below table: ")
print(min_month)


