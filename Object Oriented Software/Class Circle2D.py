#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jun 25 11:25:58 2022

@author: madeline
"""

import math

class Circle2D:
    # def __init__ (self, x=0, y=0, radius=0):
    #     self.x=0
    #     self.y=0
    #     self.radius=0
    def __init__ (self, inputNum):
        
        self.x=float(inputNum.split(',')[0])
        self.y=float(inputNum.split(',')[1])
        self.radius=float(inputNum.split(',')[2])
    
    def getX(self):
        return self.x
    
    def getY(self):
        return self.y
    
    def getRadius(self):
        return self.radius
    
    def getArea(self):
        return math.pi * self.radius * self.radius
    
    def getPerimeter(self):
        return math.pi * 2 * self.radius
    
    def containsPoint (self,x,y):
        return ((self.x-x)**2 + (self.y-y)**2)**0.5 < self.radius
  
        
    def contains(self, circle2D):
        return ((self.x-circle2D.getX())**2 + (self.y-circle2D.getY())**2)**0.5 <= self.radius-circle2D.getRadius()
       
        
    def overlaps(self, circle2D):
        return self.radius-circle2D.getRadius() <= ((self.x - circle2D.getX())**2 + (self.y-circle2D.getY())**2)**0.5 <= self.radius+circle2D.getRadius()
    
 
    
        

def main():
    Circle2D_1 = Circle2D(str(input("Enter the x1, y1, radius 1: ")))
    Circle2D_2 = Circle2D(str(input("Enter the x2, y2, radius 2: ")))
    
    
    print("The area of the circle of radius", Circle2D_1.radius, "is", str(Circle2D_1.getArea()))
    print("The area of the circle of radius", Circle2D_2.radius, "is", str(Circle2D_2.getArea()))
    print("The perimeter of the circle of radius", Circle2D_1.radius, "is", Circle2D_1.getPerimeter())
    print("The perimeter of the circle of radius", Circle2D_2.radius, "is", Circle2D_2.getPerimeter())
    print("Does the specified point 1 is inside of this circle?", Circle2D_1.containsPoint(Circle2D_2.getX(), Circle2D_2.getY()))
    print("Does the specified point 2 is inside of this circle?", Circle2D_2.containsPoint(Circle2D_1.getX(), Circle2D_1.getY()))
    print("Does circle 1 contains circle 2?", Circle2D_1.contains(Circle2D_2))
    print("Does circle 1 overlaps circle 2?", Circle2D_1.overlaps(Circle2D_2))
    
main()
        
        

