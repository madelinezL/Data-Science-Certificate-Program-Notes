#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jul  1 23:54:21 2022

@author: madeline
"""
#Question 3: Stopwatch

import time


class StopWatch:
    def __init__ (self):
        self.__startTime = int(time.time()*1000.0)
        self.__endTime= 0
    
    def getStartTime(self):
        return self.__startTime
    
    def getEndTime(self):
        return self.__endTime
        
    def start(self):
        self.__startTime = int(time.time() * 1000.0)
    
    def stop(self):
        self.__endTime = int(time.time() * 1000.0)
        
    def getElapsedTime(self):
        return self.__endTime - self.__startTime
    

def main():
    sum = 0
    execution_time = StopWatch()
    execution_time.start()
    for i in range (1,1000001):
        sum = sum+i
    execution_time.stop()
    print ("The Execution time of additing numbers from 1 to 1,000,000 is", \
           execution_time.getElapsedTime(), "in milliseconds.")
        
main()    
    

