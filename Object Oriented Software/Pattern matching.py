#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jul 16 00:44:02 2022

@author: madeline
"""
#W12 Q1: Pattern matching
a=input("Enter a string s1: ")

b=input("Enter a string s2: ")

for i in range(len(a)-len(b)+1):

 if a[i:len(b)+i] == b:

  print("Matched at index", i)

  break 

