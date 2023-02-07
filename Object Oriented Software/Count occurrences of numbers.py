#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  8 23:48:51 2022

@author: madeline
"""
#Q2: Count occurrences of numbers

nums = list(map(int,input("Enter the numbers: ").split()))
freq = {}
maxcount = 0
for x in nums:
    if x not in freq.keys():
        freq[x] = nums.count(x)
        if freq[x]>maxcount:
            maxcount = freq[x]

print("Numbers with maximum number of occurences are: ")
for x in freq.keys():
    if freq[x]==maxcount:
        print(x,end = " ")
print(f"\nThey occur {maxcount} times")