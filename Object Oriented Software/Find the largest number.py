#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jul  9 00:00:37 2022

@author: madeline
"""
#Q3: Find the largest number in a list
x = input ("Enter numbers separated by spaces from one line: ")
x = [float(i) for i in x.split()]
x_max = max(x)
print("The largest number in", x, "is", x_max)