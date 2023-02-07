#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jul  2 00:11:58 2022

@author: madeline
"""

#Algebra: vertex from equations

from fractions import Fraction 

a = int(input("Enter a as integer in starndard form: "))
b = int(input("Enter b as integer in starndard form: "))
c = int(input("Enter c as integer in starndard form: "))
    
h = Fraction (-b, 2*a)
k = Fraction (4*a*c-b*b, 4*a)
    
print ("The vertex form of h is", h)       
print ("The vertex form of k is", k)
    
    
    
    