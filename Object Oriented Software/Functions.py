#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jun  5 02:40:02 2022

@author: madeline
"""
#Q1
def getPentagonalNumber(n):
    return n*(3*n-1)/2

def main():
 count = 1
 for i in range (1, 101):
       if count % 10 == 0:
          print (getPentagonalNumber(i), end="\n")
       else:
         print (getPentagonalNumber(i), end=" ")
       count = count +1
main()


#Q2
def sumDigits(n):
    if (n<=9):
        return n
    else:
        return(n%10)+sumDigits(n//10)

integer = int(input("Enter an integer: "))
print ("The sum of all its digits is", sumDigits(integer))

#Q3
def AssessmentValue(n):
    return 0.6*n

def PropertyTax(n):
    return int(0.6*n/100*0.72)

ActualValue=float(input("Enter the actual value of a piece of property: "))
print("The assessment value is", AssessmentValue(ActualValue))
print("The property tax is", PropertyTax(ActualValue))