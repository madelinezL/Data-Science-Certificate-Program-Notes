#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  8 21:28:32 2022

@author: madeline
"""
#Question 1: Count characters, words, and lines in a file
file = input("Enter a file name: ")
total_characters = 0
total_words = 0
total_lines = 0

with open (file, 'r') as inputFile:
    for i in inputFile:
        total_characters += len(i)
        total_words += len(i.split())
        total_lines += 1
    
print (total_characters, "characters")
print (total_words, "words")
print (total_lines, "lines")
    
