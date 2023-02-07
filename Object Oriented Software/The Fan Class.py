#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  1 20:03:17 2022

@author: madeline
"""
#Question 1: The Fan Class
class Fan:
    SLOW = 1
    MEDIUM = 2
    FAST = 3
    
    def __init__ (self, on=False, speed=SLOW, radius=5, color="blue"):
        self.__on = on
        self.__speed = speed
        self.__radius = radius
        self.__color = color
    
    def getOn(self):
       return self.__on
   
    def setOn(self,on):
       self.__on =True
   
    def setOff(self,on):
       self.__on=False
        
    def getSpeed(self):
        if self.__speed == 1:
            return "SLOW"
        elif self.__speed == 2:
            return "MEDIUM"
        elif self.__speed ==3:
            return "FAST"
      
    def setSpeed(self,speed):
        self.__speed = speed

    def getRadius(self):
        return self.__radius
    
    def setRadius(self,radius):
        self.__radius = radius
    
    def getColor(self):
        return self.__color
    
    def setColor(self,color):
        return self.__color
    
def main():
    Fan_default=Fan()
    print("The speed of the fan is", Fan_default.getSpeed())
    print("The radius of the fan is", Fan_default.getRadius())
    print("The color of the fan is", Fan_default.getColor())
    print("The mode of the fan is", Fan_default.getOn())
    
    print(end="\n")
    
    Fan_1 = Fan(True,3,10,"yellow")
    print("The speed of the fan is", Fan_1.getSpeed())
    print("The radius of the fan is", Fan_1.getRadius())
    print("The color of the fan is", Fan_1.getColor())
    print("The mode of the fan is", Fan_1.getOn())
    
    print(end="\n")
    
    Fan_2 = Fan(False,2,5,"blue")
    print("The speed of the fan is", Fan_2.getSpeed())
    print("The radius of the fan is", Fan_2.getRadius())
    print("The color of the fan is", Fan_2.getColor())
    print("The mode of the fan is", Fan_2.getOn())
    

main()
    

