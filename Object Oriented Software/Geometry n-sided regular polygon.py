#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  1 23:07:52 2022

@author: madeline
"""
#Question 2: Geometry: n-sided regular polygon

import math

class RegularPolygon:
    def __init__ (self, n=3, side=1, x=0, y=0):
        self.__n=n
        self.__side=side
        self.__x=x
        self.__y=y
        
    def getN(self):
        return self.n
    
    def setN(self,n):
        self.__n=n
        
    def getSide(self):
        return self.side
    
    def setSide(self,side):
        self.__side=side
    
    def getX(self):
        return self.x
    
    def setX(self,x):
        self.__x=x
    
    def getY(self):
        return self.y
    
    def setY(self,y):
        self.__y=y
    
    def GetPerimeter(self):
        return self.__n * self.__side
    
    def GetArea(self):
        return (self.__n * self.__side * self.__side) / (4 * math.tan(math.pi/self.__n))
    

def main():
    RP1=RegularPolygon()
    print("The perimeter of the regular polygon by default is", RP1.GetPerimeter())
    print("The area of the regular polygon by default is", RP1.GetArea())
    
    print(end="\n")
    
    RP2 = RegularPolygon(6,4)
    print("The perimeter of the 2nd regular polygon is", RP2.GetPerimeter())
    print("The area of the 2nd regular polygon is", RP2.GetArea())
    
    print(end="\n")

    RP3 = RegularPolygon(10,4,5.6,7.8)
    print("The perimeter of the 3rd regular polygon is", RP3.GetPerimeter())
    print("The area of the 3rd regular polygon is", RP3.GetArea())  

main()



