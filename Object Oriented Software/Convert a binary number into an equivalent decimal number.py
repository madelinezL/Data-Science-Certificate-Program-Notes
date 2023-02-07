#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul 22 11:29:36 2022

@author: madeline
"""

#Week 13 Q1: Convert a binary number into an equivalent decimal number
b_num = list(input("Input a binary number: "))
value = 0

for i in range(len(b_num)):
 digit = b_num.pop()
 value = value + int(digit) * pow(2,i)
print("The decimal value of the number is", value)

